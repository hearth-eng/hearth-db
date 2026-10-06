#!/bin/sh
# Plain psql-based migration runner (hearth-db has no Flyway/V<n>__ naming - its real
# layout is 1-schema/, 2-seed-data/, 3-test-data/, scripts/setup.sql). Runs a fixed,
# documented set of files in order against the target database, matching the order
# scripts/setup.sql itself documents: schema -> reference data -> test/mock data.
#
# Connection comes entirely from libpq's standard env vars (PGHOST, PGPORT,
# PGDATABASE, PGUSER, PGPASSWORD, PGSSLMODE, PGSSLROOTCERT), which psql picks up
# with zero flags needed.
set -eu

RETRIES="${DB_CONNECT_RETRIES:-10}"

echo ">> Waiting for database to accept connections (up to ${RETRIES} attempts)..."
i=0
until pg_isready -q; do
  i=$((i + 1))
  if [ "$i" -ge "$RETRIES" ]; then
    echo "::error::Database did not become ready after ${RETRIES} attempts" >&2
    exit 1
  fi
  sleep 3
done
echo ">> Database is ready."

# RUN_QUERY=<sql> runs a single ad hoc read-only-by-convention statement and exits,
# bypassing the bootstrap guard/migration entirely. For one-off lookups (e.g. reading
# a seeded row's generated UUID) when no other DB access path exists. Not intended
# for writes - nothing stops a write here, but the normal migration path below is
# the only thing this script otherwise does to the schema/data.
if [ -n "${RUN_QUERY:-}" ]; then
  echo ">> RUN_QUERY set - running ad hoc statement and exiting:"
  psql -tA -c "$RUN_QUERY"
  exit 0
fi

# This is a one-shot bootstrap (drop_tables.sql + fixed-ID INSERTs in reference_data.sql
# and the 3-test-data/ files are NOT safe to re-run against a populated database -
# drop_tables.sql destroys all data, and the INSERTs would fail/duplicate on their
# hardcoded IDs). There is no schema-version tracking in this repo, so guard the whole
# run: if the core schema already exists, skip everything and exit successfully. Real
# schema changes after the first deploy need a separate, deliberate migration path -
# this script only handles "create from empty."
#
# FORCE_REBUILD=true bypasses this guard and re-runs drop_tables.sql + everything else
# anyway, destroying all existing data. Deliberately opt-in only (no default), so a
# plain re-run of this task is always a safe no-op.
ALREADY_BOOTSTRAPPED=$(psql -tA -c "SELECT to_regclass('public.fks_users') IS NOT NULL;")
echo ">> DEBUG: FORCE_REBUILD='${FORCE_REBUILD:-<unset>}' ALREADY_BOOTSTRAPPED='${ALREADY_BOOTSTRAPPED}'"
if [ "$ALREADY_BOOTSTRAPPED" = "t" ] && [ "${FORCE_REBUILD:-}" != "true" ]; then
  echo ">> fks_users already exists - database already bootstrapped. Skipping (safe no-op)."
  echo ">> To apply a schema change, add a new, separate migration path; this script does not support re-running against existing data."
  echo ">> To destroy and recreate everything anyway, re-run with FORCE_REBUILD=true."
  exit 0
elif [ "$ALREADY_BOOTSTRAPPED" = "t" ]; then
  echo "::warning::FORCE_REBUILD=true - dropping and recreating all tables, destroying existing data."
fi

# Fixed order, matching scripts/setup.sql exactly: schema, then reference data, then
# test/mock data. post_insert.sql must run last - it resets sequences from MAX(id)
# over the rows mock_data.sql just inserted.
FILES="
1-schema/drop_tables.sql
1-schema/tables.sql
1-schema/constraints.sql
1-schema/indexes.sql
2-seed-data/reference_data.sql
3-test-data/categories.sql
3-test-data/mock_data.sql
3-test-data/post_insert.sql
"

for f in $FILES; do
  echo "====================================================="
  echo "Running $f"
  echo "====================================================="
  psql -v ON_ERROR_STOP=1 -f "/sql/$f"
done

echo "====================================================="
echo "Migration completed successfully."
echo "====================================================="
