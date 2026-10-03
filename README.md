## Hearth Database Repository

This repository contains PostgreSQL schema, seed data, and optional local/QA test data, plus a deployment script that runs the SQL files in the correct order.

Refer to [Data Dictionary](docs/DATA_DICTIONARY.md) for more details about hearth schema design.

### Repository layout

```text

folks-db/
├── README.md
├── .gitignore
├── docs/
│   ├── DATA_DICTIONARY_.md
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

Open a new Terminal. Check if the service is up:

In `Mac`

```
<prompt> ps -aef | grep postgres

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

In `Windows`

```
<prompt> C:\Project\folks-db>tasklist | findstr /I "postgres"

# Expected Result

    postgres.exe                  6984 Services                   0     14,332 K
    postgres.exe                  8208 Services                   0     10,904 K
    postgres.exe                  8264 Services                   0     11,076 K
    postgres.exe                  8276 Services                   0     11,416 K
    postgres.exe                  8292 Services                   0     13,120 K
    postgres.exe                  8304 Services                   0     18,064 K
    postgres.exe                  8312 Services                   0     12,416 K
    postgres.exe                  8616 Services                   0     15,312 K
    postgres.exe                  8628 Services                   0     11,888 K
    postgres.exe                  8636 Services                   0     11,740 K
    postgres.exe                 18380 Services                   0     19,300 K

```

If you see the above output, that indicates the Postgres DB Server is up and running.

#### Stop a Postgres Server

```
<prompt> sudo -u postgres /Library/PostgreSQL/17/bin/pg_ctl -D /Library/PostgreSQL/17/data stop
Password: <kerberose password>

```

#### Start a Postgres Server

In `Mac`

```
<prompt> sudo -u postgres /Library/PostgreSQL/17/bin/pg_ctl -D /Library/PostgreSQL/17/data start
Password: <kerberose password>

```

In `Windows`

1. Press the Windows Key + R to open the Run dialog box.
1. Type services.msc and press Enter.
1. Scroll down to find the PostgreSQL service (named like postgresql-x64-18 or your specific version number).
1. Right-click the service and select Start (or click Start in the left panel)

Although the recent version of Postgres may provide the UI to manage the database server, but in case there is some 
issue with the UI, you can always use the above set of commands.


### Setup Hearth database

#### Create Hearth Schema

**Connect to Postgres:**

```
/Library/PostgreSQL/17/bin/psql -U postgres
password for postgres:<postgres user pwd>

```

**Create User:**

```
postgres# CREATE ROLE hearth WITH
        LOGIN
        NOSUPERUSER
        CREATEDB
        CREATEROLE
        INHERIT
        REPLICATION
        CONNECTION LIMIT -1;

```

**Set password for the hearth role:**

```
postgres# ALTER ROLE hearth  WITH PASSWORD 'p@$$word';

```

**Create Database:**

```
postgres# CREATE DATABASE hearthdb
    WITH
    OWNER = hearth
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

```

At this stage, you have created an empty schema for Hearth. Now we need to run the db scripts to create the required tables.

**Exit from the database prompt** and ...

**Run the below table script:** Ensure to run it with hearth user and hearthdb database.

```
<prompt> /Library/PostgreSQL/17/bin/psql \
  -h localhost \
  -U hearth \
  -d hearthdb \
  -v ON_ERROR_STOP=1 \
  -f scripts/setup.sql

Password for user hearth: p@$$word

```

For Windows

```
<prompt> C:\Progra~1\PostgreSQL\18\bin\psql -h localhost -U hearth -d hearthdb -v ON_ERROR_STOP=1 -f scripts/setup.sql
```


**Login back to Postgres with hearth user:**

```
<prompt> /Library/PostgreSQL/17/bin/psql -d hearthdb -U hearth
Password for user hearth: p@$$word

hearthdb=>

```

**Verify the table creation:**


```
hearthdb=> \dt
                 List of relations
 Schema |           Name            | Type  | Owner 
--------+---------------------------+-------+-------
 public | fks_addresses             | table | hearth
 public | fks_audit_logs            | table | hearth
 public | fks_availability          | table | hearth
 public | fks_bookings              | table | hearth
 public | fks_categories            | table | hearth
 public | fks_conversations         | table | hearth
 public | fks_coupon_usage          | table | hearth
 public | fks_coupons               | table | hearth
 public | fks_documents             | table | hearth
 public | fks_job_status            | table | hearth
 public | fks_messages              | table | hearth
 public | fks_payments              | table | hearth
 public | fks_pricing_rules         | table | hearth
 public | fks_professional_services | table | hearth
 public | fks_professionals         | table | hearth
 public | fks_reviews               | table | hearth
 public | fks_services              | table | hearth
 public | fks_users                 | table | hearth
 public | fks_wallet_transactions   | table | hearth
 public | fks_wallets               | table | hearth
(20 rows)

```

**Verify the sequence creation**

