-- ============================================================================
-- Database Setup Script
-- Executes all database scripts in the correct order.
--
-- Execute using:
-- psql -h <host> -U <user> -d <database> -f scripts/setup.sql
-- ============================================================================

\echo '====================================================='
\echo 'Creating database schema...'
\echo '====================================================='

\i ./1-schema/drop_tables.sql
\i ./1-schema/tables.sql
\i ./1-schema/constraints.sql
\i ./1-schema/indexes.sql

\echo '====================================================='
\echo 'Loading reference data...'
\echo '====================================================='

\i ./2-seed-data/reference_data.sql

\echo '====================================================='
\echo 'Loading test data...'
\echo '====================================================='

\i ./3-test-data/mock_data.sql
\i ./3-test-data/post_insert.sql

\echo '====================================================='
\echo 'Database setup completed successfully.'
\echo '====================================================='
