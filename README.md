## Folks Database Repository

This repository contains PostgreSQL schema, seed data, and optional local/QA test data, plus a deployment script that runs the SQL files in the correct order.

### Repository layout

```text

folks-db/
├── README.md
├── .gitignore
├── 1-schema/
│   ├── tables.sql
│   ├── indexes.sql
│   ├── views.sql
│   └── functions.sql
├── 2-seed-data/
│   └── reference_data.sql
├── 3-test-data/
│   ├── users_mock.sql
│   └── post_insert.sql
└── scripts/
    └── setup.sql

```

### Install Postgres

Download latest Postgres version from the official site: https://www.postgresql.org/download/macosx

Follow the steps to install Postgres to your local box (laptop). Keep the default configuration. 
As part of the installation procedure you will be asked to choose the root user and password. Remember the root password, 
we will need it in subsequent steps.

#### Stop/Start Postgres Server

Once Postgres is installed (in the default installation directory), you can use the below command to stop and start the service.

Open a new Terminal.

Check if the service is up:

```
# Check the postgres process:
ps -aef | grep postgres


# Expected Result

  502 68256     1   0  5:55PM ??         0:00.04 /Library/PostgreSQL/17/bin/postgres -D /Library/PostgreSQL/17/data
  502 68257 68256   0  5:55PM ??         0:00.00 postgres: logger
  502 68259 68256   0  5:55PM ??         0:00.00 postgres: checkpointer
  502 68260 68256   0  5:55PM ??         0:00.00 postgres: background writer
  502 68261 68256   0  5:55PM ??         0:00.00 postgres: walwriter
  502 68262 68256   0  5:55PM ??         0:00.00 postgres: autovacuum launcher   
  502 68263 68256   0  5:55PM ??         0:00.00 postgres: stats collector
  502 68264 68256   0  5:55PM ??         0:00.00 postgres: logical replication launcher

```

If you see the above output, that indicates the Postgres DB Server is up and running.

#### Stop a Postgres Server

```
sudo -u postgres /Library/PostgreSQL/17/bin/pg_ctl -D /Library/PostgreSQL/17/data stop
Password: <kerberose password>

```

#### Start a Postgres Server

```
sudo -u postgres /Library/PostgreSQL/17/bin/pg_ctl -D /Library/PostgreSQL/17/data start
Password: <kerberose password>

```

Although the recent version of Postgres may provide the UI to manage the database server, but in case there is some 
issue with the UI, you can always use the above set of commands.


### Setup Folks database

#### Create Folks Schema

**Connect to Postgres:**

```
sudo -u postgres /Library/PostgreSQL/17/bin/psql
password:<kerberose password>
password for postgres:<postgres user pwd>

```

**Create User:**

```
CREATE ROLE folks WITH
        LOGIN
        NOSUPERUSER
        CREATEDB
        CREATEROLE
        INHERIT
        REPLICATION
        CONNECTION LIMIT -1;

```

**Set password for the folks role:**

```
ALTER ROLE folks  WITH PASSWORD 'p@$$word';

```

**Create Database:**

```
CREATE DATABASE folksdb
    WITH
    OWNER = folks
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

```

At this stage, you have created an empty schema for ECM. Now we need to run the db scripts to create the required tables.

**Exit from the database prompt** and ...

**Run the below table script:** Ensure to run it with folks user and folksdb database.

```
/Library/PostgreSQL/17/bin/psql \
  -h localhost \
  -U folks \
  -d folksdb \
  -v ON_ERROR_STOP=1 \
  -f scripts/setup.sql

Password for user folks: ******

```

**Login back to Postgres with folks user:**

```
/Library/PostgreSQL/17/bin/psql -d folksdb -U folks
Password for user ecm: p@$$word

folksdb=>

```

**Verify the table creation:**


```
folksdb=> \dt
                 List of relations
 Schema |           Name            | Type  | Owner 
--------+---------------------------+-------+-------
 public | fks_addresses             | table | folks
 public | fks_audit_logs            | table | folks
 public | fks_availability          | table | folks
 public | fks_bookings              | table | folks
 public | fks_categories            | table | folks
 public | fks_conversations         | table | folks
 public | fks_coupon_usage          | table | folks
 public | fks_coupons               | table | folks
 public | fks_documents             | table | folks
 public | fks_job_status            | table | folks
 public | fks_messages              | table | folks
 public | fks_payments              | table | folks
 public | fks_pricing_rules         | table | folks
 public | fks_professional_services | table | folks
 public | fks_professionals         | table | folks
 public | fks_reviews               | table | folks
 public | fks_services              | table | folks
 public | fks_users                 | table | folks
 public | fks_wallet_transactions   | table | folks
 public | fks_wallets               | table | folks
(20 rows)

```

**Verify the sequence creation**

```
folksdb=> SELECT schemaname, sequencename, sequenceowner, data_type, start_value, last_value
FROM pg_sequences;

 schemaname |             sequencename              | sequenceowner | data_type | start_value | last_value 
------------+---------------------------------------+---------------+-----------+-------------+------------
 public     | fks_users_user_id_seq                 | folks         | integer   |           1 |        100
 public     | fks_addresses_address_id_seq          | folks         | integer   |           1 |        100
 public     | fks_professionals_professional_id_seq | folks         | integer   |           1 |         30
 public     | fks_documents_document_id_seq         | folks         | integer   |           1 |         30
 public     | fks_availability_availability_id_seq  | folks         | integer   |           1 |        200
 public     | fks_categories_category_id_seq        | folks         | integer   |           1 |        100
 public     | fks_services_service_id_seq           | folks         | integer   |           1 |        270
 public     | fks_professional_services_id_seq      | folks         | integer   |           1 |        100
 public     | fks_job_status_log_id_seq             | folks         | integer   |           1 |          1
 public     | fks_payments_payment_id_seq           | folks         | integer   |           1 |        700
 public     | fks_reviews_review_id_seq             | folks         | integer   |           1 |        400
 public     | fks_conversations_conversation_id_seq | folks         | integer   |           1 |          1
 public     | fks_messages_message_id_seq           | folks         | integer   |           1 |          1
 public     | fks_pricing_rules_rule_id_seq         | folks         | integer   |           1 |         80
 public     | fks_coupons_coupon_id_seq             | folks         | integer   |           1 |         40
 public     | fks_coupon_usage_usage_id_seq         | folks         | integer   |           1 |         25
 public     | fks_audit_logs_log_id_seq             | folks         | integer   |           1 |          1
(17 rows)

```
