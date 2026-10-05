-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Table Script (Maintain the order of creation) --

-- 0. Serving/Operating Cities --

CREATE TABLE fks_countries (
    country_id          INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    country_code        VARCHAR(3)      NOT NULL,
    country_name        VARCHAR(128)    NOT NULL,
    language_code       VARCHAR(3)      NOT NULL,
    language            VARCHAR(30)     NOT NULL,
    locale_code         VARCHAR(8)      NOT NULL,
    currency_code       VARCHAR(3)      NOT NULL,
    currency            VARCHAR(20)     NOT NULL,
    timezone            VARCHAR(32)     NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       
);

CREATE TABLE fks_provinces (
    province_id         INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    country_id          INT             NOT NULL,
    province_name       VARCHAR(128)    ,
    region              VARCHAR(32)     ,
    language            VARCHAR(30)     NOT NULL,
    status              VARCHAR(20)     NOT NULL CHECK (status IN ('PLANNED', 'ACTIVE', 'PAUSED', 'INACTIVE')),
    launched_at         DATE            ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       
);

CREATE TABLE fks_cities (
    city_id             INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    province_id         INT             NOT NULL,
    city_name           VARCHAR(50)     NOT NULL,
    image_key           VARCHAR(128)    ,
    status              VARCHAR(20)     NOT NULL CHECK (status IN ('PLANNED', 'ACTIVE', 'PAUSED', 'INACTIVE')),
    launched_at         DATE            ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       
);

CREATE TABLE fks_neighbourhoods (
    neighbourhood_id    INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    city_id             INT             NOT NULL,
    locality            VARCHAR(80)     NOT NULL,
    pincode             INT             NOT NULL,
    zone                VARCHAR(80)     NOT NULL,
    latitude            NUMERIC(20, 6)  ,
    longitude           NUMERIC(20, 6)  ,
    is_serviceable      SMALLINT        NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       
);


-- 1. Users (Customers + Service Professionals + Admins)