```
hearthdb=> \ds
                         List of relations
 Schema |                 Name                  |   Type   | Owner 
--------+---------------------------------------+----------+-------
 public | fks_addresses_address_id_seq          | sequence | hearth
 public | fks_audit_logs_log_id_seq             | sequence | hearth
 public | fks_availability_availability_id_seq  | sequence | hearth
 public | fks_categories_category_id_seq        | sequence | hearth
 public | fks_conversations_conversation_id_seq | sequence | hearth
 public | fks_coupon_usage_usage_id_seq         | sequence | hearth
 public | fks_coupons_coupon_id_seq             | sequence | hearth
 public | fks_documents_document_id_seq         | sequence | hearth
 public | fks_job_status_log_id_seq             | sequence | hearth
 public | fks_messages_message_id_seq           | sequence | hearth
 public | fks_payments_payment_id_seq           | sequence | hearth
 public | fks_pricing_rules_rule_id_seq         | sequence | hearth
 public | fks_professional_services_id_seq      | sequence | hearth
 public | fks_professionals_professional_id_seq | sequence | hearth
 public | fks_reviews_review_id_seq             | sequence | hearth
 public | fks_services_service_id_seq           | sequence | hearth
 public | fks_users_user_id_seq                 | sequence | hearth
(17 rows)

```

**Check the estimated row count**

```
hearthdb=> SELECT relname AS table_name, n_live_tup AS estimated_row_count
  FROM pg_stat_user_tables
 WHERE schemaname = 'public'
 ORDER BY relname;

```

Output:

```
        table_name         | estimated_row_count 
---------------------------+---------------------
 fks_addresses             |                 100
 fks_audit_logs            |                   0
 fks_availability          |                 200
 fks_bookings              |                1000
 fks_categories            |                 100
 fks_conversations         |                   0
 fks_coupon_usage          |                  25
 fks_coupons               |                  40
 fks_documents             |                  30
 fks_job_status            |                   0
 fks_messages              |                   0
 fks_payments              |                 700
 fks_pricing_rules         |                  80
 fks_professional_services |                 100
 fks_professionals         |                  30
 fks_reviews               |                 400
 fks_services              |                 270
 fks_users                 |                 100
 fks_wallet_transactions   |                 120
 fks_wallets               |                  50
(20 rows)

```

### Backup Folks schema

#### Backup Database Objects

To create a backup of all database objects, run the below command:

```
<prompt> /Library/PostgreSQL/17/bin/pg_dump -U hearth -d hearthdb --schema-only -F p -f ./hearth_schema.sql

Password: ********

```

It will create a sql file `hearth_schema.sql` in the current directory. The file will have the ddl scripts for tables, view, sequences, etc.

#### Backup All Table Data

```
<prompt> /Library/PostgreSQL/17/bin/pg_dump -U hearth -d hearthdb --data-only --column-inserts -f ./hearth_test_data.sql

Password: ********

```

This will create a file `hearth_test_data.sql` in the current directory containing all the sql insert scripts.


#### Backup Single Table Data

```
<prompt> /Library/PostgreSQL/17/bin/pg_dump -U hearth -d hearthdb --table <table_name> --data-only --column-inserts -f ./hearth_test_data_table_name.sql

Password: ********

```

This will create a file `hearth_test_data_table_name.sql` in the current directory containing all the sql insert scripts.


### View Sequence Status

Since most of the tables in hearth do have an identity column as primary key, hence it is important to periodically review the sequences to see whether they have reached their maximum values.

Data type of all the identity columns in hearth schema is INT. INT in PostgreSQL is a 32-bit signed integer, so the maximum value is `214,74,83,647`, which is about `214.74 crore`.
That means the identity column range is finite. However, never make it cyclic, as it might leads to primary key violation in future.

The safer approach is:

1. Keep identity sequences as `NO CYCLE`.
1. During manual insert use `OVERRIDING SYSTEM VALUE`, **only** if you are hardcoding the identity column value.
   ```
    INSERT INTO employees (employee_id, person_name)
    OVERRIDING SYSTEM VALUE
    VALUE (234, 'Zulu')
   ```
1. Use `setval(...)` after bulk inserts.
   ```
    SELECT setval('employees_employee_id_seq', COALESCE(MAX(employee_id), 1)) FROM employees;
   ```
1. Switch to `BIGINT` if the table grows very large over time.

Sequences created automatically by SERIAL or IDENTITY columns are linked to specific tables.

**(A)** To map sequences directly to their corresponding tables and columns, query the internal dependency catalog:

```
SELECT  t.relname AS table_name, a.attname AS column_name, s.relname AS sequence_name
  FROM pg_class s
  JOIN pg_depend d ON d.objid = s.oid
  JOIN pg_class t ON d.refobjid = t.oid
  JOIN pg_attribute a ON d.refobjid = a.attrelid AND d.refobjsubid = a.attnum
 WHERE s.relkind = 'S';

```

**(B)** To view comlete sequence metadata use the below query:

```
SELECT schemaname, sequencename, sequenceowner, data_type, start_value, increment_by, last_value, cycle
  FROM pg_sequences;

```

Both the above queries should return `17` rows.

### Drop Database

```
DROP DATABASE IF EXISTS hearthdb;
```

### Drop a Role

```
DROP ROLE hearth;
```

### Check The Available Databases

```
SELECT datname
 FROM pg_database;
```

### Check The Available Roles

```
SELECT rolname
  FROM pg_roles;
```