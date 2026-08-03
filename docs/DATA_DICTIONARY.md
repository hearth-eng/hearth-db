# Folks Data Dictionary


## fks_users

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| user_id | Unique identifier for the user | INT | No | Yes |
| external_id | Unique external identifier for the user | VARCHAR(36) | No | Yes |
| full_name | User's full name | VARCHAR(96) | No | No |
| email | User's email address | VARCHAR(128) | No | No |
| phone1 | Primary phone number | VARCHAR(20) | No | No |
| phone2 | Secondary phone number | VARCHAR(20) | Yes | No |
| password_hash | Hashed password for authentication | TEXT | No | No |
| role | User role (Customer, Professional, Admin) | VARCHAR(32) | Yes | No |
| status | Account status (Active, Inactive, Blocked) | VARCHAR(32) | Yes | No |
| created_at | Record creation timestamp | TIMESTAMP | No | No |
| updated_at | Last update timestamp | TIMESTAMP | Yes | No |

## fks_addresses

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| address_id | Unique identifier for address | INT | No | Yes |
| user_id | Owner of the address | INT | No | No |
| address_line1 | Primary address line | VARCHAR(255) | No | No |
| address_line2 | Secondary address line | VARCHAR(255) | No | No |
| city | City name | VARCHAR(64) | No | No |
| state | State name | VARCHAR(64) | No | No |
| pincode | Postal code | VARCHAR(20) | No | No |
| latitude | Latitude coordinate | DECIMAL(10,7) | Yes | No |
| longitude | Longitude coordinate | DECIMAL(10,7) | Yes | No |
| is_default | Indicates default address | SMALLINT | No | No |

## fks_categories

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| category_id | Unique identifier for category | INT | No | Yes |
| name | Category name | VARCHAR(128) | No | No |
| parent_id | Parent category reference | INT | Yes | No |

## fks_services

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| service_id | Unique identifier for service | INT | No | Yes |
| category_id | Associated category | INT | No | No |
| name | Service name | VARCHAR(128) | No | No |
| description | Service description | TEXT | Yes | No |
| base_price | Base price of service | DECIMAL(10,2) | No | No |
| duration_minutes | Estimated duration in minutes | INT | Yes | No |

## fks_professionals

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| professional_id | Unique identifier for professional | INT | No | Yes |
| user_id | Linked user account | INT | No | No |
| bio | Professional biography | TEXT | Yes | No |
| experience_years | Years of experience | INT | No | No |
| rating_avg | Average rating | DECIMAL(3,2) | Yes | No |
| is_verified | Verification status flag | SMALLINT | No | No |

## fks_professional_services

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| id | Unique mapping identifier | INT | No | Yes |
| professional_id | Professional offering service | INT | No | No |
| service_id | Offered service | INT | No | No |
| price | Professional-specific service price | DECIMAL(10,2) | No | No |
| is_active | Active flag for service offering | SMALLINT | No | No |

## fks_bookings

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| booking_id | Unique booking identifier | VARCHAR(36) | No | Yes |
| customer_id | Customer making booking | INT | No | No |
| professional_id | Assigned professional | INT | No | No |
| service_id | Booked service | INT | No | No |
| address_id | Service delivery address | INT | No | No |
| scheduled_at | Scheduled service date and time | TIMESTAMP | No | No |
| status | Booking lifecycle status | VARCHAR(32) | Yes | No |
| total_amount | Total booking amount | DECIMAL(10,2) | No | No |
| created_at | Booking creation timestamp | TIMESTAMP | No | No |

## fks_availability

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| availability_id | Unique availability record identifier | INT | No | Yes |
| professional_id | Professional whose availability is tracked | INT | No | No |
| date | Availability date | DATE | No | No |
| start_time | Availability start time | TIMESTAMP | Yes | No |
| end_time | Availability end time | TIMESTAMP | Yes | No |
| is_booked | Indicates slot booking status | SMALLINT | No | No |

## fks_payments

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| payment_id | Unique payment identifier | INT | No | Yes |
| booking_id | Related booking | VARCHAR(36) | No | No |
| amount | Payment amount | DECIMAL(10,2) | No | No |
| payment_method | Payment method used | VARCHAR(32) | Yes | No |
| payment_status | Status of payment transaction | VARCHAR(32) | Yes | No |
| transaction_ref | External transaction reference | VARCHAR(128) | No | No |
| paid_at | Payment timestamp | TIMESTAMP | No | No |