CREATE TABLE fks_users (
    user_id             INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    external_id         VARCHAR(36)     NOT NULL,
    full_name           VARCHAR(96)     NOT NULL,
    email               VARCHAR(128)    NOT NULL,
    phone1              VARCHAR(20)     NOT NULL,
    phone2              VARCHAR(20)     ,
    password_hash       TEXT            ,
    role                VARCHAR(16)     NOT NULL CHECK (role IN ('CUSTOMER', 'PROFESSIONAL', 'ADMIN')),
    status              VARCHAR(16)     NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE', 'BLOCKED')),
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- Address

CREATE TABLE fks_addresses (
    address_id          INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    user_id             INT             NOT NULL,
    address_line1       VARCHAR(128)    NOT NULL,
    address_line2       VARCHAR(128)    ,
    neighbourhood_id    INT             NOT NULL,
    latitude            NUMERIC(20, 6)  ,
    longitude           NUMERIC(20, 6)  ,
    is_default          SMALLINT        NOT NULL,
    label               VARCHAR(20)     NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 2. Service Catalog - Categories & Services

CREATE TABLE fks_categories (
    category_id         INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    name                VARCHAR(128)    NOT NULL,
    icon                VARCHAR(16)     ,
    tag_line            VARCHAR(128)    ,
    image               VARCHAR(128)    ,
    parent_id           INT             ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

CREATE TABLE fks_services (
    service_id          INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    category_id         INT             NOT NULL,
    name                VARCHAR(128)    NOT NULL,
    description         TEXT            ,
    base_price          NUMERIC(7, 2)   NOT NULL,
    currency            VARCHAR(3)      NOT NULL,
    duration_minutes    SMALLINT        ,
    image               VARCHAR(128)    ,
    rating_avg          NUMERIC(3, 2)   ,
    reviews             INT             ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 3. Professional Profiles

CREATE TABLE fks_professionals (
    professional_id     INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    user_id             INT             NOT NULL,
    bio                 TEXT            ,
    experience_years    SMALLINT        NOT NULL,
    serving_cities      VARCHAR(255)    NOT NULL,
    rating_avg          NUMERIC(3, 2)   ,
    is_verified         SMALLINT        NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- Professional Skills

CREATE TABLE fks_professional_services (
    id                  INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    professional_id     INT             NOT NULL,
    service_id          INT             NOT NULL,
    price               NUMERIC(7, 2)   NOT NULL,
    is_active           SMALLINT        NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- Professional Service Areas

CREATE TABLE fks_professional_neighbourhoods (
    id                  INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    professional_id     INT             NOT NULL,
    neighbourhood_id    INT             NOT NULL,
    status              VARCHAR(20)     NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE')),
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       
);

-- Professional's Availability

CREATE TABLE fks_availabilities (
    availability_id     INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    professional_id     INT             NOT NULL,
    date                DATE            NOT NULL,
    start_time          TIME            ,
    end_time            TIME            ,
    is_booked           SMALLINT        NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);


-- 4. Booking & Scheduling

-- Booking

CREATE TABLE fks_bookings (
    booking_id          VARCHAR(36)     NOT NULL,
    customer_id         INT             NOT NULL,
    professional_id     INT             NOT NULL,
    service_id          INT             NOT NULL,
    address_id          INT             NOT NULL,
    scheduled_at        TIMESTAMP       NOT NULL,
    time_slot           VARCHAR(24)     NOT NULL,
    status              VARCHAR(16)     CHECK (status IN ('PENDING', 'CONFIRMED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    status_msg          VARCHAR(255)    NUll,
    total_amount        NUMERIC(20, 6)  NOT NULL,
    payment_method      VARCHAR(16)     CHECK (payment_method IN ('CARD', 'UPI', 'WALLET', 'COD')),
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP       ,
    updated_by          VARCHAR(50)
);

-- 5. Payments & Pricing

-- Payments

CREATE TABLE fks_payments (
    payment_id          INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    booking_id          VARCHAR(36)     NOT NULL,
    amount              NUMERIC(7, 2)   NOT NULL,
    payment_method      VARCHAR(16)     CHECK (payment_method IN ('CARD', 'UPI', 'WALLET', 'COD')),
    payment_status      VARCHAR(16)     CHECK (payment_status IN ('INITIATED', 'SUCCESS', 'FAILED', 'REFUNDED')),
    transaction_ref     VARCHAR(128)    NOT NULL,
    paid_at             TIMESTAMP       NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- Coupons & Discounts

CREATE TABLE fks_coupons (
    coupon_id           INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    code                VARCHAR(16)     NOT NULL,
    title               VARCHAR(48)     NOT NULL,
    description         VARCHAR(128)    NOT NULL,
    terms               VARCHAR(128)    NOT NULL,
    discount_type       VARCHAR(16)     NOT NULL,
    discount_value      NUMERIC(7, 2)   ,
    max_discount        NUMERIC(7, 2)   ,
    expiry_date         DATE            ,
    usage_limit         SMALLINT        ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

CREATE TABLE fks_coupon_usage (
    usage_id            INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    coupon_id           INT             NOT NULL,
    user_id             INT             NOT NULL,
    booking_id          VARCHAR(36)     NOT NULL,
    used_at             TIMESTAMP       NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 6. Ratings & Reviews

CREATE TABLE fks_reviews (
    review_id           INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    booking_id          VARCHAR(36)     NOT NULL,
    customer_id         INT             NOT NULL,
    professional_id     INT             NOT NULL,
    rating              SMALLINT        ,
    comment             TEXT            ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 7. Communication

CREATE TABLE fks_conversations (
    conversation_id     INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    booking_id          VARCHAR(36)     NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

CREATE TABLE fks_messages (
    message_id          INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    conversation_id     INT             NOT NULL,
    sender_id           INT             NOT NULL,
    message_text        TEXT            ,
    sent_at             TIMESTAMP       NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 8. Operations & Logistics

CREATE TABLE fks_job_status (
    log_id              INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    booking_id          VARCHAR(36)     NOT NULL,
    status              VARCHAR(32)     NOT NULL,
    updated_by          INT             ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 9. Admin & Compliance

-- Documents (KYC, Verification)

CREATE TABLE fks_documents (
    document_id         INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    professional_id     INT             NOT NULL,
    application_id      VARCHAR(36)     NOT NULL,
    document_type       VARCHAR(50)     NOT NULL,
    document_number     VARCHAR(50)     NOT NULL,
    document_url        TEXT            ,
    name_on_document    VARCHAR(50)     NOT NULL,
    verification_status VARCHAR(16)     CHECK (verification_status IN ('PENDING', 'APPROVED', 'REJECTED')),
    comment             VARCHAR(128)    ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 10. Surge Pricing

CREATE TABLE fks_pricing_rules (
    rule_id             INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    service_id          INT             NOT NULL,
    city                VARCHAR(100)    NOT NULL,
    multiplier          NUMERIC(7, 2)   NOT NULL,
    start_time          TIMESTAMP       NOT NULL,
    end_time            TIMESTAMP       NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 11. Wallet Systems

CREATE TABLE fks_wallets (
    wallet_id           VARCHAR(36)     NOT NULL,
    user_id             INT             NOT NULL,
    balance             NUMERIC(7, 2)   ,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

CREATE TABLE fks_wallet_transactions (
    txn_id              VARCHAR(64)     NOT NULL,
    wallet_id           VARCHAR(36)     NOT NULL,
    amount              NUMERIC(7, 2)   NOT NULL,
    type                VARCHAR(16)     CHECK (type IN ('CREDIT', 'DEBIT')),
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);

-- 12. Analytics / Audit

CREATE TABLE fks_audit_logs (
    log_id              INT             GENERATED ALWAYS AS IDENTITY NOT NULL,
    user_id             INT             NOT NULL,
    action              VARCHAR(64)     NOT NULL,
    entity_type         VARCHAR(50)     NOT NULL,
    entity_id           INT             NOT NULL,
    created_at          TIMESTAMP       NOT NULL,
    updated_at          TIMESTAMP     
);
