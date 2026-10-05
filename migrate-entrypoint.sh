#!/bin/sh
# Plain psql-based migration runner (hearth-db has no Flyway/V<n>__ naming - its real
# layout is 1-schema/, 2-seed-data/, 3-test-data/, scripts/setup.sql). Runs a fixed,
# documented set of files in order against the target database. Only schema and
# reference (seed) data are run here - 3-test-data/ is local/QA-only and is
# intentionally NOT run against prod.
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

# This is a one-shot bootstrap (drop_tables.sql + fixed-ID INSERTs in reference_data.sql
# are NOT safe to re-run against a populated database - drop_tables.sql destroys all
# data, and reference_data.sql would fail/duplicate on its hardcoded IDs). There is no
# schema-version tracking in this repo, so guard the whole run: if the core schema
# already exists, skip schema+seed entirely and exit successfully. Real schema changes
# after the first deploy need a separate, deliberate migration path - this script only
# handles "create from empty."
ALREADY_BOOTSTRAPPED=$(psql -tA -c "SELECT to_regclass('public.fks_users') IS NOT NULL;")
if [ "$ALREADY_BOOTSTRAPPED" = "t" ]; then
  echo ">> fks_users already exists - database already bootstrapped. Skipping (safe no-op)."
  echo ">> To apply a schema change, add a new, separate migration path; this script does not support re-running against existing data."
  exit 0
fi

# Fixed order: schema first, then seed/reference data. Mirrors scripts/setup.sql's
# intent but deliberately skips 3-test-data/ (test/QA-only fixtures, not for prod).
FILES="
1-schema/drop_tables.sql
1-schema/tables.sql
1-schema/constraints.sql
1-schema/indexes.sql
2-seed-data/reference_data.sql
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
