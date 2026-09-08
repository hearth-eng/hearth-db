-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Reset Sequences --

SELECT setval('public.fks_countries_country_id_seq', COALESCE(MAX(country_id), 1)) FROM public.fks_countries;
SELECT setval('public.fks_provinces_province_id_seq', COALESCE(MAX(province_id), 1)) FROM public.fks_provinces;
SELECT setval('public.fks_cities_city_id_seq', COALESCE(MAX(city_id), 1)) FROM public.fks_cities;
SELECT setval('public.fks_neighbourhoods_neighbourhood_id_seq', COALESCE(MAX(neighbourhood_id), 1)) FROM public.fks_neighbourhoods;
SELECT setval('public.fks_users_user_id_seq', COALESCE(MAX(user_id), 1)) FROM public.fks_users;
SELECT setval('public.fks_addresses_address_id_seq', COALESCE(MAX(address_id), 1)) FROM public.fks_addresses;
SELECT setval('public.fks_professionals_professional_id_seq', COALESCE(MAX(professional_id), 1)) FROM public.fks_professionals;
SELECT setval('public.fks_documents_document_id_seq', COALESCE(MAX(document_id), 1)) FROM public.fks_documents;
SELECT setval('public.fks_categories_category_id_seq', COALESCE(MAX(category_id), 1)) FROM public.fks_categories;
SELECT setval('public.fks_services_service_id_seq', COALESCE(MAX(service_id), 1)) FROM public.fks_services;
SELECT setval('public.fks_professional_services_id_seq', COALESCE(MAX(id), 1)) FROM public.fks_professional_services;
SELECT setval('public.fks_professional_neighbourhoods_id_seq', COALESCE(MAX(id), 1)) FROM public.fks_professional_neighbourhoods;
SELECT setval('public.fks_availabilities_availability_id_seq', COALESCE(MAX(availability_id), 1)) FROM public.fks_availabilities;
SELECT setval('public.fks_payments_payment_id_seq', COALESCE(MAX(payment_id), 1)) FROM public.fks_payments;
SELECT setval('public.fks_pricing_rules_rule_id_seq', COALESCE(MAX(rule_id), 1)) FROM public.fks_pricing_rules;
SELECT setval('public.fks_reviews_review_id_seq', COALESCE(MAX(review_id), 1)) FROM public.fks_reviews;
SELECT setval('public.fks_conversations_conversation_id_seq', COALESCE(MAX(conversation_id), 1)) FROM public.fks_conversations;
SELECT setval('public.fks_messages_message_id_seq', COALESCE(MAX(message_id), 1)) FROM public.fks_messages;
SELECT setval('public.fks_job_status_log_id_seq', COALESCE(MAX(log_id), 1)) FROM public.fks_job_status;
SELECT setval('public.fks_coupons_coupon_id_seq', COALESCE(MAX(coupon_id), 1)) FROM public.fks_coupons;
SELECT setval('public.fks_coupon_usage_usage_id_seq', COALESCE(MAX(usage_id), 1)) FROM public.fks_coupon_usage;
SELECT setval('public.fks_audit_logs_log_id_seq', COALESCE(MAX(log_id), 1)) FROM public.fks_audit_logs;
