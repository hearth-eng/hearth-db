-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Delete Table Script (Maintain the order of deletion) --

DROP TABLE IF EXISTS fks_audit_logs;
DROP TABLE IF EXISTS fks_wallet_transactions;
DROP TABLE IF EXISTS fks_wallets;
DROP TABLE IF EXISTS fks_pricing_rules;

-- bookings related
DROP TABLE IF EXISTS fks_payments;
DROP TABLE IF EXISTS fks_job_status;
DROP TABLE IF EXISTS fks_coupon_usage;
DROP TABLE IF EXISTS fks_messages;
DROP TABLE IF EXISTS fks_conversations;
DROP TABLE IF EXISTS fks_reviews;
DROP TABLE IF EXISTS fks_bookings;
DROP TABLE IF EXISTS fks_coupons;

-- professional related
DROP TABLE IF EXISTS fks_availabilities;
DROP TABLE IF EXISTS fks_professional_neighbourhoods;
DROP TABLE IF EXISTS fks_professional_services;

-- user related
DROP TABLE IF EXISTS fks_documents;
DROP TABLE IF EXISTS fks_addresses;
DROP TABLE IF EXISTS fks_professionals;
DROP TABLE IF EXISTS fks_users;

-- category related
DROP TABLE IF EXISTS fks_services;
DROP TABLE IF EXISTS fks_categories;

-- master data
DROP TABLE IF EXISTS fks_neighbourhoods;
DROP TABLE IF EXISTS fks_cities;
DROP TABLE IF EXISTS fks_provinces;
DROP TABLE IF EXISTS fks_countries;
