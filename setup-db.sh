#!/usr/bin/env bash

set -euo pipefail

# PostgreSQL configuration
PSQL="/Library/PostgreSQL/17/bin/psql"
DB_HOST="localhost"
ADMIN_USER="postgres"

HEARTH_USER="hearth"
HEARTH_PASSWORD='p@$$word'
HEARTH_DB="hearthdb"

SETUP_SQL="scripts/setup.sql"

echo "=== Hearth Database Setup ==="

# Ask for the postgres admin password without displaying it.
read -rsp "Enter password for PostgreSQL user '${ADMIN_USER}': " ADMIN_PASSWORD
echo

# Supply the admin password to psql without changing the global environment.
export PGPASSWORD="$ADMIN_PASSWORD"

echo "Checking PostgreSQL connection..."
"$PSQL" -h "$DB_HOST" -U "$ADMIN_USER" -d postgres -c "SELECT version();" >/dev/null

echo "Creating/updating hearth role..."
"$PSQL" -h "$DB_HOST" -U "$ADMIN_USER" -d postgres <<SQL
DO \$\$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = '${HEARTH_USER}'
    ) THEN
        CREATE ROLE ${HEARTH_USER}
            WITH
            LOGIN
            NOSUPERUSER
            CREATEDB
            CREATEROLE
            INHERIT
            REPLICATION
            CONNECTION LIMIT -1;
    ELSE
        ALTER ROLE ${HEARTH_USER}
            WITH
            LOGIN
            NOSUPERUSER
            CREATEDB
            CREATEROLE
            INHERIT
            REPLICATION
            CONNECTION LIMIT -1;
    END IF;
END
\$\$;

ALTER ROLE ${HEARTH_USER} WITH PASSWORD '${HEARTH_PASSWORD}';
SQL

echo "Creating database if it does not exist..."
"$PSQL" -h "$DB_HOST" -U "$ADMIN_USER" -d postgres <<SQL
SELECT 'CREATE DATABASE ${HEARTH_DB}
        WITH OWNER = ${HEARTH_USER}
        ENCODING = ''UTF8''
        CONNECTION LIMIT = -1'
WHERE NOT EXISTS (
    SELECT FROM pg_database WHERE datname = '${HEARTH_DB}'
)\gexec
SQL

unset PGPASSWORD

echo "Running Hearth table setup..."

export PGPASSWORD="$HEARTH_PASSWORD"

"$PSQL" \
    -h "$DB_HOST" \
    -U "$HEARTH_USER" \
    -d "$HEARTH_DB" \
    -v ON_ERROR_STOP=1 \
    -f "$SETUP_SQL"

unset PGPASSWORD

echo
echo "=== Hearth database setup completed successfully ==="