## fks_coupons

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| coupon_id | Unique coupon identifier | INT | No | Yes |
| code | Coupon code | VARCHAR(50) | No | No |
| discount_type | Discount type (Percent/Flat) | VARCHAR(16) | Yes | No |
| discount_value | Discount amount/value | DECIMAL(10,2) | Yes | No |
| max_discount | Maximum allowable discount | DECIMAL(10,2) | Yes | No |
| expiry_date | Coupon expiry date | DATE | No | No |
| usage_limit | Maximum usage count | INT | Yes | No |

## fks_coupon_usage

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| id | Unique coupon usage identifier | INT | No | Yes |
| coupon_id | Applied coupon | INT | No | No |
| user_id | User who used the coupon | INT | No | No |
| booking_id | Booking where coupon was applied | INT | No | No |
| used_at | Coupon usage timestamp | TIMESTAMP | No | No |

## fks_reviews

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| review_id | Unique review identifier | INT | No | Yes |
| booking_id | Associated booking | INT | No | No |
| customer_id | Reviewing customer | INT | No | No |
| professional_id | Reviewed professional | INT | No | No |
| rating | Rating score (1-5) | INT | Yes | No |
| comment | Customer feedback comment | TEXT | Yes | No |
| created_at | Review creation timestamp | TIMESTAMP | No | No |

## fks_conversations

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| conversation_id | Unique conversation identifier | INT | No | Yes |
| booking_id | Associated booking | INT | No | No |
| created_at | Conversation creation timestamp | TIMESTAMP | No | No |

## fks_messages

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| message_id | Unique message identifier | INT | No | Yes |
| conversation_id | Parent conversation | INT | No | No |
| sender_id | Sender user identifier | INT | No | No |
| message_text | Message content | TEXT | Yes | No |
| sent_at | Message sent timestamp | TIMESTAMP | No | No |

## fks_job_status

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| log_id | Unique status log identifier | INT | No | Yes |
| booking_id | Related booking | INT | No | No |
| status | Job status value | VARCHAR(32) | No | No |
| updated_at | Status update timestamp | TIMESTAMP | Yes | No |
| updated_by | User who updated status | INT | Yes | No |

## fks_documents

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| document_id | Unique document identifier | INT | No | Yes |
| user_id | Document owner | INT | No | No |
| document_type | Type of uploaded document | VARCHAR(50) | No | No |
| document_url | Location of document file | TEXT | Yes | No |
| verification_status | Verification status | VARCHAR(32) | Yes | No |
| uploaded_at | Upload timestamp | TIMESTAMP | Yes | No |

## fks_audit_logs

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| log_id | Unique audit log identifier | INT | No | Yes |
| user_id | User performing action | INT | No | No |
| action | Action performed | VARCHAR(255) | No | No |
| entity_type | Type of affected entity | VARCHAR(50) | No | No |
| entity_id | Identifier of affected entity | INT | No | No |
| created_at | Audit log creation timestamp | TIMESTAMP | No | No |

## fks_pricing_rules

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| rule_id | Unique pricing rule identifier | INT | No | Yes |
| service_id | Applicable service | INT | No | No |
| city | Applicable city | VARCHAR(100) | No | No |
| multiplier | Surge pricing multiplier | DECIMAL(5,2) | No | No |
| start_time | Rule start time | TIMESTAMP | No | No |
| end_time | Rule end time | TIMESTAMP | No | No |

## fks_wallets

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| wallet_id | Unique wallet identifier | INT | No | Yes |
| user_id | Wallet owner | INT | No | No |
| balance | Current wallet balance | DECIMAL(10,2) | Yes | No |

## fks_wallet_transactions

| Column | Description | Data Type | Nullable? | Primary Key |
|----------|-------------|------------|------------|-------------|
| txn_id | Unique wallet transaction identifier | INT | No | Yes |
| wallet_id | Associated wallet | INT | No | No |
| amount | Transaction amount | DECIMAL(10,2) | No | No |
| type | Transaction type (Credit/Debit) | VARCHAR(32) | Yes | No |
| created_at | Transaction timestamp | TIMESTAMP | No | No |