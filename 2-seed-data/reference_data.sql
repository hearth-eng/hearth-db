-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Reference data (Admin user) --

INSERT INTO public.fks_users (user_id, external_id, full_name, email, phone1, phone2, password_hash, role, status, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES 
(1, gen_random_uuid(), 'Folks Admin', 'folks.admin@javalabs.org', '9000000000', NULL, '7c6a180b36896a0a8c02787eeafb0e4c', 'ADMIN', 'ACTIVE', current_timestamp, null),
(2, gen_random_uuid(), 'Node Admin', 'node.admin@javalabs.org', '8000000000', NULL, '6cb75f652a9b52798eb6cf2201057c73', 'ADMIN', 'ACTIVE', current_timestamp, null),
(3, gen_random_uuid(), 'Support Admin', 'support.admin@javalabs.org', '7000000000', NULL, '6cb75f652a9b52798eb6cf2201057c73', 'ADMIN', 'ACTIVE', current_timestamp, null);
