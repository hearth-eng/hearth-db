-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Primary Key Constraint --

ALTER TABLE fks_payments
ADD CONSTRAINT fks_payments_pk
PRIMARY KEY (payment_id);

ALTER TABLE fks_users
ADD CONSTRAINT fks_users_pk
PRIMARY KEY (user_id);

ALTER TABLE fks_addresses
ADD CONSTRAINT fks_addresses_pk
PRIMARY KEY (address_id);

ALTER TABLE fks_categories
ADD CONSTRAINT fks_categories_pk
PRIMARY KEY (category_id);

ALTER TABLE fks_services
ADD CONSTRAINT fks_services_pk
PRIMARY KEY (service_id);

ALTER TABLE fks_professionals
ADD CONSTRAINT fks_professionals_pk
PRIMARY KEY (professional_id);

ALTER TABLE fks_professional_services
ADD CONSTRAINT fks_professional_services_pk
PRIMARY KEY (id);

ALTER TABLE fks_bookings
ADD CONSTRAINT fks_bookings_pk
PRIMARY KEY (booking_id);

ALTER TABLE fks_availability
ADD CONSTRAINT fks_availability_pk
PRIMARY KEY (availability_id);

ALTER TABLE fks_reviews
ADD CONSTRAINT fks_reviews_pk
PRIMARY KEY (review_id);

ALTER TABLE fks_conversations
ADD CONSTRAINT fks_conversations_pk
PRIMARY KEY (conversation_id);

ALTER TABLE fks_messages
ADD CONSTRAINT fks_messages_pk
PRIMARY KEY (message_id);

ALTER TABLE fks_job_status
ADD CONSTRAINT fks_job_status_pk
PRIMARY KEY (log_id);

ALTER TABLE fks_documents
ADD CONSTRAINT fks_documents_pk
PRIMARY KEY (document_id);

ALTER TABLE fks_audit_logs
ADD CONSTRAINT fks_audit_logs_pk
PRIMARY KEY (log_id);

ALTER TABLE fks_pricing_rules
ADD CONSTRAINT fks_pricing_rules_pk
PRIMARY KEY (rule_id);

ALTER TABLE fks_wallets
ADD CONSTRAINT fks_wallets_pk
PRIMARY KEY (wallet_id);

ALTER TABLE fks_wallet_transactions
ADD CONSTRAINT fks_wallet_transactions_pk
PRIMARY KEY (txn_id);

ALTER TABLE fks_coupon_usage
ADD CONSTRAINT fks_coupon_usage_pk
PRIMARY KEY (usage_id);

-- Foreign Key Constraint --

ALTER TABLE fks_addresses
ADD CONSTRAINT fks_addresses_fk1
FOREIGN KEY (user_id)
REFERENCES fks_users (user_id);

ALTER TABLE fks_professionals
ADD CONSTRAINT fks_professionals_fk1
FOREIGN KEY (user_id)
REFERENCES fks_users (user_id);

ALTER TABLE fks_bookings
ADD CONSTRAINT fks_bookings_fk1
FOREIGN KEY (customer_id)
REFERENCES fks_users (user_id);

ALTER TABLE fks_coupon_usage
ADD CONSTRAINT fks_coupon_usage_fk1
FOREIGN KEY (user_id)
REFERENCES fks_users (user_id);

ALTER TABLE fks_bookings
ADD CONSTRAINT fks_bookings_fk2
FOREIGN KEY (address_id)
REFERENCES fks_addresses (address_id);

ALTER TABLE fks_availability
ADD CONSTRAINT fks_availability_fk1
FOREIGN KEY (professional_id)
REFERENCES fks_professionals (professional_id);

ALTER TABLE fks_professional_services
ADD CONSTRAINT fks_professional_services_fk1
FOREIGN KEY (professional_id)
REFERENCES fks_professionals (professional_id);

ALTER TABLE fks_professional_services
ADD CONSTRAINT fks_professional_services_fk2
FOREIGN KEY (service_id)
REFERENCES fks_services (service_id);

ALTER TABLE fks_categories
ADD CONSTRAINT fks_categories_fk1
FOREIGN KEY (parent_id)
REFERENCES fks_categories (category_id);

ALTER TABLE fks_services
ADD CONSTRAINT fks_services_fk1
FOREIGN KEY (category_id)
REFERENCES fks_categories (category_id);

ALTER TABLE fks_bookings
ADD CONSTRAINT fks_bookings_fk3
FOREIGN KEY (service_id)
REFERENCES fks_services (service_id);

ALTER TABLE fks_messages
ADD CONSTRAINT fks_messages_fk1
FOREIGN KEY (conversation_id)
REFERENCES fks_conversations (conversation_id);

ALTER TABLE fks_coupon_usage
ADD CONSTRAINT fks_coupon_usage_fk2
FOREIGN KEY (booking_id)
REFERENCES fks_bookings (booking_id);

ALTER TABLE fks_payments
ADD CONSTRAINT fks_payments_fk1
FOREIGN KEY (booking_id)
REFERENCES fks_bookings (booking_id);
