--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: fks_categories, Type: TABLE DATA, Schema: public, Owner: folks
--

INSERT INTO public.fks_categories (category_id, name, icon, tag_line, image, parent_id, created_at, updated_at)
 OVERRIDING SYSTEM VALUE
 VALUES 
 (1, 'Salon & Makeup', 'scissors', 'Professional grooming and beauty services at home.', 'https://images.unsplash.com/photo-1634449571010-02389ed0f9b0?w=800&q=80&auto=format&fit=crop', NULL, '2026-10-02 00:00:00', NULL),
 (2, 'Cleaning & Pest Control', 'broom', 'Deep cleaning and pest treatments that actually last.', 'https://images.unsplash.com/photo-1647381518264-97ff1835026f?w=800&q=80&auto=format&fit=crop', NULL, '2026-10-02 00:00:00', NULL),
 (3, 'Appliance Repair', 'wrench', 'Fast, reliable repairs for the appliances you rely on daily.', 'https://images.unsplash.com/photo-1621905251918-48416bd8575a?w=800&q=80&auto=format&fit=crop', NULL, '2026-10-02 00:00:00', NULL),
 (4, 'Electrician, Plumbing & Carpentry', 'bolt', 'Trusted hands for wiring, leaks and everyday fixes.', 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=800&q=80&auto=format&fit=crop', NULL, '2026-10-02 00:00:00', NULL),
 (5, 'Painting & Décor', 'paint-roller', 'Fresh coats and finishing touches, handled end to end.', 'https://images.unsplash.com/photo-1693985120993-e9b203ce7631?w=800&q=80&auto=format&fit=crop', NULL, '2026-10-02 00:00:00', NULL),
 (6, 'Women''s Salon', NULL, NULL, 'https://images.unsplash.com/photo-1695527081848-1e46c06e6458?w=800&q=80&auto=format&fit=crop', 1, '2026-10-02 00:00:00', NULL),
 (7, 'Men''s Salon', NULL, NULL, 'https://images.unsplash.com/photo-1593702275687-f8b402bf1fb5?w=800&q=80&auto=format&fit=crop', 1, '2026-10-02 00:00:00', NULL),
 (8, 'Bridal & Party Makeup', NULL, NULL, 'https://images.unsplash.com/photo-1636023730877-233b9237d4ec?w=800&q=80&auto=format&fit=crop', 1, '2026-10-02 00:00:00', NULL),
 (9, 'Home Cleaning', NULL, NULL, 'https://images.unsplash.com/photo-1646980241033-cd7abda2ee88?w=800&q=80&auto=format&fit=crop', 2, '2026-10-02 00:00:00', NULL),
 (10, 'Pest Control', NULL, NULL, 'https://images.unsplash.com/photo-1581578017093-cd30fce4eeb7?w=800&q=80&auto=format&fit=crop', 2, '2026-10-02 00:00:00', NULL),
 (11, 'Office Cleaning', NULL, NULL, 'https://images.unsplash.com/photo-1669101602108-fa5ba89507ee?w=800&q=80&auto=format&fit=crop', 2, '2026-10-02 00:00:00', NULL),
 (12, 'AC Service & Repair', NULL, NULL, 'https://images.unsplash.com/photo-1762341123870-d706f257a12e?w=800&q=80&auto=format&fit=crop', 3, '2026-10-02 00:00:00', NULL),
 (13, 'Kitchen & Home Appliances', NULL, NULL, 'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=800&q=80&auto=format&fit=crop', 3, '2026-10-02 00:00:00', NULL),
 (14, 'Electronics Repair', NULL, NULL, 'https://images.unsplash.com/photo-1517420704952-d9f39e95b43e?w=800&q=80&auto=format&fit=crop', 3, '2026-10-02 00:00:00', NULL),
 (15, 'Electrician', NULL, NULL, 'https://images.unsplash.com/photo-1682345262055-8f95f3c513ea?w=800&q=80&auto=format&fit=crop', 4, '2026-10-02 00:00:00', NULL),
 (16, 'Plumbing', NULL, NULL, 'https://images.unsplash.com/photo-1749532125405-70950966b0e5?w=800&q=80&auto=format&fit=crop', 4, '2026-10-02 00:00:00', NULL),
 (17, 'Carpentry', NULL, NULL, 'https://images.unsplash.com/photo-1544164560-adac3045edb2?w=800&q=80&auto=format&fit=crop', 4, '2026-10-02 00:00:00', NULL),
 (18, 'Interior Painting', NULL, NULL, 'https://images.unsplash.com/photo-1717281234297-3def5ae3eee1?w=800&q=80&auto=format&fit=crop', 5, '2026-10-02 00:00:00', NULL),
 (19, 'Exterior Painting', NULL, NULL, 'https://images.unsplash.com/photo-1574359411659-15573a27fd0c?w=800&q=80&auto=format&fit=crop', 5, '2026-10-02 00:00:00', NULL);


--
-- Data for Name: fks_services, Type: TABLE DATA, Schema: public, Owner: folks
--

 INSERT INTO public.fks_services (service_id, category_id, name, description, base_price, currency, duration_minutes, image, rating_avg, reviews, created_at, updated_at)
 OVERRIDING SYSTEM VALUE
 VALUES
 (1, 6, 'Fruit Facial Glow', 'A refreshing fruit-based facial that brightens and hydrates tired skin.', 799.00, 'INR', 60, 'https://images.unsplash.com/photo-1713824096348-c1956e6da321?w=800&q=80&auto=format&fit=crop', 4.80, 2140, '2026-10-01 00:00:00', NULL),
 (2, 6, 'Hair Spa & Care', 'A deep-conditioning hair spa that repairs damage and restores natural shine.', 899.00, 'INR', 75, 'https://images.unsplash.com/photo-1634449571017-5fecfd26ad76?w=800&q=80&auto=format&fit=crop', 4.70, 1560, '2026-10-01 00:00:00', NULL),
 (3, 6, 'Full Arms & Legs Waxing', 'Smooth, salon-grade waxing for arms and legs using a gentle wax.', 599.00, 'INR', 45, 'https://images.unsplash.com/photo-1677091508049-d8ae041b1582?w=800&q=80&auto=format&fit=crop', 4.60, 3200, '2026-10-01 00:00:00', NULL),
 (4, 6, 'Threading (Eyebrows + Upper Lip)', 'Quick, precise threading for perfectly shaped brows and upper lip.', 149.00, 'INR', 20, 'https://images.unsplash.com/photo-1790244342917-b08f24662dde?w=800&q=80&auto=format&fit=crop', 4.50, 4100, '2026-10-01 00:00:00', NULL),
 (5, 6, 'Manicure & Pedicure', 'A classic mani-pedi that leaves hands and feet soft, neat and polished.', 649.00, 'INR', 60, 'https://images.unsplash.com/photo-1664643411326-6c589531be3c?w=800&q=80&auto=format&fit=crop', 4.60, 2450, '2026-10-01 00:00:00', NULL),
 (6, 6, 'Global Hair Colour', 'Ammonia-friendly global colour application for full, even coverage.', 1299.00, 'INR', 90, 'https://images.unsplash.com/photo-1605980625600-88b46abafa8d?w=800&q=80&auto=format&fit=crop', 4.50, 870, '2026-10-01 00:00:00', NULL),
 (7, 7, 'Haircut & Styling', 'A precision haircut and styling from an experienced men''s stylist.', 299.00, 'INR', 30, 'https://images.unsplash.com/photo-1657105052497-f996284ffff8?w=800&q=80&auto=format&fit=crop', 4.70, 5200, '2026-10-01 00:00:00', NULL),
 (8, 7, 'Beard Shape-up & Trim', 'Sharp beard shaping and trim to keep your look fresh.', 199.00, 'INR', 20, 'https://images.unsplash.com/photo-1599011176306-4a96f1516d4d?w=800&q=80&auto=format&fit=crop', 4.60, 4700, '2026-10-01 00:00:00', NULL),
 (9, 7, 'Head & Shoulder Massage', 'A relaxing head and shoulder massage to relieve stress and tension.', 399.00, 'INR', 30, 'https://images.unsplash.com/photo-1542848285-4777eb2a621e?w=800&q=80&auto=format&fit=crop', 4.80, 2300, '2026-10-01 00:00:00', NULL),
 (10, 7, 'De-Tan Facial for Men', 'A de-tan facial that clears dullness and refreshes sun-exposed skin.', 549.00, 'INR', 45, 'https://images.unsplash.com/photo-1728949202477-bad2935775cb?w=800&q=80&auto=format&fit=crop', 4.50, 1340, '2026-10-01 00:00:00', NULL),
 (11, 7, 'Beard & Hair Colour', 'Natural-looking colour touch-up for greying hair and beard.', 349.00, 'INR', 30, 'https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=800&q=80&auto=format&fit=crop', 4.40, 980, '2026-10-01 00:00:00', NULL),
 (12, 8, 'Party Makeup', 'Camera-ready party makeup tailored to your outfit and occasion.', 1499.00, 'INR', 90, 'https://images.unsplash.com/photo-1709477542149-f4e0e21d590b?w=800&q=80&auto=format&fit=crop', 4.90, 860, '2026-10-01 00:00:00', NULL),
 (13, 8, 'Bridal Makeup (HD)', 'Long-lasting HD bridal makeup with draping and hairstyling included.', 6999.00, 'INR', 150, 'https://images.unsplash.com/photo-1610173827043-9db50e0d8ef9?w=800&q=80&auto=format&fit=crop', 4.90, 410, '2026-10-01 00:00:00', NULL),
 (14, 8, 'Nail Art & Manicure', 'A gel manicure with custom nail art finished by a trained nail artist.', 499.00, 'INR', 40, 'https://images.unsplash.com/photo-1754799670312-8e7da8e40ad7?w=800&q=80&auto=format&fit=crop', 4.60, 1980, '2026-10-01 00:00:00', NULL),
 (15, 8, 'Engagement Makeup', 'Soft-glam engagement makeup designed to photograph beautifully.', 2999.00, 'INR', 100, 'https://images.unsplash.com/photo-1600685890506-593fdf55949b?w=800&q=80&auto=format&fit=crop', 4.80, 320, '2026-10-01 00:00:00', NULL),
 (16, 9, 'Full Home Deep Cleaning', 'A comprehensive deep clean covering every room, kitchen and bathroom.', 3499.00, 'INR', 240, 'https://images.unsplash.com/photo-1740657254989-42fe9c3b8cce?w=800&q=80&auto=format&fit=crop', 4.80, 6200, '2026-10-01 00:00:00', NULL),
 (17, 9, 'Kitchen Deep Cleaning', 'Degreasing and sanitising of chimney, hob, cabinets and countertops.', 899.00, 'INR', 90, 'https://images.unsplash.com/photo-1736433622548-4adbbc1c2cf2?w=800&q=80&auto=format&fit=crop', 4.70, 3100, '2026-10-01 00:00:00', NULL),
 (18, 9, 'Bathroom Deep Cleaning', 'Descaling and disinfecting tiles, fittings and fixtures until spotless.', 499.00, 'INR', 60, 'https://images.unsplash.com/photo-1691496550053-80260c93db8f?w=800&q=80&auto=format&fit=crop', 4.60, 4400, '2026-10-01 00:00:00', NULL),
 (19, 9, 'Sofa & Carpet Shampooing', 'A machine shampoo wash to lift dirt and stains from sofas and carpets.', 799.00, 'INR', 75, 'https://images.unsplash.com/photo-1686178827149-6d55c72d81df?w=800&q=80&auto=format&fit=crop', 4.50, 1870, '2026-10-01 00:00:00', NULL),
 (20, 9, 'Balcony & Grille Cleaning', 'Scrubbing and de-staining of balcony floors, grilles and railings.', 399.00, 'INR', 40, 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800&q=80&auto=format&fit=crop', 4.40, 760, '2026-10-01 00:00:00', NULL),
 (21, 9, 'Move-in / Move-out Cleaning', 'A thorough top-to-bottom clean to prep a home before or after moving.', 2799.00, 'INR', 180, 'https://images.unsplash.com/photo-1714647211902-bb711d643a17?w=800&q=80&auto=format&fit=crop', 4.70, 1120, '2026-10-01 00:00:00', NULL),
 (22, 10, 'General Pest Control', 'An odourless spray treatment that keeps common household pests away.', 999.00, 'INR', 60, 'https://images.unsplash.com/photo-1747659629851-a92bd71149f6?w=800&q=80&auto=format&fit=crop', 4.60, 2800, '2026-10-01 00:00:00', NULL),
 (23, 10, 'Cockroach Control', 'A gel-based treatment that targets cockroaches at the source.', 699.00, 'INR', 45, 'https://images.unsplash.com/photo-1611773236409-f3ee161007a1?w=800&q=80&auto=format&fit=crop', 4.50, 2100, '2026-10-01 00:00:00', NULL),
 (24, 10, 'Termite Control', 'An anti-termite treatment with long-lasting protection for wood and walls.', 2499.00, 'INR', 120, 'https://images.unsplash.com/photo-1562123404-528b41e573a0?w=800&q=80&auto=format&fit=crop', 4.70, 940, '2026-10-01 00:00:00', NULL),
 (25, 10, 'Mosquito Fogging', 'A fogging treatment that clears mosquito breeding spots indoors and out.', 599.00, 'INR', 30, 'https://images.unsplash.com/photo-1707943768453-7850f916ebde?w=800&q=80&auto=format&fit=crop', 4.40, 1330, '2026-10-01 00:00:00', NULL),
 (26, 10, 'Bed Bug Treatment', 'A targeted treatment that eliminates bed bugs from mattresses and furniture.', 1299.00, 'INR', 90, 'https://images.unsplash.com/photo-1727198634627-645ef5356455?w=800&q=80&auto=format&fit=crop', 4.50, 640, '2026-10-01 00:00:00', NULL),
 (27, 10, 'Rodent Control', 'Safe trapping and sealing to keep rodents out for good.', 899.00, 'INR', 50, 'https://images.unsplash.com/photo-1624116518496-993146f67f4a?w=800&q=80&auto=format&fit=crop', 4.40, 510, '2026-10-01 00:00:00', NULL),
 (28, 11, 'Office Deep Cleaning', 'A full deep clean for workstations, common areas and pantries.', 4999.00, 'INR', 300, 'https://images.unsplash.com/photo-1627905646269-7f034dcc5738?w=800&q=80&auto=format&fit=crop', 4.60, 380, '2026-10-01 00:00:00', NULL),
 (29, 11, 'Carpet & Upholstery Cleaning', 'Machine cleaning for office carpets, chairs and fabric partitions.', 1899.00, 'INR', 120, 'https://images.unsplash.com/photo-1742483359033-13315b247c74?w=800&q=80&auto=format&fit=crop', 4.50, 210, '2026-10-01 00:00:00', NULL),
 (30, 11, 'Sanitization Service', 'Disinfectant fogging across surfaces, desks and high-touch points.', 2499.00, 'INR', 90, 'https://images.unsplash.com/photo-1628177142898-93e36e4e3a50?w=800&q=80&auto=format&fit=crop', 4.60, 300, '2026-10-01 00:00:00', NULL),
 (31, 12, 'AC General Service', 'A foam-jet cleaning that restores cooling efficiency and airflow.', 549.00, 'INR', 45, 'https://images.unsplash.com/photo-1737012197886-7d5a52ded45b?w=800&q=80&auto=format&fit=crop', 4.70, 7100, '2026-10-01 00:00:00', NULL),
 (32, 12, 'AC Repair Visit', 'A diagnostic visit to identify and fix cooling or noise issues.', 299.00, 'INR', 30, 'https://images.unsplash.com/photo-1660330589827-da8ab7dd3c02?w=800&q=80&auto=format&fit=crop', 4.50, 3900, '2026-10-01 00:00:00', NULL),
 (33, 12, 'AC Gas Refill', 'A refrigerant top-up for ACs that have lost cooling performance.', 2199.00, 'INR', 90, 'https://images.unsplash.com/photo-1694532438941-06bb0d95dae5?w=800&q=80&auto=format&fit=crop', 4.60, 1200, '2026-10-01 00:00:00', NULL),
 (34, 12, 'Split AC Installation', 'Professional mounting and installation of a new split AC unit.', 1499.00, 'INR', 120, 'https://images.unsplash.com/photo-1757219525975-03b5984bc6e8?w=800&q=80&auto=format&fit=crop', 4.60, 860, '2026-10-01 00:00:00', NULL),
 (35, 12, 'Window AC Installation', 'Secure fitting and sealing for a new window AC unit.', 999.00, 'INR', 90, 'https://images.unsplash.com/photo-1718203862467-c33159fdc504?w=800&q=80&auto=format&fit=crop', 4.50, 540, '2026-10-01 00:00:00', NULL),
 (36, 13, 'Refrigerator Repair', 'A diagnostic and repair visit for cooling, noise or leakage issues.', 399.00, 'INR', 45, 'https://images.unsplash.com/photo-1630459065645-549fe5a56db4?w=800&q=80&auto=format&fit=crop', 4.50, 2600, '2026-10-01 00:00:00', NULL),
 (37, 13, 'Washing Machine Repair', 'Troubleshooting and repair for drainage, spin or drum issues.', 399.00, 'INR', 45, 'https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?w=800&q=80&auto=format&fit=crop', 4.50, 3300, '2026-10-01 00:00:00', NULL),
 (38, 13, 'Microwave Repair', 'A repair visit for heating, sparking or control panel problems.', 349.00, 'INR', 30, 'https://images.unsplash.com/photo-1585659722983-3a675dabf23d?w=800&q=80&auto=format&fit=crop', 4.40, 1150, '2026-10-01 00:00:00', NULL),
 (39, 13, 'Water Purifier Service', 'A filter check and service to keep your RO purifier running safely.', 449.00, 'INR', 40, 'https://images.unsplash.com/photo-1669211659110-3f3db4119b65?w=800&q=80&auto=format&fit=crop', 4.60, 1980, '2026-10-01 00:00:00', NULL),
 (40, 13, 'Chimney Repair & Cleaning', 'Degreasing filters and checking suction for a smoke-free kitchen.', 599.00, 'INR', 50, 'https://images.unsplash.com/photo-1714358013380-b75b16127007?w=800&q=80&auto=format&fit=crop', 4.50, 890, '2026-10-01 00:00:00', NULL),
 (41, 13, 'Geyser Repair & Service', 'A safety check and repair for heating elements and thermostats.', 449.00, 'INR', 40, 'https://images.unsplash.com/photo-1594233078955-e1f73a02ebb2?w=800&q=80&auto=format&fit=crop', 4.40, 760, '2026-10-01 00:00:00', NULL),
 (42, 14, 'TV Repair', 'A diagnostic visit for display, sound or power issues on any TV.', 449.00, 'INR', 45, 'https://images.unsplash.com/photo-1593784991251-92ded75ea290?w=800&q=80&auto=format&fit=crop', 4.40, 720, '2026-10-01 00:00:00', NULL),
 (43, 14, 'Laptop Repair', 'Hardware and software troubleshooting for slow or malfunctioning laptops.', 599.00, 'INR', 60, 'https://images.unsplash.com/photo-1721333089073-215a56fd710c?w=800&q=80&auto=format&fit=crop', 4.30, 480, '2026-10-01 00:00:00', NULL),
 (44, 14, 'Inverter & Battery Repair', 'Testing and repair to keep your home inverter backup reliable.', 499.00, 'INR', 45, 'https://images.unsplash.com/photo-1676337167752-2062c6ca7366?w=800&q=80&auto=format&fit=crop', 4.40, 390, '2026-10-01 00:00:00', NULL),
 (45, 15, 'Switch & Socket Repair', 'Fix or replace faulty switches and sockets safely.', 149.00, 'INR', 20, 'https://images.unsplash.com/photo-1751486289947-4f5f5961b3aa?w=800&q=80&auto=format&fit=crop', 4.60, 3400, '2026-10-01 00:00:00', NULL),
 (46, 15, 'Ceiling Fan Installation', 'Secure mounting and wiring of a new ceiling fan.', 249.00, 'INR', 30, 'https://images.unsplash.com/photo-1609519479841-5fd3b2884e17?w=800&q=80&auto=format&fit=crop', 4.60, 2700, '2026-10-01 00:00:00', NULL),
 (47, 15, 'House Wiring Inspection', 'A full electrical safety check to catch wiring issues early.', 499.00, 'INR', 60, 'https://images.unsplash.com/photo-1758101755915-462eddc23f57?w=800&q=80&auto=format&fit=crop', 4.50, 980, '2026-10-01 00:00:00', NULL),
 (48, 15, 'MCB & Fuse Repair', 'Diagnosis and repair of tripping MCBs or blown fuses.', 299.00, 'INR', 30, 'https://images.unsplash.com/photo-1576446470246-499c738d1c8e?w=800&q=80&auto=format&fit=crop', 4.50, 1340, '2026-10-01 00:00:00', NULL),
 (49, 15, 'Inverter Installation', 'Wiring and setup for a new home inverter and battery backup.', 799.00, 'INR', 75, 'https://images.unsplash.com/photo-1660330589693-99889d60181e?w=800&q=80&auto=format&fit=crop', 4.50, 610, '2026-10-01 00:00:00', NULL),
 (50, 15, 'CCTV / Video Doorbell Install', 'Mounting and wiring for a smart camera or video doorbell.', 649.00, 'INR', 60, 'https://images.unsplash.com/photo-1549109926-58f039549485?w=800&q=80&auto=format&fit=crop', 4.60, 540, '2026-10-01 00:00:00', NULL),
 (51, 16, 'Tap & Mixer Repair', 'Fix leaking or jammed taps and mixers in the kitchen or bathroom.', 149.00, 'INR', 20, 'https://images.unsplash.com/photo-1610278764397-388d11c35ddb?w=800&q=80&auto=format&fit=crop', 4.60, 3900, '2026-10-01 00:00:00', NULL),
 (52, 16, 'Pipe Leakage Repair', 'Locate and seal pipe leaks before they cause water damage.', 349.00, 'INR', 40, 'https://images.unsplash.com/photo-1676210133055-eab6ef033ce3?w=800&q=80&auto=format&fit=crop', 4.50, 2200, '2026-10-01 00:00:00', NULL),
 (53, 16, 'Toilet & Flush Repair', 'Repair of flush tanks, jets or toilet seat fittings.', 299.00, 'INR', 35, 'https://images.unsplash.com/photo-1676210134050-6f12c6898395?w=800&q=80&auto=format&fit=crop', 4.50, 1870, '2026-10-01 00:00:00', NULL),
 (54, 16, 'Water Tank Cleaning', 'Deep cleaning and disinfection of overhead or underground tanks.', 599.00, 'INR', 60, 'https://images.unsplash.com/photo-1646488993053-8c182b628696?w=800&q=80&auto=format&fit=crop', 4.40, 990, '2026-10-01 00:00:00', NULL),
 (55, 16, 'Water Heater Installation', 'Safe mounting and plumbing connection for a new geyser.', 549.00, 'INR', 60, 'https://images.unsplash.com/photo-1620653713380-7a34b773fef8?w=800&q=80&auto=format&fit=crop', 4.50, 720, '2026-10-01 00:00:00', NULL),
 (56, 16, 'Drainage Cleaning', 'Clearing clogged drains to restore normal water flow.', 449.00, 'INR', 45, 'https://images.unsplash.com/photo-1654440122140-f1fc995ddb34?w=800&q=80&auto=format&fit=crop', 4.30, 650, '2026-10-01 00:00:00', NULL),
 (57, 17, 'Furniture Assembly', 'Assembly of flat-pack furniture like beds, wardrobes and desks.', 349.00, 'INR', 45, 'https://images.unsplash.com/photo-1772338537689-056082f100a9?w=800&q=80&auto=format&fit=crop', 4.60, 1650, '2026-10-01 00:00:00', NULL),
 (58, 17, 'Door & Lock Repair', 'Fix sticking doors, loose hinges or faulty locks.', 299.00, 'INR', 30, 'https://images.unsplash.com/photo-1677951570313-b0750351c461?w=800&q=80&auto=format&fit=crop', 4.50, 1420, '2026-10-01 00:00:00', NULL),
 (59, 17, 'Furniture Repair', 'Repair of wobbly, broken or damaged wooden furniture.', 399.00, 'INR', 40, 'https://images.unsplash.com/photo-1679797850019-3d0d8659a695?w=800&q=80&auto=format&fit=crop', 4.40, 870, '2026-10-01 00:00:00', NULL),
 (60, 17, 'Curtain Rod Installation', 'Levelled mounting of curtain rods and brackets on any wall.', 249.00, 'INR', 30, 'https://images.unsplash.com/photo-1771039621750-2548ea40e52c?w=800&q=80&auto=format&fit=crop', 4.50, 610, '2026-10-01 00:00:00', NULL),
 (61, 17, 'Wall Shelf Installation', 'Secure fitting of wall-mounted shelves and storage units.', 299.00, 'INR', 35, 'https://images.unsplash.com/photo-1781032384657-320d38787e77?w=800&q=80&auto=format&fit=crop', 4.40, 480, '2026-10-01 00:00:00', NULL),
 (62, 18, 'Single Room Painting', 'Two coats of premium emulsion for one room''s walls and ceiling.', 3999.00, 'INR', 480, 'https://images.unsplash.com/photo-1562259949-e8e7689d7828?w=800&q=80&auto=format&fit=crop', 4.60, 610, '2026-10-01 00:00:00', NULL),
 (63, 18, 'Full Home Painting', 'A complete interior painting package sized for 2-3 BHK homes.', 24999.00, 'INR', 2400, 'https://images.unsplash.com/photo-1742900280861-32bed068938b?w=800&q=80&auto=format&fit=crop', 4.70, 340, '2026-10-01 00:00:00', NULL),
 (64, 18, 'Accent Wall Texture Design', 'A textured finish applied to a feature wall for a design accent.', 4999.00, 'INR', 480, 'https://images.unsplash.com/photo-1610422218546-42b7f1f84dbd?w=800&q=80&auto=format&fit=crop', 4.50, 210, '2026-10-01 00:00:00', NULL),
 (65, 18, 'Wood Polish & Varnish', 'Refinishing for doors, furniture and wood trims to restore their shine.', 2499.00, 'INR', 480, 'https://images.unsplash.com/photo-1599651993975-30a482e26467?w=800&q=80&auto=format&fit=crop', 4.50, 260, '2026-10-01 00:00:00', NULL),
 (66, 18, 'Wall Stencil Art', 'A custom stencil design hand-painted onto a wall of your choice.', 1999.00, 'INR', 300, 'https://images.unsplash.com/photo-1775210326611-890803b318fa?w=800&q=80&auto=format&fit=crop', 4.40, 180, '2026-10-01 00:00:00', NULL),
 (67, 19, 'Exterior Wall Painting', 'A weatherproof exterior painting package for independent houses.', 18999.00, 'INR', 2040, 'https://images.unsplash.com/photo-1742900280864-bcc27353ceba?w=800&q=80&auto=format&fit=crop', 4.60, 260, '2026-10-01 00:00:00', NULL),
 (68, 19, 'Waterproofing Treatment', 'Preventive waterproofing for terraces, walls and bathrooms.', 5999.00, 'INR', 480, 'https://images.unsplash.com/photo-1674485169641-bcb2bf6f1df9?w=800&q=80&auto=format&fit=crop', 4.70, 430, '2026-10-01 00:00:00', NULL),
 (69, 19, 'Metal Grill & Gate Painting', 'Anti-rust primer and enamel finish for grilles, gates and railings.', 2999.00, 'INR', 480, 'https://images.unsplash.com/photo-1576169510450-fd0392650023?w=800&q=80&auto=format&fit=crop', 4.40, 150, '2026-10-01 00:00:00', NULL);
