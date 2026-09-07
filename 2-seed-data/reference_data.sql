-- Run the below script to generate the tables --
-- h2-script.sh -url jdbc:h2:tcp://localhost:9092/~/testdb -user test -password test123 -script /Users/schan280/temp/folks-app/src/main/resources/db/schema.sql --

-- Reference data (Admin user) --

\set script_timestamp CURRENT_TIMESTAMP

INSERT INTO public.fks_users (user_id, external_id, full_name, email, phone1, phone2, password_hash, role, status, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES 
(1, gen_random_uuid(), 'Folks Admin', 'folks.admin@javalabs.org', '9000000000', NULL, '7c6a180b36896a0a8c02787eeafb0e4c', 'ADMIN', 'ACTIVE', CURRENT_TIMESTAMP, null),
(2, gen_random_uuid(), 'Node Admin', 'node.admin@javalabs.org', '8000000000', NULL, '6cb75f652a9b52798eb6cf2201057c73', 'ADMIN', 'ACTIVE', CURRENT_TIMESTAMP, null),
(3, gen_random_uuid(), 'Support Admin', 'support.admin@javalabs.org', '7000000000', NULL, '6cb75f652a9b52798eb6cf2201057c73', 'ADMIN', 'ACTIVE', CURRENT_TIMESTAMP, null);


-- Reference data (Cities where folks is operational) --

--1. Countries

INSERT INTO fks_countries (country_id, country_code, country_name, language_code, language, locale_code, currency_code, currency, timezone, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES (1, 'IN', 'India', 'en', 'English', 'en_US', 'INR', 'Indian Rupee', 'Asia/Kolkata', CURRENT_TIMESTAMP, NULL);

-- 2. States

INSERT INTO fks_provinces (province_id, country_id, province_name, region, language, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES
    (1,  '1', 'Andhra Pradesh',       'SOUTH',     'Telugu',     CURRENT_TIMESTAMP, NULL),
    (2,  '1', 'Arunachal Pradesh',    'NORTHEAST', 'English',    CURRENT_TIMESTAMP, NULL),
    (3,  '1', 'Assam',                'NORTHEAST', 'Assamese',   CURRENT_TIMESTAMP, NULL),
    (4,  '1', 'Bihar',                'EAST',      'Hindi',      CURRENT_TIMESTAMP, NULL),
    (5,  '1', 'Chhattisgarh',         'CENTRAL',   'Hindi',      CURRENT_TIMESTAMP, NULL),
    (6,  '1', 'Goa',                  'WEST',      'Konkani',    CURRENT_TIMESTAMP, NULL),
    (7,  '1', 'Gujarat',              'WEST',      'Gujarati',   CURRENT_TIMESTAMP, NULL),
    (8,  '1', 'Haryana',              'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (9,  '1', 'Himachal Pradesh',     'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (10, '1', 'Jharkhand',            'EAST',      'Hindi',      CURRENT_TIMESTAMP, NULL),
    (11, '1', 'Karnataka',            'SOUTH',     'Kannada',    CURRENT_TIMESTAMP, NULL),
    (12, '1', 'Kerala',               'SOUTH',     'Malayalam',  CURRENT_TIMESTAMP, NULL),
    (13, '1', 'Madhya Pradesh',       'CENTRAL',   'Hindi',      CURRENT_TIMESTAMP, NULL),
    (14, '1', 'Maharashtra',          'WEST',      'Marathi',    CURRENT_TIMESTAMP, NULL),
    (15, '1', 'Manipur',              'NORTHEAST', 'Meitei',     CURRENT_TIMESTAMP, NULL),
    (16, '1', 'Meghalaya',            'NORTHEAST', 'English',    CURRENT_TIMESTAMP, NULL),
    (17, '1', 'Mizoram',              'NORTHEAST', 'Mizo',       CURRENT_TIMESTAMP, NULL),
    (18, '1', 'Nagaland',             'NORTHEAST', 'English',    CURRENT_TIMESTAMP, NULL),
    (19, '1', 'Odisha',               'EAST',      'Odia',       CURRENT_TIMESTAMP, NULL),
    (20, '1', 'Punjab',               'NORTH',     'Punjabi',    CURRENT_TIMESTAMP, NULL),
    (21, '1', 'Rajasthan',            'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (22, '1', 'Sikkim',               'NORTHEAST', 'English',    CURRENT_TIMESTAMP, NULL),
    (23, '1', 'Tamil Nadu',           'SOUTH',     'Tamil',      CURRENT_TIMESTAMP, NULL),
    (24, '1', 'Telangana',            'SOUTH',     'Telugu',     CURRENT_TIMESTAMP, NULL),
    (25, '1', 'Tripura',              'NORTHEAST', 'Bengali',    CURRENT_TIMESTAMP, NULL),
    (26, '1', 'Uttar Pradesh',        'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (27, '1', 'Uttarakhand',          'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (28, '1', 'West Bengal',          'EAST',      'Bengali',    CURRENT_TIMESTAMP, NULL),

    -- Union Territories
    (29, '1', 'Andaman and Nicobar Islands', 'SOUTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (30, '1', 'Chandigarh',             'NORTH',     'English',    CURRENT_TIMESTAMP, NULL),
    (31, '1', 'Dadra and Nagar Haveli and Daman and Diu', 'WEST',      'Gujarati',   CURRENT_TIMESTAMP, NULL),
    (32, '1', 'Delhi',                  'NORTH',     'Hindi',      CURRENT_TIMESTAMP, NULL),
    (33, '1', 'Jammu and Kashmir',      'NORTH',     'Kashmiri',   CURRENT_TIMESTAMP, NULL),
    (34, '1', 'Ladakh',                 'NORTH',     'English',    CURRENT_TIMESTAMP, NULL),
    (35, '1', 'Lakshadweep',            'SOUTH',     'Malayalam',  CURRENT_TIMESTAMP, NULL),
    (36, '1', 'Puducherry',             'SOUTH',     'Tamil',      CURRENT_TIMESTAMP, NULL);

-- 3. Cities

INSERT INTO fks_cities (city_id, province_id, city_name, image_key, status, launched_at, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES
    -- Tier 1 / Major Metros
    (1, 14, 'Mumbai',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (2, 32, 'Delhi',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (3, 11, 'Bengaluru',          NULL, 'ACTIVE',  NULL, CURRENT_TIMESTAMP, NULL),
    (4, 24, 'Hyderabad',          NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (5, 23, 'Chennai',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (6, 28, 'Kolkata',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (7,  7, 'Ahmedabad',          NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (8, 14, 'Pune',               NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),

    -- Tier 2 / Major Emerging Cities
    (9,  7, 'Surat',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (10, 21, 'Jaipur',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (11, 26, 'Lucknow',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (12, 26, 'Kanpur',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (13, 14, 'Nagpur',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (14, 13, 'Indore',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (15, 14, 'Thane',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (16, 13, 'Bhopal',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (17,  1, 'Visakhapatnam',      NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (18, 14, 'Pimpri-Chinchwad',   NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (19,  4, 'Patna',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (20, 26, 'Ghaziabad',          NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (21, 26, 'Agra',               NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (22,  8, 'Faridabad',          NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (23, 26, 'Varanasi',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (24, 33, 'Srinagar',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (25, 14, 'Chhatrapati Sambhajinagar', NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (26, 10, 'Dhanbad',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (27, 20, 'Amritsar',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (28, 14, 'Navi Mumbai',        NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (29, 26, 'Prayagraj',          NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (30, 10, 'Ranchi',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (31, 13, 'Jabalpur',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (32, 13, 'Gwalior',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (33, 23, 'Coimbatore',         NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (34, 21, 'Jodhpur',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (35,  5, 'Raipur',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (36, 21, 'Kota',               NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (37, 30, 'Chandigarh',         NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (38,  3, 'Guwahati',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (39, 11, 'Mysuru',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (40,  8, 'Gurugram',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (41, 26, 'Noida',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (42, 12, 'Kochi',              NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (43, 19, 'Bhubaneswar',        NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (44,  7, 'Vadodara',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (45, 23, 'Madurai',            NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (46,  1, 'Vijayawada',         NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (47, 14, 'Nashik',             NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (48, 12, 'Thiruvananthapuram', NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (49, 20, 'Ludhiana',           NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL),
    (50, 23, 'Tiruchirappalli',    NULL, 'PLANNED', NULL, CURRENT_TIMESTAMP, NULL);
    

-- 4. Servcing Areas of an Operating City --

INSERT INTO fks_neighbourhoods (neighbourhood_id, city_id, locality, pincode, latitude, longitude, is_serviceable, created_at, updated_at)
OVERRIDING SYSTEM VALUE
VALUES
    (1,   3, 'MG Road',                    560001, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (2,   3, 'Shivajinagar',               560001, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (3,   3, 'Richmond Town',              560025, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (4,   3, 'Vasanth Nagar',              560052, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (5,   3, 'Ulsoor',                     560008, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (6,   3, 'Commercial Street',          560001, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (7,   3, 'Frazer Town',                560005, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (8,   3, 'Cox Town',                   560005, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (9,   3, 'Cooke Town',                 560005, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (10,  3, 'Benson Town',                560046, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (11,  3, 'Indiranagar',                560038, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (12,  3, 'Domlur',                     560071, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (13,  3, 'HAL 2nd Stage',              560008, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (14,  3, 'New Thippasandra',           560075, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (15,  3, 'Jeevan Bhima Nagar',         560075, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (16,  3, 'CV Raman Nagar',             560093, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (17,  3, 'Old Airport Road',           560017, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (18,  3, 'Maruthi Seva Nagar',         560033, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (19,  3, 'Dooravani Nagar',            560016, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (20,  3, 'Ramamurthy Nagar',           560016, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (21,  3, 'Koramangala',                560034, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (22,  3, 'Koramangala 6th Block',      560095, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (23,  3, 'Ejipura',                    560047, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (24,  3, 'BTM Layout',                 560076, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (25,  3, 'HSR Layout',                 560102, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (26,  3, 'Bommanahalli',               560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (27,  3, 'Begur',                      560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (28,  3, 'Hongasandra',                560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (29,  3, 'Singasandra',                560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (30,  3, 'Mangammanapalya',            560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (31,  3, 'Jayanagar',                  560041, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (32,  3, 'Jayanagar 3rd Block',        560011, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (33,  3, 'Jayanagar East',             560041, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (34,  3, 'JP Nagar',                   560078, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (35,  3, 'Banashankari',                560050, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (36,  3, 'Banashankari 2nd Stage',     560070, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (37,  3, 'Banashankari 3rd Stage',     560085, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (38,  3, 'Basavanagudi',               560004, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (39,  3, 'Girinagar',                  560085, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (40,  3, 'Kumaraswamy Layout',          560111, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (41,  3, 'Padmanabhanagar',            560070, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (42,  3, 'Uttarahalli',                560061, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (43,  3, 'Subramanyapura',             560061, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (44,  3, 'Vasanthapura',               560061, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (45,  3, 'Konanakunte',                560062, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (46,  3, 'Kanakapura Road',            560062, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (47,  3, 'Arekere',                    560076, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (48,  3, 'Hulimavu',                   560076, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (49,  3, 'Bannerghatta Road',          560076, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (50,  3, 'Gottigere',                  560083, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (51,  3, 'Malleshwaram',               560003, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (52,  3, 'Sadashivanagar',             560080, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (53,  3, 'Seshadripuram',              560020, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (54,  3, 'Rajajinagar',                560010, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (55,  3, 'Basaveshwaranagar',          560079, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (56,  3, 'Nandini Layout',             560096, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (57,  3, 'Vijayanagar',                560040, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (58,  3, 'Nagarbhavi',                 560072, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (59,  3, 'Attiguppe',                  560040, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (60,  3, 'Kamakshipalya',              560079, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (61,  3, 'Yeshwanthpur',               560022, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (62,  3, 'Peenya',                     560058, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (63,  3, 'Jalahalli',                  560013, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (64,  3, 'Jalahalli East',             560014, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (65,  3, 'Jalahalli West',             560015, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (66,  3, 'Mathikere',                  560054, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (67,  3, 'Vidyaranyapura',              560097, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (68,  3, 'Hebbal',                     560024, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (69,  3, 'Hebbal Kempapura',           560024, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (70,  3, 'RT Nagar',                   560032, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (71,  3, 'Sahakara Nagar',             560092, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (72,  3, 'Amruthahalli',               560092, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (73,  3, 'Jakkur',                     560064, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (74,  3, 'Yelahanka',                  560064, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (75,  3, 'Doddaballapur Road',         560064, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (76,  3, 'Nagawara',                   560045, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (77,  3, 'HBR Layout',                 560043, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (78,  3, 'Kalyan Nagar',               560043, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (79,  3, 'Banaswadi',                  560043, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (80,  3, 'Horamavu',                   560113, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (81,  3, 'Whitefield',                 560066, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (82,  3, 'Brookefield',                560037, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (83,  3, 'Marathahalli',               560037, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (84,  3, 'Hoodi',                     560048, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (85,  3, 'Mahadevapura',               560048, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (86,  3, 'Doddanekkundi',              560037, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (87,  3, 'Kadugodi',                   560067, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (88,  3, 'Varthur',                    560087, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (89,  3, 'Gunjur',                     560087, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (90,  3, 'KR Puram',                   560036, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),

    (91,  3, 'Bellandur',                  560103, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (92,  3, 'Sarjapur Road',              560035, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (93,  3, 'Carmelaram',                 560035, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (94,  3, 'Electronic City',            560100, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (95,  3, 'Bommasandra',                560099, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (96,  3, 'Chandapura',                 560081, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (97,  3, 'Akshayanagar',               560076, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (98,  3, 'Hosur Road',                 560068, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (99,  3, 'Devanahalli',                562110, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL),
    (100, 3, 'Sarjapura',                  562125, NULL, NULL, 1, CURRENT_TIMESTAMP, NULL);

