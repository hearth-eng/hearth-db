-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Indexes --

CREATE UNIQUE INDEX fks_users_uk1
ON fks_users
USING BTREE (external_id);

CREATE UNIQUE INDEX fks_users_uk2
ON fks_users
USING BTREE (phone1);
