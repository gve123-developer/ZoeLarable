-- Zoe Pharmacy & General Merchandise
-- Apply final official product details to all 1,842 active products.
-- Category rule: MED = Pharmaceutical; all other source codes = Non-pharmaceutical.
-- Source: supplied Populated_Meds_Database_With_Prices_and_Expiries.xlsx

BEGIN;

DO $$
DECLARE v_count integer;
BEGIN
  SELECT COUNT(*) INTO v_count FROM products;
  IF v_count <> 1842 THEN
    RAISE EXCEPTION 'Pre-check failed: expected 1842 active products, found %', v_count;
  END IF;
END $$;

UPDATE products
SET sku = 'MED-00001',
    name = '4G Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.53,
    cost = 5.86,
    reorder_level = 20,
    expiry_date = DATE '2029-07-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 1;
UPDATE products
SET sku = 'MED-00002',
    name = 'ADVIL Liqui-gel Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-steroidal anti-inflammatory drug (Ibuprofen) for headache, fever, toothache, and body pain.',
    quantity = 100,
    price = 12.82,
    cost = 9.91,
    reorder_level = 20,
    expiry_date = DATE '2029-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 2;
UPDATE products
SET sku = 'MED-00003',
    name = 'ADVIL Suspension 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-steroidal anti-inflammatory drug (Ibuprofen) for headache, fever, toothache, and body pain.',
    quantity = 100,
    price = 71.88,
    cost = 55.72,
    reorder_level = 20,
    expiry_date = DATE '2029-07-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 3;
UPDATE products
SET sku = 'NPH-00001',
    name = 'AGUA OXIGENADA 10V  60mL (Ace)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '3% Hydrogen Peroxide topical antiseptic solution for cleaning cuts, abrasions, and minor wounds.',
    quantity = 100,
    price = 33.03,
    cost = 26.69,
    reorder_level = 20,
    expiry_date = DATE '2027-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 4;
UPDATE products
SET sku = 'NPH-00002',
    name = 'AGUA OXIGENADA 10V 120mL (Ace)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '3% Hydrogen Peroxide topical antiseptic solution for cleaning cuts, abrasions, and minor wounds.',
    quantity = 100,
    price = 95.54,
    cost = 76.66,
    reorder_level = 20,
    expiry_date = DATE '2029-04-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 5;
UPDATE products
SET sku = 'MED-00004',
    name = 'ALAXAN FR Capsule 10''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Synergistic Ibuprofen + Paracetamol formulation for fast relief of intense body and muscle aches.',
    quantity = 100,
    price = 113.58,
    cost = 88.89,
    reorder_level = 20,
    expiry_date = DATE '2028-10-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 6;
UPDATE products
SET sku = 'MED-00005',
    name = 'ALAXAN FR Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Synergistic Ibuprofen + Paracetamol formulation for fast relief of intense body and muscle aches.',
    quantity = 100,
    price = 11.65,
    cost = 9.70,
    reorder_level = 20,
    expiry_date = DATE '2028-12-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 7;
UPDATE products
SET sku = 'MED-00006',
    name = 'ALAXAN Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Synergistic Ibuprofen + Paracetamol formulation for fast relief of intense body and muscle aches.',
    quantity = 100,
    price = 9.93,
    cost = 7.58,
    reorder_level = 20,
    expiry_date = DATE '2027-04-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 8;
UPDATE products
SET sku = 'MED-00007',
    name = 'ALBOTHYL Suppository 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Policresulen antiseptic/hemostatic agent for local gynecological and mucosal indications.',
    quantity = 100,
    price = 44.17,
    cost = 35.83,
    reorder_level = 20,
    expiry_date = DATE '2028-02-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 9;
UPDATE products
SET sku = 'NPH-00003',
    name = 'ALCAMFORADO  50mL (IPI)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Camphorated oil liniment for sprains, bruises, neuralgia, and soothing relief from insect bites.',
    quantity = 100,
    price = 71.42,
    cost = 57.72,
    reorder_level = 20,
    expiry_date = DATE '2030-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 10;
UPDATE products
SET sku = 'NPH-00004',
    name = 'ALCOPLUS Ethyl 70%  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 53.14,
    cost = 40.42,
    reorder_level = 20,
    expiry_date = DATE '2028-09-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 11;
UPDATE products
SET sku = 'NPH-00005',
    name = 'ALCOPLUS Ethyl 70% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 57.01,
    cost = 46.37,
    reorder_level = 20,
    expiry_date = DATE '2027-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 12;
UPDATE products
SET sku = 'NPH-00006',
    name = 'ALCOPLUS Ethyl 70% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 94.06,
    cost = 75.27,
    reorder_level = 20,
    expiry_date = DATE '2030-07-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 13;
UPDATE products
SET sku = 'NPH-00007',
    name = 'ALCOPLUS Ethyl 70% 330ml-Spray',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 150.77,
    cost = 123.87,
    reorder_level = 20,
    expiry_date = DATE '2029-03-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 14;
UPDATE products
SET sku = 'NPH-00008',
    name = 'ALCOPLUS Ethyl 70% 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 259.22,
    cost = 199.06,
    reorder_level = 20,
    expiry_date = DATE '2027-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 15;
UPDATE products
SET sku = 'NPH-00009',
    name = 'ALCOPLUS Ethyl 70% 60mL 6''s+1 Doz.Hard&Mat 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 123.70,
    cost = 101.56,
    reorder_level = 20,
    expiry_date = DATE '2030-02-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00001';
UPDATE products
SET sku = 'NPH-00010',
    name = 'ALCOPLUS Ethyl 70% 60mL-Spray',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 64.48,
    cost = 49.59,
    reorder_level = 20,
    expiry_date = DATE '2030-01-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 16;
UPDATE products
SET sku = 'NPH-00011',
    name = 'ALCOPLUS Ethyl.70% 60 3''s+free Grips WaxHM',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 64.77,
    cost = 50.84,
    reorder_level = 20,
    expiry_date = DATE '2028-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00002';
UPDATE products
SET sku = 'NPH-00012',
    name = 'ALCOPLUS Iso.70% 60 3''s+free GripClay',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 62.48,
    cost = 49.02,
    reorder_level = 20,
    expiry_date = DATE '2028-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00003';
UPDATE products
SET sku = 'NPH-00013',
    name = 'ALCOPLUS Iso.70% 60 6''s+freeGripClay',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 40.17,
    cost = 31.56,
    reorder_level = 20,
    expiry_date = DATE '2027-12-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00004';
UPDATE products
SET sku = 'NPH-00014',
    name = 'ALCOPLUS Isopropyl 40%  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 54.90,
    cost = 44.48,
    reorder_level = 20,
    expiry_date = DATE '2028-01-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 17;
UPDATE products
SET sku = 'NPH-00015',
    name = 'ALCOPLUS Isopropyl 40% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 74.19,
    cost = 59.40,
    reorder_level = 20,
    expiry_date = DATE '2027-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 18;
UPDATE products
SET sku = 'NPH-00016',
    name = 'ALCOPLUS Isopropyl 40% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 87.55,
    cost = 68.46,
    reorder_level = 20,
    expiry_date = DATE '2029-07-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 19;
UPDATE products
SET sku = 'NPH-00017',
    name = 'ALCOPLUS Isopropyl 40% 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 290.98,
    cost = 239.78,
    reorder_level = 20,
    expiry_date = DATE '2027-03-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 20;
UPDATE products
SET sku = 'NPH-00018',
    name = 'ALCOPLUS Isopropyl 70%  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 40.27,
    cost = 33.09,
    reorder_level = 20,
    expiry_date = DATE '2028-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 21;
UPDATE products
SET sku = 'NPH-00019',
    name = 'ALCOPLUS Isopropyl 70% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 74.42,
    cost = 59.77,
    reorder_level = 20,
    expiry_date = DATE '2029-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 22;
UPDATE products
SET sku = 'NPH-00020',
    name = 'ALCOPLUS Isopropyl 70% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 114.16,
    cost = 88.10,
    reorder_level = 20,
    expiry_date = DATE '2029-08-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 23;
UPDATE products
SET sku = 'NPH-00021',
    name = 'ALCOPLUS Isopropyl 70% 330ml-Spray',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 74.29,
    cost = 57.59,
    reorder_level = 20,
    expiry_date = DATE '2030-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 24;
UPDATE products
SET sku = 'NPH-00022',
    name = 'ALCOPLUS Isopropyl 70% 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 275.27,
    cost = 229.07,
    reorder_level = 20,
    expiry_date = DATE '2029-07-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 25;
UPDATE products
SET sku = 'NPH-00023',
    name = 'ALCOPLUS Isopropyl 70% 60mL-Spray',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 51.27,
    cost = 42.48,
    reorder_level = 20,
    expiry_date = DATE '2027-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00005';
UPDATE products
SET sku = 'MED-00008',
    name = 'ALLERKID Drops 10mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 53.04,
    cost = 41.65,
    reorder_level = 20,
    expiry_date = DATE '2028-04-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 26;
UPDATE products
SET sku = 'MED-00009',
    name = 'ALLERKID Syrup 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 26.70,
    cost = 21.82,
    reorder_level = 20,
    expiry_date = DATE '2030-03-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 27;
UPDATE products
SET sku = 'MED-00010',
    name = 'ALLERKID Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 49.10,
    cost = 38.41,
    reorder_level = 20,
    expiry_date = DATE '2027-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 28;
UPDATE products
SET sku = 'MED-00011',
    name = 'ALLERTA Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 64.02,
    cost = 51.36,
    reorder_level = 20,
    expiry_date = DATE '2027-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 29;
UPDATE products
SET sku = 'MED-00012',
    name = 'ALLERTA Tablet 10mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.67,
    cost = 12.99,
    reorder_level = 20,
    expiry_date = DATE '2027-07-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 30;
UPDATE products
SET sku = 'MED-00013',
    name = 'ALLERZET 2.5mg Syrup 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.36,
    cost = 41.16,
    reorder_level = 20,
    expiry_date = DATE '2029-04-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 31;
UPDATE products
SET sku = 'MED-00014',
    name = 'ALLERZET 2.5mg Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.93,
    cost = 26.19,
    reorder_level = 20,
    expiry_date = DATE '2029-04-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 32;
UPDATE products
SET sku = 'MED-00015',
    name = 'ALNIX Drops 10mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.06,
    cost = 38.29,
    reorder_level = 20,
    expiry_date = DATE '2030-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 33;
UPDATE products
SET sku = 'MED-00016',
    name = 'ALNIX Plus Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.80,
    cost = 44.13,
    reorder_level = 20,
    expiry_date = DATE '2030-04-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 34;
UPDATE products
SET sku = 'MED-00017',
    name = 'ALNIX Plus Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.26,
    cost = 15.74,
    reorder_level = 20,
    expiry_date = DATE '2027-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 35;
UPDATE products
SET sku = 'MED-00018',
    name = 'ALNIX Syrup 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.94,
    cost = 31.43,
    reorder_level = 20,
    expiry_date = DATE '2030-07-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 36;
UPDATE products
SET sku = 'MED-00019',
    name = 'ALNIX Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.68,
    cost = 28.55,
    reorder_level = 20,
    expiry_date = DATE '2027-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 37;
UPDATE products
SET sku = 'MED-00020',
    name = 'ALNIX Tablet 10mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.24,
    cost = 5.01,
    reorder_level = 20,
    expiry_date = DATE '2027-07-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 38;
UPDATE products
SET sku = 'NPH-00024',
    name = 'ALTHEA Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 59.92,
    cost = 46.98,
    reorder_level = 20,
    expiry_date = DATE '2029-08-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 39;
UPDATE products
SET sku = 'MED-00021',
    name = 'AMBROLEX 15mg Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.08,
    cost = 32.25,
    reorder_level = 20,
    expiry_date = DATE '2027-09-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 40;
UPDATE products
SET sku = 'MED-00022',
    name = 'AMBROLEX 30mg Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 71.95,
    cost = 57.58,
    reorder_level = 20,
    expiry_date = DATE '2029-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 41;
UPDATE products
SET sku = 'MED-00023',
    name = 'AMBROLEX Drops',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.40,
    cost = 19.41,
    reorder_level = 20,
    expiry_date = DATE '2028-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 42;
UPDATE products
SET sku = 'MED-00024',
    name = 'AMBROLEX Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.03,
    cost = 4.93,
    reorder_level = 20,
    expiry_date = DATE '2027-10-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 43;
UPDATE products
SET sku = 'MED-00025',
    name = 'AMOXICILLIN Cap 250mg (VHELLOX)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 19.72,
    cost = 14.97,
    reorder_level = 20,
    expiry_date = DATE '2028-05-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 44;
UPDATE products
SET sku = 'MED-00026',
    name = 'AMOXICILLIN Cap 500mg (VHELLOX)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 8.07,
    cost = 6.59,
    reorder_level = 20,
    expiry_date = DATE '2030-08-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 45;
UPDATE products
SET sku = 'MED-00027',
    name = 'AMOXICILLIN Cap.250mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 16.13,
    cost = 13.38,
    reorder_level = 20,
    expiry_date = DATE '2028-07-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 50;
UPDATE products
SET sku = 'MED-00028',
    name = 'AMOXICILLIN Cap.500mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 11.44,
    cost = 8.73,
    reorder_level = 20,
    expiry_date = DATE '2029-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 51;
UPDATE products
SET sku = 'MED-00029',
    name = 'AMOXICILLIN Capsule 500mg (Nixolin)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 13.33,
    cost = 10.23,
    reorder_level = 20,
    expiry_date = DATE '2029-01-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 52;
UPDATE products
SET sku = 'MED-00030',
    name = 'AMOXICILLIN Drops (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 53.83,
    cost = 44.61,
    reorder_level = 20,
    expiry_date = DATE '2029-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 53;
UPDATE products
SET sku = 'MED-00031',
    name = 'AMOXICLAV 625mg Tab. (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.90,
    cost = 13.98,
    reorder_level = 20,
    expiry_date = DATE '2029-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 54;
UPDATE products
SET sku = 'MED-00032',
    name = 'AMOXIL 500mg Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.64,
    cost = 12.51,
    reorder_level = 20,
    expiry_date = DATE '2029-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 55;
UPDATE products
SET sku = 'MED-00033',
    name = 'AMVASC BE  5mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.47,
    cost = 11.86,
    reorder_level = 20,
    expiry_date = DATE '2030-11-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 56;
UPDATE products
SET sku = 'MED-00034',
    name = 'AMVASC BE 10mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.32,
    cost = 14.41,
    reorder_level = 20,
    expiry_date = DATE '2028-08-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 57;
UPDATE products
SET sku = 'MED-00035',
    name = 'ANTIOX Suspension 10mL (Choco)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.74,
    cost = 15.50,
    reorder_level = 20,
    expiry_date = DATE '2028-03-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 58;
UPDATE products
SET sku = 'MED-00036',
    name = 'ANTIOX Tablet 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.64,
    cost = 13.58,
    reorder_level = 20,
    expiry_date = DATE '2030-12-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 59;
UPDATE products
SET sku = 'NPH-00025',
    name = 'AP-AP Solution 30mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 50.69,
    cost = 41.47,
    reorder_level = 20,
    expiry_date = DATE '2029-07-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 60;
UPDATE products
SET sku = 'NPH-00026',
    name = 'AP-AP Solution 60mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 56.66,
    cost = 43.30,
    reorder_level = 20,
    expiry_date = DATE '2028-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 61;
UPDATE products
SET sku = 'MED-00037',
    name = 'APPEBON KID Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 28.78,
    cost = 23.54,
    reorder_level = 20,
    expiry_date = DATE '2029-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 62;
UPDATE products
SET sku = 'MED-00038',
    name = 'APPEBON KID Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 74.72,
    cost = 57.10,
    reorder_level = 20,
    expiry_date = DATE '2028-05-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 63;
UPDATE products
SET sku = 'MED-00039',
    name = 'APPEBON KID Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 160.20,
    cost = 123.46,
    reorder_level = 20,
    expiry_date = DATE '2030-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 64;
UPDATE products
SET sku = 'MED-00040',
    name = 'APPEBON with Iron Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.57,
    cost = 6.71,
    reorder_level = 20,
    expiry_date = DATE '2028-04-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 65;
UPDATE products
SET sku = 'MED-00041',
    name = 'APPEBON with Iron Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.54,
    cost = 38.76,
    reorder_level = 20,
    expiry_date = DATE '2029-04-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 66;
UPDATE products
SET sku = 'MED-00042',
    name = 'APPEBON with Iron Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 61.71,
    cost = 50.01,
    reorder_level = 20,
    expiry_date = DATE '2027-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 67;
UPDATE products
SET sku = 'MED-00043',
    name = 'ARCOXIA Tablet 120mg 5''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.31,
    cost = 10.89,
    reorder_level = 20,
    expiry_date = DATE '2030-07-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 68;
UPDATE products
SET sku = 'MED-00044',
    name = 'ARCOXIA Tablet 60mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.93,
    cost = 17.68,
    reorder_level = 20,
    expiry_date = DATE '2029-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 69;
UPDATE products
SET sku = 'MED-00045',
    name = 'ARCOXIA Tablet 90mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.40,
    cost = 14.69,
    reorder_level = 20,
    expiry_date = DATE '2028-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 70;
UPDATE products
SET sku = 'MED-00046',
    name = 'ARCOXIA Tablet AC 120mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.11,
    cost = 17.19,
    reorder_level = 20,
    expiry_date = DATE '2029-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 71;
UPDATE products
SET sku = 'MED-00047',
    name = 'ASCOF 600mg 5-DAY ReliefPck(10+5)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 54.43,
    cost = 42.97,
    reorder_level = 20,
    expiry_date = DATE '2030-10-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 72;
UPDATE products
SET sku = 'MED-00048',
    name = 'ASCOF Forte 600mg Capsule  60''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.69,
    cost = 17.38,
    reorder_level = 20,
    expiry_date = DATE '2028-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 73;
UPDATE products
SET sku = 'MED-00049',
    name = 'ASCOF Forte 600mg Capsule 120''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.26,
    cost = 16.38,
    reorder_level = 20,
    expiry_date = DATE '2028-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 74;
UPDATE products
SET sku = 'MED-00050',
    name = 'ASCOF Forte 600mg Tablet 12+ 3',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.36,
    cost = 17.63,
    reorder_level = 20,
    expiry_date = DATE '2030-05-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 75;
UPDATE products
SET sku = 'MED-00051',
    name = 'ASCOF Forte 600mg Tablet 120''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.38,
    cost = 5.98,
    reorder_level = 20,
    expiry_date = DATE '2029-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 76;
UPDATE products
SET sku = 'MED-00052',
    name = 'ASCOF Ponkan 120mL w/Crayola',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 97.99,
    cost = 75.96,
    reorder_level = 20,
    expiry_date = DATE '2027-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 77;
UPDATE products
SET sku = 'MED-00053',
    name = 'ASCOF Syrup  60mL (Ponkan)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 29.82,
    cost = 23.00,
    reorder_level = 20,
    expiry_date = DATE '2029-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 78;
UPDATE products
SET sku = 'MED-00054',
    name = 'ASCOF Syrup 120mL (Ponkan)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 100.76,
    cost = 81.70,
    reorder_level = 20,
    expiry_date = DATE '2027-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 79;
UPDATE products
SET sku = 'MED-00055',
    name = 'ASCOF Syrup 120mL-Strawberry',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 96.03,
    cost = 77.01,
    reorder_level = 20,
    expiry_date = DATE '2030-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 80;
UPDATE products
SET sku = 'MED-00056',
    name = 'ASCOF Syrup Forte Menthol  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.25,
    cost = 27.00,
    reorder_level = 20,
    expiry_date = DATE '2030-04-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 81;
UPDATE products
SET sku = 'MED-00057',
    name = 'ASCOF Syrup Forte Menthol  60mL-Sugar Free',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.67,
    cost = 37.60,
    reorder_level = 20,
    expiry_date = DATE '2029-11-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 82;
UPDATE products
SET sku = 'MED-00058',
    name = 'ASCOF Syrup Forte Menthol 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.65,
    cost = 51.70,
    reorder_level = 20,
    expiry_date = DATE '2029-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 83;
UPDATE products
SET sku = 'MED-00059',
    name = 'ASCOF Syrup Forte Menthol 120mL-Sugar Free',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.67,
    cost = 38.90,
    reorder_level = 20,
    expiry_date = DATE '2030-09-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 84;
UPDATE products
SET sku = 'MED-00060',
    name = 'ASCOF Syrup Strawberry  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.83,
    cost = 27.67,
    reorder_level = 20,
    expiry_date = DATE '2027-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 85;
UPDATE products
SET sku = 'MED-00061',
    name = 'ASCOF Tablet 300mg (Lagundi)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.89,
    cost = 10.46,
    reorder_level = 20,
    expiry_date = DATE '2030-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 86;
UPDATE products
SET sku = 'MED-00062',
    name = 'ASCORBIC ACID 500 (Ritemed)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.45,
    cost = 41.29,
    reorder_level = 20,
    expiry_date = DATE '2028-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 87;
UPDATE products
SET sku = 'MED-00063',
    name = 'ASCORBIC ACID 500mg (Rhea)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.02,
    cost = 12.51,
    reorder_level = 20,
    expiry_date = DATE '2028-04-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 88;
UPDATE products
SET sku = 'MED-00064',
    name = 'ASCOR-CEE Plus Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.16,
    cost = 14.48,
    reorder_level = 20,
    expiry_date = DATE '2028-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 89;
UPDATE products
SET sku = 'MED-00065',
    name = 'ASMALIN Broncho Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 61.73,
    cost = 49.08,
    reorder_level = 20,
    expiry_date = DATE '2027-07-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 90;
UPDATE products
SET sku = 'MED-00066',
    name = 'ASMALIN Solution Neb.  2.5mL  5''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.45,
    cost = 31.41,
    reorder_level = 20,
    expiry_date = DATE '2028-02-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 91;
UPDATE products
SET sku = 'MED-00067',
    name = 'ASMALIN Syrup (New) 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.33,
    cost = 30.51,
    reorder_level = 20,
    expiry_date = DATE '2028-12-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 92;
UPDATE products
SET sku = 'MED-00068',
    name = 'ASPILETS Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.25,
    cost = 14.90,
    reorder_level = 20,
    expiry_date = DATE '2030-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 93;
UPDATE products
SET sku = 'MED-00069',
    name = 'ASPILETS-EC Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.07,
    cost = 12.54,
    reorder_level = 20,
    expiry_date = DATE '2029-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 94;
UPDATE products
SET sku = 'MED-00070',
    name = 'AUGMENTIN 156mg  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.62,
    cost = 32.81,
    reorder_level = 20,
    expiry_date = DATE '2027-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 95;
UPDATE products
SET sku = 'MED-00071',
    name = 'AUGMENTIN 228mg  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.69,
    cost = 18.25,
    reorder_level = 20,
    expiry_date = DATE '2030-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 96;
UPDATE products
SET sku = 'MED-00072',
    name = 'AUGMENTIN 312mg  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.66,
    cost = 41.53,
    reorder_level = 20,
    expiry_date = DATE '2029-06-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 97;
UPDATE products
SET sku = 'MED-00073',
    name = 'AUGMENTIN 457mg  35mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.56,
    cost = 25.36,
    reorder_level = 20,
    expiry_date = DATE '2028-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 98;
UPDATE products
SET sku = 'MED-00074',
    name = 'AUGMENTIN 457mg  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.37,
    cost = 11.68,
    reorder_level = 20,
    expiry_date = DATE '2030-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 99;
UPDATE products
SET sku = 'MED-00075',
    name = 'AUGMENTIN Tablet 375mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.76,
    cost = 16.85,
    reorder_level = 20,
    expiry_date = DATE '2028-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 100;
UPDATE products
SET sku = 'MED-00076',
    name = 'AUGMENTIN Tablet 625mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.13,
    cost = 10.01,
    reorder_level = 20,
    expiry_date = DATE '2028-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 101;
UPDATE products
SET sku = 'NPH-00027',
    name = 'AXE Roll-On 40mL (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.11,
    cost = 33.25,
    reorder_level = 20,
    expiry_date = DATE '2028-01-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 102;
UPDATE products
SET sku = 'NPH-00028',
    name = 'AXE Roll-On 40mL (Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.25,
    cost = 47.71,
    reorder_level = 20,
    expiry_date = DATE '2028-12-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 103;
UPDATE products
SET sku = 'NPH-00029',
    name = 'AXE Roll-On 40mL (Click)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.93,
    cost = 40.26,
    reorder_level = 20,
    expiry_date = DATE '2030-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 104;
UPDATE products
SET sku = 'NPH-00030',
    name = 'AXE Roll-On 40mL (Dark Temptation)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.85,
    cost = 41.79,
    reorder_level = 20,
    expiry_date = DATE '2030-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 105;
UPDATE products
SET sku = 'NPH-00031',
    name = 'AXE Roll-On 40mL (Gold Temptation)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.68,
    cost = 45.59,
    reorder_level = 20,
    expiry_date = DATE '2029-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 106;
UPDATE products
SET sku = 'NPH-00032',
    name = 'AXE Spray 50mL (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.88,
    cost = 55.34,
    reorder_level = 20,
    expiry_date = DATE '2027-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 107;
UPDATE products
SET sku = 'NPH-00033',
    name = 'AXE Spray 50mL (Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.10,
    cost = 55.38,
    reorder_level = 20,
    expiry_date = DATE '2028-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 108;
UPDATE products
SET sku = 'NPH-00034',
    name = 'AXE Spray 50mL (Click)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.27,
    cost = 44.17,
    reorder_level = 20,
    expiry_date = DATE '2027-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 109;
UPDATE products
SET sku = 'NPH-00035',
    name = 'AXE Spray 50mL (Dark Temptation)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.06,
    cost = 48.81,
    reorder_level = 20,
    expiry_date = DATE '2027-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 110;
UPDATE products
SET sku = 'NPH-00036',
    name = 'AXE Spray 50mL (You)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.14,
    cost = 36.60,
    reorder_level = 20,
    expiry_date = DATE '2027-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 111;
UPDATE products
SET sku = 'MED-00077',
    name = 'BACTIDOL Liquid  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 56.67,
    cost = 44.97,
    reorder_level = 20,
    expiry_date = DATE '2027-08-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 112;
UPDATE products
SET sku = 'MED-00078',
    name = 'BACTIDOL Liquid 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 86.64,
    cost = 70.43,
    reorder_level = 20,
    expiry_date = DATE '2030-06-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 113;
UPDATE products
SET sku = 'MED-00079',
    name = 'BACTIDOL Liquid 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 95.06,
    cost = 78.96,
    reorder_level = 20,
    expiry_date = DATE '2028-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 114;
UPDATE products
SET sku = 'MED-00080',
    name = 'BACTROBAN Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.13,
    cost = 31.47,
    reorder_level = 20,
    expiry_date = DATE '2028-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 115;
UPDATE products
SET sku = 'MED-00081',
    name = 'BACTROBAN Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.41,
    cost = 17.74,
    reorder_level = 20,
    expiry_date = DATE '2027-02-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 116;
UPDATE products
SET sku = 'MED-00082',
    name = 'BAND-AID Adhesive Bandages 50''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 213.26,
    cost = 170.10,
    reorder_level = 20,
    expiry_date = DATE '2030-01-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 117;
UPDATE products
SET sku = 'NPH-00037',
    name = 'BEAR BRAND Milk  320G',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 22.22,
    cost = 17.67,
    reorder_level = 20,
    expiry_date = DATE '2028-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 118;
UPDATE products
SET sku = 'MED-00083',
    name = 'BENADRYL AH 25mg Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 426.01,
    cost = 328.54,
    reorder_level = 20,
    expiry_date = DATE '2027-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 119;
UPDATE products
SET sku = 'MED-00084',
    name = 'BENADRYL AH 50mg Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 723.76,
    cost = 558.82,
    reorder_level = 20,
    expiry_date = DATE '2029-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 120;
UPDATE products
SET sku = 'MED-00085',
    name = 'BENADRYL Expectorant  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.61,
    cost = 22.06,
    reorder_level = 20,
    expiry_date = DATE '2029-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 121;
UPDATE products
SET sku = 'MED-00086',
    name = 'BENADRYL Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 71.64,
    cost = 55.50,
    reorder_level = 20,
    expiry_date = DATE '2029-08-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 122;
UPDATE products
SET sku = 'MED-00087',
    name = 'BENADRYL Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 73.31,
    cost = 59.10,
    reorder_level = 20,
    expiry_date = DATE '2029-05-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 123;
UPDATE products
SET sku = 'NPH-00038',
    name = 'BENCH B/Spray  50mL Bare Me Not',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.88,
    cost = 47.16,
    reorder_level = 20,
    expiry_date = DATE '2029-08-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 124;
UPDATE products
SET sku = 'NPH-00039',
    name = 'BENCH B/Spray  50mL So In Love',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.16,
    cost = 39.74,
    reorder_level = 20,
    expiry_date = DATE '2030-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 125;
UPDATE products
SET sku = 'NPH-00040',
    name = 'BENCH B/Spray  50mL Tickled Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.65,
    cost = 39.60,
    reorder_level = 20,
    expiry_date = DATE '2028-09-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 126;
UPDATE products
SET sku = 'NPH-00041',
    name = 'BENCH B/Spray 100mL Atlantis',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 72.18,
    cost = 55.80,
    reorder_level = 20,
    expiry_date = DATE '2027-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 127;
UPDATE products
SET sku = 'NPH-00042',
    name = 'BENCH B/Spray 100mL B20',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.49,
    cost = 43.21,
    reorder_level = 20,
    expiry_date = DATE '2027-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 128;
UPDATE products
SET sku = 'NPH-00043',
    name = 'BENCH B/Spray 100mL Bare Me Not',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.83,
    cost = 47.97,
    reorder_level = 20,
    expiry_date = DATE '2030-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 129;
UPDATE products
SET sku = 'NPH-00044',
    name = 'BENCH B/Spray 100mL Capture',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 84.34,
    cost = 64.27,
    reorder_level = 20,
    expiry_date = DATE '2030-05-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 130;
UPDATE products
SET sku = 'NPH-00045',
    name = 'BENCH B/Spray 100mL Eight',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 117.92,
    cost = 89.68,
    reorder_level = 20,
    expiry_date = DATE '2030-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 131;
UPDATE products
SET sku = 'NPH-00046',
    name = 'BENCH B/Spray 100mL i Choose',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.38,
    cost = 42.52,
    reorder_level = 20,
    expiry_date = DATE '2029-05-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 132;
UPDATE products
SET sku = 'NPH-00047',
    name = 'BENCH B/Spray 100mL i Desire',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 89.51,
    cost = 69.40,
    reorder_level = 20,
    expiry_date = DATE '2029-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 133;
UPDATE products
SET sku = 'NPH-00048',
    name = 'BENCH B/Spray 100mL i Rock',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 117.93,
    cost = 94.59,
    reorder_level = 20,
    expiry_date = DATE '2030-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 134;
UPDATE products
SET sku = 'NPH-00049',
    name = 'BENCH B/Spray 100mL i Sport',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 92.25,
    cost = 76.59,
    reorder_level = 20,
    expiry_date = DATE '2029-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 135;
UPDATE products
SET sku = 'NPH-00050',
    name = 'BENCH B/Spray 100mL Pure Play',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.24,
    cost = 42.93,
    reorder_level = 20,
    expiry_date = DATE '2030-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 136;
UPDATE products
SET sku = 'NPH-00051',
    name = 'BENCH B/Spray 100mL So In Love',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 113.42,
    cost = 88.11,
    reorder_level = 20,
    expiry_date = DATE '2028-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 137;
UPDATE products
SET sku = 'NPH-00052',
    name = 'BENCH B/Spray 100mL Sure Blue',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 69.39,
    cost = 57.62,
    reorder_level = 20,
    expiry_date = DATE '2028-04-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 138;
UPDATE products
SET sku = 'NPH-00053',
    name = 'BENCH B/Spray 100mL Velocity-BLUE',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.76,
    cost = 45.84,
    reorder_level = 20,
    expiry_date = DATE '2028-01-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 139;
UPDATE products
SET sku = 'NPH-00054',
    name = 'BENCH D/Scent Col.  25-Beach Bum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.85,
    cost = 27.69,
    reorder_level = 20,
    expiry_date = DATE '2029-06-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 140;
UPDATE products
SET sku = 'NPH-00055',
    name = 'BENCH D/Scent Col.  25-Bubble Pop',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.00,
    cost = 19.73,
    reorder_level = 20,
    expiry_date = DATE '2030-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 141;
UPDATE products
SET sku = 'NPH-00056',
    name = 'BENCH D/Scent Col.  25-Eye Candy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.94,
    cost = 25.89,
    reorder_level = 20,
    expiry_date = DATE '2027-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 142;
UPDATE products
SET sku = 'NPH-00057',
    name = 'BENCH D/Scent Col.  25-Happy Hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.66,
    cost = 36.97,
    reorder_level = 20,
    expiry_date = DATE '2028-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 143;
UPDATE products
SET sku = 'NPH-00058',
    name = 'BENCH D/Scent Col.  25-IndianSummer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.11,
    cost = 35.77,
    reorder_level = 20,
    expiry_date = DATE '2029-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 144;
UPDATE products
SET sku = 'NPH-00059',
    name = 'BENCH D/Scent Col.  25-LazyAftrn.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.02,
    cost = 37.91,
    reorder_level = 20,
    expiry_date = DATE '2028-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 145;
UPDATE products
SET sku = 'NPH-00060',
    name = 'BENCH D/Scent Col.  25-Nine 2 Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.36,
    cost = 18.51,
    reorder_level = 20,
    expiry_date = DATE '2028-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 146;
UPDATE products
SET sku = 'NPH-00061',
    name = 'BENCH D/Scent Col.  25-Spring Break',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 71.62,
    cost = 54.57,
    reorder_level = 20,
    expiry_date = DATE '2027-03-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 147;
UPDATE products
SET sku = 'NPH-00062',
    name = 'BENCH D/Scent Col.  25-Sunday Mrng',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.97,
    cost = 25.10,
    reorder_level = 20,
    expiry_date = DATE '2028-02-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 148;
UPDATE products
SET sku = 'NPH-00063',
    name = 'BENCH D/Scent Col.  50-Beach Bum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.95,
    cost = 40.74,
    reorder_level = 20,
    expiry_date = DATE '2028-11-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 149;
UPDATE products
SET sku = 'NPH-00064',
    name = 'BENCH D/Scent Col.  50-Bubble Pop',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.43,
    cost = 48.68,
    reorder_level = 20,
    expiry_date = DATE '2030-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 150;
UPDATE products
SET sku = 'NPH-00065',
    name = 'BENCH D/Scent Col.  50-Eye Candy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.21,
    cost = 25.68,
    reorder_level = 20,
    expiry_date = DATE '2029-06-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 151;
UPDATE products
SET sku = 'NPH-00066',
    name = 'BENCH D/Scent Col.  50-Happy Hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.57,
    cost = 26.37,
    reorder_level = 20,
    expiry_date = DATE '2030-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 152;
UPDATE products
SET sku = 'NPH-00067',
    name = 'BENCH D/Scent Col.  50-IndianSummer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.39,
    cost = 30.05,
    reorder_level = 20,
    expiry_date = DATE '2030-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 153;
UPDATE products
SET sku = 'NPH-00068',
    name = 'BENCH D/Scent Col.  50-LazyAftrn.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.32,
    cost = 29.52,
    reorder_level = 20,
    expiry_date = DATE '2028-07-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 154;
UPDATE products
SET sku = 'NPH-00069',
    name = 'BENCH D/Scent Col.  50-Nine 2 Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.46,
    cost = 49.01,
    reorder_level = 20,
    expiry_date = DATE '2028-03-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 155;
UPDATE products
SET sku = 'NPH-00070',
    name = 'BENCH D/Scent Col.  50-Spring Break',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.43,
    cost = 25.19,
    reorder_level = 20,
    expiry_date = DATE '2030-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 156;
UPDATE products
SET sku = 'NPH-00071',
    name = 'BENCH D/Scent Col.  50-Sunday Mrng',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.74,
    cost = 25.45,
    reorder_level = 20,
    expiry_date = DATE '2029-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 157;
UPDATE products
SET sku = 'NPH-00072',
    name = 'BENCH D/Scent Col. 75-Happy Hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.61,
    cost = 42.91,
    reorder_level = 20,
    expiry_date = DATE '2027-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 158;
UPDATE products
SET sku = 'NPH-00073',
    name = 'BENCH D/Scent Col. 75-IndianSummer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.05,
    cost = 47.22,
    reorder_level = 20,
    expiry_date = DATE '2027-06-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 159;
UPDATE products
SET sku = 'NPH-00074',
    name = 'BENCH D/Scent Col. 75-Lazy Aftrn.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.17,
    cost = 36.51,
    reorder_level = 20,
    expiry_date = DATE '2030-10-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 160;
UPDATE products
SET sku = 'NPH-00075',
    name = 'BENCH D/Scent Col. 75-Nine 2 Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.34,
    cost = 20.71,
    reorder_level = 20,
    expiry_date = DATE '2028-06-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 161;
UPDATE products
SET sku = 'NPH-00076',
    name = 'BENCH D/Scent Col. 75-Sunday Mrng',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.45,
    cost = 30.67,
    reorder_level = 20,
    expiry_date = DATE '2029-02-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 162;
UPDATE products
SET sku = 'NPH-00077',
    name = 'BENCH D/Scent Col.125-Beach Bum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.75,
    cost = 27.85,
    reorder_level = 20,
    expiry_date = DATE '2027-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 163;
UPDATE products
SET sku = 'NPH-00078',
    name = 'BENCH D/Scent Col.125-Bubble Pop',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.58,
    cost = 35.00,
    reorder_level = 20,
    expiry_date = DATE '2030-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 164;
UPDATE products
SET sku = 'NPH-00079',
    name = 'BENCH D/Scent Col.125-Eye Candy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.98,
    cost = 20.19,
    reorder_level = 20,
    expiry_date = DATE '2028-07-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 165;
UPDATE products
SET sku = 'NPH-00080',
    name = 'BENCH D/Scent Col.125-Happy Hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.92,
    cost = 30.78,
    reorder_level = 20,
    expiry_date = DATE '2028-07-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 166;
UPDATE products
SET sku = 'NPH-00081',
    name = 'BENCH D/Scent Col.125-IndianSummer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.44,
    cost = 27.19,
    reorder_level = 20,
    expiry_date = DATE '2027-05-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 167;
UPDATE products
SET sku = 'NPH-00082',
    name = 'BENCH D/Scent Col.125-LazyAftrn.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.27,
    cost = 26.52,
    reorder_level = 20,
    expiry_date = DATE '2027-05-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 168;
UPDATE products
SET sku = 'NPH-00083',
    name = 'BENCH D/Scent Col.125-Nine 2 Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.39,
    cost = 54.17,
    reorder_level = 20,
    expiry_date = DATE '2027-04-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 169;
UPDATE products
SET sku = 'NPH-00084',
    name = 'BENCH D/Scent Col.125-Spring Break',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.47,
    cost = 22.16,
    reorder_level = 20,
    expiry_date = DATE '2030-02-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 170;
UPDATE products
SET sku = 'NPH-00085',
    name = 'BENCH D/Scent Col.125-Sunday Mrng',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.42,
    cost = 52.82,
    reorder_level = 20,
    expiry_date = DATE '2027-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 171;
UPDATE products
SET sku = 'NPH-00086',
    name = 'BENZALKONIUM 30mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 29.67,
    cost = 23.89,
    reorder_level = 20,
    expiry_date = DATE '2027-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 172;
UPDATE products
SET sku = 'NPH-00087',
    name = 'BENZALKONIUM 60mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 41.42,
    cost = 33.72,
    reorder_level = 20,
    expiry_date = DATE '2030-03-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 173;
UPDATE products
SET sku = 'MED-00088',
    name = 'BEROCCA Tablet 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 137.99,
    cost = 105.45,
    reorder_level = 20,
    expiry_date = DATE '2028-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 174;
UPDATE products
SET sku = 'MED-00089',
    name = 'BETADINE Antiseptic   7.5mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 26.15,
    cost = 19.83,
    reorder_level = 20,
    expiry_date = DATE '2029-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 175;
UPDATE products
SET sku = 'MED-00090',
    name = 'BETADINE Antiseptic  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 53.83,
    cost = 44.00,
    reorder_level = 20,
    expiry_date = DATE '2027-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 176;
UPDATE products
SET sku = 'MED-00091',
    name = 'BETADINE Antiseptic 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 77.74,
    cost = 64.27,
    reorder_level = 20,
    expiry_date = DATE '2030-01-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 177;
UPDATE products
SET sku = 'MED-00092',
    name = 'BETADINE Oral  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 35.75,
    cost = 27.94,
    reorder_level = 20,
    expiry_date = DATE '2027-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 178;
UPDATE products
SET sku = 'MED-00093',
    name = 'BETADINE Oral 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 48.90,
    cost = 40.48,
    reorder_level = 20,
    expiry_date = DATE '2030-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 179;
UPDATE products
SET sku = 'MED-00094',
    name = 'BETADINE Paint 10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 17.35,
    cost = 14.08,
    reorder_level = 20,
    expiry_date = DATE '2027-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 180;
UPDATE products
SET sku = 'MED-00095',
    name = 'BETADINE Throat Spray 50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Povidone-Iodine antiseptic solution for prompt germicidal action on wounds, cuts, and minor burns.',
    quantity = 100,
    price = 62.24,
    cost = 49.28,
    reorder_level = 20,
    expiry_date = DATE '2029-03-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 181;
UPDATE products
SET sku = 'NPH-00088',
    name = 'BETET BALM',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 49.42,
    cost = 38.40,
    reorder_level = 20,
    expiry_date = DATE '2030-01-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 182;
UPDATE products
SET sku = 'MED-00096',
    name = 'BETNOVATE Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.95,
    cost = 40.47,
    reorder_level = 20,
    expiry_date = DATE '2027-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 183;
UPDATE products
SET sku = 'MED-00097',
    name = 'BETNOVATE Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.73,
    cost = 31.26,
    reorder_level = 20,
    expiry_date = DATE '2030-09-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 184;
UPDATE products
SET sku = 'NPH-00089',
    name = 'BIGEN Speedy (Brown Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 45.73,
    cost = 37.93,
    reorder_level = 20,
    expiry_date = DATE '2030-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 185;
UPDATE products
SET sku = 'NPH-00090',
    name = 'BIGEN Speedy (Dark Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 52.92,
    cost = 41.49,
    reorder_level = 20,
    expiry_date = DATE '2029-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 186;
UPDATE products
SET sku = 'NPH-00091',
    name = 'BIGEN Speedy (Light Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 46.30,
    cost = 35.41,
    reorder_level = 20,
    expiry_date = DATE '2028-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 187;
UPDATE products
SET sku = 'NPH-00092',
    name = 'BIGEN Speedy (Medium Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 63.99,
    cost = 49.48,
    reorder_level = 20,
    expiry_date = DATE '2028-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 188;
UPDATE products
SET sku = 'NPH-00093',
    name = 'BIGEN Speedy (Natural Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 56.45,
    cost = 45.88,
    reorder_level = 20,
    expiry_date = DATE '2028-06-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 189;
UPDATE products
SET sku = 'NPH-00094',
    name = 'BIGEN-A  (Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 47.75,
    cost = 38.99,
    reorder_level = 20,
    expiry_date = DATE '2029-05-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 190;
UPDATE products
SET sku = 'NPH-00095',
    name = 'BIGEN-B  (Brown Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 31.90,
    cost = 26.27,
    reorder_level = 20,
    expiry_date = DATE '2028-06-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 191;
UPDATE products
SET sku = 'NPH-00096',
    name = 'BIGEN-C  (Dark Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 43.28,
    cost = 34.42,
    reorder_level = 20,
    expiry_date = DATE '2028-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 192;
UPDATE products
SET sku = 'NPH-00097',
    name = 'BIGEN-D  (Chestnut Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 54.85,
    cost = 42.79,
    reorder_level = 20,
    expiry_date = DATE '2029-10-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 193;
UPDATE products
SET sku = 'MED-00098',
    name = 'BIODERM Ointment Tube 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 30.60,
    cost = 23.95,
    reorder_level = 20,
    expiry_date = DATE '2028-07-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 194;
UPDATE products
SET sku = 'NPH-00098',
    name = 'BIODERM Soap  60g (Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 30.64,
    cost = 24.42,
    reorder_level = 20,
    expiry_date = DATE '2028-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 195;
UPDATE products
SET sku = 'NPH-00099',
    name = 'BIODERM Soap  60g (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 49.25,
    cost = 38.90,
    reorder_level = 20,
    expiry_date = DATE '2028-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 196;
UPDATE products
SET sku = 'NPH-00100',
    name = 'BIODERM Soap  60g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 59.80,
    cost = 46.41,
    reorder_level = 20,
    expiry_date = DATE '2027-11-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 197;
UPDATE products
SET sku = 'NPH-00101',
    name = 'BIODERM Soap  60g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 34.39,
    cost = 27.19,
    reorder_level = 20,
    expiry_date = DATE '2027-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 198;
UPDATE products
SET sku = 'NPH-00102',
    name = 'BIODERM Soap  60g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 58.00,
    cost = 45.24,
    reorder_level = 20,
    expiry_date = DATE '2027-03-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 199;
UPDATE products
SET sku = 'NPH-00103',
    name = 'BIODERM Soap  60g (Yellow)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 71.18,
    cost = 54.54,
    reorder_level = 20,
    expiry_date = DATE '2029-05-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 200;
UPDATE products
SET sku = 'NPH-00104',
    name = 'BIODERM Soap  90g (Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 41.30,
    cost = 32.46,
    reorder_level = 20,
    expiry_date = DATE '2029-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 201;
UPDATE products
SET sku = 'NPH-00105',
    name = 'BIODERM Soap  90g (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 34.92,
    cost = 29.00,
    reorder_level = 20,
    expiry_date = DATE '2028-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 202;
UPDATE products
SET sku = 'NPH-00106',
    name = 'BIODERM Soap  90g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 70.21,
    cost = 56.32,
    reorder_level = 20,
    expiry_date = DATE '2027-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 203;
UPDATE products
SET sku = 'NPH-00107',
    name = 'BIODERM Soap  90g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 61.98,
    cost = 46.99,
    reorder_level = 20,
    expiry_date = DATE '2029-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 204;
UPDATE products
SET sku = 'NPH-00108',
    name = 'BIODERM Soap  90g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 53.20,
    cost = 40.74,
    reorder_level = 20,
    expiry_date = DATE '2030-02-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 205;
UPDATE products
SET sku = 'NPH-00109',
    name = 'BIODERM Soap  90g (Yellow)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 39.40,
    cost = 31.84,
    reorder_level = 20,
    expiry_date = DATE '2027-09-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 206;
UPDATE products
SET sku = 'NPH-00110',
    name = 'BIODERM Soap 135g (Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 27.09,
    cost = 22.47,
    reorder_level = 20,
    expiry_date = DATE '2030-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 207;
UPDATE products
SET sku = 'NPH-00111',
    name = 'BIODERM Soap 135g (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 21.49,
    cost = 17.48,
    reorder_level = 20,
    expiry_date = DATE '2030-12-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 208;
UPDATE products
SET sku = 'NPH-00112',
    name = 'BIODERM Soap 135g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 30.05,
    cost = 24.61,
    reorder_level = 20,
    expiry_date = DATE '2030-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 209;
UPDATE products
SET sku = 'NPH-00113',
    name = 'BIODERM Soap 135g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 33.76,
    cost = 27.24,
    reorder_level = 20,
    expiry_date = DATE '2029-01-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 210;
UPDATE products
SET sku = 'NPH-00114',
    name = 'BIODERM Soap 135g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 33.21,
    cost = 27.56,
    reorder_level = 20,
    expiry_date = DATE '2028-04-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 211;
UPDATE products
SET sku = 'NPH-00115',
    name = 'BIODERM Soap 135g (Yellow)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 37.11,
    cost = 30.83,
    reorder_level = 20,
    expiry_date = DATE '2028-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 212;
UPDATE products
SET sku = 'MED-00099',
    name = 'BIOFITEA Herbal Tea 30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 413.09,
    cost = 320.03,
    reorder_level = 20,
    expiry_date = DATE '2028-06-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 213;
UPDATE products
SET sku = 'MED-00100',
    name = 'BIOFLU Suspension 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 71.11,
    cost = 56.88,
    reorder_level = 20,
    expiry_date = DATE '2027-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 214;
UPDATE products
SET sku = 'MED-00101',
    name = 'BIOFLU Tablet 5''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 21.25,
    cost = 16.67,
    reorder_level = 20,
    expiry_date = DATE '2028-01-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 215;
UPDATE products
SET sku = 'MED-00102',
    name = 'BIOFLU Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 5.82,
    cost = 4.73,
    reorder_level = 20,
    expiry_date = DATE '2028-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 216;
UPDATE products
SET sku = 'MED-00103',
    name = 'BIOGESIC 120mg/60mL (Orange)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 72.14,
    cost = 56.52,
    reorder_level = 20,
    expiry_date = DATE '2029-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 217;
UPDATE products
SET sku = 'MED-00104',
    name = 'BIOGESIC 120mg/60mL (Strawberry)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 56.14,
    cost = 46.07,
    reorder_level = 20,
    expiry_date = DATE '2030-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 218;
UPDATE products
SET sku = 'MED-00105',
    name = 'BIOGESIC 250mg/60mL (Orange)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 45.42,
    cost = 34.45,
    reorder_level = 20,
    expiry_date = DATE '2029-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 219;
UPDATE products
SET sku = 'MED-00106',
    name = 'BIOGESIC 250mg/60mL (Strawberry)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 56.53,
    cost = 46.44,
    reorder_level = 20,
    expiry_date = DATE '2027-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 220;
UPDATE products
SET sku = 'MED-00107',
    name = 'BIOGESIC Drops (Orange)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 43.30,
    cost = 33.39,
    reorder_level = 20,
    expiry_date = DATE '2028-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 221;
UPDATE products
SET sku = 'MED-00108',
    name = 'BIOGESIC Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Gentle and effective antipyretic/analgesic (Paracetamol) for fever and minor pain relief.',
    quantity = 100,
    price = 18.52,
    cost = 15.26,
    reorder_level = 20,
    expiry_date = DATE '2030-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 222;
UPDATE products
SET sku = 'MED-00109',
    name = 'BISOLVON Syrup 4mg/ 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.29,
    cost = 27.75,
    reorder_level = 20,
    expiry_date = DATE '2029-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 223;
UPDATE products
SET sku = 'MED-00110',
    name = 'BISOLVON Syrup 4mg/120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 57.16,
    cost = 46.17,
    reorder_level = 20,
    expiry_date = DATE '2028-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 224;
UPDATE products
SET sku = 'MED-00111',
    name = 'BISOLVON Syrup 8mg/ 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 65.18,
    cost = 51.32,
    reorder_level = 20,
    expiry_date = DATE '2030-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 225;
UPDATE products
SET sku = 'MED-00112',
    name = 'BISOLVON Syrup 8mg/125mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 42.42,
    cost = 32.25,
    reorder_level = 20,
    expiry_date = DATE '2029-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 226;
UPDATE products
SET sku = 'MED-00113',
    name = 'BISOLVON Tablet 8mg 120''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.79,
    cost = 6.38,
    reorder_level = 20,
    expiry_date = DATE '2027-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 227;
UPDATE products
SET sku = 'NPH-00116',
    name = 'BL Cream 7g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.67,
    cost = 37.41,
    reorder_level = 20,
    expiry_date = DATE '2028-04-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 228;
UPDATE products
SET sku = 'NPH-00117',
    name = 'BL Soap 115g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.62,
    cost = 34.75,
    reorder_level = 20,
    expiry_date = DATE '2029-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 229;
UPDATE products
SET sku = 'NPH-00118',
    name = 'BL Soap Papaya 115g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 36.41,
    cost = 27.75,
    reorder_level = 20,
    expiry_date = DATE '2029-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 230;
UPDATE products
SET sku = 'NPH-00119',
    name = 'BONAKID  180g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 53.37,
    cost = 43.32,
    reorder_level = 20,
    expiry_date = DATE '2027-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 231;
UPDATE products
SET sku = 'NPH-00120',
    name = 'BONAKID  400g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 90.82,
    cost = 74.83,
    reorder_level = 20,
    expiry_date = DATE '2028-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 232;
UPDATE products
SET sku = 'NPH-00121',
    name = 'BONAKID Pre-School  400g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 170.95,
    cost = 136.01,
    reorder_level = 20,
    expiry_date = DATE '2028-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 233;
UPDATE products
SET sku = 'NPH-00122',
    name = 'BONAMIL 180g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 62.57,
    cost = 49.38,
    reorder_level = 20,
    expiry_date = DATE '2030-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 234;
UPDATE products
SET sku = 'NPH-00123',
    name = 'BONAMIL 400g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 169.97,
    cost = 136.42,
    reorder_level = 20,
    expiry_date = DATE '2030-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 235;
UPDATE products
SET sku = 'MED-00114',
    name = 'BONAMINE Chewable Tab.(Adult)9+1',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.34,
    cost = 8.41,
    reorder_level = 20,
    expiry_date = DATE '2029-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 236;
UPDATE products
SET sku = 'MED-00115',
    name = 'BONAMINE Chewable Tablet (Adult)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.40,
    cost = 5.97,
    reorder_level = 20,
    expiry_date = DATE '2029-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 237;
UPDATE products
SET sku = 'MED-00116',
    name = 'BONAMINE Chewable Tablet (Kids)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.24,
    cost = 14.85,
    reorder_level = 20,
    expiry_date = DATE '2029-01-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 238;
UPDATE products
SET sku = 'NPH-00124',
    name = 'BONIL Solution',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 61.18,
    cost = 48.47,
    reorder_level = 20,
    expiry_date = DATE '2030-03-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 239;
UPDATE products
SET sku = 'NPH-00125',
    name = 'BONNA  180g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 47.49,
    cost = 39.20,
    reorder_level = 20,
    expiry_date = DATE '2029-09-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 240;
UPDATE products
SET sku = 'NPH-00126',
    name = 'BONNA  400g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Nutritional formula fortified with vitamins, calcium, and minerals for balanced daily nourishment.',
    quantity = 100,
    price = 125.53,
    cost = 101.29,
    reorder_level = 20,
    expiry_date = DATE '2030-06-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 241;
UPDATE products
SET sku = 'MED-00117',
    name = 'BRAVO For Men Capsule 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.16,
    cost = 39.83,
    reorder_level = 20,
    expiry_date = DATE '2028-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 242;
UPDATE products
SET sku = 'MED-00118',
    name = 'BREZU 5mcg/MI syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.77,
    cost = 38.56,
    reorder_level = 20,
    expiry_date = DATE '2029-02-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 243;
UPDATE products
SET sku = 'MED-00119',
    name = 'BRICANYL Expectorant Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 67.00,
    cost = 51.76,
    reorder_level = 20,
    expiry_date = DATE '2030-01-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 244;
UPDATE products
SET sku = 'MED-00120',
    name = 'BURN Ointment 15g* (United Home)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.09,
    cost = 32.47,
    reorder_level = 20,
    expiry_date = DATE '2027-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 245;
UPDATE products
SET sku = 'MED-00121',
    name = 'BUSCOPAN Plus Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.16,
    cost = 8.00,
    reorder_level = 20,
    expiry_date = DATE '2027-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 246;
UPDATE products
SET sku = 'MED-00122',
    name = 'BUSCOPAN Tablet 4''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 64.88,
    cost = 51.44,
    reorder_level = 20,
    expiry_date = DATE '2027-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 247;
UPDATE products
SET sku = 'MED-00123',
    name = 'BUSCOPAN Venus Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.38,
    cost = 11.83,
    reorder_level = 20,
    expiry_date = DATE '2028-05-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 248;
UPDATE products
SET sku = 'NPH-00127',
    name = 'C.Y.GABRIEL Soap  60-Medicated',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 22.90,
    cost = 18.15,
    reorder_level = 20,
    expiry_date = DATE '2029-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 249;
UPDATE products
SET sku = 'NPH-00128',
    name = 'C.Y.GABRIEL Soap  60-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 43.86,
    cost = 33.96,
    reorder_level = 20,
    expiry_date = DATE '2027-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE id = 250;
UPDATE products
SET sku = 'NPH-00129',
    name = 'C.Y.GABRIEL Soap  60-Special',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.96,
    cost = 40.81,
    reorder_level = 20,
    expiry_date = DATE '2027-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00006';
UPDATE products
SET sku = 'MED-00124',
    name = 'CALACTATE 650mg (UHP) 100''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 489.05,
    cost = 403.50,
    reorder_level = 20,
    expiry_date = DATE '2029-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00007';
UPDATE products
SET sku = 'MED-00125',
    name = 'CALADRYL Lotion 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.48,
    cost = 14.02,
    reorder_level = 20,
    expiry_date = DATE '2030-02-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00008';
UPDATE products
SET sku = 'MED-00126',
    name = 'CALAMINE Lotion 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.92,
    cost = 19.04,
    reorder_level = 20,
    expiry_date = DATE '2030-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00009';
UPDATE products
SET sku = 'MED-00127',
    name = 'CALAMINE Lotion 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.46,
    cost = 24.33,
    reorder_level = 20,
    expiry_date = DATE '2028-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00010';
UPDATE products
SET sku = 'MED-00128',
    name = 'CALCIUM LACTATE 650mg-Rhea 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 435.75,
    cost = 333.57,
    reorder_level = 20,
    expiry_date = DATE '2030-08-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00011';
UPDATE products
SET sku = 'MED-00129',
    name = 'CALCIUMADE Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.31,
    cost = 5.17,
    reorder_level = 20,
    expiry_date = DATE '2030-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00012';
UPDATE products
SET sku = 'MED-00130',
    name = 'CALMOSEPTINE Sachet 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.06,
    cost = 12.96,
    reorder_level = 20,
    expiry_date = DATE '2027-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00013';
UPDATE products
SET sku = 'MED-00131',
    name = 'CALPOL Drops 0-2 years     10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.78,
    cost = 27.15,
    reorder_level = 20,
    expiry_date = DATE '2027-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00014';
UPDATE products
SET sku = 'MED-00132',
    name = 'CALPOL Syrup  2-6 years  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.01,
    cost = 33.25,
    reorder_level = 20,
    expiry_date = DATE '2029-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00015';
UPDATE products
SET sku = 'MED-00133',
    name = 'CALPOL Syrup  6-12 years  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.35,
    cost = 38.05,
    reorder_level = 20,
    expiry_date = DATE '2030-03-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00016';
UPDATE products
SET sku = 'MED-00134',
    name = 'CALTRATE Plus Tablet (Foil)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.76,
    cost = 4.36,
    reorder_level = 20,
    expiry_date = DATE '2027-10-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00017';
UPDATE products
SET sku = 'MED-00135',
    name = 'CANESTEN Cream  5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 30.97,
    cost = 24.15,
    reorder_level = 20,
    expiry_date = DATE '2030-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00018';
UPDATE products
SET sku = 'NPH-00130',
    name = 'CARE Adult Diaper Large 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 56.93,
    cost = 43.88,
    reorder_level = 20,
    expiry_date = DATE '2027-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00019';
UPDATE products
SET sku = 'NPH-00131',
    name = 'CARE Adult Diaper Medium 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 105.74,
    cost = 87.99,
    reorder_level = 20,
    expiry_date = DATE '2030-01-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00020';
UPDATE products
SET sku = 'NPH-00132',
    name = 'CARE Adult Diaper Medium Singles',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 68.14,
    cost = 52.00,
    reorder_level = 20,
    expiry_date = DATE '2030-04-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00021';
UPDATE products
SET sku = 'NPH-00133',
    name = 'CAREFREE  8''s-Breathable',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.77,
    cost = 31.72,
    reorder_level = 20,
    expiry_date = DATE '2028-12-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00022';
UPDATE products
SET sku = 'NPH-00134',
    name = 'CAREFREE  8''s-Healthy Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.30,
    cost = 39.22,
    reorder_level = 20,
    expiry_date = DATE '2027-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00023';
UPDATE products
SET sku = 'NPH-00135',
    name = 'CAREFREE  8''s-Super Dry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.83,
    cost = 34.35,
    reorder_level = 20,
    expiry_date = DATE '2027-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00024';
UPDATE products
SET sku = 'NPH-00136',
    name = 'CAREFREE 20''s-Breathable',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.31,
    cost = 47.45,
    reorder_level = 20,
    expiry_date = DATE '2028-09-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00025';
UPDATE products
SET sku = 'NPH-00137',
    name = 'CAREFREE 20''s-Healthy Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.08,
    cost = 29.18,
    reorder_level = 20,
    expiry_date = DATE '2030-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00026';
UPDATE products
SET sku = 'NPH-00138',
    name = 'CAREFREE 20''s-Super Dry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.02,
    cost = 52.82,
    reorder_level = 20,
    expiry_date = DATE '2030-06-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00027';
UPDATE products
SET sku = 'NPH-00139',
    name = 'CARESS Adult Diaper Large  2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 49.90,
    cost = 38.52,
    reorder_level = 20,
    expiry_date = DATE '2028-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00028';
UPDATE products
SET sku = 'NPH-00140',
    name = 'CARESS Adult Diaper Large 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 114.40,
    cost = 94.83,
    reorder_level = 20,
    expiry_date = DATE '2027-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00029';
UPDATE products
SET sku = 'NPH-00141',
    name = 'CARESS Adult Diaper Medium  1''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 64.61,
    cost = 51.17,
    reorder_level = 20,
    expiry_date = DATE '2029-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00030';
UPDATE products
SET sku = 'NPH-00142',
    name = 'CARESS Adult Diaper Medium 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 120.44,
    cost = 95.11,
    reorder_level = 20,
    expiry_date = DATE '2030-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00031';
UPDATE products
SET sku = 'NPH-00143',
    name = 'CARESS Underpad Large 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.21,
    cost = 22.54,
    reorder_level = 20,
    expiry_date = DATE '2030-09-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00032';
UPDATE products
SET sku = 'NPH-00144',
    name = 'CARESS Underpad Medium 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 101.22,
    cost = 77.09,
    reorder_level = 20,
    expiry_date = DATE '2029-10-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00033';
UPDATE products
SET sku = 'NPH-00145',
    name = 'CARESS Underpad X-Large 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.57,
    cost = 34.32,
    reorder_level = 20,
    expiry_date = DATE '2029-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00034';
UPDATE products
SET sku = 'NPH-00146',
    name = 'CASINO Alcohol  60mL (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 32.34,
    cost = 25.93,
    reorder_level = 20,
    expiry_date = DATE '2030-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00035';
UPDATE products
SET sku = 'NPH-00147',
    name = 'CASINO Alcohol  60mL (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 52.12,
    cost = 40.92,
    reorder_level = 20,
    expiry_date = DATE '2027-01-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00036';
UPDATE products
SET sku = 'NPH-00148',
    name = 'CASINO Alcohol 150mL (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 114.64,
    cost = 87.02,
    reorder_level = 20,
    expiry_date = DATE '2029-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00037';
UPDATE products
SET sku = 'NPH-00149',
    name = 'CASINO Alcohol 150mL (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 116.74,
    cost = 92.26,
    reorder_level = 20,
    expiry_date = DATE '2029-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00038';
UPDATE products
SET sku = 'NPH-00150',
    name = 'CASINO Alcohol 250mL (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 93.12,
    cost = 73.88,
    reorder_level = 20,
    expiry_date = DATE '2029-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00039';
UPDATE products
SET sku = 'NPH-00151',
    name = 'CASINO Alcohol 250mL (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 90.88,
    cost = 72.85,
    reorder_level = 20,
    expiry_date = DATE '2027-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00040';
UPDATE products
SET sku = 'NPH-00152',
    name = 'CASINO Alcohol 40% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 103.59,
    cost = 83.78,
    reorder_level = 20,
    expiry_date = DATE '2029-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00041';
UPDATE products
SET sku = 'NPH-00153',
    name = 'CASINO Alcohol 40% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 140.01,
    cost = 107.51,
    reorder_level = 20,
    expiry_date = DATE '2028-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00042';
UPDATE products
SET sku = 'NPH-00154',
    name = 'CASINO Alcohol 500mL (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 104.41,
    cost = 86.64,
    reorder_level = 20,
    expiry_date = DATE '2030-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00043';
UPDATE products
SET sku = 'NPH-00155',
    name = 'CASINO Alcohol 500mL (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 161.34,
    cost = 133.29,
    reorder_level = 20,
    expiry_date = DATE '2029-01-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00044';
UPDATE products
SET sku = 'NPH-00156',
    name = 'CASINO Alcohol 70% 150mL (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 119.78,
    cost = 90.98,
    reorder_level = 20,
    expiry_date = DATE '2027-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00045';
UPDATE products
SET sku = 'NPH-00157',
    name = 'CASINO Alcohol 70% 250mL (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 132.42,
    cost = 106.02,
    reorder_level = 20,
    expiry_date = DATE '2030-01-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00046';
UPDATE products
SET sku = 'NPH-00158',
    name = 'CASINO Femme W/Dual Moist  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 49.70,
    cost = 40.15,
    reorder_level = 20,
    expiry_date = DATE '2028-10-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00047';
UPDATE products
SET sku = 'NPH-00159',
    name = 'CASINO Femme W/Dual Moist 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 63.74,
    cost = 50.65,
    reorder_level = 20,
    expiry_date = DATE '2029-03-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00048';
UPDATE products
SET sku = 'NPH-00160',
    name = 'CASINO Femme W/Dual Moist 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 111.11,
    cost = 89.62,
    reorder_level = 20,
    expiry_date = DATE '2029-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00049';
UPDATE products
SET sku = 'NPH-00161',
    name = 'CASINO Femme W/Dual Moist 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 210.42,
    cost = 169.60,
    reorder_level = 20,
    expiry_date = DATE '2027-12-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00050';
UPDATE products
SET sku = 'NPH-00162',
    name = 'CASTOR OIL 30mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 30.56,
    cost = 25.35,
    reorder_level = 20,
    expiry_date = DATE '2029-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00051';
UPDATE products
SET sku = 'NPH-00163',
    name = 'CASTOR OIL 60mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 44.91,
    cost = 36.59,
    reorder_level = 20,
    expiry_date = DATE '2027-10-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00052';
UPDATE products
SET sku = 'MED-00136',
    name = 'CASTORIA 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 26.13,
    cost = 20.89,
    reorder_level = 20,
    expiry_date = DATE '2029-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00053';
UPDATE products
SET sku = 'MED-00137',
    name = 'CASTORIA 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 69.60,
    cost = 55.89,
    reorder_level = 20,
    expiry_date = DATE '2028-10-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00054';
UPDATE products
SET sku = 'MED-00138',
    name = 'CATAFLAM Tablet 50mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.17,
    cost = 14.41,
    reorder_level = 20,
    expiry_date = DATE '2029-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00055';
UPDATE products
SET sku = 'MED-00139',
    name = 'CATAPRES Tablet  75mcg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.72,
    cost = 16.32,
    reorder_level = 20,
    expiry_date = DATE '2030-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00056';
UPDATE products
SET sku = 'NPH-00164',
    name = 'CEBO DE MACHO 10g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 43.21,
    cost = 33.75,
    reorder_level = 20,
    expiry_date = DATE '2027-11-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00057';
UPDATE products
SET sku = 'NPH-00165',
    name = 'CEBO DE MACHO 25g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 30.04,
    cost = 23.68,
    reorder_level = 20,
    expiry_date = DATE '2027-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00058';
UPDATE products
SET sku = 'MED-00140',
    name = 'CECLOR Drops 20mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 29.10,
    cost = 22.17,
    reorder_level = 20,
    expiry_date = DATE '2027-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00059';
UPDATE products
SET sku = 'MED-00141',
    name = 'CEELIN Chewable Tablet 30''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 244.22,
    cost = 197.69,
    reorder_level = 20,
    expiry_date = DATE '2028-02-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00060';
UPDATE products
SET sku = 'MED-00142',
    name = 'CEELIN Chewable Tablet 60''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 18.94,
    cost = 14.52,
    reorder_level = 20,
    expiry_date = DATE '2028-05-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00061';
UPDATE products
SET sku = 'MED-00143',
    name = 'CEELIN Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 28.40,
    cost = 22.30,
    reorder_level = 20,
    expiry_date = DATE '2027-04-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00062';
UPDATE products
SET sku = 'MED-00144',
    name = 'CEELIN Drops 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 25.29,
    cost = 20.18,
    reorder_level = 20,
    expiry_date = DATE '2030-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00063';
UPDATE products
SET sku = 'MED-00145',
    name = 'CEELIN Plus Chewable Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 13.33,
    cost = 10.18,
    reorder_level = 20,
    expiry_date = DATE '2030-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00064';
UPDATE products
SET sku = 'MED-00146',
    name = 'CEELIN Plus Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 38.75,
    cost = 29.88,
    reorder_level = 20,
    expiry_date = DATE '2030-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00065';
UPDATE products
SET sku = 'MED-00147',
    name = 'CEELIN Plus Drops 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 38.33,
    cost = 31.36,
    reorder_level = 20,
    expiry_date = DATE '2030-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00066';
UPDATE products
SET sku = 'MED-00148',
    name = 'CEELIN Plus Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 61.23,
    cost = 50.08,
    reorder_level = 20,
    expiry_date = DATE '2029-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00067';
UPDATE products
SET sku = 'MED-00149',
    name = 'CEELIN Plus Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 77.43,
    cost = 59.41,
    reorder_level = 20,
    expiry_date = DATE '2027-12-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00068';
UPDATE products
SET sku = 'MED-00150',
    name = 'CEELIN Plus Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 104.94,
    cost = 80.51,
    reorder_level = 20,
    expiry_date = DATE '2029-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00069';
UPDATE products
SET sku = 'MED-00151',
    name = 'CEELIN Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 45.42,
    cost = 34.65,
    reorder_level = 20,
    expiry_date = DATE '2030-02-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00070';
UPDATE products
SET sku = 'MED-00152',
    name = 'CEELIN Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 68.42,
    cost = 54.55,
    reorder_level = 20,
    expiry_date = DATE '2028-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00071';
UPDATE products
SET sku = 'MED-00153',
    name = 'CEELIN Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 152.50,
    cost = 120.43,
    reorder_level = 20,
    expiry_date = DATE '2029-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00072';
UPDATE products
SET sku = 'MED-00154',
    name = 'CEELIN Syrup 500mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 235.17,
    cost = 190.36,
    reorder_level = 20,
    expiry_date = DATE '2028-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00073';
UPDATE products
SET sku = 'MED-00155',
    name = 'CEFALEXIN Capsule 500mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 19.50,
    cost = 15.26,
    reorder_level = 20,
    expiry_date = DATE '2030-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00074';
UPDATE products
SET sku = 'MED-00156',
    name = 'CEFALIN 125mg Suspension 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.70,
    cost = 22.82,
    reorder_level = 20,
    expiry_date = DATE '2027-01-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00075';
UPDATE products
SET sku = 'MED-00157',
    name = 'CEFALIN 500mg Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.72,
    cost = 8.36,
    reorder_level = 20,
    expiry_date = DATE '2029-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00076';
UPDATE products
SET sku = 'MED-00158',
    name = 'CEFALIN Drops 10mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.11,
    cost = 25.88,
    reorder_level = 20,
    expiry_date = DATE '2028-09-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00077';
UPDATE products
SET sku = 'MED-00159',
    name = 'CEFIXIME 200mg Tablet (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.60,
    cost = 9.32,
    reorder_level = 20,
    expiry_date = DATE '2029-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00078';
UPDATE products
SET sku = 'MED-00160',
    name = 'CEFUROXIME 500mg Tab.(Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.08,
    cost = 17.15,
    reorder_level = 20,
    expiry_date = DATE '2029-12-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00079';
UPDATE products
SET sku = 'MED-00161',
    name = 'CENTRUM ADVANCE SILVER Tab. Foil',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.92,
    cost = 13.44,
    reorder_level = 20,
    expiry_date = DATE '2028-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00080';
UPDATE products
SET sku = 'MED-00162',
    name = 'CENTRUM Advance Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.68,
    cost = 8.42,
    reorder_level = 20,
    expiry_date = DATE '2028-10-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00081';
UPDATE products
SET sku = 'MED-00163',
    name = 'CENTRUM SILVER Tablet  30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 225.69,
    cost = 180.83,
    reorder_level = 20,
    expiry_date = DATE '2027-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00082';
UPDATE products
SET sku = 'MED-00164',
    name = 'CEPOREX 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.71,
    cost = 18.06,
    reorder_level = 20,
    expiry_date = DATE '2030-07-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00083';
UPDATE products
SET sku = 'MED-00165',
    name = 'CETIRIZINE 10mg Tab 100s (Pasteur)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 352.19,
    cost = 281.37,
    reorder_level = 20,
    expiry_date = DATE '2027-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00084';
UPDATE products
SET sku = 'MED-00166',
    name = 'CETIRIZINE 10mg Tablet (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 7.07,
    cost = 5.63,
    reorder_level = 20,
    expiry_date = DATE '2028-05-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00085';
UPDATE products
SET sku = 'NPH-00166',
    name = 'CHARMEE All Night Plus 4''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.68,
    cost = 58.51,
    reorder_level = 20,
    expiry_date = DATE '2027-10-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00086';
UPDATE products
SET sku = 'NPH-00167',
    name = 'CHARMEE Breathble 20''s-Green Tea',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.35,
    cost = 54.26,
    reorder_level = 20,
    expiry_date = DATE '2030-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00087';
UPDATE products
SET sku = 'NPH-00168',
    name = 'CHARMEE Breathble 20''s-LavndrScent',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.75,
    cost = 36.00,
    reorder_level = 20,
    expiry_date = DATE '2029-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00088';
UPDATE products
SET sku = 'NPH-00169',
    name = 'CHARMEE Breathble 20''s-Unscented',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.53,
    cost = 47.57,
    reorder_level = 20,
    expiry_date = DATE '2028-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00089';
UPDATE products
SET sku = 'NPH-00170',
    name = 'CHARMEE Breathble 8''s-Green Tea',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.39,
    cost = 53.54,
    reorder_level = 20,
    expiry_date = DATE '2028-04-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00090';
UPDATE products
SET sku = 'NPH-00171',
    name = 'CHARMEE Breathble 8''s-LavndrScent',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.86,
    cost = 44.02,
    reorder_level = 20,
    expiry_date = DATE '2027-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00091';
UPDATE products
SET sku = 'NPH-00172',
    name = 'CHARMEE Breathble 8''s-Unscented',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.41,
    cost = 29.28,
    reorder_level = 20,
    expiry_date = DATE '2029-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00092';
UPDATE products
SET sku = 'NPH-00173',
    name = 'CHARMEE Dry Net Non Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.46,
    cost = 39.17,
    reorder_level = 20,
    expiry_date = DATE '2027-04-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00093';
UPDATE products
SET sku = 'NPH-00174',
    name = 'CHARMEE Dry Net With Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.38,
    cost = 53.52,
    reorder_level = 20,
    expiry_date = DATE '2027-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00094';
UPDATE products
SET sku = 'NPH-00175',
    name = 'CHARMEE Heavy Flow Overnight 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.12,
    cost = 48.88,
    reorder_level = 20,
    expiry_date = DATE '2028-04-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00095';
UPDATE products
SET sku = 'NPH-00176',
    name = 'CHARMEE Menstrual Pants- M 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.55,
    cost = 39.23,
    reorder_level = 20,
    expiry_date = DATE '2029-12-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00096';
UPDATE products
SET sku = 'NPH-00177',
    name = 'CHARMEE Non Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.53,
    cost = 34.24,
    reorder_level = 20,
    expiry_date = DATE '2029-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00097';
UPDATE products
SET sku = 'NPH-00178',
    name = 'CHARMEE P/L Go Girl 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.73,
    cost = 52.16,
    reorder_level = 20,
    expiry_date = DATE '2029-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00098';
UPDATE products
SET sku = 'NPH-00179',
    name = 'CHARMEE Pantyliners 20''s-Unscented',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.85,
    cost = 46.82,
    reorder_level = 20,
    expiry_date = DATE '2028-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00099';
UPDATE products
SET sku = 'NPH-00180',
    name = 'CHARMEE Pantyliners 8''s-Go Girl Rose',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.62,
    cost = 19.56,
    reorder_level = 20,
    expiry_date = DATE '2028-12-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00100';
UPDATE products
SET sku = 'NPH-00181',
    name = 'CHARMEE Pantyliners 8''s-Unscented',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.15,
    cost = 24.77,
    reorder_level = 20,
    expiry_date = DATE '2028-03-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00101';
UPDATE products
SET sku = 'NPH-00182',
    name = 'CHARMEE with Wings 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 81.75,
    cost = 67.36,
    reorder_level = 20,
    expiry_date = DATE '2028-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00102';
UPDATE products
SET sku = 'NPH-00183',
    name = 'CHARMEE with Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.32,
    cost = 27.32,
    reorder_level = 20,
    expiry_date = DATE '2030-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00103';
UPDATE products
SET sku = 'MED-00167',
    name = 'CHERIFER Drops 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 49.62,
    cost = 39.17,
    reorder_level = 20,
    expiry_date = DATE '2027-05-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00104';
UPDATE products
SET sku = 'MED-00168',
    name = 'CHERIFER Drops 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 30.89,
    cost = 25.41,
    reorder_level = 20,
    expiry_date = DATE '2030-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00105';
UPDATE products
SET sku = 'MED-00169',
    name = 'CHERIFER Forte Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 117.72,
    cost = 91.51,
    reorder_level = 20,
    expiry_date = DATE '2030-10-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00106';
UPDATE products
SET sku = 'MED-00170',
    name = 'CHERIFER Forte Syrup 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 155.70,
    cost = 125.31,
    reorder_level = 20,
    expiry_date = DATE '2029-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00107';
UPDATE products
SET sku = 'MED-00171',
    name = 'CHERIFER Forte with Zinc 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 106.36,
    cost = 81.24,
    reorder_level = 20,
    expiry_date = DATE '2027-09-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00108';
UPDATE products
SET sku = 'MED-00172',
    name = 'CHERIFER Forte with Zinc 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 101.04,
    cost = 84.13,
    reorder_level = 20,
    expiry_date = DATE '2029-01-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00109';
UPDATE products
SET sku = 'MED-00173',
    name = 'CHERIFER Immunomax Syr.120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 107.81,
    cost = 82.17,
    reorder_level = 20,
    expiry_date = DATE '2029-03-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00110';
UPDATE products
SET sku = 'MED-00174',
    name = 'CHERIFER PGM 10-22 Capsule  30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 428.93,
    cost = 338.09,
    reorder_level = 20,
    expiry_date = DATE '2030-10-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00111';
UPDATE products
SET sku = 'MED-00175',
    name = 'CHERIFER PGM 10-22 Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 739.29,
    cost = 585.81,
    reorder_level = 20,
    expiry_date = DATE '2027-12-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00112';
UPDATE products
SET sku = 'MED-00176',
    name = 'CHERIFER PGM Immunomax Cap 30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 393.83,
    cost = 299.78,
    reorder_level = 20,
    expiry_date = DATE '2029-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00113';
UPDATE products
SET sku = 'MED-00177',
    name = 'CHERIFER PGM with Zinc Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 17.42,
    cost = 14.12,
    reorder_level = 20,
    expiry_date = DATE '2030-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00114';
UPDATE products
SET sku = 'MED-00178',
    name = 'CHERIFER Premium Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 634.11,
    cost = 484.46,
    reorder_level = 20,
    expiry_date = DATE '2029-01-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00115';
UPDATE products
SET sku = 'MED-00179',
    name = 'CHERIFER Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 89.27,
    cost = 69.00,
    reorder_level = 20,
    expiry_date = DATE '2028-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00116';
UPDATE products
SET sku = 'MED-00180',
    name = 'CHERIFER Syrup 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 146.34,
    cost = 114.65,
    reorder_level = 20,
    expiry_date = DATE '2030-02-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00117';
UPDATE products
SET sku = 'MED-00181',
    name = 'CHERIFER with CGF + Zinc 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 84.33,
    cost = 69.97,
    reorder_level = 20,
    expiry_date = DATE '2030-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00118';
UPDATE products
SET sku = 'MED-00182',
    name = 'CHERIFER with CGF + Zinc 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 115.40,
    cost = 88.86,
    reorder_level = 20,
    expiry_date = DATE '2027-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00119';
UPDATE products
SET sku = 'MED-00183',
    name = 'CHILLI PLASTER (20 packs x 10''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 108.29,
    cost = 83.91,
    reorder_level = 20,
    expiry_date = DATE '2027-07-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00120';
UPDATE products
SET sku = 'NPH-00184',
    name = 'CHIN CHUN SU (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 25.25,
    cost = 20.67,
    reorder_level = 20,
    expiry_date = DATE '2029-10-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00121';
UPDATE products
SET sku = 'NPH-00185',
    name = 'CHIN CHUN SU (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 41.27,
    cost = 33.40,
    reorder_level = 20,
    expiry_date = DATE '2029-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00122';
UPDATE products
SET sku = 'NPH-00186',
    name = 'CHIN CHUN SU with Beta Carotene',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 63.20,
    cost = 48.11,
    reorder_level = 20,
    expiry_date = DATE '2029-05-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00123';
UPDATE products
SET sku = 'MED-00184',
    name = 'CIPROBAY Tablet 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.81,
    cost = 4.41,
    reorder_level = 20,
    expiry_date = DATE '2029-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00124';
UPDATE products
SET sku = 'MED-00185',
    name = 'CIPROFLOXACIN 500mg Tab.(Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.45,
    cost = 11.69,
    reorder_level = 20,
    expiry_date = DATE '2029-09-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00125';
UPDATE products
SET sku = 'MED-00186',
    name = 'CLARICORT Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.33,
    cost = 6.73,
    reorder_level = 20,
    expiry_date = DATE '2029-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00126';
UPDATE products
SET sku = 'MED-00187',
    name = 'CLARITHROMYCIN 500mg (Natra)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.64,
    cost = 35.48,
    reorder_level = 20,
    expiry_date = DATE '2029-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00127';
UPDATE products
SET sku = 'MED-00188',
    name = 'CLARITHROMYCIN 500mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.58,
    cost = 32.56,
    reorder_level = 20,
    expiry_date = DATE '2027-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00128';
UPDATE products
SET sku = 'MED-00189',
    name = 'CLARITIN Syrup 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 34.85,
    cost = 28.04,
    reorder_level = 20,
    expiry_date = DATE '2028-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00129';
UPDATE products
SET sku = 'MED-00190',
    name = 'CLARITIN Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 21.24,
    cost = 16.79,
    reorder_level = 20,
    expiry_date = DATE '2030-08-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00130';
UPDATE products
SET sku = 'MED-00191',
    name = 'CLARITIN Tablet 5''s (4+1)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-drowsy second-generation antihistamine for allergic rhinitis, sneezing, and skin allergy symptoms.',
    quantity = 100,
    price = 18.49,
    cost = 14.78,
    reorder_level = 20,
    expiry_date = DATE '2027-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00131';
UPDATE products
SET sku = 'NPH-00187',
    name = 'CLEAR Men Shamp Sach (Cool Sport)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.11,
    cost = 52.16,
    reorder_level = 20,
    expiry_date = DATE '2027-08-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00132';
UPDATE products
SET sku = 'NPH-00188',
    name = 'CLEAR Shamp Sach (C/Soft Care) 12mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.60,
    cost = 26.27,
    reorder_level = 20,
    expiry_date = DATE '2030-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00133';
UPDATE products
SET sku = 'MED-00192',
    name = 'CLINDAMYCIN 150mg Cap.(Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.76,
    cost = 12.94,
    reorder_level = 20,
    expiry_date = DATE '2027-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00134';
UPDATE products
SET sku = 'MED-00193',
    name = 'C-LIUM Fibre Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.98,
    cost = 16.68,
    reorder_level = 20,
    expiry_date = DATE '2030-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00135';
UPDATE products
SET sku = 'MED-00194',
    name = 'C-LIUM Fibre Habit Pack 30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 420.95,
    cost = 337.46,
    reorder_level = 20,
    expiry_date = DATE '2027-08-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00136';
UPDATE products
SET sku = 'MED-00195',
    name = 'C-LIUM Fibre Sachet 7''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.09,
    cost = 6.74,
    reorder_level = 20,
    expiry_date = DATE '2028-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00137';
UPDATE products
SET sku = 'MED-00196',
    name = 'CLOPIDOGREL 75mg (FLAMDOVIX)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 26.88,
    cost = 21.06,
    reorder_level = 20,
    expiry_date = DATE '2030-10-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00138';
UPDATE products
SET sku = 'MED-00197',
    name = 'CLOPIDOGREL 75mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 25.12,
    cost = 19.80,
    reorder_level = 20,
    expiry_date = DATE '2030-05-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00139';
UPDATE products
SET sku = 'MED-00198',
    name = 'CLOPIDOGREL 75mg Tablet 14''s (Winthrop)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 49.25,
    cost = 40.02,
    reorder_level = 20,
    expiry_date = DATE '2030-09-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00140';
UPDATE products
SET sku = 'NPH-00189',
    name = 'CLOSE-UP  25mL (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.48,
    cost = 19.48,
    reorder_level = 20,
    expiry_date = DATE '2029-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00141';
UPDATE products
SET sku = 'NPH-00190',
    name = 'CLOSE-UP  25mL (Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.90,
    cost = 19.15,
    reorder_level = 20,
    expiry_date = DATE '2030-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00142';
UPDATE products
SET sku = 'NPH-00191',
    name = 'CLOSE-UP  50mL (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.46,
    cost = 25.17,
    reorder_level = 20,
    expiry_date = DATE '2027-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00143';
UPDATE products
SET sku = 'NPH-00192',
    name = 'CLOSE-UP  50mL (Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.81,
    cost = 28.08,
    reorder_level = 20,
    expiry_date = DATE '2027-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00144';
UPDATE products
SET sku = 'NPH-00193',
    name = 'CLOSE-UP  95mL (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.01,
    cost = 38.96,
    reorder_level = 20,
    expiry_date = DATE '2029-02-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00145';
UPDATE products
SET sku = 'NPH-00194',
    name = 'CLOSE-UP  95mL (Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.27,
    cost = 51.59,
    reorder_level = 20,
    expiry_date = DATE '2028-08-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00146';
UPDATE products
SET sku = 'NPH-00195',
    name = 'CLOSE-UP 145mL  (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.26,
    cost = 51.92,
    reorder_level = 20,
    expiry_date = DATE '2028-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00147';
UPDATE products
SET sku = 'NPH-00196',
    name = 'CLOSE-UP 145mL (Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.45,
    cost = 34.55,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00148';
UPDATE products
SET sku = 'NPH-00197',
    name = 'CLOSE-UP Sachet Green 6''s Free N-Book',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.41,
    cost = 53.62,
    reorder_level = 20,
    expiry_date = DATE '2030-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00149';
UPDATE products
SET sku = 'NPH-00198',
    name = 'CLOSE-UP Sachet-Green Twn/Pck 22g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 8.43,
    cost = 6.96,
    reorder_level = 20,
    expiry_date = DATE '2028-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00150';
UPDATE products
SET sku = 'NPH-00199',
    name = 'CLOSE-UP Sachet-Red Twn/Pck 22g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 15.55,
    cost = 12.10,
    reorder_level = 20,
    expiry_date = DATE '2029-06-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00151';
UPDATE products
SET sku = 'MED-00199',
    name = 'CLOXACILLIN 500mg Cap.(Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.45,
    cost = 4.54,
    reorder_level = 20,
    expiry_date = DATE '2027-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00152';
UPDATE products
SET sku = 'MED-00200',
    name = 'CLUSIVOL Plus Capsule (Foil)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.63,
    cost = 11.80,
    reorder_level = 20,
    expiry_date = DATE '2027-09-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00153';
UPDATE products
SET sku = 'MED-00201',
    name = 'CLUSIVOL Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 28.44,
    cost = 22.33,
    reorder_level = 20,
    expiry_date = DATE '2028-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00154';
UPDATE products
SET sku = 'MED-00202',
    name = 'CLUSIVOL Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 101.89,
    cost = 83.68,
    reorder_level = 20,
    expiry_date = DATE '2027-06-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00155';
UPDATE products
SET sku = 'MED-00203',
    name = 'CLUSIVOL Syrup 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 159.48,
    cost = 132.67,
    reorder_level = 20,
    expiry_date = DATE '2030-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00156';
UPDATE products
SET sku = 'MED-00204',
    name = 'CLUSIVOL-OB Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.19,
    cost = 11.51,
    reorder_level = 20,
    expiry_date = DATE '2029-07-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00157';
UPDATE products
SET sku = 'MED-00205',
    name = 'CO-ALEVA 10mg/500mcg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.52,
    cost = 14.42,
    reorder_level = 20,
    expiry_date = DATE '2030-10-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00158';
UPDATE products
SET sku = 'MED-00206',
    name = 'CO-ALTRIA 10mg/5mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.01,
    cost = 13.13,
    reorder_level = 20,
    expiry_date = DATE '2029-01-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00159';
UPDATE products
SET sku = 'MED-00207',
    name = 'CO-AMOXICLAV 500/125 Tab (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Broad-spectrum antibacterial prescription antibiotic for respiratory, ENT, and skin infections.',
    quantity = 100,
    price = 5.63,
    cost = 4.55,
    reorder_level = 20,
    expiry_date = DATE '2027-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00160';
UPDATE products
SET sku = 'MED-00208',
    name = 'CO-APROVEL 150mg 12.5mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.95,
    cost = 14.63,
    reorder_level = 20,
    expiry_date = DATE '2027-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00161';
UPDATE products
SET sku = 'MED-00209',
    name = 'COLCHICINE Tablet 500mcg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.54,
    cost = 17.27,
    reorder_level = 20,
    expiry_date = DATE '2027-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00162';
UPDATE products
SET sku = 'NPH-00200',
    name = 'COLGATE   66g F/C Spicy Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 31.27,
    cost = 23.78,
    reorder_level = 20,
    expiry_date = DATE '2027-08-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00163';
UPDATE products
SET sku = 'NPH-00201',
    name = 'COLGATE  25mL Great Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 35.82,
    cost = 28.79,
    reorder_level = 20,
    expiry_date = DATE '2029-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00164';
UPDATE products
SET sku = 'NPH-00202',
    name = 'COLGATE  25mL Triple Action',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 19.44,
    cost = 14.78,
    reorder_level = 20,
    expiry_date = DATE '2028-12-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00165';
UPDATE products
SET sku = 'NPH-00203',
    name = 'COLGATE  50mL  F/C Peppermint Ice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 56.46,
    cost = 42.84,
    reorder_level = 20,
    expiry_date = DATE '2028-03-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00166';
UPDATE products
SET sku = 'NPH-00204',
    name = 'COLGATE  50mL F/C KoolMentholFresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 61.83,
    cost = 49.53,
    reorder_level = 20,
    expiry_date = DATE '2027-07-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00167';
UPDATE products
SET sku = 'NPH-00205',
    name = 'COLGATE  50mL Great Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 29.54,
    cost = 22.71,
    reorder_level = 20,
    expiry_date = DATE '2027-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00168';
UPDATE products
SET sku = 'NPH-00206',
    name = 'COLGATE  50mL Triple Action',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 38.06,
    cost = 30.74,
    reorder_level = 20,
    expiry_date = DATE '2027-05-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00169';
UPDATE products
SET sku = 'NPH-00207',
    name = 'COLGATE  95mL F/C KoolMentholFresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 39.97,
    cost = 30.38,
    reorder_level = 20,
    expiry_date = DATE '2028-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00170';
UPDATE products
SET sku = 'NPH-00208',
    name = 'COLGATE  95mL F/C Peppermint Ice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 48.37,
    cost = 38.22,
    reorder_level = 20,
    expiry_date = DATE '2028-07-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00171';
UPDATE products
SET sku = 'NPH-00209',
    name = 'COLGATE  95mL Great Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 33.14,
    cost = 25.27,
    reorder_level = 20,
    expiry_date = DATE '2028-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00172';
UPDATE products
SET sku = 'NPH-00210',
    name = 'COLGATE  95mL Triple Action',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 65.06,
    cost = 53.82,
    reorder_level = 20,
    expiry_date = DATE '2027-12-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00173';
UPDATE products
SET sku = 'NPH-00211',
    name = 'COLGATE 126g F/C Spicy Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 42.71,
    cost = 33.94,
    reorder_level = 20,
    expiry_date = DATE '2029-04-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00174';
UPDATE products
SET sku = 'NPH-00212',
    name = 'COLGATE 145mL F/C KoolMentholFresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 24.41,
    cost = 18.66,
    reorder_level = 20,
    expiry_date = DATE '2030-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00175';
UPDATE products
SET sku = 'NPH-00213',
    name = 'COLGATE 145mL F/C Peppermint Ice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 54.56,
    cost = 43.26,
    reorder_level = 20,
    expiry_date = DATE '2028-07-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00176';
UPDATE products
SET sku = 'NPH-00214',
    name = 'COLGATE 145mL Great Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 66.05,
    cost = 53.55,
    reorder_level = 20,
    expiry_date = DATE '2029-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00177';
UPDATE products
SET sku = 'NPH-00215',
    name = 'COLGATE 145mL Triple Action',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 67.00,
    cost = 51.39,
    reorder_level = 20,
    expiry_date = DATE '2028-02-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00178';
UPDATE products
SET sku = 'NPH-00216',
    name = 'COLGATE 193g F/C Spicy Fresh.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 58.59,
    cost = 46.67,
    reorder_level = 20,
    expiry_date = DATE '2030-06-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00179';
UPDATE products
SET sku = 'NPH-00217',
    name = 'COLGATE 40g (Kids Barbie)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 64.47,
    cost = 50.30,
    reorder_level = 20,
    expiry_date = DATE '2028-04-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00180';
UPDATE products
SET sku = 'NPH-00218',
    name = 'COLGATE 40g (Kids Spiderman)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 42.14,
    cost = 32.79,
    reorder_level = 20,
    expiry_date = DATE '2028-07-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00181';
UPDATE products
SET sku = 'NPH-00219',
    name = 'COLGATE Sach.-Great Reg.Twn/Pack',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 45.50,
    cost = 35.12,
    reorder_level = 20,
    expiry_date = DATE '2029-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00182';
UPDATE products
SET sku = 'NPH-00220',
    name = 'COLGATE Sach-K/MntholFrsh Twn/Pck',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 63.87,
    cost = 52.59,
    reorder_level = 20,
    expiry_date = DATE '2027-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00183';
UPDATE products
SET sku = 'NPH-00221',
    name = 'COLGATE Sach-Spicy Fresh Twn/Pack',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 36.89,
    cost = 28.28,
    reorder_level = 20,
    expiry_date = DATE '2029-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00184';
UPDATE products
SET sku = 'NPH-00222',
    name = 'COLGATE TBrush Classic (Adult) 1+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 57.02,
    cost = 44.96,
    reorder_level = 20,
    expiry_date = DATE '2028-06-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00185';
UPDATE products
SET sku = 'NPH-00223',
    name = 'COLGATE Toothbrush w/ cap (Adult)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 19.07,
    cost = 14.52,
    reorder_level = 20,
    expiry_date = DATE '2030-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00186';
UPDATE products
SET sku = 'NPH-00224',
    name = 'COLGATE Toothbrush w/ cap (Child)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 6.24,
    cost = 4.94,
    reorder_level = 20,
    expiry_date = DATE '2027-05-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00187';
UPDATE products
SET sku = 'MED-00210',
    name = 'COLVAN Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.51,
    cost = 6.02,
    reorder_level = 20,
    expiry_date = DATE '2030-10-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00188';
UPDATE products
SET sku = 'MED-00211',
    name = 'COLVAN Drops',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.74,
    cost = 31.53,
    reorder_level = 20,
    expiry_date = DATE '2028-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00189';
UPDATE products
SET sku = 'MED-00212',
    name = 'COLVAN Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.50,
    cost = 35.41,
    reorder_level = 20,
    expiry_date = DATE '2028-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00190';
UPDATE products
SET sku = 'MED-00213',
    name = 'COMBANTRIN Suspension 10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 26.74,
    cost = 21.82,
    reorder_level = 20,
    expiry_date = DATE '2029-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00191';
UPDATE products
SET sku = 'MED-00214',
    name = 'COMBANTRIN Tablet 125mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.41,
    cost = 11.08,
    reorder_level = 20,
    expiry_date = DATE '2030-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00192';
UPDATE products
SET sku = 'MED-00215',
    name = 'COMBIVENT UDV Nebules 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.74,
    cost = 22.97,
    reorder_level = 20,
    expiry_date = DATE '2029-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00193';
UPDATE products
SET sku = 'MED-00216',
    name = 'COMBIZAR Tablet  50mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.50,
    cost = 15.01,
    reorder_level = 20,
    expiry_date = DATE '2029-05-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00194';
UPDATE products
SET sku = 'MED-00217',
    name = 'COMBIZAR Tablet 100mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.59,
    cost = 12.60,
    reorder_level = 20,
    expiry_date = DATE '2030-09-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00195';
UPDATE products
SET sku = 'MED-00218',
    name = 'CONCORE AM 5mg/5mg Tab',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.42,
    cost = 10.34,
    reorder_level = 20,
    expiry_date = DATE '2029-07-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00196';
UPDATE products
SET sku = 'MED-00219',
    name = 'CONTRACTUBEX Gel 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.22,
    cost = 30.03,
    reorder_level = 20,
    expiry_date = DATE '2027-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00197';
UPDATE products
SET sku = 'MED-00220',
    name = 'CONTRACTUBEX Gel 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.82,
    cost = 32.69,
    reorder_level = 20,
    expiry_date = DATE '2028-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00198';
UPDATE products
SET sku = 'MED-00221',
    name = 'CONZACE Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 20.15,
    cost = 16.47,
    reorder_level = 20,
    expiry_date = DATE '2029-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00199';
UPDATE products
SET sku = 'MED-00222',
    name = 'CORTAL 500 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.88,
    cost = 9.96,
    reorder_level = 20,
    expiry_date = DATE '2028-07-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00200';
UPDATE products
SET sku = 'MED-00223',
    name = 'COTRIMOXAZOLE 800mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.24,
    cost = 24.23,
    reorder_level = 20,
    expiry_date = DATE '2030-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00201';
UPDATE products
SET sku = 'MED-00224',
    name = 'COTRIMOXAZOLE 800mg Tab-Pharex',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.62,
    cost = 16.25,
    reorder_level = 20,
    expiry_date = DATE '2027-12-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00202';
UPDATE products
SET sku = 'MED-00225',
    name = 'COTRIMOXAZOLE Susp. 60mL (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 72.98,
    cost = 56.42,
    reorder_level = 20,
    expiry_date = DATE '2028-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00203';
UPDATE products
SET sku = 'NPH-00225',
    name = 'CRACKERS Garlic Bread  24G 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 117.50,
    cost = 90.03,
    reorder_level = 20,
    expiry_date = DATE '2030-09-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00204';
UPDATE products
SET sku = 'NPH-00226',
    name = 'CRACKERS Garlic Bread 108G 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 69.16,
    cost = 53.97,
    reorder_level = 20,
    expiry_date = DATE '2030-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00205';
UPDATE products
SET sku = 'NPH-00227',
    name = 'CREAMSILK  90mL-Blue:D/Control',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.68,
    cost = 26.99,
    reorder_level = 20,
    expiry_date = DATE '2029-12-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00206';
UPDATE products
SET sku = 'NPH-00228',
    name = 'CREAMSILK  90mL-Grn:HairFall Defnse',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.05,
    cost = 31.66,
    reorder_level = 20,
    expiry_date = DATE '2029-11-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00207';
UPDATE products
SET sku = 'NPH-00229',
    name = 'CREAMSILK  90mL-Pink:S/Straight',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.28,
    cost = 22.88,
    reorder_level = 20,
    expiry_date = DATE '2028-06-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00208';
UPDATE products
SET sku = 'NPH-00230',
    name = 'CREAMSILK 180mL-Blue:D/Control',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 88.04,
    cost = 68.22,
    reorder_level = 20,
    expiry_date = DATE '2028-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00209';
UPDATE products
SET sku = 'NPH-00231',
    name = 'CREAMSILK 180mL-Grn:HairFall Defnse',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 82.01,
    cost = 65.60,
    reorder_level = 20,
    expiry_date = DATE '2027-08-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00210';
UPDATE products
SET sku = 'NPH-00232',
    name = 'CREAMSILK 180mL-Pink:S/Straight',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 75.83,
    cost = 62.27,
    reorder_level = 20,
    expiry_date = DATE '2028-11-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00211';
UPDATE products
SET sku = 'NPH-00233',
    name = 'CREAMSILK Sach (Blue: Damage Control)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.77,
    cost = 41.19,
    reorder_level = 20,
    expiry_date = DATE '2030-02-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00212';
UPDATE products
SET sku = 'NPH-00234',
    name = 'CREAMSILK Sach (Brilliant Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.26,
    cost = 54.34,
    reorder_level = 20,
    expiry_date = DATE '2027-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00213';
UPDATE products
SET sku = 'NPH-00235',
    name = 'CREAMSILK Sach (Pink/Standout Straight)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.80,
    cost = 31.17,
    reorder_level = 20,
    expiry_date = DATE '2030-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00214';
UPDATE products
SET sku = 'NPH-00236',
    name = 'CREAMSILK Sach (Stunning Shine)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.83,
    cost = 42.35,
    reorder_level = 20,
    expiry_date = DATE '2030-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00215';
UPDATE products
SET sku = 'NPH-00237',
    name = 'CREAMSILK Sach (Violet: Dandruff-Free)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.12,
    cost = 29.06,
    reorder_level = 20,
    expiry_date = DATE '2029-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00216';
UPDATE products
SET sku = 'NPH-00238',
    name = 'CREAMSILK Sach Pink/SS (6+1) 11mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.28,
    cost = 40.71,
    reorder_level = 20,
    expiry_date = DATE '2027-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00217';
UPDATE products
SET sku = 'NPH-00239',
    name = 'CREAMSILK Sach-Color Protect',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.05,
    cost = 20.81,
    reorder_level = 20,
    expiry_date = DATE '2028-12-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00218';
UPDATE products
SET sku = 'NPH-00240',
    name = 'CREAMSILK Sach-Grn:HairFall Defnse',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.25,
    cost = 33.51,
    reorder_level = 20,
    expiry_date = DATE '2028-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00219';
UPDATE products
SET sku = 'NPH-00241',
    name = 'CREAMSILK Sach-Grn:HFD (6+1) 11mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.62,
    cost = 42.35,
    reorder_level = 20,
    expiry_date = DATE '2028-10-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00220';
UPDATE products
SET sku = 'NPH-00242',
    name = 'CUTICLE REMOVER 60mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 30.01,
    cost = 23.24,
    reorder_level = 20,
    expiry_date = DATE '2027-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00221';
UPDATE products
SET sku = 'MED-00226',
    name = 'DAFLON Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.17,
    cost = 8.68,
    reorder_level = 20,
    expiry_date = DATE '2028-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00222';
UPDATE products
SET sku = 'MED-00227',
    name = 'DAKTARIN Oral Gel  3.5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.19,
    cost = 15.78,
    reorder_level = 20,
    expiry_date = DATE '2027-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00223';
UPDATE products
SET sku = 'MED-00228',
    name = 'DALACIN-C 150mg Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.72,
    cost = 9.07,
    reorder_level = 20,
    expiry_date = DATE '2028-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00224';
UPDATE products
SET sku = 'MED-00229',
    name = 'DALACIN-C 300mg Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.46,
    cost = 17.22,
    reorder_level = 20,
    expiry_date = DATE '2027-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00225';
UPDATE products
SET sku = 'NPH-00243',
    name = 'DAPHNE Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 65.71,
    cost = 50.34,
    reorder_level = 20,
    expiry_date = DATE '2028-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00226';
UPDATE products
SET sku = 'MED-00230',
    name = 'DECILONE Forte Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.37,
    cost = 4.09,
    reorder_level = 20,
    expiry_date = DATE '2030-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00227';
UPDATE products
SET sku = 'MED-00231',
    name = 'DECILONE Plain Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.99,
    cost = 8.89,
    reorder_level = 20,
    expiry_date = DATE '2030-09-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00228';
UPDATE products
SET sku = 'MED-00232',
    name = 'DECOLGEN Forte Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 9.93,
    cost = 8.02,
    reorder_level = 20,
    expiry_date = DATE '2029-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00229';
UPDATE products
SET sku = 'MED-00233',
    name = 'DECOLGEN No-Drowse Tablet 4''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 66.45,
    cost = 51.64,
    reorder_level = 20,
    expiry_date = DATE '2030-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00230';
UPDATE products
SET sku = 'MED-00234',
    name = 'DECOLGEN No-Drowse Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 8.86,
    cost = 7.30,
    reorder_level = 20,
    expiry_date = DATE '2029-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00231';
UPDATE products
SET sku = 'MED-00235',
    name = 'DECOLSIN Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.57,
    cost = 6.99,
    reorder_level = 20,
    expiry_date = DATE '2030-03-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00232';
UPDATE products
SET sku = 'MED-00236',
    name = 'DECOLSIN Suspension  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 56.24,
    cost = 43.76,
    reorder_level = 20,
    expiry_date = DATE '2030-08-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00233';
UPDATE products
SET sku = 'MED-00237',
    name = 'DEQUADIN Lozenges',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.07,
    cost = 35.72,
    reorder_level = 20,
    expiry_date = DATE '2027-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00234';
UPDATE products
SET sku = 'MED-00238',
    name = 'DEQUADIN Paint',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 49.81,
    cost = 39.61,
    reorder_level = 20,
    expiry_date = DATE '2027-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00235';
UPDATE products
SET sku = 'MED-00239',
    name = 'DERMALIN Whitfield''s Oint. 15g* UHP',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.08,
    cost = 34.11,
    reorder_level = 20,
    expiry_date = DATE '2028-08-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00236';
UPDATE products
SET sku = 'MED-00240',
    name = 'DERMOVATE Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.56,
    cost = 30.54,
    reorder_level = 20,
    expiry_date = DATE '2029-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00237';
UPDATE products
SET sku = 'MED-00241',
    name = 'DERMOVATE Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.27,
    cost = 37.09,
    reorder_level = 20,
    expiry_date = DATE '2029-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00238';
UPDATE products
SET sku = 'MED-00242',
    name = 'DESITIN Cream 56g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.58,
    cost = 39.29,
    reorder_level = 20,
    expiry_date = DATE '2029-12-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00239';
UPDATE products
SET sku = 'MED-00243',
    name = 'DIANE 35 Dragees 21''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.75,
    cost = 27.06,
    reorder_level = 20,
    expiry_date = DATE '2027-03-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00240';
UPDATE products
SET sku = 'MED-00244',
    name = 'DIATABS Capsule 4''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antidiarrheal agent (Loperamide HCl) for rapid control of acute diarrhea symptoms.',
    quantity = 100,
    price = 60.04,
    cost = 48.52,
    reorder_level = 20,
    expiry_date = DATE '2030-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00241';
UPDATE products
SET sku = 'MED-00245',
    name = 'DIATABS Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antidiarrheal agent (Loperamide HCl) for rapid control of acute diarrhea symptoms.',
    quantity = 100,
    price = 12.42,
    cost = 10.14,
    reorder_level = 20,
    expiry_date = DATE '2028-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00242';
UPDATE products
SET sku = 'MED-00246',
    name = 'DICLOFENAC 50mg Tab. (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.12,
    cost = 16.00,
    reorder_level = 20,
    expiry_date = DATE '2030-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00243';
UPDATE products
SET sku = 'MED-00247',
    name = 'DIFENAX 50mg (Diclofenac Sodium)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.44,
    cost = 17.93,
    reorder_level = 20,
    expiry_date = DATE '2030-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00244';
UPDATE products
SET sku = 'MED-00248',
    name = 'DIFFLAM Lozenges',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.50,
    cost = 41.17,
    reorder_level = 20,
    expiry_date = DATE '2029-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00245';
UPDATE products
SET sku = 'MED-00249',
    name = 'DIFFLAM Solution 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 119.62,
    cost = 92.05,
    reorder_level = 20,
    expiry_date = DATE '2028-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00246';
UPDATE products
SET sku = 'NPH-00244',
    name = 'DIGITAL Thermometer (Advan)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 26.80,
    cost = 22.27,
    reorder_level = 20,
    expiry_date = DATE '2029-09-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00247';
UPDATE products
SET sku = 'NPH-00245',
    name = 'DIGITAL Thermometer (Surgitech)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 40.66,
    cost = 33.69,
    reorder_level = 20,
    expiry_date = DATE '2030-01-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00248';
UPDATE products
SET sku = 'MED-00250',
    name = 'DIMETAPP Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.49,
    cost = 30.43,
    reorder_level = 20,
    expiry_date = DATE '2029-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00249';
UPDATE products
SET sku = 'MED-00251',
    name = 'DIPROLENE Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.84,
    cost = 15.30,
    reorder_level = 20,
    expiry_date = DATE '2029-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00250';
UPDATE products
SET sku = 'MED-00252',
    name = 'DIPROLENE Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.79,
    cost = 15.44,
    reorder_level = 20,
    expiry_date = DATE '2030-08-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00251';
UPDATE products
SET sku = 'MED-00253',
    name = 'DIPROSALIC Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.42,
    cost = 33.62,
    reorder_level = 20,
    expiry_date = DATE '2027-08-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00252';
UPDATE products
SET sku = 'NPH-00246',
    name = 'DISPOSABLE Syringe  1mL-SureShot',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 27.17,
    cost = 20.63,
    reorder_level = 20,
    expiry_date = DATE '2027-09-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00253';
UPDATE products
SET sku = 'NPH-00247',
    name = 'DISPOSABLE Syringe  3mL-SureShot',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 62.81,
    cost = 51.31,
    reorder_level = 20,
    expiry_date = DATE '2028-08-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00254';
UPDATE products
SET sku = 'NPH-00248',
    name = 'DISPOSABLE Syringe  5mL-SureShot',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 66.93,
    cost = 54.83,
    reorder_level = 20,
    expiry_date = DATE '2027-01-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00255';
UPDATE products
SET sku = 'MED-00254',
    name = 'DISUDRIN Drops 10mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.90,
    cost = 34.04,
    reorder_level = 20,
    expiry_date = DATE '2027-07-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00256';
UPDATE products
SET sku = 'MED-00255',
    name = 'DISUDRIN Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 62.81,
    cost = 50.61,
    reorder_level = 20,
    expiry_date = DATE '2029-05-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00257';
UPDATE products
SET sku = 'MED-00256',
    name = 'DISUDRIN Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 81.84,
    cost = 67.07,
    reorder_level = 20,
    expiry_date = DATE '2027-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00258';
UPDATE products
SET sku = 'MED-00257',
    name = 'DOLAN Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 28.38,
    cost = 22.89,
    reorder_level = 20,
    expiry_date = DATE '2027-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00259';
UPDATE products
SET sku = 'MED-00258',
    name = 'DOLAN FP Forte Syrup 200mg 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 67.59,
    cost = 56.03,
    reorder_level = 20,
    expiry_date = DATE '2028-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00260';
UPDATE products
SET sku = 'MED-00259',
    name = 'DOLAN FP Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 58.46,
    cost = 45.06,
    reorder_level = 20,
    expiry_date = DATE '2028-08-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00261';
UPDATE products
SET sku = 'MED-00260',
    name = 'DOLCET 37.5/325mg Tablet (50''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 261.76,
    cost = 207.95,
    reorder_level = 20,
    expiry_date = DATE '2030-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00262';
UPDATE products
SET sku = 'MED-00261',
    name = 'DOLFENAL 250mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.29,
    cost = 13.50,
    reorder_level = 20,
    expiry_date = DATE '2029-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00263';
UPDATE products
SET sku = 'MED-00262',
    name = 'DOLFENAL 500mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.97,
    cost = 12.93,
    reorder_level = 20,
    expiry_date = DATE '2028-08-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00264';
UPDATE products
SET sku = 'MED-00263',
    name = 'DOLO-NEUROBION Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.14,
    cost = 9.24,
    reorder_level = 20,
    expiry_date = DATE '2029-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00265';
UPDATE products
SET sku = 'NPH-00249',
    name = 'DOVE Cond.Sach-Hair Fall Rescue',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.36,
    cost = 26.39,
    reorder_level = 20,
    expiry_date = DATE '2028-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00266';
UPDATE products
SET sku = 'NPH-00250',
    name = 'DOVE Cond.Sach-Intense Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.23,
    cost = 42.29,
    reorder_level = 20,
    expiry_date = DATE '2027-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00267';
UPDATE products
SET sku = 'NPH-00251',
    name = 'DOVE Cond.Sach-IntenseRepair(11+1)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.26,
    cost = 39.42,
    reorder_level = 20,
    expiry_date = DATE '2027-12-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00268';
UPDATE products
SET sku = 'NPH-00252',
    name = 'DOVE Cond.Sach-Nourshng Oil Care',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.31,
    cost = 47.77,
    reorder_level = 20,
    expiry_date = DATE '2027-12-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00269';
UPDATE products
SET sku = 'NPH-00253',
    name = 'DOVE Cond.Sach-Straight & Silky',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.41,
    cost = 48.28,
    reorder_level = 20,
    expiry_date = DATE '2028-06-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00270';
UPDATE products
SET sku = 'NPH-00254',
    name = 'DOVE Cond.Sach-Straight Silky (11+1)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.24,
    cost = 40.83,
    reorder_level = 20,
    expiry_date = DATE '2028-02-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00271';
UPDATE products
SET sku = 'NPH-00255',
    name = 'DOVE Cream Bar  50g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.78,
    cost = 48.92,
    reorder_level = 20,
    expiry_date = DATE '2027-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00272';
UPDATE products
SET sku = 'NPH-00256',
    name = 'DOVE Cream Bar  75g (Rich Moisture)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.76,
    cost = 39.10,
    reorder_level = 20,
    expiry_date = DATE '2027-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00273';
UPDATE products
SET sku = 'NPH-00257',
    name = 'DOVE Cream Bar  75g (Sensitive)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.68,
    cost = 24.83,
    reorder_level = 20,
    expiry_date = DATE '2027-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00274';
UPDATE products
SET sku = 'NPH-00258',
    name = 'DOVE Cream Bar 100g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.07,
    cost = 34.14,
    reorder_level = 20,
    expiry_date = DATE '2027-06-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00275';
UPDATE products
SET sku = 'NPH-00259',
    name = 'DOVE Cream Bar 100g (Sensitive )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.58,
    cost = 41.69,
    reorder_level = 20,
    expiry_date = DATE '2030-10-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00276';
UPDATE products
SET sku = 'NPH-00260',
    name = 'DOVE Cream Bar 100g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.08,
    cost = 30.15,
    reorder_level = 20,
    expiry_date = DATE '2028-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00277';
UPDATE products
SET sku = 'NPH-00261',
    name = 'DOVE Cream Bar 135g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.42,
    cost = 19.13,
    reorder_level = 20,
    expiry_date = DATE '2029-03-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00278';
UPDATE products
SET sku = 'NPH-00262',
    name = 'DOVE Cream Bar 135g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.93,
    cost = 35.14,
    reorder_level = 20,
    expiry_date = DATE '2027-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00279';
UPDATE products
SET sku = 'NPH-00263',
    name = 'DOVE Roll-on (Cucumber)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.33,
    cost = 43.14,
    reorder_level = 20,
    expiry_date = DATE '2029-12-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00280';
UPDATE products
SET sku = 'NPH-00264',
    name = 'DOVE Roll-on (Fresh Touch)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.25,
    cost = 47.99,
    reorder_level = 20,
    expiry_date = DATE '2030-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00281';
UPDATE products
SET sku = 'NPH-00265',
    name = 'DOVE Roll-on (Original)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.05,
    cost = 45.24,
    reorder_level = 20,
    expiry_date = DATE '2027-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00282';
UPDATE products
SET sku = 'NPH-00266',
    name = 'DOVE Roll-on (Original) 25mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.83,
    cost = 28.20,
    reorder_level = 20,
    expiry_date = DATE '2028-05-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00283';
UPDATE products
SET sku = 'NPH-00267',
    name = 'DOVE Sham.170mL Intense Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 74.23,
    cost = 59.97,
    reorder_level = 20,
    expiry_date = DATE '2027-12-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00284';
UPDATE products
SET sku = 'NPH-00268',
    name = 'DOVE Sham.Sach-Hair Fall Rescue',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.46,
    cost = 35.92,
    reorder_level = 20,
    expiry_date = DATE '2030-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00285';
UPDATE products
SET sku = 'NPH-00269',
    name = 'DOVE Sham.Sach-Intense Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.43,
    cost = 30.85,
    reorder_level = 20,
    expiry_date = DATE '2027-11-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00286';
UPDATE products
SET sku = 'NPH-00270',
    name = 'DOVE Sham.Sach-Intense Repair 11+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.68,
    cost = 45.27,
    reorder_level = 20,
    expiry_date = DATE '2030-10-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00287';
UPDATE products
SET sku = 'NPH-00271',
    name = 'DOVE Sham.Sach-Nourshng Oil Care',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.83,
    cost = 39.84,
    reorder_level = 20,
    expiry_date = DATE '2030-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00288';
UPDATE products
SET sku = 'NPH-00272',
    name = 'DOVE Sham.Sach-Straight & Silky',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.03,
    cost = 23.46,
    reorder_level = 20,
    expiry_date = DATE '2030-07-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00289';
UPDATE products
SET sku = 'NPH-00273',
    name = 'DOVE Sham.Sach-Straight & Silky 11+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.10,
    cost = 41.52,
    reorder_level = 20,
    expiry_date = DATE '2027-05-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00290';
UPDATE products
SET sku = 'MED-00264',
    name = 'DOXYCYCLINE Capsule (Dyna)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.70,
    cost = 15.82,
    reorder_level = 20,
    expiry_date = DATE '2029-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00291';
UPDATE products
SET sku = 'NPH-00274',
    name = 'DR. KAUFMANN IR Soap 80g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.30,
    cost = 50.25,
    reorder_level = 20,
    expiry_date = DATE '2028-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00292';
UPDATE products
SET sku = 'NPH-00275',
    name = 'DR. KAUFMANN Soap (XPS) 80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.60,
    cost = 27.45,
    reorder_level = 20,
    expiry_date = DATE '2028-11-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00293';
UPDATE products
SET sku = 'NPH-00276',
    name = 'DR. KAUFMANN Soap (YELLOW) 80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.03,
    cost = 24.56,
    reorder_level = 20,
    expiry_date = DATE '2028-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00294';
UPDATE products
SET sku = 'NPH-00277',
    name = 'DR. P Adult Diaper (Basic Large 2''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 73.20,
    cost = 57.58,
    reorder_level = 20,
    expiry_date = DATE '2027-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00295';
UPDATE products
SET sku = 'NPH-00278',
    name = 'DR. P Adult Diaper (Basic Large 8''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 36.04,
    cost = 28.20,
    reorder_level = 20,
    expiry_date = DATE '2027-04-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00296';
UPDATE products
SET sku = 'NPH-00279',
    name = 'DR. P Adult Diaper (Basic Medium  2''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 51.47,
    cost = 41.68,
    reorder_level = 20,
    expiry_date = DATE '2029-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00297';
UPDATE products
SET sku = 'NPH-00280',
    name = 'DR. P Adult Diaper (Basic Medium 10''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 102.47,
    cost = 77.64,
    reorder_level = 20,
    expiry_date = DATE '2029-08-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00298';
UPDATE products
SET sku = 'NPH-00281',
    name = 'DR. P Adult Diaper (Standard Large 13''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 52.47,
    cost = 43.28,
    reorder_level = 20,
    expiry_date = DATE '2027-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00299';
UPDATE products
SET sku = 'NPH-00282',
    name = 'DR. P Adult Diaper (Standard Med. 16''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 44.86,
    cost = 35.22,
    reorder_level = 20,
    expiry_date = DATE '2029-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00300';
UPDATE products
SET sku = 'NPH-00283',
    name = 'DR. P Adult Diaper (Standard Medium  2''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 34.00,
    cost = 27.71,
    reorder_level = 20,
    expiry_date = DATE '2029-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00301';
UPDATE products
SET sku = 'NPH-00284',
    name = 'DR.WONG''S w/ Moisturizer  80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.94,
    cost = 29.70,
    reorder_level = 20,
    expiry_date = DATE '2028-12-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00302';
UPDATE products
SET sku = 'NPH-00285',
    name = 'DR.WONG''S w/ Moisturizer 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.20,
    cost = 19.57,
    reorder_level = 20,
    expiry_date = DATE '2029-02-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00303';
UPDATE products
SET sku = 'NPH-00286',
    name = 'DR.WONG''S Yellow  80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.35,
    cost = 31.78,
    reorder_level = 20,
    expiry_date = DATE '2029-02-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00304';
UPDATE products
SET sku = 'NPH-00287',
    name = 'DR.WONG''S Yellow 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.42,
    cost = 29.12,
    reorder_level = 20,
    expiry_date = DATE '2030-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00305';
UPDATE products
SET sku = 'NPH-00288',
    name = 'DR.WONG''S Yellow 135g-w/soapcase',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.01,
    cost = 37.42,
    reorder_level = 20,
    expiry_date = DATE '2029-02-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00306';
UPDATE products
SET sku = 'NPH-00289',
    name = 'DRAGON BALM 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 24.28,
    cost = 19.95,
    reorder_level = 20,
    expiry_date = DATE '2030-08-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00307';
UPDATE products
SET sku = 'MED-00265',
    name = 'DRAPOLENE Cream 55g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 24.16,
    cost = 19.61,
    reorder_level = 20,
    expiry_date = DATE '2029-05-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00308';
UPDATE products
SET sku = 'MED-00266',
    name = 'DRENEX 0.75mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.62,
    cost = 14.69,
    reorder_level = 20,
    expiry_date = DATE '2029-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00309';
UPDATE products
SET sku = 'MED-00267',
    name = 'DRENEX 3mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.10,
    cost = 16.85,
    reorder_level = 20,
    expiry_date = DATE '2030-01-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00310';
UPDATE products
SET sku = 'MED-00268',
    name = 'DRIVEMAX Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.87,
    cost = 16.09,
    reorder_level = 20,
    expiry_date = DATE '2029-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00311';
UPDATE products
SET sku = 'MED-00269',
    name = 'DRIVEMAX Coffee Mix 15''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.93,
    cost = 37.36,
    reorder_level = 20,
    expiry_date = DATE '2028-05-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00312';
UPDATE products
SET sku = 'MED-00270',
    name = 'DRIXINE Nasal Drops 10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.34,
    cost = 29.18,
    reorder_level = 20,
    expiry_date = DATE '2027-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00313';
UPDATE products
SET sku = 'MED-00271',
    name = 'DRIXINE Nasal Spray 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 35.40,
    cost = 29.47,
    reorder_level = 20,
    expiry_date = DATE '2028-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00314';
UPDATE products
SET sku = 'MED-00272',
    name = 'DUAVENT PulmoNeb 500mcg 5''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 24.35,
    cost = 20.05,
    reorder_level = 20,
    expiry_date = DATE '2027-07-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00315';
UPDATE products
SET sku = 'MED-00273',
    name = 'DULCOLAX Sulit Pack Tablet 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 74.44,
    cost = 58.63,
    reorder_level = 20,
    expiry_date = DATE '2029-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00316';
UPDATE products
SET sku = 'MED-00274',
    name = 'DULCOLAX Suppository (Adult)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.84,
    cost = 27.95,
    reorder_level = 20,
    expiry_date = DATE '2027-08-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00317';
UPDATE products
SET sku = 'MED-00275',
    name = 'DULCOLAX Suppository (Pedia)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.51,
    cost = 10.93,
    reorder_level = 20,
    expiry_date = DATE '2028-10-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00318';
UPDATE products
SET sku = 'MED-00276',
    name = 'DUOMAX Tablet 4''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.60,
    cost = 38.29,
    reorder_level = 20,
    expiry_date = DATE '2030-04-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00319';
UPDATE products
SET sku = 'MED-00277',
    name = 'DUPHALAC Syrup  45mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.20,
    cost = 17.71,
    reorder_level = 20,
    expiry_date = DATE '2030-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00320';
UPDATE products
SET sku = 'MED-00278',
    name = 'DUPHALAC Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 60.62,
    cost = 47.60,
    reorder_level = 20,
    expiry_date = DATE '2027-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00321';
UPDATE products
SET sku = 'MED-00279',
    name = 'DUPHASTON Tablet 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.52,
    cost = 10.61,
    reorder_level = 20,
    expiry_date = DATE '2027-04-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00322';
UPDATE products
SET sku = 'MED-00280',
    name = 'DUVADILAN Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 4.90,
    cost = 4.07,
    reorder_level = 20,
    expiry_date = DATE '2029-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00323';
UPDATE products
SET sku = 'MED-00281',
    name = 'DYNATUSSIN Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.63,
    cost = 17.19,
    reorder_level = 20,
    expiry_date = DATE '2030-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00324';
UPDATE products
SET sku = 'MED-00282',
    name = 'DYNATUSSIN Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.12,
    cost = 33.75,
    reorder_level = 20,
    expiry_date = DATE '2030-04-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00325';
UPDATE products
SET sku = 'MED-00283',
    name = 'DYNATUSSIN Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 88.91,
    cost = 69.27,
    reorder_level = 20,
    expiry_date = DATE '2027-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00326';
UPDATE products
SET sku = 'NPH-00290',
    name = 'EFFICASCENT Oil  25mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.92,
    cost = 18.56,
    reorder_level = 20,
    expiry_date = DATE '2027-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00327';
UPDATE products
SET sku = 'NPH-00291',
    name = 'EFFICASCENT Oil  25mL (Extra Strength)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.86,
    cost = 22.24,
    reorder_level = 20,
    expiry_date = DATE '2030-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00328';
UPDATE products
SET sku = 'NPH-00292',
    name = 'EFFICASCENT Oil  25mL (Extreme)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.89,
    cost = 34.38,
    reorder_level = 20,
    expiry_date = DATE '2030-03-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00329';
UPDATE products
SET sku = 'NPH-00293',
    name = 'EFFICASCENT Oil  50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.64,
    cost = 54.98,
    reorder_level = 20,
    expiry_date = DATE '2027-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00330';
UPDATE products
SET sku = 'NPH-00294',
    name = 'EFFICASCENT Oil  50mL (Extra Strength)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.41,
    cost = 22.79,
    reorder_level = 20,
    expiry_date = DATE '2030-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00331';
UPDATE products
SET sku = 'NPH-00295',
    name = 'EFFICASCENT Oil  50mL (Extreme)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.87,
    cost = 23.07,
    reorder_level = 20,
    expiry_date = DATE '2027-11-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00332';
UPDATE products
SET sku = 'NPH-00296',
    name = 'EFFICASCENT Oil 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.63,
    cost = 42.97,
    reorder_level = 20,
    expiry_date = DATE '2028-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00333';
UPDATE products
SET sku = 'NPH-00297',
    name = 'EFFICASCENT Oil 100mL (Extra Strength)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 111.97,
    cost = 85.78,
    reorder_level = 20,
    expiry_date = DATE '2027-03-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00334';
UPDATE products
SET sku = 'NPH-00298',
    name = 'EFFICASCENT Ointment  10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.50,
    cost = 26.62,
    reorder_level = 20,
    expiry_date = DATE '2027-10-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00335';
UPDATE products
SET sku = 'NPH-00299',
    name = 'EFFICASCENT Ointment  5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.99,
    cost = 25.38,
    reorder_level = 20,
    expiry_date = DATE '2030-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00336';
UPDATE products
SET sku = 'NPH-00300',
    name = 'EFFICASCENT Relaxing Oil 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.17,
    cost = 39.25,
    reorder_level = 20,
    expiry_date = DATE '2027-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00337';
UPDATE products
SET sku = 'NPH-00301',
    name = 'EFFICASCENT Relaxing Oil 6mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.06,
    cost = 51.11,
    reorder_level = 20,
    expiry_date = DATE '2028-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00338';
UPDATE products
SET sku = 'MED-00284',
    name = 'ELICA Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.43,
    cost = 29.61,
    reorder_level = 20,
    expiry_date = DATE '2028-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00339';
UPDATE products
SET sku = 'MED-00285',
    name = 'ELICA Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.66,
    cost = 25.47,
    reorder_level = 20,
    expiry_date = DATE '2028-10-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00340';
UPDATE products
SET sku = 'MED-00286',
    name = 'ENERVON Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 38.41,
    cost = 31.24,
    reorder_level = 20,
    expiry_date = DATE '2028-11-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00341';
UPDATE products
SET sku = 'MED-00287',
    name = 'ENERVON Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 70.14,
    cost = 57.01,
    reorder_level = 20,
    expiry_date = DATE '2028-05-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00342';
UPDATE products
SET sku = 'MED-00288',
    name = 'ENERVON Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 140.09,
    cost = 111.98,
    reorder_level = 20,
    expiry_date = DATE '2029-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00343';
UPDATE products
SET sku = 'MED-00289',
    name = 'ENERVON Syrup 500mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 160.24,
    cost = 125.07,
    reorder_level = 20,
    expiry_date = DATE '2030-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00344';
UPDATE products
SET sku = 'MED-00290',
    name = 'ENERVON-C Tablet (Flex)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 17.73,
    cost = 13.90,
    reorder_level = 20,
    expiry_date = DATE '2030-07-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00345';
UPDATE products
SET sku = 'MED-00291',
    name = 'ENERVON-C Tablet 30''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Essential nutritional multivitamin / Vitamin C supplement for immunity and vitality.',
    quantity = 100,
    price = 237.92,
    cost = 188.80,
    reorder_level = 20,
    expiry_date = DATE '2029-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00346';
UPDATE products
SET sku = 'NPH-00302',
    name = 'EQ Diapers Dry ( Large  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 75.68,
    cost = 57.69,
    reorder_level = 20,
    expiry_date = DATE '2029-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00347';
UPDATE products
SET sku = 'NPH-00303',
    name = 'EQ Diapers Dry ( Large 16''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 34.18,
    cost = 26.41,
    reorder_level = 20,
    expiry_date = DATE '2028-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00348';
UPDATE products
SET sku = 'NPH-00304',
    name = 'EQ Diapers Dry ( Large 32''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 367.09,
    cost = 290.03,
    reorder_level = 20,
    expiry_date = DATE '2028-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00349';
UPDATE products
SET sku = 'NPH-00305',
    name = 'EQ Diapers Dry ( Large 48''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 35.64,
    cost = 28.84,
    reorder_level = 20,
    expiry_date = DATE '2029-08-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00350';
UPDATE products
SET sku = 'NPH-00306',
    name = 'EQ Diapers Dry ( Large 72''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 54.72,
    cost = 42.43,
    reorder_level = 20,
    expiry_date = DATE '2028-10-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00351';
UPDATE products
SET sku = 'NPH-00307',
    name = 'EQ Diapers Dry ( Medium  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 34.36,
    cost = 27.95,
    reorder_level = 20,
    expiry_date = DATE '2029-09-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00352';
UPDATE products
SET sku = 'NPH-00308',
    name = 'EQ Diapers Dry ( Medium 18''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 51.05,
    cost = 42.51,
    reorder_level = 20,
    expiry_date = DATE '2027-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00353';
UPDATE products
SET sku = 'NPH-00309',
    name = 'EQ Diapers Dry ( Medium 36''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 435.02,
    cost = 336.20,
    reorder_level = 20,
    expiry_date = DATE '2030-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00354';
UPDATE products
SET sku = 'NPH-00310',
    name = 'EQ Diapers Dry ( Medium 54''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 34.26,
    cost = 28.16,
    reorder_level = 20,
    expiry_date = DATE '2027-11-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00355';
UPDATE products
SET sku = 'NPH-00311',
    name = 'EQ Diapers Dry ( New Born  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 50.73,
    cost = 41.93,
    reorder_level = 20,
    expiry_date = DATE '2030-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00356';
UPDATE products
SET sku = 'NPH-00312',
    name = 'EQ Diapers Dry ( New Born 22''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 70.05,
    cost = 57.93,
    reorder_level = 20,
    expiry_date = DATE '2028-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00357';
UPDATE products
SET sku = 'NPH-00313',
    name = 'EQ Diapers Dry ( Small  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 49.16,
    cost = 38.84,
    reorder_level = 20,
    expiry_date = DATE '2029-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00358';
UPDATE products
SET sku = 'NPH-00314',
    name = 'EQ Diapers Dry ( Small 20''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 39.23,
    cost = 31.76,
    reorder_level = 20,
    expiry_date = DATE '2029-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00359';
UPDATE products
SET sku = 'NPH-00315',
    name = 'EQ Diapers Dry ( Small 40''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 310.36,
    cost = 246.53,
    reorder_level = 20,
    expiry_date = DATE '2027-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00360';
UPDATE products
SET sku = 'NPH-00316',
    name = 'EQ Diapers Dry ( Small 60''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 67.06,
    cost = 54.05,
    reorder_level = 20,
    expiry_date = DATE '2027-01-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00361';
UPDATE products
SET sku = 'NPH-00317',
    name = 'EQ Diapers Dry ( X-Large  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 44.96,
    cost = 34.33,
    reorder_level = 20,
    expiry_date = DATE '2028-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00362';
UPDATE products
SET sku = 'NPH-00318',
    name = 'EQ Diapers Dry ( X-Large 14''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 49.52,
    cost = 39.04,
    reorder_level = 20,
    expiry_date = DATE '2029-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00363';
UPDATE products
SET sku = 'NPH-00319',
    name = 'EQ Diapers Dry ( X-Large 28''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 28.56,
    cost = 23.02,
    reorder_level = 20,
    expiry_date = DATE '2028-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00364';
UPDATE products
SET sku = 'NPH-00320',
    name = 'EQ Diapers Dry ( X-Large 42''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 48.42,
    cost = 36.90,
    reorder_level = 20,
    expiry_date = DATE '2027-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00365';
UPDATE products
SET sku = 'NPH-00321',
    name = 'EQ Diapers Dry ( XX-Large  3''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 44.57,
    cost = 36.48,
    reorder_level = 20,
    expiry_date = DATE '2030-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00366';
UPDATE products
SET sku = 'NPH-00322',
    name = 'EQ Diapers Dry ( XX-Large 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 130.95,
    cost = 102.40,
    reorder_level = 20,
    expiry_date = DATE '2028-07-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00367';
UPDATE products
SET sku = 'NPH-00323',
    name = 'EQ Diapers Dry ( XX-Large 24''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 311.20,
    cost = 242.06,
    reorder_level = 20,
    expiry_date = DATE '2028-08-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00368';
UPDATE products
SET sku = 'NPH-00324',
    name = 'EQ Diapers Dry (XX-Large 36''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 261.40,
    cost = 208.06,
    reorder_level = 20,
    expiry_date = DATE '2027-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00369';
UPDATE products
SET sku = 'NPH-00325',
    name = 'EQ Diapers Plus ( Large  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 37.76,
    cost = 30.12,
    reorder_level = 20,
    expiry_date = DATE '2029-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00370';
UPDATE products
SET sku = 'NPH-00326',
    name = 'EQ Diapers Plus ( Large 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 114.00,
    cost = 91.90,
    reorder_level = 20,
    expiry_date = DATE '2027-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00371';
UPDATE products
SET sku = 'NPH-00327',
    name = 'EQ Diapers Plus ( Large 28''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 60.50,
    cost = 47.16,
    reorder_level = 20,
    expiry_date = DATE '2028-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00372';
UPDATE products
SET sku = 'NPH-00328',
    name = 'EQ Diapers Plus ( Medium  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 49.12,
    cost = 37.76,
    reorder_level = 20,
    expiry_date = DATE '2030-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00373';
UPDATE products
SET sku = 'NPH-00329',
    name = 'EQ Diapers Plus ( Medium 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 129.06,
    cost = 102.98,
    reorder_level = 20,
    expiry_date = DATE '2029-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00374';
UPDATE products
SET sku = 'NPH-00330',
    name = 'EQ Diapers Plus ( Medium 32''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 344.22,
    cost = 271.59,
    reorder_level = 20,
    expiry_date = DATE '2029-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00375';
UPDATE products
SET sku = 'NPH-00331',
    name = 'EQ Diapers Plus ( Small  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 67.67,
    cost = 55.75,
    reorder_level = 20,
    expiry_date = DATE '2029-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00376';
UPDATE products
SET sku = 'NPH-00332',
    name = 'EQ Diapers Plus ( Small 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 92.62,
    cost = 73.68,
    reorder_level = 20,
    expiry_date = DATE '2028-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00377';
UPDATE products
SET sku = 'NPH-00333',
    name = 'EQ Diapers Plus ( Small 36''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 237.33,
    cost = 192.25,
    reorder_level = 20,
    expiry_date = DATE '2027-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00378';
UPDATE products
SET sku = 'NPH-00334',
    name = 'EQ Diapers Plus ( X-Large  4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 52.95,
    cost = 41.10,
    reorder_level = 20,
    expiry_date = DATE '2029-07-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00379';
UPDATE products
SET sku = 'NPH-00335',
    name = 'EQ Diapers Plus ( X-Large 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 110.91,
    cost = 90.20,
    reorder_level = 20,
    expiry_date = DATE '2028-12-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00380';
UPDATE products
SET sku = 'NPH-00336',
    name = 'EQ Diapers Plus ( X-Large 24''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 333.83,
    cost = 273.01,
    reorder_level = 20,
    expiry_date = DATE '2027-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00381';
UPDATE products
SET sku = 'NPH-00337',
    name = 'EQ Diapers Plus ( XX-Large 12''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 131.91,
    cost = 100.70,
    reorder_level = 20,
    expiry_date = DATE '2027-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00382';
UPDATE products
SET sku = 'NPH-00338',
    name = 'EQ Diapers Plus ( XX-Large 20''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 62.49,
    cost = 47.92,
    reorder_level = 20,
    expiry_date = DATE '2029-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00383';
UPDATE products
SET sku = 'NPH-00339',
    name = 'EQ Pants ( Large 10''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 133.18,
    cost = 106.86,
    reorder_level = 20,
    expiry_date = DATE '2027-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00384';
UPDATE products
SET sku = 'NPH-00340',
    name = 'EQ Pants ( Large 4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 51.55,
    cost = 41.61,
    reorder_level = 20,
    expiry_date = DATE '2028-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00385';
UPDATE products
SET sku = 'NPH-00341',
    name = 'EQ Pants ( Medium 4''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 31.77,
    cost = 25.72,
    reorder_level = 20,
    expiry_date = DATE '2029-08-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00386';
UPDATE products
SET sku = 'NPH-00342',
    name = 'EQ Pants ( X-Large 10''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 103.65,
    cost = 85.82,
    reorder_level = 20,
    expiry_date = DATE '2029-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00387';
UPDATE products
SET sku = 'NPH-00343',
    name = 'EQ Pants ( XX-Large 10''s )',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 84.44,
    cost = 69.25,
    reorder_level = 20,
    expiry_date = DATE '2028-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00388';
UPDATE products
SET sku = 'MED-00292',
    name = 'ERCEFLORA Oral Suspension 5mL 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 98.46,
    cost = 78.94,
    reorder_level = 20,
    expiry_date = DATE '2027-02-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00389';
UPDATE products
SET sku = 'MED-00293',
    name = 'ERYTHROCIN Tablet 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.66,
    cost = 11.26,
    reorder_level = 20,
    expiry_date = DATE '2030-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00390';
UPDATE products
SET sku = 'MED-00294',
    name = 'ERYTHROMYCIN 200mg Susp. 60mL (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.18,
    cost = 30.31,
    reorder_level = 20,
    expiry_date = DATE '2030-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00391';
UPDATE products
SET sku = 'MED-00295',
    name = 'ERYTHROMYCIN 500mg Tablet (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.56,
    cost = 16.67,
    reorder_level = 20,
    expiry_date = DATE '2027-10-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00392';
UPDATE products
SET sku = 'NPH-00344',
    name = 'ESKINOL F/C C/White w/Grains  75mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 49.87,
    cost = 39.58,
    reorder_level = 20,
    expiry_date = DATE '2030-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00393';
UPDATE products
SET sku = 'NPH-00345',
    name = 'ESKINOL F/C C/White w/Grains 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 28.47,
    cost = 22.20,
    reorder_level = 20,
    expiry_date = DATE '2028-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00394';
UPDATE products
SET sku = 'NPH-00346',
    name = 'ESKINOL F/C C/White w/Grains 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 29.67,
    cost = 22.59,
    reorder_level = 20,
    expiry_date = DATE '2027-08-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00395';
UPDATE products
SET sku = 'NPH-00347',
    name = 'ESKINOL F/C Classic White  75mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 36.86,
    cost = 28.22,
    reorder_level = 20,
    expiry_date = DATE '2028-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00396';
UPDATE products
SET sku = 'NPH-00348',
    name = 'ESKINOL F/C Classic White 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 60.48,
    cost = 48.29,
    reorder_level = 20,
    expiry_date = DATE '2030-03-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00397';
UPDATE products
SET sku = 'NPH-00349',
    name = 'ESKINOL F/C Classic White 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 40.20,
    cost = 31.33,
    reorder_level = 20,
    expiry_date = DATE '2027-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00398';
UPDATE products
SET sku = 'NPH-00350',
    name = 'ESKINOL F/C Forteens  75mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 54.78,
    cost = 43.88,
    reorder_level = 20,
    expiry_date = DATE '2028-10-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00399';
UPDATE products
SET sku = 'NPH-00351',
    name = 'ESKINOL F/C Forteens 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 24.83,
    cost = 20.18,
    reorder_level = 20,
    expiry_date = DATE '2029-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00400';
UPDATE products
SET sku = 'NPH-00352',
    name = 'ESKINOL F/C Forteens 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 37.34,
    cost = 30.66,
    reorder_level = 20,
    expiry_date = DATE '2028-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00401';
UPDATE products
SET sku = 'NPH-00353',
    name = 'ESKINOL F/C IcePore Minimizing  75mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 58.83,
    cost = 47.99,
    reorder_level = 20,
    expiry_date = DATE '2029-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00402';
UPDATE products
SET sku = 'NPH-00354',
    name = 'ESKINOL F/C IcePore Minimizing 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 59.98,
    cost = 46.53,
    reorder_level = 20,
    expiry_date = DATE '2027-03-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00403';
UPDATE products
SET sku = 'NPH-00355',
    name = 'ESKINOL F/C IcePore Minimizing 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 42.21,
    cost = 32.57,
    reorder_level = 20,
    expiry_date = DATE '2030-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00404';
UPDATE products
SET sku = 'NPH-00356',
    name = 'ESKINOL F/C Oil Control  75mL-Lem.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 57.48,
    cost = 45.80,
    reorder_level = 20,
    expiry_date = DATE '2027-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00405';
UPDATE products
SET sku = 'NPH-00357',
    name = 'ESKINOL F/C Oil Control 135mL-Lem.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 25.79,
    cost = 20.32,
    reorder_level = 20,
    expiry_date = DATE '2030-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00406';
UPDATE products
SET sku = 'NPH-00358',
    name = 'ESKINOL F/C Oil Control 225mL-Lem.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 28.46,
    cost = 22.47,
    reorder_level = 20,
    expiry_date = DATE '2027-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00407';
UPDATE products
SET sku = 'NPH-00359',
    name = 'ESKINOL F/C Papaya Smooth  75mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 67.08,
    cost = 51.92,
    reorder_level = 20,
    expiry_date = DATE '2027-04-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00408';
UPDATE products
SET sku = 'NPH-00360',
    name = 'ESKINOL F/C Papaya Smooth 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 48.04,
    cost = 39.28,
    reorder_level = 20,
    expiry_date = DATE '2030-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00409';
UPDATE products
SET sku = 'NPH-00361',
    name = 'ESKINOL F/C Papaya Smooth 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 33.00,
    cost = 25.62,
    reorder_level = 20,
    expiry_date = DATE '2028-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00410';
UPDATE products
SET sku = 'NPH-00362',
    name = 'ESKINOL F/C PimpleFighting  75mL-DC',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 55.46,
    cost = 42.30,
    reorder_level = 20,
    expiry_date = DATE '2029-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00411';
UPDATE products
SET sku = 'NPH-00363',
    name = 'ESKINOL F/C PimpleFighting 135mL-DC',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 52.48,
    cost = 40.00,
    reorder_level = 20,
    expiry_date = DATE '2030-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00412';
UPDATE products
SET sku = 'NPH-00364',
    name = 'ESKINOL F/C PimpleFighting 225mL-DC',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 18.75,
    cost = 14.87,
    reorder_level = 20,
    expiry_date = DATE '2027-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00413';
UPDATE products
SET sku = 'NPH-00365',
    name = 'ESKINOL F/C Refreshng  75mL-Ccmbr',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 29.68,
    cost = 22.80,
    reorder_level = 20,
    expiry_date = DATE '2029-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00414';
UPDATE products
SET sku = 'NPH-00366',
    name = 'ESKINOL F/C Refreshng 135mL-Ccmbr',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 46.04,
    cost = 35.27,
    reorder_level = 20,
    expiry_date = DATE '2027-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00415';
UPDATE products
SET sku = 'NPH-00367',
    name = 'ESKINOL F/C Refreshng 225mL-Ccmbr',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 22.39,
    cost = 17.54,
    reorder_level = 20,
    expiry_date = DATE '2027-12-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00416';
UPDATE products
SET sku = 'NPH-00368',
    name = 'ESKINOL F/C SpotlessWhte  75mL-Cal',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 61.42,
    cost = 49.31,
    reorder_level = 20,
    expiry_date = DATE '2028-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00417';
UPDATE products
SET sku = 'NPH-00369',
    name = 'ESKINOL F/C SpotlessWhte 135mL-Cal',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 34.45,
    cost = 28.63,
    reorder_level = 20,
    expiry_date = DATE '2028-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00418';
UPDATE products
SET sku = 'NPH-00370',
    name = 'ESKINOL F/C SpotlessWhte 225mL-Cal',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 44.97,
    cost = 36.75,
    reorder_level = 20,
    expiry_date = DATE '2027-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00419';
UPDATE products
SET sku = 'NPH-00371',
    name = 'ESKINOL F/Scrub PapayaSmooth 6g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 54.38,
    cost = 43.09,
    reorder_level = 20,
    expiry_date = DATE '2027-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00420';
UPDATE products
SET sku = 'NPH-00372',
    name = 'ESKINOL F/Wash PimpleFighting 100g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 45.06,
    cost = 35.87,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00421';
UPDATE products
SET sku = 'MED-00296',
    name = 'ESSENTIALE Forte Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.97,
    cost = 7.34,
    reorder_level = 20,
    expiry_date = DATE '2028-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00422';
UPDATE products
SET sku = 'NPH-00373',
    name = 'EUCALYPTUS Oil  7.5mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 42.06,
    cost = 32.61,
    reorder_level = 20,
    expiry_date = DATE '2029-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00423';
UPDATE products
SET sku = 'MED-00297',
    name = 'EYE-MO 7.5mL (Moisturizing Formula)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.80,
    cost = 13.26,
    reorder_level = 20,
    expiry_date = DATE '2028-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00424';
UPDATE products
SET sku = 'MED-00298',
    name = 'EYE-MO 7.5mL (Red Eye Formula)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.78,
    cost = 18.93,
    reorder_level = 20,
    expiry_date = DATE '2029-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00425';
UPDATE products
SET sku = 'NPH-00374',
    name = 'EZ Lubricating Jelly',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 54.40,
    cost = 44.59,
    reorder_level = 20,
    expiry_date = DATE '2027-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00426';
UPDATE products
SET sku = 'NPH-00375',
    name = 'EZ Lubricating Jelly 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 362.96,
    cost = 278.74,
    reorder_level = 20,
    expiry_date = DATE '2028-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00427';
UPDATE products
SET sku = 'MED-00299',
    name = 'E-ZINC 55mg/5mL Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.45,
    cost = 24.65,
    reorder_level = 20,
    expiry_date = DATE '2030-05-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00428';
UPDATE products
SET sku = 'MED-00300',
    name = 'E-ZINC Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.69,
    cost = 41.49,
    reorder_level = 20,
    expiry_date = DATE '2028-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00429';
UPDATE products
SET sku = 'NPH-00376',
    name = 'FACE MASK Earloop-Medimax 50''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 317.29,
    cost = 240.97,
    reorder_level = 20,
    expiry_date = DATE '2030-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00430';
UPDATE products
SET sku = 'MED-00301',
    name = 'FAKTU Ointment 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 35.42,
    cost = 28.05,
    reorder_level = 20,
    expiry_date = DATE '2029-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00431';
UPDATE products
SET sku = 'MED-00302',
    name = 'FAKTU Suppository 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 82.77,
    cost = 65.37,
    reorder_level = 20,
    expiry_date = DATE '2028-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00432';
UPDATE products
SET sku = 'NPH-00377',
    name = 'FAMILY Rubbing Alcohol 36% 180mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 69.35,
    cost = 55.07,
    reorder_level = 20,
    expiry_date = DATE '2030-02-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00433';
UPDATE products
SET sku = 'NPH-00378',
    name = 'FAMILY Rubbing Alcohol 36% 473mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 59.45,
    cost = 45.11,
    reorder_level = 20,
    expiry_date = DATE '2029-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00434';
UPDATE products
SET sku = 'NPH-00379',
    name = 'FAMILY Rubbing Alcohol 40%  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 55.41,
    cost = 45.32,
    reorder_level = 20,
    expiry_date = DATE '2030-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00435';
UPDATE products
SET sku = 'NPH-00380',
    name = 'FAMILY Rubbing Alcohol 40% 180mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 43.05,
    cost = 35.70,
    reorder_level = 20,
    expiry_date = DATE '2027-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00436';
UPDATE products
SET sku = 'NPH-00381',
    name = 'FAMILY Rubbing Alcohol 40% 473mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 36.42,
    cost = 27.68,
    reorder_level = 20,
    expiry_date = DATE '2027-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00437';
UPDATE products
SET sku = 'NPH-00382',
    name = 'FAMILY Rubbing Alcohol 70%  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 44.09,
    cost = 36.16,
    reorder_level = 20,
    expiry_date = DATE '2027-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00438';
UPDATE products
SET sku = 'NPH-00383',
    name = 'FAMILY Rubbing Alcohol 70% 180mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 47.42,
    cost = 37.42,
    reorder_level = 20,
    expiry_date = DATE '2027-04-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00439';
UPDATE products
SET sku = 'NPH-00384',
    name = 'FAMILY Rubbing Alcohol 70% 473mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = '70% Antiseptic disinfectant rubbing alcohol with moisturizer for effective daily germ protection.',
    quantity = 100,
    price = 35.79,
    cost = 27.31,
    reorder_level = 20,
    expiry_date = DATE '2027-05-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00440';
UPDATE products
SET sku = 'MED-00303',
    name = 'FERLIN Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.35,
    cost = 40.96,
    reorder_level = 20,
    expiry_date = DATE '2027-05-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00441';
UPDATE products
SET sku = 'MED-00304',
    name = 'FERLIN Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 106.46,
    cost = 86.71,
    reorder_level = 20,
    expiry_date = DATE '2028-12-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00442';
UPDATE products
SET sku = 'MED-00305',
    name = 'FERSULFATE Tablet (UHP)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.02,
    cost = 14.40,
    reorder_level = 20,
    expiry_date = DATE '2029-04-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00443';
UPDATE products
SET sku = 'NPH-00385',
    name = 'FISSAN Powder  25g (Diaper Rash)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 22.58,
    cost = 18.52,
    reorder_level = 20,
    expiry_date = DATE '2028-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00444';
UPDATE products
SET sku = 'NPH-00386',
    name = 'FISSAN Powder  25g (Extra Cool)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.68,
    cost = 24.97,
    reorder_level = 20,
    expiry_date = DATE '2028-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00445';
UPDATE products
SET sku = 'NPH-00387',
    name = 'FISSAN Powder  25g (Foot Powder)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 18.70,
    cost = 15.42,
    reorder_level = 20,
    expiry_date = DATE '2029-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00446';
UPDATE products
SET sku = 'NPH-00388',
    name = 'FISSAN Powder  25g (Prickly Heat)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.73,
    cost = 27.78,
    reorder_level = 20,
    expiry_date = DATE '2028-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00447';
UPDATE products
SET sku = 'NPH-00389',
    name = 'FISSAN Powder  50g (Diaper Rash)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 70.58,
    cost = 55.28,
    reorder_level = 20,
    expiry_date = DATE '2029-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00448';
UPDATE products
SET sku = 'NPH-00390',
    name = 'FISSAN Powder  50g (Extra Cool)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.90,
    cost = 40.10,
    reorder_level = 20,
    expiry_date = DATE '2029-04-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00449';
UPDATE products
SET sku = 'NPH-00391',
    name = 'FISSAN Powder  50g (Foot Powder)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.53,
    cost = 25.37,
    reorder_level = 20,
    expiry_date = DATE '2027-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00450';
UPDATE products
SET sku = 'NPH-00392',
    name = 'FISSAN Powder  50g (Prickly Heat)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.50,
    cost = 46.97,
    reorder_level = 20,
    expiry_date = DATE '2028-09-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00451';
UPDATE products
SET sku = 'NPH-00393',
    name = 'FISSAN Powder 100g (Diaper Rash)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 27.00,
    cost = 21.68,
    reorder_level = 20,
    expiry_date = DATE '2029-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00452';
UPDATE products
SET sku = 'NPH-00394',
    name = 'FISSAN Powder 100g (Extra Cool)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.34,
    cost = 50.65,
    reorder_level = 20,
    expiry_date = DATE '2029-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00453';
UPDATE products
SET sku = 'NPH-00395',
    name = 'FISSAN Powder 100g (Foot Powder)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.29,
    cost = 50.38,
    reorder_level = 20,
    expiry_date = DATE '2027-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00454';
UPDATE products
SET sku = 'NPH-00396',
    name = 'FISSAN Powder 100g (Prickly Heat)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.46,
    cost = 43.02,
    reorder_level = 20,
    expiry_date = DATE '2029-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00455';
UPDATE products
SET sku = 'MED-00306',
    name = 'FITRUM Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.81,
    cost = 14.46,
    reorder_level = 20,
    expiry_date = DATE '2029-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00456';
UPDATE products
SET sku = 'NPH-00397',
    name = 'FIX HS Jar 25g Clay Doh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 19.60,
    cost = 15.00,
    reorder_level = 20,
    expiry_date = DATE '2027-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00457';
UPDATE products
SET sku = 'NPH-00398',
    name = 'FIX HS Jar 25g Clay Doh Lite',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.86,
    cost = 31.71,
    reorder_level = 20,
    expiry_date = DATE '2027-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00458';
UPDATE products
SET sku = 'NPH-00399',
    name = 'FIX HS Jar 25g Hairlastic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.73,
    cost = 16.53,
    reorder_level = 20,
    expiry_date = DATE '2029-11-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00459';
UPDATE products
SET sku = 'NPH-00400',
    name = 'FIX HS Jar 25g Rock & Rule',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.10,
    cost = 21.30,
    reorder_level = 20,
    expiry_date = DATE '2028-04-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00460';
UPDATE products
SET sku = 'NPH-00401',
    name = 'FIX HS Jar 25g Shape Shifter',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.75,
    cost = 39.51,
    reorder_level = 20,
    expiry_date = DATE '2027-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00461';
UPDATE products
SET sku = 'NPH-00402',
    name = 'FIX HS Jar 80g Clay Doh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.60,
    cost = 31.33,
    reorder_level = 20,
    expiry_date = DATE '2030-06-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00462';
UPDATE products
SET sku = 'NPH-00403',
    name = 'FIX HS Jar 80g Clay Doh Lite',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.20,
    cost = 41.59,
    reorder_level = 20,
    expiry_date = DATE '2027-11-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00463';
UPDATE products
SET sku = 'NPH-00404',
    name = 'FIX HS Sachet Clay Doh 4g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 7.86,
    cost = 6.55,
    reorder_level = 20,
    expiry_date = DATE '2029-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00464';
UPDATE products
SET sku = 'NPH-00405',
    name = 'FIX HS Sachet Shape Shifter 4g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.59,
    cost = 9.13,
    reorder_level = 20,
    expiry_date = DATE '2030-05-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00465';
UPDATE products
SET sku = 'MED-00307',
    name = 'FIXCOM 3 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.10,
    cost = 7.06,
    reorder_level = 20,
    expiry_date = DATE '2030-09-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00466';
UPDATE products
SET sku = 'MED-00308',
    name = 'FIXCOM 4 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.85,
    cost = 12.95,
    reorder_level = 20,
    expiry_date = DATE '2028-12-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00467';
UPDATE products
SET sku = 'MED-00309',
    name = 'FLAGYL Forte Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.39,
    cost = 4.16,
    reorder_level = 20,
    expiry_date = DATE '2027-01-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00468';
UPDATE products
SET sku = 'MED-00310',
    name = 'FLAGYL Suspension 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.56,
    cost = 33.39,
    reorder_level = 20,
    expiry_date = DATE '2030-11-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00469';
UPDATE products
SET sku = 'MED-00311',
    name = 'FLAGYSTATINE Suppository 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 81.87,
    cost = 67.31,
    reorder_level = 20,
    expiry_date = DATE '2028-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00470';
UPDATE products
SET sku = 'MED-00312',
    name = 'FLAMMAZINE Cream 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.73,
    cost = 35.13,
    reorder_level = 20,
    expiry_date = DATE '2030-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00471';
UPDATE products
SET sku = 'MED-00313',
    name = 'FLAMMAZINE Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 25.76,
    cost = 20.88,
    reorder_level = 20,
    expiry_date = DATE '2029-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00472';
UPDATE products
SET sku = 'MED-00314',
    name = 'FLANAX Tablet 275mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.10,
    cost = 14.55,
    reorder_level = 20,
    expiry_date = DATE '2027-06-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00473';
UPDATE products
SET sku = 'MED-00315',
    name = 'FLANAX Tablet 550mg Forte',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.99,
    cost = 5.79,
    reorder_level = 20,
    expiry_date = DATE '2030-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00474';
UPDATE products
SET sku = 'MED-00316',
    name = 'FLUIMUCIL 100mg Powder',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 45.02,
    cost = 34.12,
    reorder_level = 20,
    expiry_date = DATE '2028-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00475';
UPDATE products
SET sku = 'MED-00317',
    name = 'FLUIMUCIL 200mg Powder',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 54.04,
    cost = 43.88,
    reorder_level = 20,
    expiry_date = DATE '2027-10-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00476';
UPDATE products
SET sku = 'MED-00318',
    name = 'FLUIMUCIL 600mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 7.01,
    cost = 5.62,
    reorder_level = 20,
    expiry_date = DATE '2030-04-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00477';
UPDATE products
SET sku = 'MED-00319',
    name = 'FOLART 5mg Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.78,
    cost = 17.29,
    reorder_level = 20,
    expiry_date = DATE '2030-04-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00478';
UPDATE products
SET sku = 'MED-00320',
    name = 'FORTIFER-FA Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.37,
    cost = 6.10,
    reorder_level = 20,
    expiry_date = DATE '2028-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00479';
UPDATE products
SET sku = 'NPH-00406',
    name = 'FUN G. Antibacterial Soap 75g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.81,
    cost = 51.12,
    reorder_level = 20,
    expiry_date = DATE '2027-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00480';
UPDATE products
SET sku = 'MED-00321',
    name = 'FUNGISOL Solution 4mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 30.89,
    cost = 25.45,
    reorder_level = 20,
    expiry_date = DATE '2030-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00481';
UPDATE products
SET sku = 'NPH-00407',
    name = 'GATORADE  500mL-Blue Bolt 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 222.31,
    cost = 183.80,
    reorder_level = 20,
    expiry_date = DATE '2029-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00482';
UPDATE products
SET sku = 'NPH-00408',
    name = 'GATORADE  500mL-Grape 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 365.48,
    cost = 285.93,
    reorder_level = 20,
    expiry_date = DATE '2030-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00483';
UPDATE products
SET sku = 'NPH-00409',
    name = 'GATORADE  500mL-Lemon Lime 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 421.51,
    cost = 323.11,
    reorder_level = 20,
    expiry_date = DATE '2029-10-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00484';
UPDATE products
SET sku = 'NPH-00410',
    name = 'GATORADE  500mL-Orange Chill 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 425.52,
    cost = 335.40,
    reorder_level = 20,
    expiry_date = DATE '2027-07-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00485';
UPDATE products
SET sku = 'NPH-00411',
    name = 'GATORADE  500mL-Pink Lemonade',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 247.49,
    cost = 190.63,
    reorder_level = 20,
    expiry_date = DATE '2027-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00486';
UPDATE products
SET sku = 'NPH-00412',
    name = 'GATORADE  500mL-Tropical 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 318.45,
    cost = 257.95,
    reorder_level = 20,
    expiry_date = DATE '2030-12-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00487';
UPDATE products
SET sku = 'NPH-00413',
    name = 'GATSBY Pomade Supreme Grease 30G',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.63,
    cost = 54.15,
    reorder_level = 20,
    expiry_date = DATE '2029-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00488';
UPDATE products
SET sku = 'NPH-00414',
    name = 'GATSBY Pomade Supreme Grease 80G',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.45,
    cost = 54.93,
    reorder_level = 20,
    expiry_date = DATE '2028-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00489';
UPDATE products
SET sku = 'NPH-00415',
    name = 'GATSBY Pomade Supreme Hold 30G',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.32,
    cost = 38.25,
    reorder_level = 20,
    expiry_date = DATE '2029-12-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00490';
UPDATE products
SET sku = 'NPH-00416',
    name = 'GATSBY Pomade Supreme Hold 75G',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.72,
    cost = 42.96,
    reorder_level = 20,
    expiry_date = DATE '2027-05-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00491';
UPDATE products
SET sku = 'NPH-00417',
    name = 'GATSBY Pomade Supreme Hold Sach.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.02,
    cost = 46.18,
    reorder_level = 20,
    expiry_date = DATE '2028-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00492';
UPDATE products
SET sku = 'NPH-00418',
    name = 'GATSBY Set & Keep Spray 30g E/Hold',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.34,
    cost = 26.29,
    reorder_level = 20,
    expiry_date = DATE '2028-12-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00493';
UPDATE products
SET sku = 'NPH-00419',
    name = 'GATSBY THC Sachet  Normal',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 17.83,
    cost = 13.94,
    reorder_level = 20,
    expiry_date = DATE '2029-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00494';
UPDATE products
SET sku = 'NPH-00420',
    name = 'GATSBY THC Sachet (Anti-Dandruff)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.07,
    cost = 8.54,
    reorder_level = 20,
    expiry_date = DATE '2027-12-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00495';
UPDATE products
SET sku = 'NPH-00421',
    name = 'GATSBY THC Sachet (Soft)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 15.76,
    cost = 12.36,
    reorder_level = 20,
    expiry_date = DATE '2028-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00496';
UPDATE products
SET sku = 'NPH-00422',
    name = 'GATSBY THC Sachet (Super Hard)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 7.62,
    cost = 6.17,
    reorder_level = 20,
    expiry_date = DATE '2028-11-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00497';
UPDATE products
SET sku = 'NPH-00423',
    name = 'GATSBY Wax Jar 25gm (Hard & Free)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.96,
    cost = 39.78,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00498';
UPDATE products
SET sku = 'NPH-00424',
    name = 'GATSBY Wax Jar 25gm (Mat & Hard)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.67,
    cost = 27.20,
    reorder_level = 20,
    expiry_date = DATE '2030-12-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00499';
UPDATE products
SET sku = 'NPH-00425',
    name = 'GATSBY Wax Jar 25gm (Power & Spike)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.35,
    cost = 32.72,
    reorder_level = 20,
    expiry_date = DATE '2027-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00500';
UPDATE products
SET sku = 'NPH-00426',
    name = 'GATSBY Wax Jar 25gm (U-Shaggy)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.08,
    cost = 31.70,
    reorder_level = 20,
    expiry_date = DATE '2028-07-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00501';
UPDATE products
SET sku = 'NPH-00427',
    name = 'GATSBY Wax Jar 75gm (Hard & Free)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.61,
    cost = 40.88,
    reorder_level = 20,
    expiry_date = DATE '2029-06-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00502';
UPDATE products
SET sku = 'NPH-00428',
    name = 'GATSBY Wax Jar 75gm (Mat & Hard)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.74,
    cost = 40.94,
    reorder_level = 20,
    expiry_date = DATE '2028-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00503';
UPDATE products
SET sku = 'NPH-00429',
    name = 'GATSBY Wax Jar 75gm (Power & Spike)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.41,
    cost = 25.97,
    reorder_level = 20,
    expiry_date = DATE '2028-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00504';
UPDATE products
SET sku = 'NPH-00430',
    name = 'GATSBY Wax Jar 75gm (U-Shaggy)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.92,
    cost = 48.73,
    reorder_level = 20,
    expiry_date = DATE '2030-04-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00505';
UPDATE products
SET sku = 'NPH-00431',
    name = 'GATSBY Wax Sachet (Hard & Free)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 16.51,
    cost = 12.67,
    reorder_level = 20,
    expiry_date = DATE '2028-01-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00506';
UPDATE products
SET sku = 'NPH-00432',
    name = 'GATSBY Wax Sachet (Light & Natural) X',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.51,
    cost = 8.76,
    reorder_level = 20,
    expiry_date = DATE '2027-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00507';
UPDATE products
SET sku = 'NPH-00433',
    name = 'GATSBY Wax Sachet (Mat & Hard)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.24,
    cost = 8.74,
    reorder_level = 20,
    expiry_date = DATE '2027-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00508';
UPDATE products
SET sku = 'NPH-00434',
    name = 'GATSBY Wax Sachet (Power & Spike)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 16.97,
    cost = 13.71,
    reorder_level = 20,
    expiry_date = DATE '2029-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00509';
UPDATE products
SET sku = 'NPH-00435',
    name = 'GATSBY Wax Sachet (U-Shaggy)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.34,
    cost = 8.70,
    reorder_level = 20,
    expiry_date = DATE '2030-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00510';
UPDATE products
SET sku = 'MED-00322',
    name = 'GAVISCON Double Action Sach (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 17.04,
    cost = 13.22,
    reorder_level = 20,
    expiry_date = DATE '2030-03-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00511';
UPDATE products
SET sku = 'MED-00323',
    name = 'GAVISCON Double Action Tablet 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 15.79,
    cost = 13.03,
    reorder_level = 20,
    expiry_date = DATE '2027-04-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00512';
UPDATE products
SET sku = 'MED-00324',
    name = 'GAVISCON Original 250mg Tablet 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 15.72,
    cost = 12.30,
    reorder_level = 20,
    expiry_date = DATE '2029-12-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00513';
UPDATE products
SET sku = 'MED-00325',
    name = 'GAVISCON Original Susp. 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 82.50,
    cost = 66.26,
    reorder_level = 20,
    expiry_date = DATE '2029-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00514';
UPDATE products
SET sku = 'MED-00326',
    name = 'GAVISCON-Ppprmnt(Orig)Sach24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 432.56,
    cost = 331.33,
    reorder_level = 20,
    expiry_date = DATE '2028-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00515';
UPDATE products
SET sku = 'NPH-00436',
    name = 'GILLETTE Rubie II Razor (Yellow)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.56,
    cost = 44.64,
    reorder_level = 20,
    expiry_date = DATE '2027-06-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00516';
UPDATE products
SET sku = 'MED-00327',
    name = 'GLUCOLYTE PLUS Powder (Grape)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.35,
    cost = 38.88,
    reorder_level = 20,
    expiry_date = DATE '2028-10-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00517';
UPDATE products
SET sku = 'MED-00328',
    name = 'GLUCOLYTE PLUS Powder (Orange)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 55.22,
    cost = 42.58,
    reorder_level = 20,
    expiry_date = DATE '2029-06-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00518';
UPDATE products
SET sku = 'MED-00329',
    name = 'GLUCOLYTE PLUS Powder (Strawberry)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.81,
    cost = 18.95,
    reorder_level = 20,
    expiry_date = DATE '2029-03-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00519';
UPDATE products
SET sku = 'MED-00330',
    name = 'GLUTAPHOS Tablet 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.83,
    cost = 16.12,
    reorder_level = 20,
    expiry_date = DATE '2028-07-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00520';
UPDATE products
SET sku = 'MED-00331',
    name = 'GLYCERINE Supp.Adult (Rhea)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.05,
    cost = 26.69,
    reorder_level = 20,
    expiry_date = DATE '2028-05-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00521';
UPDATE products
SET sku = 'MED-00332',
    name = 'GLYCERINE Supp.Infant (Rhea)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.90,
    cost = 17.46,
    reorder_level = 20,
    expiry_date = DATE '2029-04-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00522';
UPDATE products
SET sku = 'MED-00333',
    name = 'GLYDOLAX Suppository Adult (UL)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.89,
    cost = 10.60,
    reorder_level = 20,
    expiry_date = DATE '2028-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00523';
UPDATE products
SET sku = 'MED-00334',
    name = 'GLYDOLAX Suppository Infant (UL)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.08,
    cost = 26.23,
    reorder_level = 20,
    expiry_date = DATE '2030-06-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00524';
UPDATE products
SET sku = 'NPH-00437',
    name = 'GRAND Adult Diapers Large 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 60.32,
    cost = 48.72,
    reorder_level = 20,
    expiry_date = DATE '2027-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00525';
UPDATE products
SET sku = 'NPH-00438',
    name = 'GRAND Adult Diapers Large 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 54.00,
    cost = 41.83,
    reorder_level = 20,
    expiry_date = DATE '2029-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00526';
UPDATE products
SET sku = 'NPH-00439',
    name = 'GRAND Adult Diapers Medium 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 95.99,
    cost = 79.74,
    reorder_level = 20,
    expiry_date = DATE '2029-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00527';
UPDATE products
SET sku = 'NPH-00440',
    name = 'GRAND Adult Diapers Medium 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 49.18,
    cost = 37.80,
    reorder_level = 20,
    expiry_date = DATE '2027-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00528';
UPDATE products
SET sku = 'MED-00335',
    name = 'GROWEE with Chlorella Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 25.67,
    cost = 21.03,
    reorder_level = 20,
    expiry_date = DATE '2030-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00529';
UPDATE products
SET sku = 'MED-00336',
    name = 'GROWEE with Chlorella Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 87.54,
    cost = 67.41,
    reorder_level = 20,
    expiry_date = DATE '2028-07-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00530';
UPDATE products
SET sku = 'MED-00337',
    name = 'GROWEE with Chlorella Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 147.99,
    cost = 114.26,
    reorder_level = 20,
    expiry_date = DATE '2028-09-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00531';
UPDATE products
SET sku = 'MED-00338',
    name = 'GUARD - C  500mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.15,
    cost = 9.41,
    reorder_level = 20,
    expiry_date = DATE '2030-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00532';
UPDATE products
SET sku = 'NPH-00441',
    name = 'GUARDIAN Alcohol 40% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 114.01,
    cost = 94.91,
    reorder_level = 20,
    expiry_date = DATE '2029-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00533';
UPDATE products
SET sku = 'NPH-00442',
    name = 'GUARDIAN Alcohol 40% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 112.71,
    cost = 88.47,
    reorder_level = 20,
    expiry_date = DATE '2029-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00534';
UPDATE products
SET sku = 'NPH-00443',
    name = 'GUARDIAN Alcohol 40% 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 268.87,
    cost = 209.22,
    reorder_level = 20,
    expiry_date = DATE '2027-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00535';
UPDATE products
SET sku = 'NPH-00444',
    name = 'GUARDIAN Alcohol 70% 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 77.31,
    cost = 64.24,
    reorder_level = 20,
    expiry_date = DATE '2027-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00536';
UPDATE products
SET sku = 'NPH-00445',
    name = 'GUARDIAN Alcohol 70% 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 82.97,
    cost = 64.80,
    reorder_level = 20,
    expiry_date = DATE '2028-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00537';
UPDATE products
SET sku = 'NPH-00446',
    name = 'GUARDIAN Alcohol 70% 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 119.87,
    cost = 91.54,
    reorder_level = 20,
    expiry_date = DATE '2027-01-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00538';
UPDATE products
SET sku = 'MED-00339',
    name = 'GYNEPRO Feminine Wash 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 28.56,
    cost = 23.02,
    reorder_level = 20,
    expiry_date = DATE '2030-06-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00539';
UPDATE products
SET sku = 'MED-00340',
    name = 'GYNERA Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.63,
    cost = 33.06,
    reorder_level = 20,
    expiry_date = DATE '2030-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00540';
UPDATE products
SET sku = 'NPH-00447',
    name = 'H & S Shamp.  70mL (Apple Fresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.85,
    cost = 45.26,
    reorder_level = 20,
    expiry_date = DATE '2027-09-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00541';
UPDATE products
SET sku = 'NPH-00448',
    name = 'H & S Shamp.  70mL (Smooth & Silky)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.34,
    cost = 41.96,
    reorder_level = 20,
    expiry_date = DATE '2027-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00542';
UPDATE products
SET sku = 'NPH-00449',
    name = 'H & S Shamp.  75mL (Cool Menthol)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.20,
    cost = 44.56,
    reorder_level = 20,
    expiry_date = DATE '2028-12-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00543';
UPDATE products
SET sku = 'NPH-00450',
    name = 'H & S Shamp. 170mL (Apple Fresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.32,
    cost = 53.69,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00544';
UPDATE products
SET sku = 'NPH-00451',
    name = 'H & S Shamp. 170mL (Cool Menthol)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 95.55,
    cost = 77.05,
    reorder_level = 20,
    expiry_date = DATE '2027-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00545';
UPDATE products
SET sku = 'NPH-00452',
    name = 'H & S Shamp. 170mL (Smooth & Silky)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 81.16,
    cost = 64.04,
    reorder_level = 20,
    expiry_date = DATE '2028-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00546';
UPDATE products
SET sku = 'NPH-00453',
    name = 'H & S Shamp.Sach (Apple Fresh) 12mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.60,
    cost = 19.60,
    reorder_level = 20,
    expiry_date = DATE '2030-12-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00547';
UPDATE products
SET sku = 'NPH-00454',
    name = 'H & S Shamp.Sach (Menthol) 12mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.57,
    cost = 27.37,
    reorder_level = 20,
    expiry_date = DATE '2030-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00548';
UPDATE products
SET sku = 'NPH-00455',
    name = 'H & S Shamp.Sach (Smooth & Silky) 12mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.47,
    cost = 36.68,
    reorder_level = 20,
    expiry_date = DATE '2027-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00549';
UPDATE products
SET sku = 'NPH-00456',
    name = 'HAIR BLACKENING Black 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 65.76,
    cost = 54.04,
    reorder_level = 20,
    expiry_date = DATE '2029-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00550';
UPDATE products
SET sku = 'NPH-00457',
    name = 'HAIR BLACKENING Chestnut Brown 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 24.89,
    cost = 19.78,
    reorder_level = 20,
    expiry_date = DATE '2028-10-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00551';
UPDATE products
SET sku = 'NPH-00458',
    name = 'HAPEE  25mL (Fresh Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 43.82,
    cost = 33.27,
    reorder_level = 20,
    expiry_date = DATE '2028-03-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00552';
UPDATE products
SET sku = 'NPH-00459',
    name = 'HAPEE  25mL (Menthol Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 27.01,
    cost = 21.72,
    reorder_level = 20,
    expiry_date = DATE '2030-04-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00553';
UPDATE products
SET sku = 'NPH-00460',
    name = 'HAPEE  50mL (Fresh Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 45.47,
    cost = 36.57,
    reorder_level = 20,
    expiry_date = DATE '2029-08-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00554';
UPDATE products
SET sku = 'NPH-00461',
    name = 'HAPEE  50mL (Menthol Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 47.19,
    cost = 37.48,
    reorder_level = 20,
    expiry_date = DATE '2030-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00555';
UPDATE products
SET sku = 'NPH-00462',
    name = 'HAPEE 100mL (Blue Chill)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 93.89,
    cost = 71.99,
    reorder_level = 20,
    expiry_date = DATE '2028-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00556';
UPDATE products
SET sku = 'NPH-00463',
    name = 'HAPEE 100mL (Fresh Cool White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 71.93,
    cost = 58.94,
    reorder_level = 20,
    expiry_date = DATE '2028-12-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00557';
UPDATE products
SET sku = 'NPH-00464',
    name = 'HAPEE 100mL (Fresh Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 75.35,
    cost = 59.28,
    reorder_level = 20,
    expiry_date = DATE '2027-11-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00558';
UPDATE products
SET sku = 'NPH-00465',
    name = 'HAPEE 100mL (Menthol Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 46.14,
    cost = 38.04,
    reorder_level = 20,
    expiry_date = DATE '2029-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00559';
UPDATE products
SET sku = 'NPH-00466',
    name = 'HAPEE 150mL (Blue Chill)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 99.42,
    cost = 75.97,
    reorder_level = 20,
    expiry_date = DATE '2028-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00560';
UPDATE products
SET sku = 'NPH-00467',
    name = 'HAPEE 150mL (Fresh Cool White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 58.25,
    cost = 46.32,
    reorder_level = 20,
    expiry_date = DATE '2030-01-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00561';
UPDATE products
SET sku = 'NPH-00468',
    name = 'HAPEE 150mL (Fresh Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 115.66,
    cost = 89.11,
    reorder_level = 20,
    expiry_date = DATE '2027-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00562';
UPDATE products
SET sku = 'NPH-00469',
    name = 'HAPEE 150mL (Icy Fresh + Whitening)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 118.00,
    cost = 94.73,
    reorder_level = 20,
    expiry_date = DATE '2029-12-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00563';
UPDATE products
SET sku = 'NPH-00470',
    name = 'HAPEE 150mL (Icy Fresh Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 85.83,
    cost = 68.22,
    reorder_level = 20,
    expiry_date = DATE '2027-11-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00564';
UPDATE products
SET sku = 'NPH-00471',
    name = 'HAPEE 150mL (Menthol Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Fluoride anti-cavity toothpaste for fresh breath, plaque defense, and enamel strengthening.',
    quantity = 100,
    price = 99.47,
    cost = 81.44,
    reorder_level = 20,
    expiry_date = DATE '2028-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00565';
UPDATE products
SET sku = 'NPH-00472',
    name = 'HAPPY Baby Pants  4''s Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 69.11,
    cost = 56.59,
    reorder_level = 20,
    expiry_date = DATE '2030-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00566';
UPDATE products
SET sku = 'NPH-00473',
    name = 'HAPPY Baby Pants  4''s Medium',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.58,
    cost = 54.90,
    reorder_level = 20,
    expiry_date = DATE '2028-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00567';
UPDATE products
SET sku = 'NPH-00474',
    name = 'HAPPY Baby Pants  4''s X-Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.22,
    cost = 45.14,
    reorder_level = 20,
    expiry_date = DATE '2030-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00568';
UPDATE products
SET sku = 'NPH-00475',
    name = 'HAPPY Baby Pants  4''s XX-Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.58,
    cost = 27.13,
    reorder_level = 20,
    expiry_date = DATE '2027-10-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00569';
UPDATE products
SET sku = 'NPH-00476',
    name = 'HAPPY Baby Pants 12''s Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 71.29,
    cost = 57.15,
    reorder_level = 20,
    expiry_date = DATE '2027-06-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00570';
UPDATE products
SET sku = 'NPH-00477',
    name = 'HAPPY Baby Pants 12''s Medium',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 92.38,
    cost = 72.60,
    reorder_level = 20,
    expiry_date = DATE '2029-09-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00571';
UPDATE products
SET sku = 'NPH-00478',
    name = 'HAPPY Baby Pants 12''s X Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 88.04,
    cost = 72.05,
    reorder_level = 20,
    expiry_date = DATE '2027-09-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00572';
UPDATE products
SET sku = 'NPH-00479',
    name = 'HAPPY Baby Pants 12''s XX-Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 88.18,
    cost = 69.99,
    reorder_level = 20,
    expiry_date = DATE '2030-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00573';
UPDATE products
SET sku = 'NPH-00480',
    name = 'HAPPY Baby Pants 24''s Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 323.66,
    cost = 246.27,
    reorder_level = 20,
    expiry_date = DATE '2028-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00574';
UPDATE products
SET sku = 'NPH-00481',
    name = 'HAPPY Baby Pants 24''s Medium',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 319.08,
    cost = 243.54,
    reorder_level = 20,
    expiry_date = DATE '2028-05-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00575';
UPDATE products
SET sku = 'NPH-00482',
    name = 'HAPPY Baby Pants 24''s X-Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 411.91,
    cost = 323.51,
    reorder_level = 20,
    expiry_date = DATE '2030-02-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00576';
UPDATE products
SET sku = 'NPH-00483',
    name = 'HAPPY Baby Pants 24''s XX-Large',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 282.24,
    cost = 218.19,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00577';
UPDATE products
SET sku = 'NPH-00484',
    name = 'HAPPY Cotton  10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.89,
    cost = 21.13,
    reorder_level = 20,
    expiry_date = DATE '2029-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00578';
UPDATE products
SET sku = 'NPH-00485',
    name = 'HAPPY Cotton  40g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.70,
    cost = 35.49,
    reorder_level = 20,
    expiry_date = DATE '2027-05-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00579';
UPDATE products
SET sku = 'NPH-00486',
    name = 'HAPPY Cotton  80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.70,
    cost = 47.12,
    reorder_level = 20,
    expiry_date = DATE '2030-10-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00580';
UPDATE products
SET sku = 'NPH-00487',
    name = 'HAPPY Cotton 150g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.55,
    cost = 57.38,
    reorder_level = 20,
    expiry_date = DATE '2030-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00581';
UPDATE products
SET sku = 'NPH-00488',
    name = 'HAPPY Cotton Balls  50''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 224.69,
    cost = 183.51,
    reorder_level = 20,
    expiry_date = DATE '2028-03-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00582';
UPDATE products
SET sku = 'NPH-00489',
    name = 'HAPPY Cotton Balls 150''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 407.35,
    cost = 313.62,
    reorder_level = 20,
    expiry_date = DATE '2029-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00583';
UPDATE products
SET sku = 'NPH-00490',
    name = 'HAPPY Cotton Balls 300''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.62,
    cost = 26.49,
    reorder_level = 20,
    expiry_date = DATE '2029-10-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00584';
UPDATE products
SET sku = 'NPH-00491',
    name = 'HAPPY Cotton Buds  36''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 249.29,
    cost = 191.64,
    reorder_level = 20,
    expiry_date = DATE '2028-01-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00585';
UPDATE products
SET sku = 'NPH-00492',
    name = 'HAPPY Cotton Buds  72''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.32,
    cost = 48.06,
    reorder_level = 20,
    expiry_date = DATE '2030-05-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00586';
UPDATE products
SET sku = 'NPH-00493',
    name = 'HAPPY Cotton Buds 108''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.61,
    cost = 46.37,
    reorder_level = 20,
    expiry_date = DATE '2029-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00587';
UPDATE products
SET sku = 'NPH-00494',
    name = 'HAPPY Cotton Buds 200''s (Can)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.03,
    cost = 23.57,
    reorder_level = 20,
    expiry_date = DATE '2030-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00588';
UPDATE products
SET sku = 'NPH-00495',
    name = 'HAPPY Cotton Buds 200''s (Plastic)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.03,
    cost = 45.46,
    reorder_level = 20,
    expiry_date = DATE '2028-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00589';
UPDATE products
SET sku = 'MED-00341',
    name = 'HEMARATE FA Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.45,
    cost = 8.45,
    reorder_level = 20,
    expiry_date = DATE '2029-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00590';
UPDATE products
SET sku = 'MED-00342',
    name = 'HEMARATE Film Coated Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.83,
    cost = 9.39,
    reorder_level = 20,
    expiry_date = DATE '2029-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00591';
UPDATE products
SET sku = 'MED-00343',
    name = 'HEMOSTAN 500mg Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.69,
    cost = 12.72,
    reorder_level = 20,
    expiry_date = DATE '2027-02-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00592';
UPDATE products
SET sku = 'NPH-00496',
    name = 'HENO DE PRAVIA Soap  90g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.65,
    cost = 24.27,
    reorder_level = 20,
    expiry_date = DATE '2028-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00593';
UPDATE products
SET sku = 'NPH-00497',
    name = 'HENO DE PRAVIA Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.64,
    cost = 37.44,
    reorder_level = 20,
    expiry_date = DATE '2028-08-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00594';
UPDATE products
SET sku = 'MED-00344',
    name = 'HERACLENE 1mg Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 16.05,
    cost = 13.01,
    reorder_level = 20,
    expiry_date = DATE '2027-12-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00595';
UPDATE products
SET sku = 'MED-00345',
    name = 'HERACLENE Forte Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Growth and appetite-enhancing pediatric multivitamin syrup fortified with Chlorella Growth Factor and Taurine.',
    quantity = 100,
    price = 6.03,
    cost = 4.77,
    reorder_level = 20,
    expiry_date = DATE '2027-12-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00596';
UPDATE products
SET sku = 'MED-00346',
    name = 'HYDRITE Sachet 4.1g* (Apple)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.02,
    cost = 13.35,
    reorder_level = 20,
    expiry_date = DATE '2028-11-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00597';
UPDATE products
SET sku = 'MED-00347',
    name = 'HYDRITE Sachet 4.1g* (Plain)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.83,
    cost = 13.06,
    reorder_level = 20,
    expiry_date = DATE '2028-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00598';
UPDATE products
SET sku = 'NPH-00498',
    name = 'HYDROGEN PEROXIDE 10 vol.120-Rhea',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 21.98,
    cost = 18.00,
    reorder_level = 20,
    expiry_date = DATE '2027-05-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00599';
UPDATE products
SET sku = 'NPH-00499',
    name = 'HYDROGEN PEROXIDE 20 vol.120-LAR',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 38.54,
    cost = 30.14,
    reorder_level = 20,
    expiry_date = DATE '2027-03-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00600';
UPDATE products
SET sku = 'NPH-00500',
    name = 'HYDROGEN PEROXIDE 20 vol.120-Rhea',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 29.30,
    cost = 23.09,
    reorder_level = 20,
    expiry_date = DATE '2027-01-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00601';
UPDATE products
SET sku = 'MED-00348',
    name = 'IBERET Active Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.05,
    cost = 8.84,
    reorder_level = 20,
    expiry_date = DATE '2030-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00602';
UPDATE products
SET sku = 'MED-00349',
    name = 'IBERET Folic Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.59,
    cost = 16.24,
    reorder_level = 20,
    expiry_date = DATE '2028-12-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00603';
UPDATE products
SET sku = 'MED-00350',
    name = 'IMMUNOMAX 10mg Syr 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 81.79,
    cost = 67.56,
    reorder_level = 20,
    expiry_date = DATE '2029-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00604';
UPDATE products
SET sku = 'MED-00351',
    name = 'IMMUNOMAX Forte Syr 20mg 60ml',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.07,
    cost = 30.12,
    reorder_level = 20,
    expiry_date = DATE '2027-12-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00605';
UPDATE products
SET sku = 'MED-00352',
    name = 'IMMUNOSIN Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.56,
    cost = 30.07,
    reorder_level = 20,
    expiry_date = DATE '2028-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00606';
UPDATE products
SET sku = 'MED-00353',
    name = 'IMMUNOSIN Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.97,
    cost = 11.55,
    reorder_level = 20,
    expiry_date = DATE '2029-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00607';
UPDATE products
SET sku = 'MED-00354',
    name = 'IMMUVIT Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.87,
    cost = 4.89,
    reorder_level = 20,
    expiry_date = DATE '2028-03-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00608';
UPDATE products
SET sku = 'MED-00355',
    name = 'IMMUZINC Drops 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.10,
    cost = 30.30,
    reorder_level = 20,
    expiry_date = DATE '2028-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00609';
UPDATE products
SET sku = 'MED-00356',
    name = 'IMMUZINC Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 67.36,
    cost = 54.08,
    reorder_level = 20,
    expiry_date = DATE '2029-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00610';
UPDATE products
SET sku = 'MED-00357',
    name = 'IMODIUM Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antidiarrheal agent (Loperamide HCl) for rapid control of acute diarrhea symptoms.',
    quantity = 100,
    price = 23.46,
    cost = 17.94,
    reorder_level = 20,
    expiry_date = DATE '2030-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00611';
UPDATE products
SET sku = 'MED-00358',
    name = 'IMODIUM Capsule Buy 3 Get 1 Free',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antidiarrheal agent (Loperamide HCl) for rapid control of acute diarrhea symptoms.',
    quantity = 100,
    price = 5.73,
    cost = 4.54,
    reorder_level = 20,
    expiry_date = DATE '2027-08-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00612';
UPDATE products
SET sku = 'MED-00359',
    name = 'INOFLOX 200mg Tablet (100''s)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 372.68,
    cost = 306.42,
    reorder_level = 20,
    expiry_date = DATE '2030-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00613';
UPDATE products
SET sku = 'MED-00360',
    name = 'INOFLOX 400mg Tablet (100''s)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 510.91,
    cost = 422.15,
    reorder_level = 20,
    expiry_date = DATE '2030-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00614';
UPDATE products
SET sku = 'MED-00361',
    name = 'INOFLOX Ophtha. Sol''n (Eye Drops)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.76,
    cost = 30.23,
    reorder_level = 20,
    expiry_date = DATE '2029-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00615';
UPDATE products
SET sku = 'MED-00362',
    name = 'INOFLOX Otic Solution*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.59,
    cost = 30.42,
    reorder_level = 20,
    expiry_date = DATE '2030-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00616';
UPDATE products
SET sku = 'MED-00363',
    name = 'ISOPRINOSINE Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 65.71,
    cost = 53.64,
    reorder_level = 20,
    expiry_date = DATE '2028-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00617';
UPDATE products
SET sku = 'MED-00364',
    name = 'ISOPRINOSINE Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.70,
    cost = 15.15,
    reorder_level = 20,
    expiry_date = DATE '2030-09-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00618';
UPDATE products
SET sku = 'NPH-00501',
    name = 'JERGENS Lot.  50-Age Defying Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.25,
    cost = 19.52,
    reorder_level = 20,
    expiry_date = DATE '2028-09-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00619';
UPDATE products
SET sku = 'NPH-00502',
    name = 'JERGENS Lot.  50-Anti-Bac D/Blue',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.20,
    cost = 32.43,
    reorder_level = 20,
    expiry_date = DATE '2030-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00620';
UPDATE products
SET sku = 'NPH-00503',
    name = 'JERGENS Lot.  50-Original Scent Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.70,
    cost = 21.41,
    reorder_level = 20,
    expiry_date = DATE '2029-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00621';
UPDATE products
SET sku = 'NPH-00504',
    name = 'JERGENS Lot.  50-Skin Lightening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.11,
    cost = 42.95,
    reorder_level = 20,
    expiry_date = DATE '2030-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00622';
UPDATE products
SET sku = 'NPH-00505',
    name = 'JERGENS Lot.  50-Soothing Aloe Grn',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.41,
    cost = 24.32,
    reorder_level = 20,
    expiry_date = DATE '2027-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00623';
UPDATE products
SET sku = 'NPH-00506',
    name = 'JERGENS Lot.  50-U/H Fragrance Free',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.18,
    cost = 36.62,
    reorder_level = 20,
    expiry_date = DATE '2030-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00624';
UPDATE products
SET sku = 'NPH-00507',
    name = 'JERGENS Lot.  50-Ultra Healing Yellow',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.55,
    cost = 41.17,
    reorder_level = 20,
    expiry_date = DATE '2029-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00625';
UPDATE products
SET sku = 'NPH-00508',
    name = 'JERGENS Lot.100-Age Defying Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.61,
    cost = 27.06,
    reorder_level = 20,
    expiry_date = DATE '2030-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00626';
UPDATE products
SET sku = 'NPH-00509',
    name = 'JERGENS Lot.100-Original Scent Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.56,
    cost = 24.17,
    reorder_level = 20,
    expiry_date = DATE '2030-04-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00627';
UPDATE products
SET sku = 'NPH-00510',
    name = 'JERGENS Lot.100-Soothing Aloe Grn',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.59,
    cost = 44.86,
    reorder_level = 20,
    expiry_date = DATE '2027-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00628';
UPDATE products
SET sku = 'NPH-00511',
    name = 'JERGENS Lot.100-Ultra Healing Yellow',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.97,
    cost = 37.96,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00629';
UPDATE products
SET sku = 'NPH-00512',
    name = 'JERGENS Lot.200-Age Defying Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.81,
    cost = 22.08,
    reorder_level = 20,
    expiry_date = DATE '2027-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00630';
UPDATE products
SET sku = 'NPH-00513',
    name = 'JERGENS Lot.200-Original Scent Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.55,
    cost = 29.22,
    reorder_level = 20,
    expiry_date = DATE '2028-10-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00631';
UPDATE products
SET sku = 'NPH-00514',
    name = 'JERGENS Lot.200-Soothing Aloe Grn',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.25,
    cost = 46.97,
    reorder_level = 20,
    expiry_date = DATE '2028-02-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00632';
UPDATE products
SET sku = 'NPH-00515',
    name = 'JERGENS Lot.200-Ultra Healing Yellow',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.06,
    cost = 37.59,
    reorder_level = 20,
    expiry_date = DATE '2030-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00633';
UPDATE products
SET sku = 'NPH-00516',
    name = 'JERGENS Lot.500-Age Defying Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.09,
    cost = 26.58,
    reorder_level = 20,
    expiry_date = DATE '2029-05-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00634';
UPDATE products
SET sku = 'NPH-00517',
    name = 'JERGENS Lot.500-Original Scent Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.86,
    cost = 48.05,
    reorder_level = 20,
    expiry_date = DATE '2030-10-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00635';
UPDATE products
SET sku = 'NPH-00518',
    name = 'JERGENS Lot.500-Soothing Aloe Grn',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.50,
    cost = 28.32,
    reorder_level = 20,
    expiry_date = DATE '2027-09-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00636';
UPDATE products
SET sku = 'NPH-00519',
    name = 'JERGENS Lot.500-Ultra Healing Yellow',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.96,
    cost = 25.89,
    reorder_level = 20,
    expiry_date = DATE '2027-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00637';
UPDATE products
SET sku = 'NPH-00520',
    name = 'JOHNSON''S Bath 100mL-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 97.78,
    cost = 76.35,
    reorder_level = 20,
    expiry_date = DATE '2030-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00638';
UPDATE products
SET sku = 'NPH-00521',
    name = 'JOHNSON''S Bath 100mL-Milk+Oats',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 113.49,
    cost = 91.10,
    reorder_level = 20,
    expiry_date = DATE '2027-12-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00639';
UPDATE products
SET sku = 'NPH-00522',
    name = 'JOHNSON''S Bath 100mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 116.75,
    cost = 91.02,
    reorder_level = 20,
    expiry_date = DATE '2030-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00640';
UPDATE products
SET sku = 'NPH-00523',
    name = 'JOHNSON''S Bath 200mL-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.57,
    cost = 19.93,
    reorder_level = 20,
    expiry_date = DATE '2029-05-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00641';
UPDATE products
SET sku = 'NPH-00524',
    name = 'JOHNSON''S Bath 200mL-Clean & Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.80,
    cost = 32.43,
    reorder_level = 20,
    expiry_date = DATE '2028-03-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00642';
UPDATE products
SET sku = 'NPH-00525',
    name = 'JOHNSON''S Bath 200mL-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.36,
    cost = 33.86,
    reorder_level = 20,
    expiry_date = DATE '2029-12-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00643';
UPDATE products
SET sku = 'NPH-00526',
    name = 'JOHNSON''S Bath 200mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.27,
    cost = 19.35,
    reorder_level = 20,
    expiry_date = DATE '2029-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00644';
UPDATE products
SET sku = 'NPH-00527',
    name = 'JOHNSON''S Bath Refill 200mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.32,
    cost = 19.41,
    reorder_level = 20,
    expiry_date = DATE '2030-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00645';
UPDATE products
SET sku = 'NPH-00528',
    name = 'JOHNSON''S Bath Refill 200mL-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.07,
    cost = 38.54,
    reorder_level = 20,
    expiry_date = DATE '2027-08-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00646';
UPDATE products
SET sku = 'NPH-00529',
    name = 'JOHNSON''S Col.  25mL-Forever Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.54,
    cost = 39.20,
    reorder_level = 20,
    expiry_date = DATE '2030-01-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00647';
UPDATE products
SET sku = 'NPH-00530',
    name = 'JOHNSON''S Col.  25mL-Happy Berries',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.45,
    cost = 19.59,
    reorder_level = 20,
    expiry_date = DATE '2027-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00648';
UPDATE products
SET sku = 'NPH-00531',
    name = 'JOHNSON''S Col.  25mL-Heaven',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.15,
    cost = 22.68,
    reorder_level = 20,
    expiry_date = DATE '2030-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00649';
UPDATE products
SET sku = 'NPH-00532',
    name = 'JOHNSON''S Col.  25mL-Morning Dew',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.11,
    cost = 37.67,
    reorder_level = 20,
    expiry_date = DATE '2030-04-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00650';
UPDATE products
SET sku = 'NPH-00533',
    name = 'JOHNSON''S Col.  25mL-Powder Mist',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.86,
    cost = 23.99,
    reorder_level = 20,
    expiry_date = DATE '2030-09-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00651';
UPDATE products
SET sku = 'NPH-00534',
    name = 'JOHNSON''S Col.  25mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.53,
    cost = 31.90,
    reorder_level = 20,
    expiry_date = DATE '2030-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00652';
UPDATE products
SET sku = 'NPH-00535',
    name = 'JOHNSON''S Col.  25mL-Slide',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.60,
    cost = 27.38,
    reorder_level = 20,
    expiry_date = DATE '2030-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00653';
UPDATE products
SET sku = 'NPH-00536',
    name = 'JOHNSON''S Col.  25mL-SummerSwing',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.31,
    cost = 18.04,
    reorder_level = 20,
    expiry_date = DATE '2030-12-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00654';
UPDATE products
SET sku = 'NPH-00537',
    name = 'JOHNSON''S Col.  50mL-Forever Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.51,
    cost = 33.13,
    reorder_level = 20,
    expiry_date = DATE '2030-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00655';
UPDATE products
SET sku = 'NPH-00538',
    name = 'JOHNSON''S Col.  50mL-Happy Berries',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.55,
    cost = 41.09,
    reorder_level = 20,
    expiry_date = DATE '2030-02-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00656';
UPDATE products
SET sku = 'NPH-00539',
    name = 'JOHNSON''S Col.  50mL-Heaven',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 69.34,
    cost = 54.92,
    reorder_level = 20,
    expiry_date = DATE '2029-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00657';
UPDATE products
SET sku = 'NPH-00540',
    name = 'JOHNSON''S Col.  50mL-Morning Dew',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.26,
    cost = 24.16,
    reorder_level = 20,
    expiry_date = DATE '2027-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00658';
UPDATE products
SET sku = 'NPH-00541',
    name = 'JOHNSON''S Col.  50mL-Powder Mist',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.41,
    cost = 40.15,
    reorder_level = 20,
    expiry_date = DATE '2027-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00659';
UPDATE products
SET sku = 'NPH-00542',
    name = 'JOHNSON''S Col.  50mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.10,
    cost = 23.26,
    reorder_level = 20,
    expiry_date = DATE '2029-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00660';
UPDATE products
SET sku = 'NPH-00543',
    name = 'JOHNSON''S Col.  50mL-Slide',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.99,
    cost = 53.19,
    reorder_level = 20,
    expiry_date = DATE '2027-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00661';
UPDATE products
SET sku = 'NPH-00544',
    name = 'JOHNSON''S Col.  50mL-SummerSwing',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.05,
    cost = 23.95,
    reorder_level = 20,
    expiry_date = DATE '2029-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00662';
UPDATE products
SET sku = 'NPH-00545',
    name = 'JOHNSON''S Col. 125mL-Forever Mine',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.66,
    cost = 21.31,
    reorder_level = 20,
    expiry_date = DATE '2027-12-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00663';
UPDATE products
SET sku = 'NPH-00546',
    name = 'JOHNSON''S Col. 125mL-Happy Berries',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.22,
    cost = 19.72,
    reorder_level = 20,
    expiry_date = DATE '2030-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00664';
UPDATE products
SET sku = 'NPH-00547',
    name = 'JOHNSON''S Col. 125mL-Heaven',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.70,
    cost = 39.59,
    reorder_level = 20,
    expiry_date = DATE '2030-09-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00665';
UPDATE products
SET sku = 'NPH-00548',
    name = 'JOHNSON''S Col. 125mL-Morning Dew',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.10,
    cost = 25.52,
    reorder_level = 20,
    expiry_date = DATE '2030-04-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00666';
UPDATE products
SET sku = 'NPH-00549',
    name = 'JOHNSON''S Col. 125mL-Powder Mist',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.16,
    cost = 37.14,
    reorder_level = 20,
    expiry_date = DATE '2029-03-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00667';
UPDATE products
SET sku = 'NPH-00550',
    name = 'JOHNSON''S Col. 125mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.68,
    cost = 19.05,
    reorder_level = 20,
    expiry_date = DATE '2030-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00668';
UPDATE products
SET sku = 'NPH-00551',
    name = 'JOHNSON''S Col. 125mL-Slide',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.64,
    cost = 31.57,
    reorder_level = 20,
    expiry_date = DATE '2029-08-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00669';
UPDATE products
SET sku = 'NPH-00552',
    name = 'JOHNSON''S Col. 125mL-SummerSwing',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.88,
    cost = 29.49,
    reorder_level = 20,
    expiry_date = DATE '2028-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00670';
UPDATE products
SET sku = 'NPH-00553',
    name = 'JOHNSON''S Lot.  50mL-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.37,
    cost = 37.80,
    reorder_level = 20,
    expiry_date = DATE '2029-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00671';
UPDATE products
SET sku = 'NPH-00554',
    name = 'JOHNSON''S Lot.  50mL-Pink 24-hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.27,
    cost = 32.32,
    reorder_level = 20,
    expiry_date = DATE '2027-02-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00672';
UPDATE products
SET sku = 'NPH-00555',
    name = 'JOHNSON''S Lot. 100mL-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 94.45,
    cost = 77.57,
    reorder_level = 20,
    expiry_date = DATE '2027-06-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00673';
UPDATE products
SET sku = 'NPH-00556',
    name = 'JOHNSON''S Lot. 100mL-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.58,
    cost = 47.66,
    reorder_level = 20,
    expiry_date = DATE '2028-10-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00674';
UPDATE products
SET sku = 'NPH-00557',
    name = 'JOHNSON''S Lot. 100mL-Pink 24-hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.29,
    cost = 46.75,
    reorder_level = 20,
    expiry_date = DATE '2029-01-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00675';
UPDATE products
SET sku = 'NPH-00558',
    name = 'JOHNSON''S Lot. 200mL-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.80,
    cost = 19.00,
    reorder_level = 20,
    expiry_date = DATE '2028-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00676';
UPDATE products
SET sku = 'NPH-00559',
    name = 'JOHNSON''S Lot. 200mL-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.50,
    cost = 20.24,
    reorder_level = 20,
    expiry_date = DATE '2030-03-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00677';
UPDATE products
SET sku = 'NPH-00560',
    name = 'JOHNSON''S Lot. 200mL-Pink 24-hour',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.74,
    cost = 49.15,
    reorder_level = 20,
    expiry_date = DATE '2030-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00678';
UPDATE products
SET sku = 'NPH-00561',
    name = 'JOHNSON''S Oil  25mL-Aloe Vera',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.83,
    cost = 39.13,
    reorder_level = 20,
    expiry_date = DATE '2027-04-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00679';
UPDATE products
SET sku = 'NPH-00562',
    name = 'JOHNSON''S Oil  25mL-Lite',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.97,
    cost = 33.59,
    reorder_level = 20,
    expiry_date = DATE '2030-09-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00680';
UPDATE products
SET sku = 'NPH-00563',
    name = 'JOHNSON''S Oil  25mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.86,
    cost = 37.27,
    reorder_level = 20,
    expiry_date = DATE '2029-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00681';
UPDATE products
SET sku = 'NPH-00564',
    name = 'JOHNSON''S Oil  50mL-Aloe Vera',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.37,
    cost = 44.32,
    reorder_level = 20,
    expiry_date = DATE '2030-11-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00682';
UPDATE products
SET sku = 'NPH-00565',
    name = 'JOHNSON''S Oil  50mL-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.97,
    cost = 43.30,
    reorder_level = 20,
    expiry_date = DATE '2028-05-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00683';
UPDATE products
SET sku = 'NPH-00566',
    name = 'JOHNSON''S Oil  50mL-Lite',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.36,
    cost = 34.47,
    reorder_level = 20,
    expiry_date = DATE '2027-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00684';
UPDATE products
SET sku = 'NPH-00567',
    name = 'JOHNSON''S Oil  50mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.21,
    cost = 40.84,
    reorder_level = 20,
    expiry_date = DATE '2027-01-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00685';
UPDATE products
SET sku = 'NPH-00568',
    name = 'JOHNSON''S Oil 125mL-Aloe Vera',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.74,
    cost = 20.78,
    reorder_level = 20,
    expiry_date = DATE '2028-06-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00686';
UPDATE products
SET sku = 'NPH-00569',
    name = 'JOHNSON''S Oil 125mL-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.24,
    cost = 39.14,
    reorder_level = 20,
    expiry_date = DATE '2028-10-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00687';
UPDATE products
SET sku = 'NPH-00570',
    name = 'JOHNSON''S Oil 125mL-Lite',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.63,
    cost = 20.12,
    reorder_level = 20,
    expiry_date = DATE '2028-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00688';
UPDATE products
SET sku = 'NPH-00571',
    name = 'JOHNSON''S Oil 125mL-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.15,
    cost = 32.42,
    reorder_level = 20,
    expiry_date = DATE '2028-12-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00689';
UPDATE products
SET sku = 'NPH-00572',
    name = 'JOHNSON''S Powder  25g-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.71,
    cost = 36.15,
    reorder_level = 20,
    expiry_date = DATE '2028-12-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00690';
UPDATE products
SET sku = 'NPH-00573',
    name = 'JOHNSON''S Powder  25g-Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.39,
    cost = 35.26,
    reorder_level = 20,
    expiry_date = DATE '2027-10-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00691';
UPDATE products
SET sku = 'NPH-00574',
    name = 'JOHNSON''S Powder  25g-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.17,
    cost = 22.61,
    reorder_level = 20,
    expiry_date = DATE '2027-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00692';
UPDATE products
SET sku = 'NPH-00575',
    name = 'JOHNSON''S Powder  25g-Pink Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.13,
    cost = 28.78,
    reorder_level = 20,
    expiry_date = DATE '2028-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00693';
UPDATE products
SET sku = 'NPH-00576',
    name = 'JOHNSON''S Powder  50g-Active Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.29,
    cost = 45.52,
    reorder_level = 20,
    expiry_date = DATE '2029-09-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00694';
UPDATE products
SET sku = 'NPH-00577',
    name = 'JOHNSON''S Powder  50g-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.06,
    cost = 38.32,
    reorder_level = 20,
    expiry_date = DATE '2029-04-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00695';
UPDATE products
SET sku = 'NPH-00578',
    name = 'JOHNSON''S Powder  50g-Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.53,
    cost = 57.80,
    reorder_level = 20,
    expiry_date = DATE '2029-07-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00696';
UPDATE products
SET sku = 'NPH-00579',
    name = 'JOHNSON''S Powder  50g-Complete Care',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.27,
    cost = 46.00,
    reorder_level = 20,
    expiry_date = DATE '2027-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00697';
UPDATE products
SET sku = 'NPH-00580',
    name = 'JOHNSON''S Powder  50g-Cooling',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.06,
    cost = 33.43,
    reorder_level = 20,
    expiry_date = DATE '2028-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00698';
UPDATE products
SET sku = 'NPH-00581',
    name = 'JOHNSON''S Powder  50g-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.46,
    cost = 46.02,
    reorder_level = 20,
    expiry_date = DATE '2029-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00699';
UPDATE products
SET sku = 'NPH-00582',
    name = 'JOHNSON''S Powder  50g-Pink Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.32,
    cost = 29.91,
    reorder_level = 20,
    expiry_date = DATE '2030-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00700';
UPDATE products
SET sku = 'NPH-00583',
    name = 'JOHNSON''S Powder 100g-Active Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.68,
    cost = 50.51,
    reorder_level = 20,
    expiry_date = DATE '2030-06-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00701';
UPDATE products
SET sku = 'NPH-00584',
    name = 'JOHNSON''S Powder 100g-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.61,
    cost = 39.09,
    reorder_level = 20,
    expiry_date = DATE '2028-01-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00702';
UPDATE products
SET sku = 'NPH-00585',
    name = 'JOHNSON''S Powder 100g-Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.66,
    cost = 32.44,
    reorder_level = 20,
    expiry_date = DATE '2030-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00703';
UPDATE products
SET sku = 'NPH-00586',
    name = 'JOHNSON''S Powder 100g-Cooling',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.40,
    cost = 37.53,
    reorder_level = 20,
    expiry_date = DATE '2030-08-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00704';
UPDATE products
SET sku = 'NPH-00587',
    name = 'JOHNSON''S Powder 100g-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.78,
    cost = 42.54,
    reorder_level = 20,
    expiry_date = DATE '2028-04-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00705';
UPDATE products
SET sku = 'NPH-00588',
    name = 'JOHNSON''S Powder 100g-Pink Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.48,
    cost = 53.03,
    reorder_level = 20,
    expiry_date = DATE '2030-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00706';
UPDATE products
SET sku = 'NPH-00589',
    name = 'JOHNSON''S Powder 200g-Active Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.83,
    cost = 53.08,
    reorder_level = 20,
    expiry_date = DATE '2030-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00707';
UPDATE products
SET sku = 'NPH-00590',
    name = 'JOHNSON''S Powder 200g-Bedtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.43,
    cost = 41.85,
    reorder_level = 20,
    expiry_date = DATE '2028-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00708';
UPDATE products
SET sku = 'NPH-00591',
    name = 'JOHNSON''S Powder 200g-Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.97,
    cost = 22.95,
    reorder_level = 20,
    expiry_date = DATE '2030-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00709';
UPDATE products
SET sku = 'NPH-00592',
    name = 'JOHNSON''S Powder 200g-Cooling',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.84,
    cost = 25.24,
    reorder_level = 20,
    expiry_date = DATE '2027-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00710';
UPDATE products
SET sku = 'NPH-00593',
    name = 'JOHNSON''S Powder 200g-Cornstarch',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.62,
    cost = 31.70,
    reorder_level = 20,
    expiry_date = DATE '2030-01-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00711';
UPDATE products
SET sku = 'NPH-00594',
    name = 'JOHNSON''S Powder 200g-Milk+Rice',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.84,
    cost = 32.47,
    reorder_level = 20,
    expiry_date = DATE '2027-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00712';
UPDATE products
SET sku = 'NPH-00595',
    name = 'JOHNSON''S Powder 200g-Pink Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.73,
    cost = 20.48,
    reorder_level = 20,
    expiry_date = DATE '2030-12-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00713';
UPDATE products
SET sku = 'NPH-00596',
    name = 'JOHNSON''S Powder 500g-Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.95,
    cost = 24.74,
    reorder_level = 20,
    expiry_date = DATE '2029-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00714';
UPDATE products
SET sku = 'NPH-00597',
    name = 'JOHNSON''S Sham. 100-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.82,
    cost = 50.73,
    reorder_level = 20,
    expiry_date = DATE '2027-04-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00715';
UPDATE products
SET sku = 'NPH-00598',
    name = 'JOHNSON''S Sham. 100-Shiny drops',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.00,
    cost = 35.43,
    reorder_level = 20,
    expiry_date = DATE '2030-05-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00716';
UPDATE products
SET sku = 'NPH-00599',
    name = 'JOHNSON''S Sham. 200-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.51,
    cost = 47.13,
    reorder_level = 20,
    expiry_date = DATE '2030-06-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00717';
UPDATE products
SET sku = 'NPH-00600',
    name = 'JOHNSON''S Sham. 200-Soft & Shiny',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.17,
    cost = 34.51,
    reorder_level = 20,
    expiry_date = DATE '2028-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00718';
UPDATE products
SET sku = 'NPH-00601',
    name = 'JOHNSON''S Sham. Sach-Active Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.51,
    cost = 44.67,
    reorder_level = 20,
    expiry_date = DATE '2027-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00719';
UPDATE products
SET sku = 'NPH-00602',
    name = 'JOHNSON''S Sham. Sach-Shiny Drops',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.45,
    cost = 32.34,
    reorder_level = 20,
    expiry_date = DATE '2029-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00720';
UPDATE products
SET sku = 'NPH-00603',
    name = 'JOHNSON''S Sham.100-Clean & Fresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.49,
    cost = 26.71,
    reorder_level = 20,
    expiry_date = DATE '2029-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00721';
UPDATE products
SET sku = 'NPH-00604',
    name = 'JOHNSON''S Sham.100-Soft & Smooth',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.32,
    cost = 26.70,
    reorder_level = 20,
    expiry_date = DATE '2028-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00722';
UPDATE products
SET sku = 'NPH-00605',
    name = 'JOHNSON''S Soap  60g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.20,
    cost = 52.15,
    reorder_level = 20,
    expiry_date = DATE '2028-08-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00723';
UPDATE products
SET sku = 'NPH-00606',
    name = 'JOHNSON''S Soap  60g-Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.76,
    cost = 39.03,
    reorder_level = 20,
    expiry_date = DATE '2030-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00724';
UPDATE products
SET sku = 'NPH-00607',
    name = 'JOHNSON''S Soap  60g-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.91,
    cost = 46.44,
    reorder_level = 20,
    expiry_date = DATE '2030-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00725';
UPDATE products
SET sku = 'NPH-00608',
    name = 'JOHNSON''S Soap 100g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.71,
    cost = 47.71,
    reorder_level = 20,
    expiry_date = DATE '2029-09-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00726';
UPDATE products
SET sku = 'NPH-00609',
    name = 'JOHNSON''S Soap 100g-Blossom',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.56,
    cost = 32.98,
    reorder_level = 20,
    expiry_date = DATE '2029-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00727';
UPDATE products
SET sku = 'NPH-00610',
    name = 'JOHNSON''S Soap 100g-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.12,
    cost = 25.62,
    reorder_level = 20,
    expiry_date = DATE '2027-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00728';
UPDATE products
SET sku = 'NPH-00611',
    name = 'JOHNSON''S Soap 150g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.65,
    cost = 46.34,
    reorder_level = 20,
    expiry_date = DATE '2029-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00729';
UPDATE products
SET sku = 'NPH-00612',
    name = 'JOHNSON''S Soap 150g-Blossoms',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.05,
    cost = 37.44,
    reorder_level = 20,
    expiry_date = DATE '2029-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00730';
UPDATE products
SET sku = 'NPH-00613',
    name = 'JOHNSON''S Soap 150g-Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.14,
    cost = 26.31,
    reorder_level = 20,
    expiry_date = DATE '2029-05-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00731';
UPDATE products
SET sku = 'NPH-00614',
    name = 'JOHNSON''S Top-to-Toe 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 84.36,
    cost = 65.67,
    reorder_level = 20,
    expiry_date = DATE '2028-08-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00732';
UPDATE products
SET sku = 'NPH-00615',
    name = 'JOHNSON''S Top-to-Toe 200mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.74,
    cost = 40.13,
    reorder_level = 20,
    expiry_date = DATE '2030-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00733';
UPDATE products
SET sku = 'NPH-00616',
    name = 'JOHNSON''S Wipes 20cts (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.41,
    cost = 27.75,
    reorder_level = 20,
    expiry_date = DATE '2027-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00734';
UPDATE products
SET sku = 'NPH-00617',
    name = 'JOHNSON''S Wipes 20cts (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.75,
    cost = 38.43,
    reorder_level = 20,
    expiry_date = DATE '2029-11-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00735';
UPDATE products
SET sku = 'NPH-00618',
    name = 'JOY Bathroom Tissue 2-Ply Extra (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.16,
    cost = 26.01,
    reorder_level = 20,
    expiry_date = DATE '2030-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00736';
UPDATE products
SET sku = 'NPH-00619',
    name = 'JUICY Col.  25mL (Angel''s Bliss)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 22.68,
    cost = 18.11,
    reorder_level = 20,
    expiry_date = DATE '2028-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00737';
UPDATE products
SET sku = 'NPH-00620',
    name = 'JUICY Col.  25mL (Dreamsicle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.05,
    cost = 26.09,
    reorder_level = 20,
    expiry_date = DATE '2027-07-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00738';
UPDATE products
SET sku = 'NPH-00621',
    name = 'JUICY Col.  25mL (Icylicious)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.15,
    cost = 36.99,
    reorder_level = 20,
    expiry_date = DATE '2027-12-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00739';
UPDATE products
SET sku = 'NPH-00622',
    name = 'JUICY Col.  25mL (Orange Twist)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.29,
    cost = 20.89,
    reorder_level = 20,
    expiry_date = DATE '2027-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00740';
UPDATE products
SET sku = 'NPH-00623',
    name = 'JUICY Col.  25mL (Sprightly Sprinkle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.59,
    cost = 32.01,
    reorder_level = 20,
    expiry_date = DATE '2029-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00741';
UPDATE products
SET sku = 'NPH-00624',
    name = 'JUICY Col.  25mL (Sugar Frosting)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.65,
    cost = 33.66,
    reorder_level = 20,
    expiry_date = DATE '2029-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00742';
UPDATE products
SET sku = 'NPH-00625',
    name = 'JUICY Col.  25mL (Sweet Delight)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.38,
    cost = 25.56,
    reorder_level = 20,
    expiry_date = DATE '2028-10-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00743';
UPDATE products
SET sku = 'NPH-00626',
    name = 'JUICY Col.  25mL (Up, Up & Away)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.57,
    cost = 31.91,
    reorder_level = 20,
    expiry_date = DATE '2029-03-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00744';
UPDATE products
SET sku = 'NPH-00627',
    name = 'JUICY Col.  50mL (Angel''s Bliss)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.71,
    cost = 25.46,
    reorder_level = 20,
    expiry_date = DATE '2030-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00745';
UPDATE products
SET sku = 'NPH-00628',
    name = 'JUICY Col.  50mL (Dreamsicle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.15,
    cost = 40.61,
    reorder_level = 20,
    expiry_date = DATE '2030-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00746';
UPDATE products
SET sku = 'NPH-00629',
    name = 'JUICY Col.  50mL (Icylicious)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.08,
    cost = 27.38,
    reorder_level = 20,
    expiry_date = DATE '2030-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00747';
UPDATE products
SET sku = 'NPH-00630',
    name = 'JUICY Col.  50mL (Orange Twist)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.61,
    cost = 33.10,
    reorder_level = 20,
    expiry_date = DATE '2029-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00748';
UPDATE products
SET sku = 'NPH-00631',
    name = 'JUICY Col.  50mL (Sprightly Sprinkle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.54,
    cost = 49.67,
    reorder_level = 20,
    expiry_date = DATE '2030-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00749';
UPDATE products
SET sku = 'NPH-00632',
    name = 'JUICY Col.  50mL (Sweet Delight)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.27,
    cost = 35.08,
    reorder_level = 20,
    expiry_date = DATE '2027-04-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00750';
UPDATE products
SET sku = 'NPH-00633',
    name = 'JUICY Col.  75mL (Angel''s Bliss)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.00,
    cost = 44.86,
    reorder_level = 20,
    expiry_date = DATE '2028-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00751';
UPDATE products
SET sku = 'NPH-00634',
    name = 'JUICY Col.  75mL (Dreamsicle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.10,
    cost = 42.83,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00752';
UPDATE products
SET sku = 'NPH-00635',
    name = 'JUICY Col.  75mL (Icylicious)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.76,
    cost = 24.15,
    reorder_level = 20,
    expiry_date = DATE '2030-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00753';
UPDATE products
SET sku = 'NPH-00636',
    name = 'JUICY Col.  75mL (Sprightly Sprinkle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.29,
    cost = 22.71,
    reorder_level = 20,
    expiry_date = DATE '2027-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00754';
UPDATE products
SET sku = 'NPH-00637',
    name = 'JUICY Col.  75mL (Sugar Frosting)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.62,
    cost = 52.62,
    reorder_level = 20,
    expiry_date = DATE '2029-01-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00755';
UPDATE products
SET sku = 'NPH-00638',
    name = 'JUICY Col.  75mL (Up,Up & Away)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.04,
    cost = 27.33,
    reorder_level = 20,
    expiry_date = DATE '2028-05-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00756';
UPDATE products
SET sku = 'NPH-00639',
    name = 'JUICY Col. 125mL (Angel''s Bliss)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.50,
    cost = 23.59,
    reorder_level = 20,
    expiry_date = DATE '2030-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00757';
UPDATE products
SET sku = 'NPH-00640',
    name = 'JUICY Col. 125mL (Dreamsicle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.04,
    cost = 29.82,
    reorder_level = 20,
    expiry_date = DATE '2027-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00758';
UPDATE products
SET sku = 'NPH-00641',
    name = 'JUICY Col. 125mL (Icylicious)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.23,
    cost = 36.99,
    reorder_level = 20,
    expiry_date = DATE '2029-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00759';
UPDATE products
SET sku = 'NPH-00642',
    name = 'JUICY Col. 125mL (Orange Twist)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 19.18,
    cost = 15.76,
    reorder_level = 20,
    expiry_date = DATE '2028-10-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00760';
UPDATE products
SET sku = 'NPH-00643',
    name = 'JUICY Col. 125mL (Sprightly Sprnkle)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.21,
    cost = 16.45,
    reorder_level = 20,
    expiry_date = DATE '2029-01-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00761';
UPDATE products
SET sku = 'NPH-00644',
    name = 'JUICY Col. 125mL (Sugar Frosting)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.95,
    cost = 41.71,
    reorder_level = 20,
    expiry_date = DATE '2030-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00762';
UPDATE products
SET sku = 'NPH-00645',
    name = 'JUICY Col. 125mL (Sweet Delight)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.25,
    cost = 18.41,
    reorder_level = 20,
    expiry_date = DATE '2027-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00763';
UPDATE products
SET sku = 'NPH-00646',
    name = 'JUICY Col. 125mL (Up,Up & Away)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.90,
    cost = 24.38,
    reorder_level = 20,
    expiry_date = DATE '2027-03-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00764';
UPDATE products
SET sku = 'NPH-00647',
    name = 'KAMI Bathroom Tissue 2-Ply',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.95,
    cost = 52.76,
    reorder_level = 20,
    expiry_date = DATE '2030-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00765';
UPDATE products
SET sku = 'MED-00365',
    name = 'KAMILLOSAN M Spray 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.11,
    cost = 29.26,
    reorder_level = 20,
    expiry_date = DATE '2027-11-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00766';
UPDATE products
SET sku = 'NPH-00648',
    name = 'KATIALIS Ointment Big 30g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 65.30,
    cost = 53.57,
    reorder_level = 20,
    expiry_date = DATE '2029-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00767';
UPDATE products
SET sku = 'NPH-00649',
    name = 'KATIALIS Ointment Medium 15g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 47.14,
    cost = 38.87,
    reorder_level = 20,
    expiry_date = DATE '2027-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00768';
UPDATE products
SET sku = 'NPH-00650',
    name = 'KATIALIS Ointment Small 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 50.02,
    cost = 40.69,
    reorder_level = 20,
    expiry_date = DATE '2027-05-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00769';
UPDATE products
SET sku = 'NPH-00651',
    name = 'KATIALIS Soap 90g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 48.46,
    cost = 39.66,
    reorder_level = 20,
    expiry_date = DATE '2027-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00770';
UPDATE products
SET sku = 'NPH-00652',
    name = 'KATINKO Ointment 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 46.26,
    cost = 36.52,
    reorder_level = 20,
    expiry_date = DATE '2028-09-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00771';
UPDATE products
SET sku = 'NPH-00653',
    name = 'KATINKO Ointment 30g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 47.75,
    cost = 39.69,
    reorder_level = 20,
    expiry_date = DATE '2029-07-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00772';
UPDATE products
SET sku = 'NPH-00654',
    name = 'KATINKO Stick 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 28.44,
    cost = 23.06,
    reorder_level = 20,
    expiry_date = DATE '2027-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00773';
UPDATE products
SET sku = 'NPH-00655',
    name = 'KISSA Papaya Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 41.29,
    cost = 33.54,
    reorder_level = 20,
    expiry_date = DATE '2030-01-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00774';
UPDATE products
SET sku = 'NPH-00656',
    name = 'KIWI Sachet 5mL (Black)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 12.39,
    cost = 9.65,
    reorder_level = 20,
    expiry_date = DATE '2028-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00775';
UPDATE products
SET sku = 'NPH-00657',
    name = 'KIWI Sachet 5mL (Brown)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 11.20,
    cost = 8.90,
    reorder_level = 20,
    expiry_date = DATE '2029-01-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00776';
UPDATE products
SET sku = 'NPH-00658',
    name = 'KLEENEX Tissue (Big Travellers)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.64,
    cost = 23.45,
    reorder_level = 20,
    expiry_date = DATE '2030-09-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00777';
UPDATE products
SET sku = 'NPH-00659',
    name = 'KLEENEX Tissue (Little Travellers)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.97,
    cost = 30.23,
    reorder_level = 20,
    expiry_date = DATE '2030-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00778';
UPDATE products
SET sku = 'NPH-00660',
    name = 'KLEENEX Tissue (Mini Pack) 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.93,
    cost = 57.35,
    reorder_level = 20,
    expiry_date = DATE '2028-01-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00779';
UPDATE products
SET sku = 'NPH-00661',
    name = 'KOJIC Acid Soap 135g (Plastic)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.30,
    cost = 28.30,
    reorder_level = 20,
    expiry_date = DATE '2029-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00780';
UPDATE products
SET sku = 'NPH-00662',
    name = 'KOJIESAN Body LghtngLot.SPF25  50g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 39.36,
    cost = 30.29,
    reorder_level = 20,
    expiry_date = DATE '2027-09-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00781';
UPDATE products
SET sku = 'NPH-00663',
    name = 'KOJIESAN Body LghtngLot.SPF25 150g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 47.56,
    cost = 37.34,
    reorder_level = 20,
    expiry_date = DATE '2027-08-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00782';
UPDATE products
SET sku = 'NPH-00664',
    name = 'KOJIESAN Body Lightening Lot.100g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 46.22,
    cost = 37.71,
    reorder_level = 20,
    expiry_date = DATE '2028-06-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00783';
UPDATE products
SET sku = 'NPH-00665',
    name = 'KOJIESAN Body Lightening Lot.200g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 31.02,
    cost = 25.58,
    reorder_level = 20,
    expiry_date = DATE '2029-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00784';
UPDATE products
SET sku = 'NPH-00666',
    name = 'KOJIESAN Body Lightng Lot.15g 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 75.35,
    cost = 62.53,
    reorder_level = 20,
    expiry_date = DATE '2027-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00785';
UPDATE products
SET sku = 'NPH-00667',
    name = 'KOJIESAN Cleanser + Toner  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 63.20,
    cost = 49.96,
    reorder_level = 20,
    expiry_date = DATE '2030-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00786';
UPDATE products
SET sku = 'NPH-00668',
    name = 'KOJIESAN Cleanser + Toner 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 47.95,
    cost = 39.70,
    reorder_level = 20,
    expiry_date = DATE '2029-03-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00787';
UPDATE products
SET sku = 'NPH-00669',
    name = 'KOJIESAN Dream White Soap  65g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 41.52,
    cost = 32.08,
    reorder_level = 20,
    expiry_date = DATE '2028-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00788';
UPDATE products
SET sku = 'NPH-00670',
    name = 'KOJIESAN Dream White Soap  65g 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 69.87,
    cost = 56.87,
    reorder_level = 20,
    expiry_date = DATE '2028-08-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00789';
UPDATE products
SET sku = 'NPH-00671',
    name = 'KOJIESAN Dream White Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 45.20,
    cost = 36.63,
    reorder_level = 20,
    expiry_date = DATE '2029-11-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00790';
UPDATE products
SET sku = 'NPH-00672',
    name = 'KOJIESAN Dream White Soap 135g 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 44.45,
    cost = 36.52,
    reorder_level = 20,
    expiry_date = DATE '2030-10-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00791';
UPDATE products
SET sku = 'NPH-00673',
    name = 'KOJIESAN Face Lightening Cream 30g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 25.50,
    cost = 19.92,
    reorder_level = 20,
    expiry_date = DATE '2029-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00792';
UPDATE products
SET sku = 'NPH-00674',
    name = 'KOJIESAN MEN Soap-EXTRA FRESH',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 43.77,
    cost = 35.64,
    reorder_level = 20,
    expiry_date = DATE '2028-03-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00793';
UPDATE products
SET sku = 'NPH-00675',
    name = 'KOJIESAN S/Lightening Soap  45g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 27.28,
    cost = 21.41,
    reorder_level = 20,
    expiry_date = DATE '2028-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00794';
UPDATE products
SET sku = 'NPH-00676',
    name = 'KOJIESAN S/Lightening Soap  65g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 35.23,
    cost = 27.30,
    reorder_level = 20,
    expiry_date = DATE '2027-12-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00795';
UPDATE products
SET sku = 'NPH-00677',
    name = 'KOJIESAN S/Lightening Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 25.42,
    cost = 21.17,
    reorder_level = 20,
    expiry_date = DATE '2027-11-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00796';
UPDATE products
SET sku = 'NPH-00678',
    name = 'KOJIESAN S/Lightening Soap 2''s  65g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 61.91,
    cost = 47.53,
    reorder_level = 20,
    expiry_date = DATE '2027-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00797';
UPDATE products
SET sku = 'NPH-00679',
    name = 'KOJIESAN S/Lightening Soap 2''s 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 52.38,
    cost = 40.34,
    reorder_level = 20,
    expiry_date = DATE '2029-03-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00798';
UPDATE products
SET sku = 'NPH-00680',
    name = 'KOJIESAN S/Lightening Soap 3''s  65g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 31.86,
    cost = 26.00,
    reorder_level = 20,
    expiry_date = DATE '2029-03-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00799';
UPDATE products
SET sku = 'NPH-00681',
    name = 'KOJIESAN S/Lightening Soap 3''s 100g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 62.09,
    cost = 48.01,
    reorder_level = 20,
    expiry_date = DATE '2029-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00800';
UPDATE products
SET sku = 'NPH-00682',
    name = 'KOLOURS Balinese Brown w/ Vitress-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.98,
    cost = 54.81,
    reorder_level = 20,
    expiry_date = DATE '2027-05-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00801';
UPDATE products
SET sku = 'NPH-00683',
    name = 'KOLOURS Balinese Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.97,
    cost = 23.66,
    reorder_level = 20,
    expiry_date = DATE '2029-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00802';
UPDATE products
SET sku = 'NPH-00684',
    name = 'KOLOURS Black-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.95,
    cost = 22.12,
    reorder_level = 20,
    expiry_date = DATE '2027-01-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00803';
UPDATE products
SET sku = 'NPH-00685',
    name = 'KOLOURS Burgundy-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.84,
    cost = 28.14,
    reorder_level = 20,
    expiry_date = DATE '2028-12-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00804';
UPDATE products
SET sku = 'NPH-00686',
    name = 'KOLOURS Caramel Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.25,
    cost = 33.39,
    reorder_level = 20,
    expiry_date = DATE '2029-11-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00805';
UPDATE products
SET sku = 'NPH-00687',
    name = 'KOLOURS ChestnutBrwn w/ Vitress -R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.01,
    cost = 49.98,
    reorder_level = 20,
    expiry_date = DATE '2029-04-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00806';
UPDATE products
SET sku = 'NPH-00688',
    name = 'KOLOURS ChestnutBrwn-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.90,
    cost = 31.02,
    reorder_level = 20,
    expiry_date = DATE '2028-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00807';
UPDATE products
SET sku = 'NPH-00689',
    name = 'KOLOURS Choc.Brown w/ Vitress-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.52,
    cost = 37.76,
    reorder_level = 20,
    expiry_date = DATE '2030-08-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00808';
UPDATE products
SET sku = 'NPH-00690',
    name = 'KOLOURS Choc.Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.44,
    cost = 28.82,
    reorder_level = 20,
    expiry_date = DATE '2030-01-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00809';
UPDATE products
SET sku = 'NPH-00691',
    name = 'KOLOURS Dark Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.65,
    cost = 48.24,
    reorder_level = 20,
    expiry_date = DATE '2030-10-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00810';
UPDATE products
SET sku = 'NPH-00692',
    name = 'KOLOURS Light Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.98,
    cost = 31.37,
    reorder_level = 20,
    expiry_date = DATE '2027-06-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00811';
UPDATE products
SET sku = 'NPH-00693',
    name = 'KOLOURS Mahogany-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.54,
    cost = 34.66,
    reorder_level = 20,
    expiry_date = DATE '2030-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00812';
UPDATE products
SET sku = 'NPH-00694',
    name = 'KOLOURS Medium Brown w/ Vitress-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.00,
    cost = 30.25,
    reorder_level = 20,
    expiry_date = DATE '2029-03-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00813';
UPDATE products
SET sku = 'NPH-00695',
    name = 'KOLOURS Medium Brown-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.21,
    cost = 25.30,
    reorder_level = 20,
    expiry_date = DATE '2028-09-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00814';
UPDATE products
SET sku = 'NPH-00696',
    name = 'KOLOURS MEN Black + Free Gel -R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.44,
    cost = 35.94,
    reorder_level = 20,
    expiry_date = DATE '2027-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00815';
UPDATE products
SET sku = 'NPH-00697',
    name = 'KOLOURS MEN Black-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.17,
    cost = 40.20,
    reorder_level = 20,
    expiry_date = DATE '2027-10-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00816';
UPDATE products
SET sku = 'NPH-00698',
    name = 'KOLOURS MEN Dark Brwn+Free Gel-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.20,
    cost = 34.30,
    reorder_level = 20,
    expiry_date = DATE '2027-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00817';
UPDATE products
SET sku = 'NPH-00699',
    name = 'KOLOURS MEN Dark Brwn-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.99,
    cost = 19.78,
    reorder_level = 20,
    expiry_date = DATE '2029-12-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00818';
UPDATE products
SET sku = 'NPH-00700',
    name = 'KOLOURS Shanghai Mhgny-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.42,
    cost = 44.86,
    reorder_level = 20,
    expiry_date = DATE '2028-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00819';
UPDATE products
SET sku = 'NPH-00701',
    name = 'KOLOURS Solenn Ash Brown-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.27,
    cost = 47.46,
    reorder_level = 20,
    expiry_date = DATE '2030-04-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00820';
UPDATE products
SET sku = 'NPH-00702',
    name = 'KOLOURS Solenn Honey Amber-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.00,
    cost = 33.70,
    reorder_level = 20,
    expiry_date = DATE '2030-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00821';
UPDATE products
SET sku = 'NPH-00703',
    name = 'KOLOURS Solenn Raspberry Red-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.21,
    cost = 26.11,
    reorder_level = 20,
    expiry_date = DATE '2028-01-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00822';
UPDATE products
SET sku = 'NPH-00704',
    name = 'KOLOURS Thai Tamarind-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.99,
    cost = 45.97,
    reorder_level = 20,
    expiry_date = DATE '2028-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00823';
UPDATE products
SET sku = 'MED-00366',
    name = 'KOOLFEVER Adults 6 sheets',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.57,
    cost = 27.20,
    reorder_level = 20,
    expiry_date = DATE '2028-09-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00824';
UPDATE products
SET sku = 'MED-00367',
    name = 'KOOLFEVER Babies 2 sheets (12''s) X',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 127.23,
    cost = 104.37,
    reorder_level = 20,
    expiry_date = DATE '2030-03-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00825';
UPDATE products
SET sku = 'MED-00368',
    name = 'KOOLFEVER Babies 6 sheets',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.86,
    cost = 39.44,
    reorder_level = 20,
    expiry_date = DATE '2030-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00826';
UPDATE products
SET sku = 'MED-00369',
    name = 'KOOLFEVER Kids 1 Sheet 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 132.49,
    cost = 104.64,
    reorder_level = 20,
    expiry_date = DATE '2027-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00827';
UPDATE products
SET sku = 'MED-00370',
    name = 'KOOLFEVER Kids 6 sheets',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.89,
    cost = 31.89,
    reorder_level = 20,
    expiry_date = DATE '2028-12-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00828';
UPDATE products
SET sku = 'MED-00371',
    name = 'KREMIL-S ADVANCE Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 21.06,
    cost = 16.15,
    reorder_level = 20,
    expiry_date = DATE '2028-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00829';
UPDATE products
SET sku = 'MED-00372',
    name = 'KREMIL-S Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 11.84,
    cost = 9.78,
    reorder_level = 20,
    expiry_date = DATE '2030-01-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00830';
UPDATE products
SET sku = 'MED-00373',
    name = 'KWELL Shampoo 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 26.67,
    cost = 20.90,
    reorder_level = 20,
    expiry_date = DATE '2028-06-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00831';
UPDATE products
SET sku = 'MED-00374',
    name = 'KWELL Shampoo 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.21,
    cost = 27.59,
    reorder_level = 20,
    expiry_date = DATE '2027-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00832';
UPDATE products
SET sku = 'MED-00375',
    name = 'KWELL Shampoo Sachet 10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 48.87,
    cost = 38.34,
    reorder_level = 20,
    expiry_date = DATE '2030-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00833';
UPDATE products
SET sku = 'MED-00376',
    name = 'K-Y Jelly 100g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.87,
    cost = 22.25,
    reorder_level = 20,
    expiry_date = DATE '2029-01-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00834';
UPDATE products
SET sku = 'MED-00377',
    name = 'LACTACYD Blue  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 56.16,
    cost = 43.35,
    reorder_level = 20,
    expiry_date = DATE '2029-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00835';
UPDATE products
SET sku = 'MED-00378',
    name = 'LACTACYD Blue 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 69.80,
    cost = 56.49,
    reorder_level = 20,
    expiry_date = DATE '2030-05-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00836';
UPDATE products
SET sku = 'MED-00379',
    name = 'LACTACYD Blue 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 169.49,
    cost = 129.45,
    reorder_level = 20,
    expiry_date = DATE '2028-05-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00837';
UPDATE products
SET sku = 'MED-00380',
    name = 'LACTACYD Blue 250mL + Baby Wash',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 131.05,
    cost = 100.72,
    reorder_level = 20,
    expiry_date = DATE '2029-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00838';
UPDATE products
SET sku = 'MED-00381',
    name = 'LACTACYD Cool & Fresh  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 32.15,
    cost = 26.54,
    reorder_level = 20,
    expiry_date = DATE '2030-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00839';
UPDATE products
SET sku = 'MED-00382',
    name = 'LACTACYD Cool & Fresh 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 79.19,
    cost = 65.70,
    reorder_level = 20,
    expiry_date = DATE '2028-09-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00840';
UPDATE products
SET sku = 'MED-00383',
    name = 'LACTACYD Cool & Fresh 5mL Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.04,
    cost = 7.15,
    reorder_level = 20,
    expiry_date = DATE '2028-05-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00841';
UPDATE products
SET sku = 'MED-00384',
    name = 'LACTACYD Pink 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 122.29,
    cost = 94.99,
    reorder_level = 20,
    expiry_date = DATE '2027-02-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00842';
UPDATE products
SET sku = 'MED-00385',
    name = 'LACTACYD Pink 250mL + Pond''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 171.54,
    cost = 134.18,
    reorder_level = 20,
    expiry_date = DATE '2029-07-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00843';
UPDATE products
SET sku = 'MED-00386',
    name = 'LACTACYD Protecting  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.98,
    cost = 32.37,
    reorder_level = 20,
    expiry_date = DATE '2029-06-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00844';
UPDATE products
SET sku = 'MED-00387',
    name = 'LACTACYD Protecting 150mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 98.70,
    cost = 75.13,
    reorder_level = 20,
    expiry_date = DATE '2028-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00845';
UPDATE products
SET sku = 'MED-00388',
    name = 'LACTACYD Protecting 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 144.77,
    cost = 115.97,
    reorder_level = 20,
    expiry_date = DATE '2027-09-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00846';
UPDATE products
SET sku = 'MED-00389',
    name = 'LACTACYD Protecting 5mL Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.22,
    cost = 7.95,
    reorder_level = 20,
    expiry_date = DATE '2030-11-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00847';
UPDATE products
SET sku = 'MED-00390',
    name = 'LACTACYD Revitalize 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 157.95,
    cost = 122.58,
    reorder_level = 20,
    expiry_date = DATE '2029-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00848';
UPDATE products
SET sku = 'MED-00391',
    name = 'LACTACYD Revitalize 5mL Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.57,
    cost = 9.29,
    reorder_level = 20,
    expiry_date = DATE '2029-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00849';
UPDATE products
SET sku = 'MED-00392',
    name = 'LACTACYD Revitalize 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.80,
    cost = 30.77,
    reorder_level = 20,
    expiry_date = DATE '2028-08-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00850';
UPDATE products
SET sku = 'MED-00393',
    name = 'LACTACYD Teens 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 64.01,
    cost = 49.10,
    reorder_level = 20,
    expiry_date = DATE '2028-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00851';
UPDATE products
SET sku = 'MED-00394',
    name = 'LACTACYD White Intimate  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.26,
    cost = 37.34,
    reorder_level = 20,
    expiry_date = DATE '2027-02-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00852';
UPDATE products
SET sku = 'MED-00395',
    name = 'LACTACYD White Intimate 150ml',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 94.86,
    cost = 73.22,
    reorder_level = 20,
    expiry_date = DATE '2027-01-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00853';
UPDATE products
SET sku = 'MED-00396',
    name = 'LACTACYD White Intimate 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 128.29,
    cost = 97.99,
    reorder_level = 20,
    expiry_date = DATE '2027-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00854';
UPDATE products
SET sku = 'MED-00397',
    name = 'LACTACYD White Intimate 5mL Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.99,
    cost = 8.59,
    reorder_level = 20,
    expiry_date = DATE '2030-05-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00855';
UPDATE products
SET sku = 'NPH-00705',
    name = 'LADY Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 32.33,
    cost = 26.88,
    reorder_level = 20,
    expiry_date = DATE '2029-10-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00856';
UPDATE products
SET sku = 'MED-00398',
    name = 'LEVOFLOXACIN 500mg Tablet (Winthrop)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 7.34,
    cost = 5.65,
    reorder_level = 20,
    expiry_date = DATE '2027-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00857';
UPDATE products
SET sku = 'MED-00399',
    name = 'LEVOPRONT Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.33,
    cost = 51.76,
    reorder_level = 20,
    expiry_date = DATE '2030-08-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00858';
UPDATE products
SET sku = 'MED-00400',
    name = 'LEVOPRONT Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 78.07,
    cost = 60.50,
    reorder_level = 20,
    expiry_date = DATE '2029-10-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00859';
UPDATE products
SET sku = 'NPH-00706',
    name = 'LEWIS & PEARL B.Spray70mL-CherryB.',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.32,
    cost = 39.81,
    reorder_level = 20,
    expiry_date = DATE '2027-05-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00860';
UPDATE products
SET sku = 'NPH-00707',
    name = 'LEWIS & PEARL Col.  25mL-Blue Navy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.21,
    cost = 35.46,
    reorder_level = 20,
    expiry_date = DATE '2029-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00861';
UPDATE products
SET sku = 'NPH-00708',
    name = 'LEWIS & PEARL Col.  25mL-C/Fantasy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.70,
    cost = 23.70,
    reorder_level = 20,
    expiry_date = DATE '2028-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00862';
UPDATE products
SET sku = 'NPH-00709',
    name = 'LEWIS & PEARL Col.  25mL-Candy Kiss',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.45,
    cost = 33.31,
    reorder_level = 20,
    expiry_date = DATE '2028-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00863';
UPDATE products
SET sku = 'NPH-00710',
    name = 'LEWIS & PEARL Col.  25mL-Dream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.48,
    cost = 21.03,
    reorder_level = 20,
    expiry_date = DATE '2030-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00864';
UPDATE products
SET sku = 'NPH-00711',
    name = 'LEWIS & PEARL Col.  25mL-Ice Water',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.23,
    cost = 39.19,
    reorder_level = 20,
    expiry_date = DATE '2029-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00865';
UPDATE products
SET sku = 'NPH-00712',
    name = 'LEWIS & PEARL Col.  25mL-New York',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.63,
    cost = 27.62,
    reorder_level = 20,
    expiry_date = DATE '2028-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00866';
UPDATE products
SET sku = 'NPH-00713',
    name = 'LEWIS & PEARL Col.  25mL-P-Passion',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.52,
    cost = 32.91,
    reorder_level = 20,
    expiry_date = DATE '2028-07-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00867';
UPDATE products
SET sku = 'NPH-00714',
    name = 'LEWIS & PEARL Col.  25mL-Rain',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.61,
    cost = 37.88,
    reorder_level = 20,
    expiry_date = DATE '2028-02-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00868';
UPDATE products
SET sku = 'NPH-00715',
    name = 'LEWIS & PEARL Col.  25mL-Rock''n Rio',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.55,
    cost = 23.74,
    reorder_level = 20,
    expiry_date = DATE '2029-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00869';
UPDATE products
SET sku = 'NPH-00716',
    name = 'LEWIS & PEARL Col.  25mL-Rush',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 19.65,
    cost = 15.83,
    reorder_level = 20,
    expiry_date = DATE '2029-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00870';
UPDATE products
SET sku = 'NPH-00717',
    name = 'LEWIS & PEARL Col.  25mL-SweetParis',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.66,
    cost = 24.38,
    reorder_level = 20,
    expiry_date = DATE '2030-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00871';
UPDATE products
SET sku = 'NPH-00718',
    name = 'LEWIS & PEARL Col.  50mL-Blue Navy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.64,
    cost = 22.50,
    reorder_level = 20,
    expiry_date = DATE '2027-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00872';
UPDATE products
SET sku = 'NPH-00719',
    name = 'LEWIS & PEARL Col.  50mL-C/Fantasy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.37,
    cost = 24.98,
    reorder_level = 20,
    expiry_date = DATE '2028-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00873';
UPDATE products
SET sku = 'NPH-00720',
    name = 'LEWIS & PEARL Col.  50mL-Dream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.47,
    cost = 24.89,
    reorder_level = 20,
    expiry_date = DATE '2030-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00874';
UPDATE products
SET sku = 'NPH-00721',
    name = 'LEWIS & PEARL Col.  50mL-Ice Water',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.95,
    cost = 50.15,
    reorder_level = 20,
    expiry_date = DATE '2030-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00875';
UPDATE products
SET sku = 'NPH-00722',
    name = 'LEWIS & PEARL Col.  50mL-New York',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.40,
    cost = 36.82,
    reorder_level = 20,
    expiry_date = DATE '2029-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00876';
UPDATE products
SET sku = 'NPH-00723',
    name = 'LEWIS & PEARL Col.  50mL-P-Passion',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.40,
    cost = 29.53,
    reorder_level = 20,
    expiry_date = DATE '2027-06-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00877';
UPDATE products
SET sku = 'NPH-00724',
    name = 'LEWIS & PEARL Col.  50mL-Rain',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.24,
    cost = 34.06,
    reorder_level = 20,
    expiry_date = DATE '2028-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00878';
UPDATE products
SET sku = 'NPH-00725',
    name = 'LEWIS & PEARL Col.  50mL-Rock''n Rio',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.29,
    cost = 48.72,
    reorder_level = 20,
    expiry_date = DATE '2027-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00879';
UPDATE products
SET sku = 'NPH-00726',
    name = 'LEWIS & PEARL Col.  50mL-Rush',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.36,
    cost = 34.04,
    reorder_level = 20,
    expiry_date = DATE '2027-08-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00880';
UPDATE products
SET sku = 'NPH-00727',
    name = 'LEWIS & PEARL Col.  50mL-Summer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.53,
    cost = 28.14,
    reorder_level = 20,
    expiry_date = DATE '2027-12-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00881';
UPDATE products
SET sku = 'NPH-00728',
    name = 'LEWIS & PEARL Col.  50mL-SweetParis',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.32,
    cost = 32.94,
    reorder_level = 20,
    expiry_date = DATE '2028-01-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00882';
UPDATE products
SET sku = 'NPH-00729',
    name = 'LEWIS & PEARL Col. 125mL-Blue Navy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.75,
    cost = 23.57,
    reorder_level = 20,
    expiry_date = DATE '2027-02-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00883';
UPDATE products
SET sku = 'NPH-00730',
    name = 'LEWIS & PEARL Col. 125mL-C/Fantasy',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.09,
    cost = 38.20,
    reorder_level = 20,
    expiry_date = DATE '2028-12-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00884';
UPDATE products
SET sku = 'NPH-00731',
    name = 'LEWIS & PEARL Col. 125mL-Candy Kiss',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.67,
    cost = 21.13,
    reorder_level = 20,
    expiry_date = DATE '2029-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00885';
UPDATE products
SET sku = 'NPH-00732',
    name = 'LEWIS & PEARL Col. 125mL-Dream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.61,
    cost = 32.63,
    reorder_level = 20,
    expiry_date = DATE '2030-06-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00886';
UPDATE products
SET sku = 'NPH-00733',
    name = 'LEWIS & PEARL Col. 125mL-Ice Water',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.68,
    cost = 26.19,
    reorder_level = 20,
    expiry_date = DATE '2030-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00887';
UPDATE products
SET sku = 'NPH-00734',
    name = 'LEWIS & PEARL Col. 125mL-New York',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.22,
    cost = 40.66,
    reorder_level = 20,
    expiry_date = DATE '2030-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00888';
UPDATE products
SET sku = 'NPH-00735',
    name = 'LEWIS & PEARL Col. 125mL-P-Passion',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 17.70,
    cost = 14.57,
    reorder_level = 20,
    expiry_date = DATE '2028-11-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00889';
UPDATE products
SET sku = 'NPH-00736',
    name = 'LEWIS & PEARL Col. 125mL-Rain',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.24,
    cost = 40.13,
    reorder_level = 20,
    expiry_date = DATE '2029-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00890';
UPDATE products
SET sku = 'NPH-00737',
    name = 'LEWIS & PEARL Col. 125mL-Rock''n Rio',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 18.00,
    cost = 14.68,
    reorder_level = 20,
    expiry_date = DATE '2030-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00891';
UPDATE products
SET sku = 'NPH-00738',
    name = 'LEWIS & PEARL Col. 125mL-Rush',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.90,
    cost = 40.85,
    reorder_level = 20,
    expiry_date = DATE '2027-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00892';
UPDATE products
SET sku = 'NPH-00739',
    name = 'LEWIS & PEARL Col. 125mL-Summer',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 18.80,
    cost = 14.43,
    reorder_level = 20,
    expiry_date = DATE '2027-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00893';
UPDATE products
SET sku = 'NPH-00740',
    name = 'LEWIS & PEARL Col. 125mL-SweetParis',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.38,
    cost = 29.45,
    reorder_level = 20,
    expiry_date = DATE '2029-12-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00894';
UPDATE products
SET sku = 'MED-00401',
    name = 'LICEALIZ Sachet Regular 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 91.60,
    cost = 70.51,
    reorder_level = 20,
    expiry_date = DATE '2030-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00895';
UPDATE products
SET sku = 'MED-00402',
    name = 'LISTERINE 100mL (Coolmint)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 109.74,
    cost = 89.47,
    reorder_level = 20,
    expiry_date = DATE '2027-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00896';
UPDATE products
SET sku = 'MED-00403',
    name = 'LISTERINE 100mL (Freshburst)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.36,
    cost = 41.03,
    reorder_level = 20,
    expiry_date = DATE '2030-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00897';
UPDATE products
SET sku = 'MED-00404',
    name = 'LISTERINE 100mL (Total Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 64.57,
    cost = 50.55,
    reorder_level = 20,
    expiry_date = DATE '2029-10-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00898';
UPDATE products
SET sku = 'MED-00405',
    name = 'LISTERINE 250mL (Coolmint)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 103.01,
    cost = 85.02,
    reorder_level = 20,
    expiry_date = DATE '2027-04-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00899';
UPDATE products
SET sku = 'MED-00406',
    name = 'LISTERINE 250mL (Fresh Burst)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 73.65,
    cost = 60.71,
    reorder_level = 20,
    expiry_date = DATE '2027-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00900';
UPDATE products
SET sku = 'MED-00407',
    name = 'LISTERINE 250mL (Tartar Control)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 134.44,
    cost = 111.72,
    reorder_level = 20,
    expiry_date = DATE '2027-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00901';
UPDATE products
SET sku = 'MED-00408',
    name = 'LISTERINE 250mL (Total Care Zero)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 118.80,
    cost = 92.16,
    reorder_level = 20,
    expiry_date = DATE '2030-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00902';
UPDATE products
SET sku = 'MED-00409',
    name = 'LISTERINE 250mL (Total Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 85.28,
    cost = 67.99,
    reorder_level = 20,
    expiry_date = DATE '2029-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00903';
UPDATE products
SET sku = 'MED-00410',
    name = 'LIVERAIDE Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.82,
    cost = 9.36,
    reorder_level = 20,
    expiry_date = DATE '2030-12-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00904';
UPDATE products
SET sku = 'MED-00411',
    name = 'LOLA Remedios Sach. Syrup 15mL 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 115.43,
    cost = 89.45,
    reorder_level = 20,
    expiry_date = DATE '2029-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00905';
UPDATE products
SET sku = 'MED-00412',
    name = 'LOMOTIL Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.26,
    cost = 4.80,
    reorder_level = 20,
    expiry_date = DATE '2030-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00906';
UPDATE products
SET sku = 'MED-00413',
    name = 'LORMIDE Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.47,
    cost = 10.05,
    reorder_level = 20,
    expiry_date = DATE '2029-03-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00907';
UPDATE products
SET sku = 'MED-00414',
    name = 'LOSEC 10mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.26,
    cost = 13.74,
    reorder_level = 20,
    expiry_date = DATE '2028-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00908';
UPDATE products
SET sku = 'MED-00415',
    name = 'LOSEC 20mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.36,
    cost = 12.23,
    reorder_level = 20,
    expiry_date = DATE '2030-12-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00909';
UPDATE products
SET sku = 'NPH-00741',
    name = 'LOVELY LOOK Hair Spray  50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.49,
    cost = 22.79,
    reorder_level = 20,
    expiry_date = DATE '2027-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00910';
UPDATE products
SET sku = 'NPH-00742',
    name = 'LOVELY LOOK Hair Spray 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 75.07,
    cost = 60.84,
    reorder_level = 20,
    expiry_date = DATE '2028-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00911';
UPDATE products
SET sku = 'MED-00416',
    name = 'MAALOX No.1  Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 7.77,
    cost = 6.17,
    reorder_level = 20,
    expiry_date = DATE '2028-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00912';
UPDATE products
SET sku = 'MED-00417',
    name = 'MAALOX Plus Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 7.05,
    cost = 5.49,
    reorder_level = 20,
    expiry_date = DATE '2030-03-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00913';
UPDATE products
SET sku = 'MED-00418',
    name = 'MAALOX Suspension  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 66.74,
    cost = 52.55,
    reorder_level = 20,
    expiry_date = DATE '2030-12-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00914';
UPDATE products
SET sku = 'MED-00419',
    name = 'MAALOX Suspension 180mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Antacid / alginate barrier formulation for fast relief from heartburn, acid indigestion, and hyperacidity.',
    quantity = 100,
    price = 50.22,
    cost = 38.80,
    reorder_level = 20,
    expiry_date = DATE '2028-01-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00915';
UPDATE products
SET sku = 'NPH-00743',
    name = 'MANZANILLA   25mL (IPI)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 35.88,
    cost = 28.41,
    reorder_level = 20,
    expiry_date = DATE '2027-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00916';
UPDATE products
SET sku = 'NPH-00744',
    name = 'MANZANILLA   50mL (IPI)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 51.91,
    cost = 39.69,
    reorder_level = 20,
    expiry_date = DATE '2028-09-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00917';
UPDATE products
SET sku = 'NPH-00745',
    name = 'MANZANILLA  100mL (IPI)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 112.14,
    cost = 89.38,
    reorder_level = 20,
    expiry_date = DATE '2028-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00918';
UPDATE products
SET sku = 'NPH-00746',
    name = 'MANZANILLA  15mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 17.83,
    cost = 14.11,
    reorder_level = 20,
    expiry_date = DATE '2028-10-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00919';
UPDATE products
SET sku = 'NPH-00747',
    name = 'MANZANILLA  30mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 20.29,
    cost = 16.06,
    reorder_level = 20,
    expiry_date = DATE '2027-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00920';
UPDATE products
SET sku = 'NPH-00748',
    name = 'MANZANILLA  30mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 47.91,
    cost = 38.68,
    reorder_level = 20,
    expiry_date = DATE '2029-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00921';
UPDATE products
SET sku = 'NPH-00749',
    name = 'MANZANILLA  60mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 30.52,
    cost = 24.43,
    reorder_level = 20,
    expiry_date = DATE '2027-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00922';
UPDATE products
SET sku = 'NPH-00750',
    name = 'MANZANILLA  60mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 74.64,
    cost = 58.00,
    reorder_level = 20,
    expiry_date = DATE '2028-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00923';
UPDATE products
SET sku = 'MED-00420',
    name = 'MARVELON Tablet 28''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.66,
    cost = 5.29,
    reorder_level = 20,
    expiry_date = DATE '2027-09-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00924';
UPDATE products
SET sku = 'NPH-00751',
    name = 'MASTER Active Whitening F/Scrub 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.31,
    cost = 20.42,
    reorder_level = 20,
    expiry_date = DATE '2029-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00925';
UPDATE products
SET sku = 'NPH-00752',
    name = 'MASTER F/C Active Whitening  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.18,
    cost = 22.45,
    reorder_level = 20,
    expiry_date = DATE '2029-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00926';
UPDATE products
SET sku = 'NPH-00753',
    name = 'MASTER F/C Active Whitening 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.58,
    cost = 43.92,
    reorder_level = 20,
    expiry_date = DATE '2028-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00927';
UPDATE products
SET sku = 'NPH-00754',
    name = 'MASTER F/C Active Whitening 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.81,
    cost = 35.69,
    reorder_level = 20,
    expiry_date = DATE '2027-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00928';
UPDATE products
SET sku = 'NPH-00755',
    name = 'MASTER F/C Anti Pimple  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.56,
    cost = 41.12,
    reorder_level = 20,
    expiry_date = DATE '2027-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00929';
UPDATE products
SET sku = 'NPH-00756',
    name = 'MASTER F/C Anti Pimple 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.90,
    cost = 29.60,
    reorder_level = 20,
    expiry_date = DATE '2030-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00930';
UPDATE products
SET sku = 'NPH-00757',
    name = 'MASTER F/C Anti Pimple 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 19.68,
    cost = 15.29,
    reorder_level = 20,
    expiry_date = DATE '2030-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00931';
UPDATE products
SET sku = 'NPH-00758',
    name = 'MASTER F/C Oil Control Max  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.50,
    cost = 24.71,
    reorder_level = 20,
    expiry_date = DATE '2030-02-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00932';
UPDATE products
SET sku = 'NPH-00759',
    name = 'MASTER F/C Oil Control Max 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.19,
    cost = 26.33,
    reorder_level = 20,
    expiry_date = DATE '2029-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00933';
UPDATE products
SET sku = 'NPH-00760',
    name = 'MASTER F/C Oil Control Max 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.46,
    cost = 39.76,
    reorder_level = 20,
    expiry_date = DATE '2030-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00934';
UPDATE products
SET sku = 'NPH-00761',
    name = 'MASTER F/C Whitening Plus  70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.13,
    cost = 34.55,
    reorder_level = 20,
    expiry_date = DATE '2027-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00935';
UPDATE products
SET sku = 'NPH-00762',
    name = 'MASTER F/C Whitening Plus 135mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.96,
    cost = 49.47,
    reorder_level = 20,
    expiry_date = DATE '2028-04-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00936';
UPDATE products
SET sku = 'NPH-00763',
    name = 'MASTER F/C Whitening Plus 225mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 37.69,
    cost = 31.00,
    reorder_level = 20,
    expiry_date = DATE '2027-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00937';
UPDATE products
SET sku = 'NPH-00764',
    name = 'MASTER F/Wash  50mL (Derma-C)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.58,
    cost = 53.41,
    reorder_level = 20,
    expiry_date = DATE '2030-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00938';
UPDATE products
SET sku = 'NPH-00765',
    name = 'MASTER Facial Scrub  50mL (Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 73.33,
    cost = 56.76,
    reorder_level = 20,
    expiry_date = DATE '2028-12-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00939';
UPDATE products
SET sku = 'NPH-00766',
    name = 'MASTER Oil Control Facial Scrub 4g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.07,
    cost = 46.01,
    reorder_level = 20,
    expiry_date = DATE '2029-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00940';
UPDATE products
SET sku = 'NPH-00767',
    name = 'MASTER Oil Control Max Facial Scrub 50g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.09,
    cost = 34.19,
    reorder_level = 20,
    expiry_date = DATE '2028-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00941';
UPDATE products
SET sku = 'NPH-00768',
    name = 'MASTER Whitening Plus F/Scrub  50g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.69,
    cost = 47.00,
    reorder_level = 20,
    expiry_date = DATE '2028-03-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00942';
UPDATE products
SET sku = 'NPH-00769',
    name = 'MASTER Whitening Plus F/Scrub 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.27,
    cost = 46.65,
    reorder_level = 20,
    expiry_date = DATE '2030-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00943';
UPDATE products
SET sku = 'NPH-00770',
    name = 'MASTER Whtng Plus Facial Scrub 4g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.56,
    cost = 54.57,
    reorder_level = 20,
    expiry_date = DATE '2029-04-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00944';
UPDATE products
SET sku = 'NPH-00771',
    name = 'MAXI-PEEL #1 60mL+free Moist.crm-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 30.56,
    cost = 23.84,
    reorder_level = 20,
    expiry_date = DATE '2030-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00945';
UPDATE products
SET sku = 'NPH-00772',
    name = 'MAXI-PEEL #2 60mL+free Moist.crm-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 65.72,
    cost = 50.73,
    reorder_level = 20,
    expiry_date = DATE '2027-07-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00946';
UPDATE products
SET sku = 'NPH-00773',
    name = 'MAXI-PEEL #3 60mL+free Moist.crm-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 52.73,
    cost = 40.61,
    reorder_level = 20,
    expiry_date = DATE '2027-03-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00947';
UPDATE products
SET sku = 'NPH-00774',
    name = 'MAXI-PEEL Astringent #1 60mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 64.45,
    cost = 50.60,
    reorder_level = 20,
    expiry_date = DATE '2028-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00948';
UPDATE products
SET sku = 'NPH-00775',
    name = 'MAXI-PEEL Astringent #2 15mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 20.01,
    cost = 16.38,
    reorder_level = 20,
    expiry_date = DATE '2029-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00949';
UPDATE products
SET sku = 'NPH-00776',
    name = 'MAXI-PEEL Astringent #2 30mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 30.29,
    cost = 23.79,
    reorder_level = 20,
    expiry_date = DATE '2029-06-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00950';
UPDATE products
SET sku = 'NPH-00777',
    name = 'MAXI-PEEL Astringent #2 60mL 3+1-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 64.23,
    cost = 48.85,
    reorder_level = 20,
    expiry_date = DATE '2027-02-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00951';
UPDATE products
SET sku = 'NPH-00778',
    name = 'MAXI-PEEL Astringent #2 60mL+Sunprtcrm15g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 48.99,
    cost = 39.68,
    reorder_level = 20,
    expiry_date = DATE '2029-03-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00952';
UPDATE products
SET sku = 'NPH-00779',
    name = 'MAXI-PEEL Astringent #2 60mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 43.37,
    cost = 35.44,
    reorder_level = 20,
    expiry_date = DATE '2028-07-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00953';
UPDATE products
SET sku = 'NPH-00780',
    name = 'MAXI-PEEL Astringent #3 15mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 36.98,
    cost = 28.93,
    reorder_level = 20,
    expiry_date = DATE '2028-05-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00954';
UPDATE products
SET sku = 'NPH-00781',
    name = 'MAXI-PEEL Astringent #3 30mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 27.93,
    cost = 22.70,
    reorder_level = 20,
    expiry_date = DATE '2030-01-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00955';
UPDATE products
SET sku = 'NPH-00782',
    name = 'MAXI-PEEL Astringent #3 60mL 3+1-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 64.42,
    cost = 53.19,
    reorder_level = 20,
    expiry_date = DATE '2028-02-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00956';
UPDATE products
SET sku = 'NPH-00783',
    name = 'MAXI-PEEL Astringent #3 60mL 8+4 R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 35.70,
    cost = 27.92,
    reorder_level = 20,
    expiry_date = DATE '2027-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00957';
UPDATE products
SET sku = 'NPH-00784',
    name = 'MAXI-PEEL Astringent #3 60mL+Sunprtcrm15g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 57.09,
    cost = 46.05,
    reorder_level = 20,
    expiry_date = DATE '2027-07-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00958';
UPDATE products
SET sku = 'NPH-00785',
    name = 'MAXI-PEEL Astringent #3 60mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 35.71,
    cost = 28.85,
    reorder_level = 20,
    expiry_date = DATE '2027-01-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00959';
UPDATE products
SET sku = 'NPH-00786',
    name = 'MAXI-PEEL Conc.Crm.Fair 10g 12s-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 91.47,
    cost = 74.19,
    reorder_level = 20,
    expiry_date = DATE '2030-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00960';
UPDATE products
SET sku = 'NPH-00787',
    name = 'MAXI-PEEL Conc.Crm.Fair 10g 2+1- R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 40.69,
    cost = 30.91,
    reorder_level = 20,
    expiry_date = DATE '2029-12-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00961';
UPDATE products
SET sku = 'NPH-00788',
    name = 'MAXI-PEEL Conc.Crm.Fair 10g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 49.83,
    cost = 39.94,
    reorder_level = 20,
    expiry_date = DATE '2029-05-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00962';
UPDATE products
SET sku = 'NPH-00789',
    name = 'MAXI-PEEL Conc.Crm.Nat. 10g 12''s-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 128.29,
    cost = 105.75,
    reorder_level = 20,
    expiry_date = DATE '2028-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00963';
UPDATE products
SET sku = 'NPH-00790',
    name = 'MAXI-PEEL Conc.Crm.Nat. 10g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 32.06,
    cost = 25.78,
    reorder_level = 20,
    expiry_date = DATE '2027-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00964';
UPDATE products
SET sku = 'NPH-00791',
    name = 'MAXI-PEEL Concealing Crm. Fair 25g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 45.65,
    cost = 37.84,
    reorder_level = 20,
    expiry_date = DATE '2029-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00965';
UPDATE products
SET sku = 'NPH-00792',
    name = 'MAXI-PEEL Concealing Crm. Nat. 25g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 36.59,
    cost = 29.06,
    reorder_level = 20,
    expiry_date = DATE '2028-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00966';
UPDATE products
SET sku = 'NPH-00793',
    name = 'MAXI-PEEL Facial Wash 25g-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 19.77,
    cost = 15.88,
    reorder_level = 20,
    expiry_date = DATE '2027-05-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00967';
UPDATE products
SET sku = 'NPH-00794',
    name = 'MAXI-PEEL Facial Wash 7g Sach.12''s-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 133.40,
    cost = 103.04,
    reorder_level = 20,
    expiry_date = DATE '2029-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00968';
UPDATE products
SET sku = 'NPH-00795',
    name = 'MAXI-PEEL Facial Wash 7g Sach-N (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 39.39,
    cost = 30.04,
    reorder_level = 20,
    expiry_date = DATE '2028-05-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00969';
UPDATE products
SET sku = 'NPH-00796',
    name = 'MAXI-PEEL Moistrizing Crm 15g 2+1-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 46.58,
    cost = 36.06,
    reorder_level = 20,
    expiry_date = DATE '2027-06-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00970';
UPDATE products
SET sku = 'NPH-00797',
    name = 'MAXI-PEEL Moisturizing Cream 15g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 45.52,
    cost = 37.60,
    reorder_level = 20,
    expiry_date = DATE '2028-02-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00971';
UPDATE products
SET sku = 'NPH-00798',
    name = 'MAXI-PEEL Moisturizing Cream 25g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 51.87,
    cost = 39.51,
    reorder_level = 20,
    expiry_date = DATE '2028-02-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00972';
UPDATE products
SET sku = 'NPH-00799',
    name = 'MAXI-PEEL Moisturizing Cream 8g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 41.99,
    cost = 31.92,
    reorder_level = 20,
    expiry_date = DATE '2029-12-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00973';
UPDATE products
SET sku = 'NPH-00800',
    name = 'MAXI-PEEL Moisturizing Crm 15g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 27.87,
    cost = 23.18,
    reorder_level = 20,
    expiry_date = DATE '2027-09-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00974';
UPDATE products
SET sku = 'NPH-00801',
    name = 'MAXI-PEEL Moisturizing Crm 8g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 27.41,
    cost = 21.25,
    reorder_level = 20,
    expiry_date = DATE '2027-07-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00975';
UPDATE products
SET sku = 'NPH-00802',
    name = 'MAXI-PEEL Soap Ppya Enzym  65g-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 45.03,
    cost = 36.33,
    reorder_level = 20,
    expiry_date = DATE '2027-05-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00976';
UPDATE products
SET sku = 'NPH-00803',
    name = 'MAXI-PEEL Soap Ppya Enzym  90g-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 54.36,
    cost = 43.45,
    reorder_level = 20,
    expiry_date = DATE '2027-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00977';
UPDATE products
SET sku = 'NPH-00804',
    name = 'MAXI-PEEL Soap Ppya Enzym 125g-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 30.75,
    cost = 23.42,
    reorder_level = 20,
    expiry_date = DATE '2030-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00978';
UPDATE products
SET sku = 'NPH-00805',
    name = 'MAXI-PEEL Sunblock Cream  8g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 33.57,
    cost = 25.85,
    reorder_level = 20,
    expiry_date = DATE '2027-07-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00979';
UPDATE products
SET sku = 'NPH-00806',
    name = 'MAXI-PEEL Sunblock Cream  8g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 28.08,
    cost = 22.72,
    reorder_level = 20,
    expiry_date = DATE '2027-11-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00980';
UPDATE products
SET sku = 'NPH-00807',
    name = 'MAXI-PEEL Sunblock Cream 15g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 35.33,
    cost = 26.86,
    reorder_level = 20,
    expiry_date = DATE '2027-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00981';
UPDATE products
SET sku = 'NPH-00808',
    name = 'MAXI-PEEL Sunblock Cream 15g-R (S)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 19.73,
    cost = 15.47,
    reorder_level = 20,
    expiry_date = DATE '2030-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00982';
UPDATE products
SET sku = 'NPH-00809',
    name = 'MAXI-PEEL Sunblock Cream 25g-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 50.60,
    cost = 39.32,
    reorder_level = 20,
    expiry_date = DATE '2027-03-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00983';
UPDATE products
SET sku = 'NPH-00810',
    name = 'MAXI-PEEL Sunblock Crm 15g 2+1-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 44.12,
    cost = 36.27,
    reorder_level = 20,
    expiry_date = DATE '2030-08-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00984';
UPDATE products
SET sku = 'NPH-00811',
    name = 'MAXI-PEEL Zero 50mL-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 37.12,
    cost = 29.48,
    reorder_level = 20,
    expiry_date = DATE '2028-08-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00985';
UPDATE products
SET sku = 'NPH-00812',
    name = 'MAXI-PEEL#2 60+SB25+MC25+FW25-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Deep-cleansing facial cleanser / toner for controlling excess oil, blemishes, and acne prevention.',
    quantity = 100,
    price = 56.49,
    cost = 45.65,
    reorder_level = 20,
    expiry_date = DATE '2029-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00986';
UPDATE products
SET sku = 'MED-00421',
    name = 'MAXVIT Softgel Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.60,
    cost = 11.83,
    reorder_level = 20,
    expiry_date = DATE '2029-11-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00987';
UPDATE products
SET sku = 'MED-00422',
    name = 'MEDICOL Advance 200 Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.98,
    cost = 8.56,
    reorder_level = 20,
    expiry_date = DATE '2027-04-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00988';
UPDATE products
SET sku = 'MED-00423',
    name = 'MEDICOL Advance 400 Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.64,
    cost = 15.76,
    reorder_level = 20,
    expiry_date = DATE '2027-02-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00989';
UPDATE products
SET sku = 'MED-00424',
    name = 'MEDIFORTAN-AS Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.16,
    cost = 8.98,
    reorder_level = 20,
    expiry_date = DATE '2029-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00990';
UPDATE products
SET sku = 'MED-00425',
    name = 'MEFENAMIC ACID 500mg (Winthrop)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-steroidal anti-inflammatory analgesic (NSAID) for dental pain, dysmenorrhea, and inflammatory aches.',
    quantity = 100,
    price = 22.55,
    cost = 17.80,
    reorder_level = 20,
    expiry_date = DATE '2029-05-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00991';
UPDATE products
SET sku = 'MED-00426',
    name = 'MELOXICAM  7.5mg Tablet (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.97,
    cost = 9.42,
    reorder_level = 20,
    expiry_date = DATE '2027-04-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00992';
UPDATE products
SET sku = 'MED-00427',
    name = 'MELOXICAM  7.5mg Tablet (Winthrop)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.23,
    cost = 4.99,
    reorder_level = 20,
    expiry_date = DATE '2029-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00993';
UPDATE products
SET sku = 'MED-00428',
    name = 'MELOXICAM 15mg Tab (FLAMICXINE)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.73,
    cost = 16.60,
    reorder_level = 20,
    expiry_date = DATE '2029-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00994';
UPDATE products
SET sku = 'MED-00429',
    name = 'MELOXICAM 15mg Tablet (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.50,
    cost = 17.47,
    reorder_level = 20,
    expiry_date = DATE '2027-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00995';
UPDATE products
SET sku = 'MED-00430',
    name = 'MELOXICAM 15mg Tablet (Winthrop)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.21,
    cost = 12.75,
    reorder_level = 20,
    expiry_date = DATE '2029-04-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00996';
UPDATE products
SET sku = 'MED-00431',
    name = 'MEMO PLUS GOLD Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.85,
    cost = 7.23,
    reorder_level = 20,
    expiry_date = DATE '2030-12-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00997';
UPDATE products
SET sku = 'MED-00432',
    name = 'MEMORY PLUS PREMIUM  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.30,
    cost = 28.50,
    reorder_level = 20,
    expiry_date = DATE '2029-04-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00998';
UPDATE products
SET sku = 'MED-00433',
    name = 'MEMORY PLUS PREMIUM 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 107.63,
    cost = 86.26,
    reorder_level = 20,
    expiry_date = DATE '2030-03-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-00999';
UPDATE products
SET sku = 'MED-00434',
    name = 'MEMORY PLUS Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 60.75,
    cost = 46.35,
    reorder_level = 20,
    expiry_date = DATE '2027-03-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01000';
UPDATE products
SET sku = 'MED-00435',
    name = 'MEMORY PLUS Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.04,
    cost = 36.52,
    reorder_level = 20,
    expiry_date = DATE '2027-04-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01001';
UPDATE products
SET sku = 'NPH-00813',
    name = 'MENA Cream Stick',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 69.83,
    cost = 53.03,
    reorder_level = 20,
    expiry_date = DATE '2028-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01002';
UPDATE products
SET sku = 'NPH-00814',
    name = 'MENA Facial Cream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.44,
    cost = 47.58,
    reorder_level = 20,
    expiry_date = DATE '2030-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01003';
UPDATE products
SET sku = 'NPH-00815',
    name = 'MENA Pearl White Cream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 54.78,
    cost = 42.50,
    reorder_level = 20,
    expiry_date = DATE '2027-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01004';
UPDATE products
SET sku = 'MED-00436',
    name = 'MEPTIN Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 54.37,
    cost = 42.55,
    reorder_level = 20,
    expiry_date = DATE '2030-03-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01005';
UPDATE products
SET sku = 'MED-00437',
    name = 'MEPTIN Tablet 25mcg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.78,
    cost = 7.65,
    reorder_level = 20,
    expiry_date = DATE '2029-08-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01006';
UPDATE products
SET sku = 'MED-00438',
    name = 'MEPTIN Tablet 50mcg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.77,
    cost = 11.03,
    reorder_level = 20,
    expiry_date = DATE '2030-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01007';
UPDATE products
SET sku = 'MED-00439',
    name = 'METRONIDAZOLE 500mg (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.85,
    cost = 27.30,
    reorder_level = 20,
    expiry_date = DATE '2029-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01008';
UPDATE products
SET sku = 'MED-00440',
    name = 'METRONIDAZOLE Suspension (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.02,
    cost = 15.77,
    reorder_level = 20,
    expiry_date = DATE '2027-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01009';
UPDATE products
SET sku = 'MED-00441',
    name = 'MICROPIL Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.73,
    cost = 22.44,
    reorder_level = 20,
    expiry_date = DATE '2030-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01010';
UPDATE products
SET sku = 'MED-00442',
    name = 'MIDOL Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.52,
    cost = 12.85,
    reorder_level = 20,
    expiry_date = DATE '2030-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01011';
UPDATE products
SET sku = 'NPH-00816',
    name = 'MILCU 2-N-1 Underarm /Foot Powder 40g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.54,
    cost = 21.52,
    reorder_level = 20,
    expiry_date = DATE '2028-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01012';
UPDATE products
SET sku = 'NPH-00817',
    name = 'MILCU 2-N-1 Underarm /Foot Powder 80g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 40.83,
    cost = 31.04,
    reorder_level = 20,
    expiry_date = DATE '2030-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01013';
UPDATE products
SET sku = 'NPH-00818',
    name = 'MILCU Deodorant Roll-On 50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.13,
    cost = 46.20,
    reorder_level = 20,
    expiry_date = DATE '2029-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01014';
UPDATE products
SET sku = 'NPH-00819',
    name = 'MINERAL OIL 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 53.58,
    cost = 41.84,
    reorder_level = 20,
    expiry_date = DATE '2030-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01015';
UPDATE products
SET sku = 'NPH-00820',
    name = 'MINERAL OIL 30mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 47.75,
    cost = 39.64,
    reorder_level = 20,
    expiry_date = DATE '2029-01-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01016';
UPDATE products
SET sku = 'NPH-00821',
    name = 'MINERAL OIL 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 66.16,
    cost = 53.70,
    reorder_level = 20,
    expiry_date = DATE '2028-06-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01017';
UPDATE products
SET sku = 'NPH-00822',
    name = 'MINERAL OIL 60mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 49.74,
    cost = 38.13,
    reorder_level = 20,
    expiry_date = DATE '2030-05-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01018';
UPDATE products
SET sku = 'MED-00443',
    name = 'MOBIC 15mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.63,
    cost = 4.68,
    reorder_level = 20,
    expiry_date = DATE '2029-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01019';
UPDATE products
SET sku = 'NPH-00823',
    name = 'MODESS All Nights 4''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.78,
    cost = 37.91,
    reorder_level = 20,
    expiry_date = DATE '2029-08-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01020';
UPDATE products
SET sku = 'NPH-00824',
    name = 'MODESS Cottony Non-Wing  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.31,
    cost = 48.02,
    reorder_level = 20,
    expiry_date = DATE '2029-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01021';
UPDATE products
SET sku = 'NPH-00825',
    name = 'MODESS Cottony Non-Wing 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 76.79,
    cost = 62.57,
    reorder_level = 20,
    expiry_date = DATE '2030-02-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01022';
UPDATE products
SET sku = 'NPH-00826',
    name = 'MODESS Cottony w/ Wing 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.18,
    cost = 49.91,
    reorder_level = 20,
    expiry_date = DATE '2029-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01023';
UPDATE products
SET sku = 'NPH-00827',
    name = 'MODESS Cottony w/ Wing Single 16''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 76.45,
    cost = 58.21,
    reorder_level = 20,
    expiry_date = DATE '2027-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01024';
UPDATE products
SET sku = 'NPH-00828',
    name = 'MODESS Dry Max Reg With Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.95,
    cost = 47.22,
    reorder_level = 20,
    expiry_date = DATE '2029-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01025';
UPDATE products
SET sku = 'NPH-00829',
    name = 'MODESS Maternity 7''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 22.66,
    cost = 18.77,
    reorder_level = 20,
    expiry_date = DATE '2027-02-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01026';
UPDATE products
SET sku = 'MED-00444',
    name = 'MORIAMIN Forte Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.69,
    cost = 7.45,
    reorder_level = 20,
    expiry_date = DATE '2030-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01027';
UPDATE products
SET sku = 'MED-00445',
    name = 'MOSEGOR-VITA Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.24,
    cost = 14.23,
    reorder_level = 20,
    expiry_date = DATE '2030-06-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01028';
UPDATE products
SET sku = 'MED-00446',
    name = 'MOSEGOR-VITA Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 55.79,
    cost = 43.10,
    reorder_level = 20,
    expiry_date = DATE '2029-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01029';
UPDATE products
SET sku = 'MED-00447',
    name = 'MOSEGOR-VITA Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 113.24,
    cost = 86.87,
    reorder_level = 20,
    expiry_date = DATE '2028-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01030';
UPDATE products
SET sku = 'MED-00448',
    name = 'MOTILIUM Suspension 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 115.61,
    cost = 90.53,
    reorder_level = 20,
    expiry_date = DATE '2028-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01031';
UPDATE products
SET sku = 'MED-00449',
    name = 'MOTILIUM Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.27,
    cost = 14.91,
    reorder_level = 20,
    expiry_date = DATE '2030-03-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01032';
UPDATE products
SET sku = 'MED-00450',
    name = 'MUCOBRON Forte Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.96,
    cost = 9.74,
    reorder_level = 20,
    expiry_date = DATE '2027-09-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01033';
UPDATE products
SET sku = 'MED-00451',
    name = 'MUCOBRON Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.45,
    cost = 40.40,
    reorder_level = 20,
    expiry_date = DATE '2030-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01034';
UPDATE products
SET sku = 'MED-00452',
    name = 'MUCOBRON Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 78.47,
    cost = 64.44,
    reorder_level = 20,
    expiry_date = DATE '2029-06-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01035';
UPDATE products
SET sku = 'MED-00453',
    name = 'MUCOBRON-D Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 68.55,
    cost = 52.87,
    reorder_level = 20,
    expiry_date = DATE '2028-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01036';
UPDATE products
SET sku = 'MED-00454',
    name = 'MUCOBRON-D Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 102.82,
    cost = 79.04,
    reorder_level = 20,
    expiry_date = DATE '2030-06-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01037';
UPDATE products
SET sku = 'MED-00455',
    name = 'MUCOSOLVAN Drops 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 51.77,
    cost = 41.76,
    reorder_level = 20,
    expiry_date = DATE '2030-07-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01038';
UPDATE products
SET sku = 'MED-00456',
    name = 'MUCOSOLVAN Retard Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 14.50,
    cost = 11.64,
    reorder_level = 20,
    expiry_date = DATE '2027-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01039';
UPDATE products
SET sku = 'MED-00457',
    name = 'MUCOSOLVAN Syrup Adult  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 31.16,
    cost = 24.27,
    reorder_level = 20,
    expiry_date = DATE '2028-07-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01040';
UPDATE products
SET sku = 'MED-00458',
    name = 'MUCOSOLVAN Syrup Adult 125mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 21.03,
    cost = 16.52,
    reorder_level = 20,
    expiry_date = DATE '2030-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01041';
UPDATE products
SET sku = 'MED-00459',
    name = 'MUCOSOLVAN Syrup Pedia  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 40.66,
    cost = 31.60,
    reorder_level = 20,
    expiry_date = DATE '2028-09-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01042';
UPDATE products
SET sku = 'MED-00460',
    name = 'MUCOSOLVAN Syrup Pedia 125mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 26.57,
    cost = 20.58,
    reorder_level = 20,
    expiry_date = DATE '2027-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01043';
UPDATE products
SET sku = 'MED-00461',
    name = 'MUCOSOLVAN Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 17.09,
    cost = 13.54,
    reorder_level = 20,
    expiry_date = DATE '2030-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01044';
UPDATE products
SET sku = 'MED-00462',
    name = 'MUPICIN Ointment 5g*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 30.33,
    cost = 24.63,
    reorder_level = 20,
    expiry_date = DATE '2030-12-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01045';
UPDATE products
SET sku = 'MED-00463',
    name = 'MX3 Coffee Mix 10''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 103.28,
    cost = 79.92,
    reorder_level = 20,
    expiry_date = DATE '2029-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01046';
UPDATE products
SET sku = 'MED-00464',
    name = 'MYONAL 50mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.22,
    cost = 14.89,
    reorder_level = 20,
    expiry_date = DATE '2030-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01047';
UPDATE products
SET sku = 'MED-00465',
    name = 'MYRA-300 E Capsule  30''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 371.34,
    cost = 294.83,
    reorder_level = 20,
    expiry_date = DATE '2029-02-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01048';
UPDATE products
SET sku = 'MED-00466',
    name = 'MYRA-400 E Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.49,
    cost = 14.31,
    reorder_level = 20,
    expiry_date = DATE '2028-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01049';
UPDATE products
SET sku = 'MED-00467',
    name = 'MYRACOF Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.42,
    cost = 13.10,
    reorder_level = 20,
    expiry_date = DATE '2027-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01050';
UPDATE products
SET sku = 'MED-00468',
    name = 'MYRA-E Facial Moisturizer 50mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.77,
    cost = 27.02,
    reorder_level = 20,
    expiry_date = DATE '2030-09-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01051';
UPDATE products
SET sku = 'MED-00469',
    name = 'MYRIN Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.53,
    cost = 17.10,
    reorder_level = 20,
    expiry_date = DATE '2030-01-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01052';
UPDATE products
SET sku = 'MED-00470',
    name = 'MYRIN-P Forte Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.30,
    cost = 16.31,
    reorder_level = 20,
    expiry_date = DATE '2027-08-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01053';
UPDATE products
SET sku = 'MED-00471',
    name = 'NAFARIN-A Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.22,
    cost = 16.57,
    reorder_level = 20,
    expiry_date = DATE '2029-09-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01054';
UPDATE products
SET sku = 'MED-00472',
    name = 'NAPROXEN 550mg Tablet (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Non-steroidal anti-inflammatory analgesic (NSAID) for dental pain, dysmenorrhea, and inflammatory aches.',
    quantity = 100,
    price = 16.27,
    cost = 13.30,
    reorder_level = 20,
    expiry_date = DATE '2027-05-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01055';
UPDATE products
SET sku = 'MED-00473',
    name = 'NASATAPP Drops',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.83,
    cost = 29.49,
    reorder_level = 20,
    expiry_date = DATE '2027-08-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01056';
UPDATE products
SET sku = 'MED-00474',
    name = 'NASATAPP Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.06,
    cost = 54.47,
    reorder_level = 20,
    expiry_date = DATE '2028-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01057';
UPDATE products
SET sku = 'MED-00475',
    name = 'NASATAPP Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.19,
    cost = 14.44,
    reorder_level = 20,
    expiry_date = DATE '2028-12-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01058';
UPDATE products
SET sku = 'MED-00476',
    name = 'NASATHERA Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.38,
    cost = 4.10,
    reorder_level = 20,
    expiry_date = DATE '2029-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01059';
UPDATE products
SET sku = 'MED-00477',
    name = 'NATRAVOX 500mg/125mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.36,
    cost = 7.88,
    reorder_level = 20,
    expiry_date = DATE '2030-06-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01060';
UPDATE products
SET sku = 'MED-00478',
    name = 'NATRAVOX Susp. 312.5mg 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 62.10,
    cost = 47.10,
    reorder_level = 20,
    expiry_date = DATE '2028-07-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01061';
UPDATE products
SET sku = 'MED-00479',
    name = 'NATRAVOX Susp.125mg/31.25mg 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 45.17,
    cost = 35.66,
    reorder_level = 20,
    expiry_date = DATE '2030-03-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01062';
UPDATE products
SET sku = 'MED-00480',
    name = 'NATRAVOX Susp.200mg/28.5mg 70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.98,
    cost = 14.88,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01063';
UPDATE products
SET sku = 'MED-00481',
    name = 'NATRAVOX Susp.400mg/57mg 35mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 33.54,
    cost = 26.46,
    reorder_level = 20,
    expiry_date = DATE '2030-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01064';
UPDATE products
SET sku = 'MED-00482',
    name = 'NATRAVOX Susp.400mg/57mg 70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.91,
    cost = 12.97,
    reorder_level = 20,
    expiry_date = DATE '2029-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01065';
UPDATE products
SET sku = 'MED-00483',
    name = 'NATRAVOX Suspension 600mg/ 50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.75,
    cost = 41.57,
    reorder_level = 20,
    expiry_date = DATE '2030-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01066';
UPDATE products
SET sku = 'MED-00484',
    name = 'NATRAVOX Suspension 600mg/100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 81.19,
    cost = 61.86,
    reorder_level = 20,
    expiry_date = DATE '2027-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01067';
UPDATE products
SET sku = 'MED-00485',
    name = 'NATRAVOX Suspension 600mg/70mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 23.50,
    cost = 19.23,
    reorder_level = 20,
    expiry_date = DATE '2027-07-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01068';
UPDATE products
SET sku = 'MED-00486',
    name = 'NEOBLOC  50mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.64,
    cost = 29.62,
    reorder_level = 20,
    expiry_date = DATE '2030-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01069';
UPDATE products
SET sku = 'MED-00487',
    name = 'NEOBLOC 100mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 29.23,
    cost = 22.95,
    reorder_level = 20,
    expiry_date = DATE '2030-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01070';
UPDATE products
SET sku = 'MED-00488',
    name = 'NEO-BROMEXAN Forte Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.93,
    cost = 17.41,
    reorder_level = 20,
    expiry_date = DATE '2027-04-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01071';
UPDATE products
SET sku = 'MED-00489',
    name = 'NEO-BROMEXAN Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 70.55,
    cost = 56.36,
    reorder_level = 20,
    expiry_date = DATE '2029-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01072';
UPDATE products
SET sku = 'MED-00490',
    name = 'NEO-PYRAZON  50mg Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.46,
    cost = 6.97,
    reorder_level = 20,
    expiry_date = DATE '2030-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01073';
UPDATE products
SET sku = 'MED-00491',
    name = 'NEOZEP Drops 10mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 18.10,
    cost = 14.46,
    reorder_level = 20,
    expiry_date = DATE '2027-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01074';
UPDATE products
SET sku = 'MED-00492',
    name = 'NEOZEP Forte Tablet  4''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 44.37,
    cost = 36.58,
    reorder_level = 20,
    expiry_date = DATE '2030-11-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01075';
UPDATE products
SET sku = 'MED-00493',
    name = 'NEOZEP Forte Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 11.58,
    cost = 9.08,
    reorder_level = 20,
    expiry_date = DATE '2030-09-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01076';
UPDATE products
SET sku = 'MED-00494',
    name = 'NEOZEP No-Drowse Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 7.35,
    cost = 6.12,
    reorder_level = 20,
    expiry_date = DATE '2030-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01077';
UPDATE products
SET sku = 'MED-00495',
    name = 'NEOZEP Syrup 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Multi-symptom cold, flu, fever, nasal congestion, and headache relief medication.',
    quantity = 100,
    price = 46.70,
    cost = 35.55,
    reorder_level = 20,
    expiry_date = DATE '2027-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01078';
UPDATE products
SET sku = 'MED-00496',
    name = 'NEUROBION Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.51,
    cost = 9.40,
    reorder_level = 20,
    expiry_date = DATE '2028-02-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01079';
UPDATE products
SET sku = 'MED-00497',
    name = 'NEUROGEN-E Tablet 8''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.54,
    cost = 4.57,
    reorder_level = 20,
    expiry_date = DATE '2027-05-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01080';
UPDATE products
SET sku = 'MED-00498',
    name = 'NEUROGEN-E Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.98,
    cost = 6.86,
    reorder_level = 20,
    expiry_date = DATE '2027-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01081';
UPDATE products
SET sku = 'NPH-00830',
    name = 'NIVEA Creme 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.57,
    cost = 23.69,
    reorder_level = 20,
    expiry_date = DATE '2030-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01082';
UPDATE products
SET sku = 'NPH-00831',
    name = 'NIVEA Creme 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.08,
    cost = 25.47,
    reorder_level = 20,
    expiry_date = DATE '2028-01-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01083';
UPDATE products
SET sku = 'NPH-00832',
    name = 'NIVEA Creme Soap 100g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.81,
    cost = 41.99,
    reorder_level = 20,
    expiry_date = DATE '2027-01-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01084';
UPDATE products
SET sku = 'NPH-00833',
    name = 'NIVEA Lot.  50mL-Extra White S/Firm',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.58,
    cost = 50.34,
    reorder_level = 20,
    expiry_date = DATE '2029-12-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01085';
UPDATE products
SET sku = 'NPH-00834',
    name = 'NIVEA Lot.  50mL-White & Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.03,
    cost = 25.03,
    reorder_level = 20,
    expiry_date = DATE '2027-06-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01086';
UPDATE products
SET sku = 'NPH-00835',
    name = 'NIVEA Lot.  75mL-Intensive Body Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 67.82,
    cost = 53.58,
    reorder_level = 20,
    expiry_date = DATE '2028-11-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01087';
UPDATE products
SET sku = 'NPH-00836',
    name = 'NIVEA Lot. 125mL-Intensive Body Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.31,
    cost = 19.37,
    reorder_level = 20,
    expiry_date = DATE '2027-07-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01088';
UPDATE products
SET sku = 'NPH-00837',
    name = 'NIVEA Lot.125mL-White & Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.04,
    cost = 23.87,
    reorder_level = 20,
    expiry_date = DATE '2029-09-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01089';
UPDATE products
SET sku = 'NPH-00838',
    name = 'NIVEA Lot.250mL-Extra White S/Firm',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 75.93,
    cost = 59.04,
    reorder_level = 20,
    expiry_date = DATE '2027-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01090';
UPDATE products
SET sku = 'NPH-00839',
    name = 'NIVEA Lot.250mL-Intensive',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 84.75,
    cost = 68.13,
    reorder_level = 20,
    expiry_date = DATE '2027-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01091';
UPDATE products
SET sku = 'NPH-00840',
    name = 'NIVEA Lot.250mL-White & Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 112.90,
    cost = 91.50,
    reorder_level = 20,
    expiry_date = DATE '2028-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01092';
UPDATE products
SET sku = 'NPH-00841',
    name = 'NIVEA R-O Men 25mL-Invsble Fresh B/W',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.93,
    cost = 16.47,
    reorder_level = 20,
    expiry_date = DATE '2028-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01093';
UPDATE products
SET sku = 'NPH-00842',
    name = 'NIVEA R-O Men 50mL-Invsble Orig.B/W',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.48,
    cost = 37.36,
    reorder_level = 20,
    expiry_date = DATE '2030-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01094';
UPDATE products
SET sku = 'NPH-00843',
    name = 'NIVEA Roll-On 20mL E/W Serum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.38,
    cost = 21.41,
    reorder_level = 20,
    expiry_date = DATE '2030-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01095';
UPDATE products
SET sku = 'NPH-00844',
    name = 'NIVEA Roll-On 25mL E-White  & Firm',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.64,
    cost = 27.71,
    reorder_level = 20,
    expiry_date = DATE '2028-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01096';
UPDATE products
SET sku = 'NPH-00845',
    name = 'NIVEA Roll-On 25mL-Invsble Clear BW',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.80,
    cost = 20.72,
    reorder_level = 20,
    expiry_date = DATE '2029-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01097';
UPDATE products
SET sku = 'NPH-00846',
    name = 'NIVEA Roll-On 25mL-Pearl',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.48,
    cost = 27.72,
    reorder_level = 20,
    expiry_date = DATE '2028-04-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01098';
UPDATE products
SET sku = 'NPH-00847',
    name = 'NIVEA Roll-On 25mL-Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.33,
    cost = 16.20,
    reorder_level = 20,
    expiry_date = DATE '2030-09-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01099';
UPDATE products
SET sku = 'NPH-00848',
    name = 'NIVEA Roll-On 40mL E/W Serum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 55.12,
    cost = 45.13,
    reorder_level = 20,
    expiry_date = DATE '2030-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01100';
UPDATE products
SET sku = 'NPH-00849',
    name = 'NIVEA Roll-On 50mL E-White & Firm',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 74.27,
    cost = 57.84,
    reorder_level = 20,
    expiry_date = DATE '2027-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01101';
UPDATE products
SET sku = 'NPH-00850',
    name = 'NIVEA Roll-On 50mL-Extra Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.96,
    cost = 40.31,
    reorder_level = 20,
    expiry_date = DATE '2029-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01102';
UPDATE products
SET sku = 'NPH-00851',
    name = 'NIVEA Roll-On 50mL-Invsble Clear BW',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.40,
    cost = 24.52,
    reorder_level = 20,
    expiry_date = DATE '2030-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01103';
UPDATE products
SET sku = 'NPH-00852',
    name = 'NIVEA Roll-On 50mL-Invsble Fresh BW',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.95,
    cost = 34.70,
    reorder_level = 20,
    expiry_date = DATE '2027-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01104';
UPDATE products
SET sku = 'NPH-00853',
    name = 'NIVEA Roll-On 50mL-Pearl',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.18,
    cost = 36.02,
    reorder_level = 20,
    expiry_date = DATE '2029-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01105';
UPDATE products
SET sku = 'NPH-00854',
    name = 'NIVEA Roll-On 50mL-Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.91,
    cost = 36.46,
    reorder_level = 20,
    expiry_date = DATE '2028-10-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01106';
UPDATE products
SET sku = 'NPH-00855',
    name = 'NIVEA Roll-On Men 25mL-Cool Kick',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 22.94,
    cost = 18.93,
    reorder_level = 20,
    expiry_date = DATE '2029-09-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01107';
UPDATE products
SET sku = 'NPH-00856',
    name = 'NIVEA Roll-On Men 25mL-Dry Impact',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.20,
    cost = 41.61,
    reorder_level = 20,
    expiry_date = DATE '2029-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01108';
UPDATE products
SET sku = 'NPH-00857',
    name = 'NIVEA Roll-On Men 25mL-Fresh Active',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.92,
    cost = 32.59,
    reorder_level = 20,
    expiry_date = DATE '2030-03-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01109';
UPDATE products
SET sku = 'NPH-00858',
    name = 'NIVEA Roll-On Men 25mL-Silver Protect',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.46,
    cost = 38.55,
    reorder_level = 20,
    expiry_date = DATE '2029-09-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01110';
UPDATE products
SET sku = 'NPH-00859',
    name = 'NIVEA Roll-On Men 25mL-Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.12,
    cost = 21.53,
    reorder_level = 20,
    expiry_date = DATE '2027-09-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01111';
UPDATE products
SET sku = 'NPH-00860',
    name = 'NIVEA Roll-On Men 50mL-Cool Kick',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.22,
    cost = 28.57,
    reorder_level = 20,
    expiry_date = DATE '2027-01-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01112';
UPDATE products
SET sku = 'NPH-00861',
    name = 'NIVEA Roll-On Men 50mL-Dry Impact',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.64,
    cost = 24.85,
    reorder_level = 20,
    expiry_date = DATE '2028-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01113';
UPDATE products
SET sku = 'NPH-00862',
    name = 'NIVEA Roll-On Men 50mL-Fresh Active',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.73,
    cost = 42.93,
    reorder_level = 20,
    expiry_date = DATE '2030-12-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01114';
UPDATE products
SET sku = 'NPH-00863',
    name = 'NIVEA Roll-On Men 50mL-Silver Protect',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.61,
    cost = 48.80,
    reorder_level = 20,
    expiry_date = DATE '2030-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01115';
UPDATE products
SET sku = 'NPH-00864',
    name = 'NIVEA Roll-On Men 50mL-Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.41,
    cost = 37.30,
    reorder_level = 20,
    expiry_date = DATE '2028-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01116';
UPDATE products
SET sku = 'NPH-00865',
    name = 'NIVEA Roll-On Women 25mL-DryCmfrt',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.78,
    cost = 40.71,
    reorder_level = 20,
    expiry_date = DATE '2028-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01117';
UPDATE products
SET sku = 'NPH-00866',
    name = 'NIVEA Roll-On Women 50mL-DryCmfrt',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.59,
    cost = 35.10,
    reorder_level = 20,
    expiry_date = DATE '2030-02-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01118';
UPDATE products
SET sku = 'MED-00499',
    name = 'NIZORAL Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 45.65,
    cost = 37.41,
    reorder_level = 20,
    expiry_date = DATE '2029-07-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01119';
UPDATE products
SET sku = 'MED-00500',
    name = 'NIZORAL Shampoo Sachet (1% - Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.93,
    cost = 11.34,
    reorder_level = 20,
    expiry_date = DATE '2027-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01120';
UPDATE products
SET sku = 'MED-00501',
    name = 'NIZORAL Shampoo Sachet (2% - Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.37,
    cost = 9.19,
    reorder_level = 20,
    expiry_date = DATE '2030-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01121';
UPDATE products
SET sku = 'MED-00502',
    name = 'NORGESIC Forte Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.40,
    cost = 4.18,
    reorder_level = 20,
    expiry_date = DATE '2030-11-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01122';
UPDATE products
SET sku = 'MED-00503',
    name = 'NORVASC  5mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.74,
    cost = 4.59,
    reorder_level = 20,
    expiry_date = DATE '2028-01-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01123';
UPDATE products
SET sku = 'MED-00504',
    name = 'NORVASC 10mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.30,
    cost = 14.24,
    reorder_level = 20,
    expiry_date = DATE '2030-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01124';
UPDATE products
SET sku = 'MED-00505',
    name = 'NUTRILIN Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.53,
    cost = 30.79,
    reorder_level = 20,
    expiry_date = DATE '2028-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01125';
UPDATE products
SET sku = 'MED-00506',
    name = 'NUTRILIN Drops 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.30,
    cost = 29.22,
    reorder_level = 20,
    expiry_date = DATE '2027-06-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01126';
UPDATE products
SET sku = 'MED-00507',
    name = 'NUTRILIN Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 117.82,
    cost = 92.40,
    reorder_level = 20,
    expiry_date = DATE '2027-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01127';
UPDATE products
SET sku = 'MED-00508',
    name = 'NUTRILIN Syrup 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 73.87,
    cost = 59.78,
    reorder_level = 20,
    expiry_date = DATE '2027-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01128';
UPDATE products
SET sku = 'MED-00509',
    name = 'NUTROPLEX Syrup with Lysine  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 69.69,
    cost = 55.87,
    reorder_level = 20,
    expiry_date = DATE '2030-10-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01129';
UPDATE products
SET sku = 'MED-00510',
    name = 'NUTROPLEX Syrup with Lysine 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 70.04,
    cost = 54.47,
    reorder_level = 20,
    expiry_date = DATE '2028-01-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01130';
UPDATE products
SET sku = 'MED-00511',
    name = 'NUTROPLEX Syrup with Lysine 250mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 110.35,
    cost = 87.56,
    reorder_level = 20,
    expiry_date = DATE '2030-05-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01131';
UPDATE products
SET sku = 'MED-00512',
    name = 'OBYNAL-M Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.77,
    cost = 15.65,
    reorder_level = 20,
    expiry_date = DATE '2029-10-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01132';
UPDATE products
SET sku = 'NPH-00867',
    name = 'OFF Lotion  50mL (Soft and Scented)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 63.62,
    cost = 49.40,
    reorder_level = 20,
    expiry_date = DATE '2027-09-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01133';
UPDATE products
SET sku = 'NPH-00868',
    name = 'OFF Lotion  50mL Kids',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 74.59,
    cost = 57.28,
    reorder_level = 20,
    expiry_date = DATE '2030-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01134';
UPDATE products
SET sku = 'NPH-00869',
    name = 'OFF Lotion  50mL Overtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 61.96,
    cost = 47.96,
    reorder_level = 20,
    expiry_date = DATE '2027-06-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01135';
UPDATE products
SET sku = 'NPH-00870',
    name = 'OFF Lotion  50mL Overtime w/ 3 sach',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.79,
    cost = 33.76,
    reorder_level = 20,
    expiry_date = DATE '2028-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01136';
UPDATE products
SET sku = 'NPH-00871',
    name = 'OFF Lotion 100mL (Soft and Scented)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 73.10,
    cost = 58.14,
    reorder_level = 20,
    expiry_date = DATE '2028-08-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01137';
UPDATE products
SET sku = 'NPH-00872',
    name = 'OFF Lotion 100mL Kids',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 53.22,
    cost = 41.98,
    reorder_level = 20,
    expiry_date = DATE '2027-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01138';
UPDATE products
SET sku = 'NPH-00873',
    name = 'OFF Lotion 100mL Overtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 99.33,
    cost = 75.52,
    reorder_level = 20,
    expiry_date = DATE '2029-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01139';
UPDATE products
SET sku = 'NPH-00874',
    name = 'OFF Lotion Sachet (Clean Feel) X',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 7.50,
    cost = 6.14,
    reorder_level = 20,
    expiry_date = DATE '2030-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01140';
UPDATE products
SET sku = 'NPH-00875',
    name = 'OFF Lotion Sachet Kids',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 10.44,
    cost = 8.62,
    reorder_level = 20,
    expiry_date = DATE '2028-03-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01141';
UPDATE products
SET sku = 'NPH-00876',
    name = 'OFF Lotion Sachet Overtime',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.78,
    cost = 9.22,
    reorder_level = 20,
    expiry_date = DATE '2028-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01142';
UPDATE products
SET sku = 'NPH-00877',
    name = 'OFF Lotion Sachet Soft and Scented',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 12.94,
    cost = 10.08,
    reorder_level = 20,
    expiry_date = DATE '2030-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01143';
UPDATE products
SET sku = 'NPH-00878',
    name = 'OIL OF WINTERGREEN 15 (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 46.87,
    cost = 36.27,
    reorder_level = 20,
    expiry_date = DATE '2027-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01144';
UPDATE products
SET sku = 'NPH-00879',
    name = 'OIL OF WINTERGREEN 15mL (J. Chemie)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 48.18,
    cost = 39.14,
    reorder_level = 20,
    expiry_date = DATE '2028-05-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01145';
UPDATE products
SET sku = 'NPH-00880',
    name = 'OIL OF WINTERGREEN 15mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 27.47,
    cost = 21.22,
    reorder_level = 20,
    expiry_date = DATE '2029-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01146';
UPDATE products
SET sku = 'NPH-00881',
    name = 'OIL OF WINTERGREEN 30 (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 19.36,
    cost = 15.81,
    reorder_level = 20,
    expiry_date = DATE '2030-06-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01147';
UPDATE products
SET sku = 'NPH-00882',
    name = 'OIL OF WINTERGREEN 30mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 34.42,
    cost = 27.15,
    reorder_level = 20,
    expiry_date = DATE '2029-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01148';
UPDATE products
SET sku = 'NPH-00883',
    name = 'OIL OF WINTERGREEN 60 (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 49.57,
    cost = 38.41,
    reorder_level = 20,
    expiry_date = DATE '2030-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01149';
UPDATE products
SET sku = 'NPH-00884',
    name = 'OIL OF WINTERGREEN 60mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 29.55,
    cost = 22.48,
    reorder_level = 20,
    expiry_date = DATE '2029-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01150';
UPDATE products
SET sku = 'NPH-00885',
    name = 'OILGANICS Headlice Shampoo Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 13.56,
    cost = 10.39,
    reorder_level = 20,
    expiry_date = DATE '2029-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01151';
UPDATE products
SET sku = 'NPH-00886',
    name = 'OLAY Facial Foam Sach 7.5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.50,
    cost = 33.37,
    reorder_level = 20,
    expiry_date = DATE '2027-05-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01152';
UPDATE products
SET sku = 'NPH-00887',
    name = 'OLAY N/W Pink Fairness Cream 7.5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.60,
    cost = 24.87,
    reorder_level = 20,
    expiry_date = DATE '2029-02-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01153';
UPDATE products
SET sku = 'NPH-00888',
    name = 'OLAY N/W Pink Fairness Cream 7.5g 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 96.83,
    cost = 78.33,
    reorder_level = 20,
    expiry_date = DATE '2029-06-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01154';
UPDATE products
SET sku = 'NPH-00889',
    name = 'OLAY N/W Yellow w/ Cream 7.5g 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 90.69,
    cost = 69.20,
    reorder_level = 20,
    expiry_date = DATE '2028-07-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01155';
UPDATE products
SET sku = 'NPH-00890',
    name = 'OLAY Nat.White Light Sach 7.5g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.86,
    cost = 23.65,
    reorder_level = 20,
    expiry_date = DATE '2027-07-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01156';
UPDATE products
SET sku = 'NPH-00891',
    name = 'OLAY Nat.White Sach Crm 7.5g 5+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 28.83,
    cost = 23.25,
    reorder_level = 20,
    expiry_date = DATE '2028-11-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01157';
UPDATE products
SET sku = 'NPH-00892',
    name = 'OLAY Pink Fairness Cream 7.5g 2x3''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.18,
    cost = 29.78,
    reorder_level = 20,
    expiry_date = DATE '2029-03-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01158';
UPDATE products
SET sku = 'NPH-00893',
    name = 'OLAY Pinkish Fairness Cream 7.5g 3''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.90,
    cost = 34.30,
    reorder_level = 20,
    expiry_date = DATE '2030-09-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01159';
UPDATE products
SET sku = 'NPH-00894',
    name = 'OLAY Skin Whitng 60g w/ Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 33.11,
    cost = 26.17,
    reorder_level = 20,
    expiry_date = DATE '2028-06-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01160';
UPDATE products
SET sku = 'NPH-00895',
    name = 'OLAY Skin Whitng 60g w/ Rose&Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.96,
    cost = 50.83,
    reorder_level = 20,
    expiry_date = DATE '2028-08-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01161';
UPDATE products
SET sku = 'NPH-00896',
    name = 'OLAY Skin Whitng 60g w/ Vit. C',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.85,
    cost = 38.53,
    reorder_level = 20,
    expiry_date = DATE '2029-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01162';
UPDATE products
SET sku = 'NPH-00897',
    name = 'OLAY Skin Whitng 90g w/ Rose&Milk',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.12,
    cost = 44.62,
    reorder_level = 20,
    expiry_date = DATE '2030-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01163';
UPDATE products
SET sku = 'NPH-00898',
    name = 'OLAY Skin Whitng 90g w/ Vit. C',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.86,
    cost = 31.78,
    reorder_level = 20,
    expiry_date = DATE '2027-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01164';
UPDATE products
SET sku = 'NPH-00899',
    name = 'OLD SPICE  14g (Fresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.97,
    cost = 32.76,
    reorder_level = 20,
    expiry_date = DATE '2027-08-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01165';
UPDATE products
SET sku = 'NPH-00900',
    name = 'OLD SPICE  14g (Pure Sport)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.83,
    cost = 23.77,
    reorder_level = 20,
    expiry_date = DATE '2027-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01166';
UPDATE products
SET sku = 'NPH-00901',
    name = 'OMEGA Pain Killer  15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.32,
    cost = 33.87,
    reorder_level = 20,
    expiry_date = DATE '2027-04-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01167';
UPDATE products
SET sku = 'NPH-00902',
    name = 'OMEGA Pain Killer  30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.77,
    cost = 33.73,
    reorder_level = 20,
    expiry_date = DATE '2029-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01168';
UPDATE products
SET sku = 'NPH-00903',
    name = 'OMEGA Pain Killer  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 35.16,
    cost = 28.48,
    reorder_level = 20,
    expiry_date = DATE '2030-05-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01169';
UPDATE products
SET sku = 'NPH-00904',
    name = 'OMEGA Pain Killer 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.37,
    cost = 49.00,
    reorder_level = 20,
    expiry_date = DATE '2029-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01170';
UPDATE products
SET sku = 'MED-00513',
    name = 'OMEPRAZOLE 20mg (ZOLETESTINE)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.66,
    cost = 10.13,
    reorder_level = 20,
    expiry_date = DATE '2030-01-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01171';
UPDATE products
SET sku = 'MED-00514',
    name = 'OPIGESIC Suppository 125mg 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 332.67,
    cost = 270.99,
    reorder_level = 20,
    expiry_date = DATE '2029-08-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01172';
UPDATE products
SET sku = 'MED-00515',
    name = 'OPIGESIC Suppository 250mg 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 330.96,
    cost = 259.83,
    reorder_level = 20,
    expiry_date = DATE '2027-07-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01173';
UPDATE products
SET sku = 'MED-00516',
    name = 'OTOSOL Ear Drops 10mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 36.60,
    cost = 27.86,
    reorder_level = 20,
    expiry_date = DATE '2027-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01174';
UPDATE products
SET sku = 'NPH-00905',
    name = 'PAGODA Cold Wave 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.79,
    cost = 46.04,
    reorder_level = 20,
    expiry_date = DATE '2029-11-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01175';
UPDATE products
SET sku = 'NPH-00906',
    name = 'PALMOLIVE Sham. 90mL(Brilliant Shine)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 34.07,
    cost = 27.37,
    reorder_level = 20,
    expiry_date = DATE '2028-05-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01176';
UPDATE products
SET sku = 'NPH-00907',
    name = 'PALMOLIVE Sham. 90mL(Grn:H/Smooth)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 53.80,
    cost = 43.57,
    reorder_level = 20,
    expiry_date = DATE '2028-07-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01177';
UPDATE products
SET sku = 'NPH-00908',
    name = 'PALMOLIVE Sham. 90mL(Pink: Dry)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 33.44,
    cost = 27.16,
    reorder_level = 20,
    expiry_date = DATE '2029-01-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01178';
UPDATE products
SET sku = 'NPH-00909',
    name = 'PALMOLIVE Sham.180mL(Anti-Hair Fall)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 72.03,
    cost = 59.55,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01179';
UPDATE products
SET sku = 'NPH-00910',
    name = 'PALMOLIVE Sham.180mL(Blue: A/D)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 99.45,
    cost = 76.78,
    reorder_level = 20,
    expiry_date = DATE '2028-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01180';
UPDATE products
SET sku = 'NPH-00911',
    name = 'PALMOLIVE Sham.180mL(BrilliantShine)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 60.30,
    cost = 46.17,
    reorder_level = 20,
    expiry_date = DATE '2030-04-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01181';
UPDATE products
SET sku = 'NPH-00912',
    name = 'PALMOLIVE Sham.180mL(Comp.Repair)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 116.27,
    cost = 93.76,
    reorder_level = 20,
    expiry_date = DATE '2029-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01182';
UPDATE products
SET sku = 'NPH-00913',
    name = 'PALMOLIVE Sham.180mL(F/Girl) Pink',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 105.17,
    cost = 86.61,
    reorder_level = 20,
    expiry_date = DATE '2027-10-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01183';
UPDATE products
SET sku = 'NPH-00914',
    name = 'PALMOLIVE Sham.180mL(Grn:Normal)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 97.96,
    cost = 79.81,
    reorder_level = 20,
    expiry_date = DATE '2028-12-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01184';
UPDATE products
SET sku = 'NPH-00915',
    name = 'PALMOLIVE Sham.180mL(Pink: Dry)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 113.83,
    cost = 87.64,
    reorder_level = 20,
    expiry_date = DATE '2029-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01185';
UPDATE products
SET sku = 'NPH-00916',
    name = 'PALMOLIVE Soap 115g (Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 20.99,
    cost = 16.05,
    reorder_level = 20,
    expiry_date = DATE '2029-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01186';
UPDATE products
SET sku = 'NPH-00917',
    name = 'PALMOLIVE Soap 115g (Pink: I/Softness)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 35.11,
    cost = 28.14,
    reorder_level = 20,
    expiry_date = DATE '2030-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01187';
UPDATE products
SET sku = 'NPH-00918',
    name = 'PALMOLIVE Soap 115g-Grn(Moist/Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 23.15,
    cost = 18.70,
    reorder_level = 20,
    expiry_date = DATE '2027-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01188';
UPDATE products
SET sku = 'NPH-00919',
    name = 'PALMOLIVE Soap 125g (Grn.Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 52.48,
    cost = 41.99,
    reorder_level = 20,
    expiry_date = DATE '2027-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01189';
UPDATE products
SET sku = 'NPH-00920',
    name = 'PANTENE Shampoo  70mL (Hair Fall Control)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 27.31,
    cost = 21.08,
    reorder_level = 20,
    expiry_date = DATE '2030-11-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01190';
UPDATE products
SET sku = 'NPH-00921',
    name = 'PANTENE Shampoo  90mL (Anti-Dandruff)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 52.81,
    cost = 41.20,
    reorder_level = 20,
    expiry_date = DATE '2030-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01191';
UPDATE products
SET sku = 'NPH-00922',
    name = 'PANTENE Shampoo 150mL (Hair Fall)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 67.63,
    cost = 55.15,
    reorder_level = 20,
    expiry_date = DATE '2030-06-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01192';
UPDATE products
SET sku = 'NPH-00923',
    name = 'PANTENE Shampoo 150mL (Total D/Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 121.72,
    cost = 93.57,
    reorder_level = 20,
    expiry_date = DATE '2029-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01193';
UPDATE products
SET sku = 'NPH-00924',
    name = 'PANTENE Shampoo 170mL (Glossy Shine)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 112.35,
    cost = 91.43,
    reorder_level = 20,
    expiry_date = DATE '2028-03-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01194';
UPDATE products
SET sku = 'NPH-00925',
    name = 'PANTENE Shampoo 170mL (Hair Fall)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 112.35,
    cost = 86.98,
    reorder_level = 20,
    expiry_date = DATE '2027-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01195';
UPDATE products
SET sku = 'NPH-00926',
    name = 'PANTENE Shampoo 170mL (Total D/Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 65.49,
    cost = 53.96,
    reorder_level = 20,
    expiry_date = DATE '2029-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01196';
UPDATE products
SET sku = 'NPH-00927',
    name = 'PAU Liniment 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.76,
    cost = 36.16,
    reorder_level = 20,
    expiry_date = DATE '2027-01-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01197';
UPDATE products
SET sku = 'NPH-00928',
    name = 'PAU Liniment 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.88,
    cost = 52.25,
    reorder_level = 20,
    expiry_date = DATE '2030-08-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01198';
UPDATE products
SET sku = 'NPH-00929',
    name = 'PAU Masaje Liniment 60mL Classic',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.25,
    cost = 37.67,
    reorder_level = 20,
    expiry_date = DATE '2028-02-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01199';
UPDATE products
SET sku = 'NPH-00930',
    name = 'PAU Masaje Liniment 60mL Peppermint',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 71.46,
    cost = 56.11,
    reorder_level = 20,
    expiry_date = DATE '2030-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01200';
UPDATE products
SET sku = 'MED-00517',
    name = 'PEDIAFORTAN-AS Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 104.22,
    cost = 81.39,
    reorder_level = 20,
    expiry_date = DATE '2027-01-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01201';
UPDATE products
SET sku = 'MED-00518',
    name = 'PEDIAFORTAN-AS Syrup 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 152.25,
    cost = 116.14,
    reorder_level = 20,
    expiry_date = DATE '2028-12-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01202';
UPDATE products
SET sku = 'MED-00519',
    name = 'PEDIAFORTAN-C Drops 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.22,
    cost = 41.48,
    reorder_level = 20,
    expiry_date = DATE '2027-12-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01203';
UPDATE products
SET sku = 'MED-00520',
    name = 'PEDIAFORTAN-C Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 63.45,
    cost = 51.16,
    reorder_level = 20,
    expiry_date = DATE '2027-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01204';
UPDATE products
SET sku = 'MED-00521',
    name = 'PEDIALYTE 30 Apple 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 216.72,
    cost = 171.00,
    reorder_level = 20,
    expiry_date = DATE '2028-01-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01205';
UPDATE products
SET sku = 'MED-00522',
    name = 'PEDIALYTE 30 Grapes 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 298.98,
    cost = 231.13,
    reorder_level = 20,
    expiry_date = DATE '2029-07-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01206';
UPDATE products
SET sku = 'MED-00523',
    name = 'PEDIALYTE 30 Strawberry 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 110.38,
    cost = 88.26,
    reorder_level = 20,
    expiry_date = DATE '2027-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01207';
UPDATE products
SET sku = 'MED-00524',
    name = 'PEDIALYTE 45 Bubble Gum 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 284.98,
    cost = 225.20,
    reorder_level = 20,
    expiry_date = DATE '2029-09-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01208';
UPDATE products
SET sku = 'MED-00525',
    name = 'PEDIALYTE 45 Fruit Flavor 500mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 186.69,
    cost = 154.48,
    reorder_level = 20,
    expiry_date = DATE '2027-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01209';
UPDATE products
SET sku = 'MED-00526',
    name = 'PEDIAMOX 250mg Suspension 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 35.35,
    cost = 29.00,
    reorder_level = 20,
    expiry_date = DATE '2030-11-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01210';
UPDATE products
SET sku = 'MED-00527',
    name = 'PEDIAMOX Drops*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 40.89,
    cost = 32.69,
    reorder_level = 20,
    expiry_date = DATE '2030-01-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01211';
UPDATE products
SET sku = 'MED-00528',
    name = 'PEDZINC Plus C Drops 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.63,
    cost = 17.69,
    reorder_level = 20,
    expiry_date = DATE '2028-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01212';
UPDATE products
SET sku = 'MED-00529',
    name = 'PEDZINC Plus C Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.09,
    cost = 52.06,
    reorder_level = 20,
    expiry_date = DATE '2028-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01213';
UPDATE products
SET sku = 'MED-00530',
    name = 'PEDZINC Plus C Syrup 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 110.88,
    cost = 90.68,
    reorder_level = 20,
    expiry_date = DATE '2030-06-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01214';
UPDATE products
SET sku = 'NPH-00931',
    name = 'PETROLEUM JELLY  25g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.01,
    cost = 26.91,
    reorder_level = 20,
    expiry_date = DATE '2030-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01215';
UPDATE products
SET sku = 'NPH-00932',
    name = 'PETROLEUM JELLY  50g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.83,
    cost = 26.99,
    reorder_level = 20,
    expiry_date = DATE '2030-06-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01216';
UPDATE products
SET sku = 'NPH-00933',
    name = 'PETROLEUM JELLY 100g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.53,
    cost = 21.09,
    reorder_level = 20,
    expiry_date = DATE '2028-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01217';
UPDATE products
SET sku = 'NPH-00934',
    name = 'PETROLEUM JELLY 200g (Apollo)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.08,
    cost = 34.38,
    reorder_level = 20,
    expiry_date = DATE '2027-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01218';
UPDATE products
SET sku = 'NPH-00935',
    name = 'PETROLEUM JELLY 20g (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 29.08,
    cost = 22.83,
    reorder_level = 20,
    expiry_date = DATE '2030-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01219';
UPDATE products
SET sku = 'NPH-00936',
    name = 'PETROLEUM JELLY 50g (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 47.42,
    cost = 37.97,
    reorder_level = 20,
    expiry_date = DATE '2028-05-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01220';
UPDATE products
SET sku = 'MED-00531',
    name = 'pH CARE  50mL (Cool Wind)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.51,
    cost = 36.20,
    reorder_level = 20,
    expiry_date = DATE '2029-04-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01221';
UPDATE products
SET sku = 'MED-00532',
    name = 'pH CARE  50mL (Fragrance Free)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 60.61,
    cost = 47.71,
    reorder_level = 20,
    expiry_date = DATE '2027-05-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01222';
UPDATE products
SET sku = 'MED-00533',
    name = 'pH CARE  50mL (Fresh Blossom)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.93,
    cost = 38.89,
    reorder_level = 20,
    expiry_date = DATE '2027-02-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01223';
UPDATE products
SET sku = 'MED-00534',
    name = 'pH CARE  50mL (Guava)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 65.01,
    cost = 51.67,
    reorder_level = 20,
    expiry_date = DATE '2030-05-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01224';
UPDATE products
SET sku = 'MED-00535',
    name = 'pH CARE  50mL (Happy Daisies)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 31.95,
    cost = 26.57,
    reorder_level = 20,
    expiry_date = DATE '2030-02-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01225';
UPDATE products
SET sku = 'MED-00536',
    name = 'pH CARE  50mL (Papaya)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 68.81,
    cost = 52.86,
    reorder_level = 20,
    expiry_date = DATE '2028-04-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01226';
UPDATE products
SET sku = 'MED-00537',
    name = 'pH CARE  50mL (Passionate Bloom)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 63.51,
    cost = 50.67,
    reorder_level = 20,
    expiry_date = DATE '2029-01-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01227';
UPDATE products
SET sku = 'MED-00538',
    name = 'pH CARE  50mL (Shower Splash)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.42,
    cost = 32.96,
    reorder_level = 20,
    expiry_date = DATE '2030-09-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01228';
UPDATE products
SET sku = 'MED-00539',
    name = 'pH CARE 150mL (Cool Wind)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 116.33,
    cost = 91.44,
    reorder_level = 20,
    expiry_date = DATE '2028-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01229';
UPDATE products
SET sku = 'MED-00540',
    name = 'pH CARE 150mL (Fragrance Free)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 118.06,
    cost = 91.44,
    reorder_level = 20,
    expiry_date = DATE '2030-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01230';
UPDATE products
SET sku = 'MED-00541',
    name = 'pH CARE 150mL (Fresh Blossoms)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 91.06,
    cost = 73.32,
    reorder_level = 20,
    expiry_date = DATE '2029-10-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01231';
UPDATE products
SET sku = 'MED-00542',
    name = 'pH CARE 150mL (Guava)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 49.15,
    cost = 37.91,
    reorder_level = 20,
    expiry_date = DATE '2030-12-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01232';
UPDATE products
SET sku = 'MED-00543',
    name = 'pH CARE 150mL (Happy Daisies)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.31,
    cost = 41.01,
    reorder_level = 20,
    expiry_date = DATE '2027-04-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01233';
UPDATE products
SET sku = 'MED-00544',
    name = 'pH CARE 150mL (Papaya)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 76.14,
    cost = 60.42,
    reorder_level = 20,
    expiry_date = DATE '2029-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01234';
UPDATE products
SET sku = 'MED-00545',
    name = 'pH CARE 150mL (Passionate Bloom)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 79.86,
    cost = 64.57,
    reorder_level = 20,
    expiry_date = DATE '2027-03-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01235';
UPDATE products
SET sku = 'MED-00546',
    name = 'pH CARE 150mL (Shower Splash)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 88.47,
    cost = 72.99,
    reorder_level = 20,
    expiry_date = DATE '2028-01-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01236';
UPDATE products
SET sku = 'MED-00547',
    name = 'pH CARE 250mL (Passionate Bloom)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 109.36,
    cost = 88.05,
    reorder_level = 20,
    expiry_date = DATE '2027-05-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01237';
UPDATE products
SET sku = 'MED-00548',
    name = 'pH CARE 250mL (Shower Splash)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 158.25,
    cost = 131.13,
    reorder_level = 20,
    expiry_date = DATE '2030-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01238';
UPDATE products
SET sku = 'MED-00549',
    name = 'pH CARE Sach Passionate Bloom 12''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 76.47,
    cost = 62.98,
    reorder_level = 20,
    expiry_date = DATE '2030-02-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01239';
UPDATE products
SET sku = 'MED-00550',
    name = 'pH CARE Sachet (Cool Wind) 12''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 111.44,
    cost = 90.78,
    reorder_level = 20,
    expiry_date = DATE '2028-11-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01240';
UPDATE products
SET sku = 'MED-00551',
    name = 'PHARMATON Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 581.61,
    cost = 466.83,
    reorder_level = 20,
    expiry_date = DATE '2028-06-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01241';
UPDATE products
SET sku = 'MED-00552',
    name = 'PLASIL Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.17,
    cost = 7.63,
    reorder_level = 20,
    expiry_date = DATE '2028-07-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01242';
UPDATE products
SET sku = 'MED-00553',
    name = 'PLEMEX For Kids Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 55.73,
    cost = 45.04,
    reorder_level = 20,
    expiry_date = DATE '2029-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01243';
UPDATE products
SET sku = 'MED-00554',
    name = 'PLEMEX For Kids Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 116.98,
    cost = 93.27,
    reorder_level = 20,
    expiry_date = DATE '2030-12-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01244';
UPDATE products
SET sku = 'MED-00555',
    name = 'PLEMEX Forte Capsule 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 766.86,
    cost = 618.17,
    reorder_level = 20,
    expiry_date = DATE '2029-11-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01245';
UPDATE products
SET sku = 'MED-00556',
    name = 'PLEMEX Forte Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.82,
    cost = 38.50,
    reorder_level = 20,
    expiry_date = DATE '2030-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01246';
UPDATE products
SET sku = 'MED-00557',
    name = 'PLEMEX Forte Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 78.41,
    cost = 64.45,
    reorder_level = 20,
    expiry_date = DATE '2030-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01247';
UPDATE products
SET sku = 'MED-00558',
    name = 'POLYNERV- 500 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.31,
    cost = 10.40,
    reorder_level = 20,
    expiry_date = DATE '2028-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01248';
UPDATE products
SET sku = 'MED-00559',
    name = 'POLYNERV-1000 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.87,
    cost = 12.81,
    reorder_level = 20,
    expiry_date = DATE '2028-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01249';
UPDATE products
SET sku = 'NPH-00937',
    name = 'POND''S Anti-Bact.F/Scrub Sach 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.99,
    cost = 18.78,
    reorder_level = 20,
    expiry_date = DATE '2030-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01250';
UPDATE products
SET sku = 'NPH-00938',
    name = 'POND''S Anti-Bact.F/Scrub Sach 6g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.97,
    cost = 25.35,
    reorder_level = 20,
    expiry_date = DATE '2027-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01251';
UPDATE products
SET sku = 'NPH-00939',
    name = 'POND''S Detox Cream 12G x 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 126.28,
    cost = 99.31,
    reorder_level = 20,
    expiry_date = DATE '2027-03-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01252';
UPDATE products
SET sku = 'NPH-00940',
    name = 'POND''S Oil Control Clnsing Foam Sach',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.33,
    cost = 19.21,
    reorder_level = 20,
    expiry_date = DATE '2028-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01253';
UPDATE products
SET sku = 'NPH-00941',
    name = 'POND''S Perfect Care F/Wash Sach 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.12,
    cost = 26.26,
    reorder_level = 20,
    expiry_date = DATE '2028-03-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01254';
UPDATE products
SET sku = 'NPH-00942',
    name = 'POND''S Perfect Care F/Wash Sach 4g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.40,
    cost = 34.94,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01255';
UPDATE products
SET sku = 'NPH-00943',
    name = 'POND''S Pinkish-White Cream 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 21.62,
    cost = 17.24,
    reorder_level = 20,
    expiry_date = DATE '2029-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01256';
UPDATE products
SET sku = 'NPH-00944',
    name = 'POND''S Pinkish-White Lotion Sach 10g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 19.35,
    cost = 15.37,
    reorder_level = 20,
    expiry_date = DATE '2030-06-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01257';
UPDATE products
SET sku = 'NPH-00945',
    name = 'POND''S W/B Pink Normal Skin Box 12g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.64,
    cost = 50.25,
    reorder_level = 20,
    expiry_date = DATE '2027-11-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01258';
UPDATE products
SET sku = 'NPH-00946',
    name = 'POND''S W/B Pink Normal Skin No-Mess x6',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 64.39,
    cost = 53.05,
    reorder_level = 20,
    expiry_date = DATE '2027-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01259';
UPDATE products
SET sku = 'NPH-00947',
    name = 'POND''S W/B Pink Normal Skin Sach 6g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.45,
    cost = 24.39,
    reorder_level = 20,
    expiry_date = DATE '2028-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01260';
UPDATE products
SET sku = 'MED-00560',
    name = 'PONSTAN SF Capsule 250mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.20,
    cost = 7.65,
    reorder_level = 20,
    expiry_date = DATE '2027-08-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01261';
UPDATE products
SET sku = 'MED-00561',
    name = 'PONSTAN SF Capsule 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.39,
    cost = 14.05,
    reorder_level = 20,
    expiry_date = DATE '2027-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01262';
UPDATE products
SET sku = 'MED-00562',
    name = 'PONSTAN Tablet 500mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.72,
    cost = 10.26,
    reorder_level = 20,
    expiry_date = DATE '2028-04-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01263';
UPDATE products
SET sku = 'MED-00563',
    name = 'POTENCEE Forte 1000mg Tablet 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 701.58,
    cost = 566.20,
    reorder_level = 20,
    expiry_date = DATE '2030-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01264';
UPDATE products
SET sku = 'MED-00564',
    name = 'POTENCEE N.A. Cap.(Sod.Ascorbate)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.20,
    cost = 9.54,
    reorder_level = 20,
    expiry_date = DATE '2030-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01265';
UPDATE products
SET sku = 'MED-00565',
    name = 'POTENCEE Tablet 500mg (REG) 100''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 758.56,
    cost = 593.11,
    reorder_level = 20,
    expiry_date = DATE '2029-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01266';
UPDATE products
SET sku = 'MED-00566',
    name = 'POTENCEE Tablet 500mg 20+2 X',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 9.06,
    cost = 6.92,
    reorder_level = 20,
    expiry_date = DATE '2030-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01267';
UPDATE products
SET sku = 'MED-00567',
    name = 'POTENCEE Tablet Sugar Free 20+2',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.95,
    cost = 14.04,
    reorder_level = 20,
    expiry_date = DATE '2030-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01268';
UPDATE products
SET sku = 'MED-00568',
    name = 'POTENCEE Tablet Sugar-Free',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.46,
    cost = 10.54,
    reorder_level = 20,
    expiry_date = DATE '2028-09-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01269';
UPDATE products
SET sku = 'MED-00569',
    name = 'PRED  5 Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.13,
    cost = 14.67,
    reorder_level = 20,
    expiry_date = DATE '2030-07-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01270';
UPDATE products
SET sku = 'MED-00570',
    name = 'PRED 10 Syrup 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 41.00,
    cost = 31.96,
    reorder_level = 20,
    expiry_date = DATE '2028-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01271';
UPDATE products
SET sku = 'MED-00571',
    name = 'PRED 10 Syrup 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 46.63,
    cost = 36.53,
    reorder_level = 20,
    expiry_date = DATE '2029-07-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01272';
UPDATE products
SET sku = 'MED-00572',
    name = 'PRED 10 Tablet (100''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 387.47,
    cost = 316.91,
    reorder_level = 20,
    expiry_date = DATE '2028-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01273';
UPDATE products
SET sku = 'MED-00573',
    name = 'PREGNANCY Test (One Step) Femme',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.60,
    cost = 35.58,
    reorder_level = 20,
    expiry_date = DATE '2027-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01274';
UPDATE products
SET sku = 'MED-00574',
    name = 'PROPAN Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.56,
    cost = 52.98,
    reorder_level = 20,
    expiry_date = DATE '2030-12-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01275';
UPDATE products
SET sku = 'MED-00575',
    name = 'PROPAN Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 65.77,
    cost = 52.30,
    reorder_level = 20,
    expiry_date = DATE '2028-07-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01276';
UPDATE products
SET sku = 'MED-00576',
    name = 'PROPAN TLC Drops 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 24.26,
    cost = 18.96,
    reorder_level = 20,
    expiry_date = DATE '2030-08-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01277';
UPDATE products
SET sku = 'MED-00577',
    name = 'PROPAN TLC Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 60.16,
    cost = 49.09,
    reorder_level = 20,
    expiry_date = DATE '2030-02-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01278';
UPDATE products
SET sku = 'MED-00578',
    name = 'PROPAN TLC Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 57.77,
    cost = 45.62,
    reorder_level = 20,
    expiry_date = DATE '2030-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01279';
UPDATE products
SET sku = 'MED-00579',
    name = 'PROPAN TLC Syrup 250mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 88.46,
    cost = 68.71,
    reorder_level = 20,
    expiry_date = DATE '2030-04-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01280';
UPDATE products
SET sku = 'MED-00580',
    name = 'PROPAN with Iron Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.67,
    cost = 9.23,
    reorder_level = 20,
    expiry_date = DATE '2030-12-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01281';
UPDATE products
SET sku = 'MED-00581',
    name = 'PROVERA 10mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.94,
    cost = 13.91,
    reorder_level = 20,
    expiry_date = DATE '2028-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01282';
UPDATE products
SET sku = 'MED-00582',
    name = 'PROVEXEL NS  Solution 2.5mL 30''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 338.60,
    cost = 281.14,
    reorder_level = 20,
    expiry_date = DATE '2028-11-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01283';
UPDATE products
SET sku = 'MED-00583',
    name = 'RANITIDINE Tablet 150mg (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.81,
    cost = 10.44,
    reorder_level = 20,
    expiry_date = DATE '2030-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01284';
UPDATE products
SET sku = 'MED-00584',
    name = 'RANITIDINE Tablet 300mg (Pharex)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.93,
    cost = 14.46,
    reorder_level = 20,
    expiry_date = DATE '2030-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01285';
UPDATE products
SET sku = 'MED-00585',
    name = 'RASHFREE Ointment 30g*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.73,
    cost = 14.22,
    reorder_level = 20,
    expiry_date = DATE '2027-03-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01286';
UPDATE products
SET sku = 'MED-00586',
    name = 'RAXIDE 150mg Tablet (GX)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.42,
    cost = 10.33,
    reorder_level = 20,
    expiry_date = DATE '2030-11-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01287';
UPDATE products
SET sku = 'NPH-00948',
    name = 'RDL Astringent #1 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 21.54,
    cost = 17.41,
    reorder_level = 20,
    expiry_date = DATE '2030-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01288';
UPDATE products
SET sku = 'NPH-00949',
    name = 'RDL Astringent #1 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 51.70,
    cost = 42.33,
    reorder_level = 20,
    expiry_date = DATE '2029-11-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01289';
UPDATE products
SET sku = 'NPH-00950',
    name = 'RDL Astringent #2 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.52,
    cost = 34.52,
    reorder_level = 20,
    expiry_date = DATE '2028-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01290';
UPDATE products
SET sku = 'NPH-00951',
    name = 'RDL Astringent #2 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.37,
    cost = 39.26,
    reorder_level = 20,
    expiry_date = DATE '2029-07-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01291';
UPDATE products
SET sku = 'NPH-00952',
    name = 'RDL Astringent #3 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.46,
    cost = 30.64,
    reorder_level = 20,
    expiry_date = DATE '2030-01-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01292';
UPDATE products
SET sku = 'NPH-00953',
    name = 'RDL Astringent #3 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.78,
    cost = 36.03,
    reorder_level = 20,
    expiry_date = DATE '2029-07-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01293';
UPDATE products
SET sku = 'NPH-00954',
    name = 'RDL F/Cleanser 150mL-Avocado',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 101.88,
    cost = 77.51,
    reorder_level = 20,
    expiry_date = DATE '2028-03-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01294';
UPDATE products
SET sku = 'NPH-00955',
    name = 'RDL F/Cleanser 150mL-Cucumber',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 69.80,
    cost = 53.52,
    reorder_level = 20,
    expiry_date = DATE '2029-04-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01295';
UPDATE products
SET sku = 'NPH-00956',
    name = 'RDL F/Cleanser 150mL-Kalamansi',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 88.74,
    cost = 69.08,
    reorder_level = 20,
    expiry_date = DATE '2027-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01296';
UPDATE products
SET sku = 'NPH-00957',
    name = 'RDL F/Cleanser 150mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 95.13,
    cost = 76.75,
    reorder_level = 20,
    expiry_date = DATE '2030-07-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01297';
UPDATE products
SET sku = 'NPH-00958',
    name = 'RDL F/Cleanser 75mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 28.87,
    cost = 22.45,
    reorder_level = 20,
    expiry_date = DATE '2028-10-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01298';
UPDATE products
SET sku = 'NPH-00959',
    name = 'RDL Papaya Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 35.14,
    cost = 27.16,
    reorder_level = 20,
    expiry_date = DATE '2027-01-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01299';
UPDATE products
SET sku = 'NPH-00960',
    name = 'RDL Papaya With Milk Soap 135g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 29.33,
    cost = 22.68,
    reorder_level = 20,
    expiry_date = DATE '2028-01-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01300';
UPDATE products
SET sku = 'NPH-00961',
    name = 'RDL Sunblock Cream  6g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.27,
    cost = 18.24,
    reorder_level = 20,
    expiry_date = DATE '2027-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01301';
UPDATE products
SET sku = 'NPH-00962',
    name = 'RDL Sunblock Cream 12g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.00,
    cost = 54.32,
    reorder_level = 20,
    expiry_date = DATE '2030-08-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01302';
UPDATE products
SET sku = 'NPH-00963',
    name = 'RDL Sunblock Cream 15g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.94,
    cost = 24.41,
    reorder_level = 20,
    expiry_date = DATE '2030-05-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01303';
UPDATE products
SET sku = 'NPH-00964',
    name = 'RDL Whitening Cream  6g',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.22,
    cost = 37.37,
    reorder_level = 20,
    expiry_date = DATE '2029-04-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01304';
UPDATE products
SET sku = 'NPH-00965',
    name = 'REJOICE Sham.  70mL  3-In-1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 45.26,
    cost = 36.15,
    reorder_level = 20,
    expiry_date = DATE '2027-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01305';
UPDATE products
SET sku = 'NPH-00966',
    name = 'REJOICE Sham.  70mL  Moist & Smooth',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 53.94,
    cost = 44.89,
    reorder_level = 20,
    expiry_date = DATE '2027-10-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01306';
UPDATE products
SET sku = 'NPH-00967',
    name = 'REJOICE Sham.  70mL  Rich',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 48.43,
    cost = 39.92,
    reorder_level = 20,
    expiry_date = DATE '2030-06-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01307';
UPDATE products
SET sku = 'NPH-00968',
    name = 'REJOICE Sham.  70mL  Soft & Smooth',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 47.73,
    cost = 38.70,
    reorder_level = 20,
    expiry_date = DATE '2028-04-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01308';
UPDATE products
SET sku = 'NPH-00969',
    name = 'REJOICE Sham. 170mL  3-In-1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 75.74,
    cost = 60.74,
    reorder_level = 20,
    expiry_date = DATE '2029-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01309';
UPDATE products
SET sku = 'NPH-00970',
    name = 'REJOICE Sham. 170mL  Anti-Frizz',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 117.64,
    cost = 90.04,
    reorder_level = 20,
    expiry_date = DATE '2028-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01310';
UPDATE products
SET sku = 'NPH-00971',
    name = 'REJOICE Sham. 170mL  Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 109.84,
    cost = 88.54,
    reorder_level = 20,
    expiry_date = DATE '2029-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01311';
UPDATE products
SET sku = 'NPH-00972',
    name = 'REJOICE Sham. 170mL  Rich',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 102.17,
    cost = 83.11,
    reorder_level = 20,
    expiry_date = DATE '2028-06-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01312';
UPDATE products
SET sku = 'NPH-00973',
    name = 'REJOICE Sham. 170mL  Soft & Smooth',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 89.11,
    cost = 71.35,
    reorder_level = 20,
    expiry_date = DATE '2027-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01313';
UPDATE products
SET sku = 'NPH-00974',
    name = 'REJOICE Sham.Sach Rich 16mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 41.04,
    cost = 33.62,
    reorder_level = 20,
    expiry_date = DATE '2029-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01314';
UPDATE products
SET sku = 'NPH-00975',
    name = 'REJOICE Sham.Sach Rich 16mL 11+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 49.50,
    cost = 40.38,
    reorder_level = 20,
    expiry_date = DATE '2030-01-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01315';
UPDATE products
SET sku = 'NPH-00976',
    name = 'REJOICE Sham.Sach Soft&Smth 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 31.16,
    cost = 23.67,
    reorder_level = 20,
    expiry_date = DATE '2029-04-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01316';
UPDATE products
SET sku = 'MED-00587',
    name = 'RE-LEAF 250mg Tablet (Sambong)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.59,
    cost = 4.33,
    reorder_level = 20,
    expiry_date = DATE '2029-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01317';
UPDATE products
SET sku = 'MED-00588',
    name = 'RE-LEAF Forte 500mg Tab. (Sambong)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.01,
    cost = 15.97,
    reorder_level = 20,
    expiry_date = DATE '2028-10-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01318';
UPDATE products
SET sku = 'MED-00589',
    name = 'REVICON Tablet (Flex)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.81,
    cost = 14.64,
    reorder_level = 20,
    expiry_date = DATE '2030-08-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01319';
UPDATE products
SET sku = 'MED-00590',
    name = 'REVICON Tablet 30''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 370.91,
    cost = 299.10,
    reorder_level = 20,
    expiry_date = DATE '2029-09-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01320';
UPDATE products
SET sku = 'MED-00591',
    name = 'REXIDOL Forte Tablet*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.99,
    cost = 8.96,
    reorder_level = 20,
    expiry_date = DATE '2029-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01321';
UPDATE products
SET sku = 'NPH-00977',
    name = 'REXONA MEN R/On 25mL Ice Cool',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 22.06,
    cost = 18.07,
    reorder_level = 20,
    expiry_date = DATE '2030-11-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01322';
UPDATE products
SET sku = 'NPH-00978',
    name = 'REXONA MEN R/On 25mL Quantum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.93,
    cost = 19.54,
    reorder_level = 20,
    expiry_date = DATE '2029-04-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01323';
UPDATE products
SET sku = 'NPH-00979',
    name = 'REXONA MEN R/On 25mL SportDefense',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.69,
    cost = 36.27,
    reorder_level = 20,
    expiry_date = DATE '2030-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01324';
UPDATE products
SET sku = 'NPH-00980',
    name = 'REXONA MEN R/On 50mL Ice Cool',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 34.43,
    cost = 27.74,
    reorder_level = 20,
    expiry_date = DATE '2028-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01325';
UPDATE products
SET sku = 'NPH-00981',
    name = 'REXONA MEN R/On 50mL Invisible Dry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.52,
    cost = 22.72,
    reorder_level = 20,
    expiry_date = DATE '2029-04-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01326';
UPDATE products
SET sku = 'NPH-00982',
    name = 'REXONA MEN R/On 50mL Quantum',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.86,
    cost = 22.54,
    reorder_level = 20,
    expiry_date = DATE '2030-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01327';
UPDATE products
SET sku = 'NPH-00983',
    name = 'REXONA MEN R/On 50mL SportDefense',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 33.71,
    cost = 27.81,
    reorder_level = 20,
    expiry_date = DATE '2027-09-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01328';
UPDATE products
SET sku = 'NPH-00984',
    name = 'REXONA MEN R/On 50mL V8',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.92,
    cost = 43.92,
    reorder_level = 20,
    expiry_date = DATE '2029-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01329';
UPDATE products
SET sku = 'NPH-00985',
    name = 'REXONA R/On 25mL Passion',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.61,
    cost = 28.56,
    reorder_level = 20,
    expiry_date = DATE '2028-09-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01330';
UPDATE products
SET sku = 'NPH-00986',
    name = 'REXONA R/On 25mL Powder Dry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 24.57,
    cost = 19.43,
    reorder_level = 20,
    expiry_date = DATE '2028-03-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01331';
UPDATE products
SET sku = 'NPH-00987',
    name = 'REXONA R/On 25mL ShowerClean',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.51,
    cost = 23.65,
    reorder_level = 20,
    expiry_date = DATE '2029-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01332';
UPDATE products
SET sku = 'NPH-00988',
    name = 'REXONA R/On 25mL Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.54,
    cost = 38.70,
    reorder_level = 20,
    expiry_date = DATE '2028-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01333';
UPDATE products
SET sku = 'NPH-00989',
    name = 'REXONA R/On 50mL AntiBact Defense',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.65,
    cost = 33.60,
    reorder_level = 20,
    expiry_date = DATE '2028-12-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01334';
UPDATE products
SET sku = 'NPH-00990',
    name = 'REXONA R/On 50mL Passion',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 68.60,
    cost = 54.04,
    reorder_level = 20,
    expiry_date = DATE '2028-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01335';
UPDATE products
SET sku = 'NPH-00991',
    name = 'REXONA R/On 50mL Powder Dry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.24,
    cost = 26.83,
    reorder_level = 20,
    expiry_date = DATE '2028-12-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01336';
UPDATE products
SET sku = 'NPH-00992',
    name = 'REXONA R/On 50mL Shower Clean',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 66.93,
    cost = 52.54,
    reorder_level = 20,
    expiry_date = DATE '2027-10-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01337';
UPDATE products
SET sku = 'NPH-00993',
    name = 'REXONA R/On 50mL Whitening',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.44,
    cost = 40.93,
    reorder_level = 20,
    expiry_date = DATE '2029-12-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01338';
UPDATE products
SET sku = 'NPH-00994',
    name = 'REXONA Sachet Ice Cool SP 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 16.28,
    cost = 12.36,
    reorder_level = 20,
    expiry_date = DATE '2030-07-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01339';
UPDATE products
SET sku = 'NPH-00995',
    name = 'REXONA Sachet Passion SP 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 15.60,
    cost = 11.82,
    reorder_level = 20,
    expiry_date = DATE '2030-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01340';
UPDATE products
SET sku = 'NPH-00996',
    name = 'REXONA Sachet Powder Dry SP 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 11.19,
    cost = 9.01,
    reorder_level = 20,
    expiry_date = DATE '2029-11-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01341';
UPDATE products
SET sku = 'NPH-00997',
    name = 'REXONA Sachet Quantum SP 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 9.27,
    cost = 7.58,
    reorder_level = 20,
    expiry_date = DATE '2029-11-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01342';
UPDATE products
SET sku = 'NPH-00998',
    name = 'REXONA Sachet Shower Clean SP 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 12.79,
    cost = 9.74,
    reorder_level = 20,
    expiry_date = DATE '2027-02-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01343';
UPDATE products
SET sku = 'NPH-00999',
    name = 'REXONA Sachet Whitening 3mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 16.40,
    cost = 13.52,
    reorder_level = 20,
    expiry_date = DATE '2027-02-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01344';
UPDATE products
SET sku = 'MED-00592',
    name = 'ROBIKIDS Suspension  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 39.55,
    cost = 32.30,
    reorder_level = 20,
    expiry_date = DATE '2029-02-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01345';
UPDATE products
SET sku = 'MED-00593',
    name = 'ROBIKIDS Suspension 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 62.24,
    cost = 49.80,
    reorder_level = 20,
    expiry_date = DATE '2029-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01346';
UPDATE products
SET sku = 'MED-00594',
    name = 'ROBITUSSIN Liqui-Gel Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 6.72,
    cost = 5.38,
    reorder_level = 20,
    expiry_date = DATE '2028-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01347';
UPDATE products
SET sku = 'MED-00595',
    name = 'ROBITUSSIN Syrup  60mL (DM)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 61.46,
    cost = 47.46,
    reorder_level = 20,
    expiry_date = DATE '2030-12-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01348';
UPDATE products
SET sku = 'MED-00596',
    name = 'ROBITUSSIN Syrup  60mL (Regular)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 47.54,
    cost = 38.66,
    reorder_level = 20,
    expiry_date = DATE '2030-04-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01349';
UPDATE products
SET sku = 'MED-00597',
    name = 'ROBITUSSIN Syrup 120mL (DM)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 85.95,
    cost = 66.83,
    reorder_level = 20,
    expiry_date = DATE '2029-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01350';
UPDATE products
SET sku = 'MED-00598',
    name = 'ROBITUSSIN Syrup 120mL (Regular)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 81.02,
    cost = 64.39,
    reorder_level = 20,
    expiry_date = DATE '2030-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01351';
UPDATE products
SET sku = 'MED-00599',
    name = 'ROBUST 400mg Extreme 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 64.26,
    cost = 48.86,
    reorder_level = 20,
    expiry_date = DATE '2029-06-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01352';
UPDATE products
SET sku = 'MED-00600',
    name = 'ROBUST 550mg For Men 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 126.76,
    cost = 101.02,
    reorder_level = 20,
    expiry_date = DATE '2027-06-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01353';
UPDATE products
SET sku = 'MED-00601',
    name = 'ROBUST 550mg For Men 2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.78,
    cost = 44.41,
    reorder_level = 20,
    expiry_date = DATE '2029-03-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01354';
UPDATE products
SET sku = 'MED-00602',
    name = 'ROBUST Energy Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 15.71,
    cost = 12.46,
    reorder_level = 20,
    expiry_date = DATE '2029-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01355';
UPDATE products
SET sku = 'MED-00603',
    name = 'ROGIN-E Cap. Value Pack 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 127.33,
    cost = 102.55,
    reorder_level = 20,
    expiry_date = DATE '2027-04-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01356';
UPDATE products
SET sku = 'MED-00604',
    name = 'ROWATINEX Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.02,
    cost = 10.33,
    reorder_level = 20,
    expiry_date = DATE '2029-12-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01357';
UPDATE products
SET sku = 'NPH-01000',
    name = 'SAFEGUARD Advntge14g-ActiveFresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 27.18,
    cost = 22.43,
    reorder_level = 20,
    expiry_date = DATE '2030-01-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01358';
UPDATE products
SET sku = 'NPH-01001',
    name = 'SAFEGUARD Advntge14g-ForestFresh',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 55.11,
    cost = 44.70,
    reorder_level = 20,
    expiry_date = DATE '2029-03-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01359';
UPDATE products
SET sku = 'NPH-01002',
    name = 'SAFEGUARD Advntge14g-Sport',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 59.26,
    cost = 46.13,
    reorder_level = 20,
    expiry_date = DATE '2029-09-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01360';
UPDATE products
SET sku = 'NPH-01003',
    name = 'SAFEGUARD Body Wash 200mL (Aloe)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 38.48,
    cost = 31.96,
    reorder_level = 20,
    expiry_date = DATE '2030-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01361';
UPDATE products
SET sku = 'NPH-01004',
    name = 'SAFEGUARD Hand Sanitizer 59mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 29.26,
    cost = 23.77,
    reorder_level = 20,
    expiry_date = DATE '2030-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01362';
UPDATE products
SET sku = 'NPH-01005',
    name = 'SAFEGUARD Soap  42g Calamansi',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 21.75,
    cost = 18.06,
    reorder_level = 20,
    expiry_date = DATE '2028-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01363';
UPDATE products
SET sku = 'NPH-01006',
    name = 'SAFEGUARD Soap  60g (Deo-Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 30.97,
    cost = 25.35,
    reorder_level = 20,
    expiry_date = DATE '2029-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01364';
UPDATE products
SET sku = 'NPH-01007',
    name = 'SAFEGUARD Soap  60g (Eucalyptus)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 46.95,
    cost = 38.10,
    reorder_level = 20,
    expiry_date = DATE '2027-10-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01365';
UPDATE products
SET sku = 'NPH-01008',
    name = 'SAFEGUARD Soap  60g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 33.32,
    cost = 26.94,
    reorder_level = 20,
    expiry_date = DATE '2029-07-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01366';
UPDATE products
SET sku = 'NPH-01009',
    name = 'SAFEGUARD Soap  60g (Guava)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 48.28,
    cost = 40.03,
    reorder_level = 20,
    expiry_date = DATE '2028-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01367';
UPDATE products
SET sku = 'NPH-01010',
    name = 'SAFEGUARD Soap  60g (Menthol)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 26.45,
    cost = 20.23,
    reorder_level = 20,
    expiry_date = DATE '2027-02-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01368';
UPDATE products
SET sku = 'NPH-01011',
    name = 'SAFEGUARD Soap  60g (Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 40.11,
    cost = 31.40,
    reorder_level = 20,
    expiry_date = DATE '2028-09-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01369';
UPDATE products
SET sku = 'NPH-01012',
    name = 'SAFEGUARD Soap  60g (Tawas Fresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 31.30,
    cost = 24.01,
    reorder_level = 20,
    expiry_date = DATE '2030-11-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01370';
UPDATE products
SET sku = 'NPH-01013',
    name = 'SAFEGUARD Soap  60g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 48.49,
    cost = 39.31,
    reorder_level = 20,
    expiry_date = DATE '2028-12-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01371';
UPDATE products
SET sku = 'NPH-01014',
    name = 'SAFEGUARD Soap  60g-Icy Cool Mint',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 52.05,
    cost = 41.65,
    reorder_level = 20,
    expiry_date = DATE '2029-06-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01372';
UPDATE products
SET sku = 'NPH-01015',
    name = 'SAFEGUARD Soap  60g-Ivory White Care',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 56.11,
    cost = 43.83,
    reorder_level = 20,
    expiry_date = DATE '2029-10-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01373';
UPDATE products
SET sku = 'NPH-01016',
    name = 'SAFEGUARD Soap  90g (Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 28.94,
    cost = 23.92,
    reorder_level = 20,
    expiry_date = DATE '2030-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01374';
UPDATE products
SET sku = 'NPH-01017',
    name = 'SAFEGUARD Soap  90g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 28.88,
    cost = 22.75,
    reorder_level = 20,
    expiry_date = DATE '2028-06-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01375';
UPDATE products
SET sku = 'NPH-01018',
    name = 'SAFEGUARD Soap  90g (Guava)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 48.63,
    cost = 40.14,
    reorder_level = 20,
    expiry_date = DATE '2030-09-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01376';
UPDATE products
SET sku = 'NPH-01019',
    name = 'SAFEGUARD Soap  90g (Ivory White Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 28.86,
    cost = 22.28,
    reorder_level = 20,
    expiry_date = DATE '2027-01-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01377';
UPDATE products
SET sku = 'NPH-01020',
    name = 'SAFEGUARD Soap  90g (Lemon)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 55.69,
    cost = 42.54,
    reorder_level = 20,
    expiry_date = DATE '2029-10-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01378';
UPDATE products
SET sku = 'NPH-01021',
    name = 'SAFEGUARD Soap  90g (Menthol)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 51.69,
    cost = 40.77,
    reorder_level = 20,
    expiry_date = DATE '2030-07-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01379';
UPDATE products
SET sku = 'NPH-01022',
    name = 'SAFEGUARD Soap  90g (Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 40.21,
    cost = 32.56,
    reorder_level = 20,
    expiry_date = DATE '2028-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01380';
UPDATE products
SET sku = 'NPH-01023',
    name = 'SAFEGUARD Soap  90g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 52.61,
    cost = 42.38,
    reorder_level = 20,
    expiry_date = DATE '2027-08-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01381';
UPDATE products
SET sku = 'NPH-01024',
    name = 'SAFEGUARD Soap  90g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 49.80,
    cost = 37.80,
    reorder_level = 20,
    expiry_date = DATE '2028-10-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01382';
UPDATE products
SET sku = 'NPH-01025',
    name = 'SAFEGUARD Soap 128g 3-pid (Deo-Blast Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 60.96,
    cost = 46.41,
    reorder_level = 20,
    expiry_date = DATE '2029-01-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01383';
UPDATE products
SET sku = 'NPH-01026',
    name = 'SAFEGUARD Soap 135g (Beige)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 50.89,
    cost = 39.18,
    reorder_level = 20,
    expiry_date = DATE '2027-11-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01384';
UPDATE products
SET sku = 'NPH-01027',
    name = 'SAFEGUARD Soap 135g (Eucalyptus)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 20.71,
    cost = 15.93,
    reorder_level = 20,
    expiry_date = DATE '2027-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01385';
UPDATE products
SET sku = 'NPH-01028',
    name = 'SAFEGUARD Soap 135g (Green)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 43.99,
    cost = 35.96,
    reorder_level = 20,
    expiry_date = DATE '2029-10-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01386';
UPDATE products
SET sku = 'NPH-01029',
    name = 'SAFEGUARD Soap 135g (Guava)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 46.25,
    cost = 37.43,
    reorder_level = 20,
    expiry_date = DATE '2027-10-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01387';
UPDATE products
SET sku = 'NPH-01030',
    name = 'SAFEGUARD Soap 135g (Ivory White Care)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 23.70,
    cost = 18.39,
    reorder_level = 20,
    expiry_date = DATE '2029-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01388';
UPDATE products
SET sku = 'NPH-01031',
    name = 'SAFEGUARD Soap 135g (Lemon)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 29.92,
    cost = 24.20,
    reorder_level = 20,
    expiry_date = DATE '2027-06-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01389';
UPDATE products
SET sku = 'NPH-01032',
    name = 'SAFEGUARD Soap 135g (Menthol)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 49.09,
    cost = 37.65,
    reorder_level = 20,
    expiry_date = DATE '2030-07-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01390';
UPDATE products
SET sku = 'NPH-01033',
    name = 'SAFEGUARD Soap 135g (Papaya)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 36.93,
    cost = 29.20,
    reorder_level = 20,
    expiry_date = DATE '2029-10-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01391';
UPDATE products
SET sku = 'NPH-01034',
    name = 'SAFEGUARD Soap 135g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 37.96,
    cost = 29.13,
    reorder_level = 20,
    expiry_date = DATE '2028-09-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01392';
UPDATE products
SET sku = 'NPH-01035',
    name = 'SAFEGUARD Soap 135g (Tawas Fresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 23.53,
    cost = 19.50,
    reorder_level = 20,
    expiry_date = DATE '2029-07-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01393';
UPDATE products
SET sku = 'NPH-01036',
    name = 'SAFEGUARD Soap 135g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 47.66,
    cost = 38.87,
    reorder_level = 20,
    expiry_date = DATE '2027-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01394';
UPDATE products
SET sku = 'NPH-01037',
    name = 'SAFEGUARD Soap 135g 3-Pid Pack (IvoryWhtCare)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 33.66,
    cost = 27.33,
    reorder_level = 20,
    expiry_date = DATE '2028-01-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01395';
UPDATE products
SET sku = 'NPH-01038',
    name = 'SAFEGUARD Soap 135g 3-Pid Pack (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 30.74,
    cost = 24.09,
    reorder_level = 20,
    expiry_date = DATE '2030-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01396';
UPDATE products
SET sku = 'NPH-01039',
    name = 'SAFEGUARD Soap 135g-Icy Cool Mint',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 27.23,
    cost = 21.71,
    reorder_level = 20,
    expiry_date = DATE '2027-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01397';
UPDATE products
SET sku = 'NPH-01040',
    name = 'SAFEGUARD Soap 180g (White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Antibacterial cleansing bar soap providing continuous germ shield protection for the family.',
    quantity = 100,
    price = 46.71,
    cost = 38.53,
    reorder_level = 20,
    expiry_date = DATE '2027-05-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01398';
UPDATE products
SET sku = 'MED-00605',
    name = 'SALBUTAMOL 2mg Tablet (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 16.27,
    cost = 12.62,
    reorder_level = 20,
    expiry_date = DATE '2030-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01399';
UPDATE products
SET sku = 'MED-00606',
    name = 'SALBUTAMOL Syrup 60mL (Ritemed)*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 56.88,
    cost = 46.62,
    reorder_level = 20,
    expiry_date = DATE '2027-02-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01400';
UPDATE products
SET sku = 'NPH-01041',
    name = 'SALICYLIC ACID 50mL (IPI)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 29.33,
    cost = 23.41,
    reorder_level = 20,
    expiry_date = DATE '2027-02-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01401';
UPDATE products
SET sku = 'MED-00607',
    name = 'SALINASE Nasal Drop 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.27,
    cost = 27.99,
    reorder_level = 20,
    expiry_date = DATE '2029-03-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01402';
UPDATE products
SET sku = 'MED-00608',
    name = 'SALINASE Nasal Drop 60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.75,
    cost = 28.79,
    reorder_level = 20,
    expiry_date = DATE '2028-07-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01403';
UPDATE products
SET sku = 'MED-00609',
    name = 'SALINASE Nasal Spray 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 27.32,
    cost = 21.22,
    reorder_level = 20,
    expiry_date = DATE '2028-08-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01404';
UPDATE products
SET sku = 'NPH-01042',
    name = 'SALONPAS Plaster 20''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 39.66,
    cost = 32.06,
    reorder_level = 20,
    expiry_date = DATE '2029-10-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01405';
UPDATE products
SET sku = 'MED-00610',
    name = 'SANGOBION Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.22,
    cost = 4.02,
    reorder_level = 20,
    expiry_date = DATE '2029-10-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01406';
UPDATE products
SET sku = 'MED-00611',
    name = 'SANGOBION Kids Syrup 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 123.48,
    cost = 94.50,
    reorder_level = 20,
    expiry_date = DATE '2030-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01407';
UPDATE products
SET sku = 'MED-00612',
    name = 'SANGOBION Prenatal  FA Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.25,
    cost = 8.81,
    reorder_level = 20,
    expiry_date = DATE '2030-08-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01408';
UPDATE products
SET sku = 'NPH-01043',
    name = 'SANITARY BALM 32g (Big)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 40.79,
    cost = 33.18,
    reorder_level = 20,
    expiry_date = DATE '2027-05-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01409';
UPDATE products
SET sku = 'MED-00613',
    name = 'SARIDON Triple Action Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.80,
    cost = 6.79,
    reorder_level = 20,
    expiry_date = DATE '2027-06-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01410';
UPDATE products
SET sku = 'MED-00614',
    name = 'SENOKOT Forte Tablet 374mg',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.84,
    cost = 4.84,
    reorder_level = 20,
    expiry_date = DATE '2027-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01411';
UPDATE products
SET sku = 'MED-00615',
    name = 'SERC  8mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.43,
    cost = 4.16,
    reorder_level = 20,
    expiry_date = DATE '2029-09-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01412';
UPDATE products
SET sku = 'MED-00616',
    name = 'SERC 16mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.01,
    cost = 12.59,
    reorder_level = 20,
    expiry_date = DATE '2030-09-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01413';
UPDATE products
SET sku = 'MED-00617',
    name = 'SERC 24mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.01,
    cost = 13.23,
    reorder_level = 20,
    expiry_date = DATE '2030-11-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01414';
UPDATE products
SET sku = 'NPH-01044',
    name = 'SHADES Cream 100mL-Burgundy-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 89.97,
    cost = 73.26,
    reorder_level = 20,
    expiry_date = DATE '2028-06-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01415';
UPDATE products
SET sku = 'NPH-01045',
    name = 'SHADES Cream 100mL-DarkBrown-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 110.78,
    cost = 84.48,
    reorder_level = 20,
    expiry_date = DATE '2030-10-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01416';
UPDATE products
SET sku = 'NPH-01046',
    name = 'SHADES Cream 100mL-LightBrown-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.02,
    cost = 44.86,
    reorder_level = 20,
    expiry_date = DATE '2028-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01417';
UPDATE products
SET sku = 'NPH-01047',
    name = 'SHADES Cream 100mL-Mahogany-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.43,
    cost = 37.24,
    reorder_level = 20,
    expiry_date = DATE '2030-11-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01418';
UPDATE products
SET sku = 'NPH-01048',
    name = 'SHADES Cream 100mL-Med.Brown-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.14,
    cost = 44.10,
    reorder_level = 20,
    expiry_date = DATE '2027-04-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01419';
UPDATE products
SET sku = 'NPH-01049',
    name = 'SILKA Lotion  50mL-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 66.27,
    cost = 54.27,
    reorder_level = 20,
    expiry_date = DATE '2028-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01420';
UPDATE products
SET sku = 'NPH-01050',
    name = 'SILKA Lotion  50mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 28.92,
    cost = 23.63,
    reorder_level = 20,
    expiry_date = DATE '2028-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01421';
UPDATE products
SET sku = 'NPH-01051',
    name = 'SILKA Lotion 100mL-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 60.22,
    cost = 47.27,
    reorder_level = 20,
    expiry_date = DATE '2027-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01422';
UPDATE products
SET sku = 'NPH-01052',
    name = 'SILKA Lotion 100mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 113.76,
    cost = 94.19,
    reorder_level = 20,
    expiry_date = DATE '2027-09-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01423';
UPDATE products
SET sku = 'NPH-01053',
    name = 'SILKA Lotion 200mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 32.54,
    cost = 26.86,
    reorder_level = 20,
    expiry_date = DATE '2028-05-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01424';
UPDATE products
SET sku = 'NPH-01054',
    name = 'SILKA Lotion 300mL-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 171.35,
    cost = 134.05,
    reorder_level = 20,
    expiry_date = DATE '2030-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01425';
UPDATE products
SET sku = 'NPH-01055',
    name = 'SILKA Soap  25g-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 45.68,
    cost = 36.77,
    reorder_level = 20,
    expiry_date = DATE '2027-11-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01426';
UPDATE products
SET sku = 'NPH-01056',
    name = 'SILKA Soap  45g-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 46.58,
    cost = 35.30,
    reorder_level = 20,
    expiry_date = DATE '2027-07-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01427';
UPDATE products
SET sku = 'NPH-01057',
    name = 'SILKA Soap  45g-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 41.08,
    cost = 31.43,
    reorder_level = 20,
    expiry_date = DATE '2027-10-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01428';
UPDATE products
SET sku = 'NPH-01058',
    name = 'SILKA Soap  65g-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 28.00,
    cost = 22.94,
    reorder_level = 20,
    expiry_date = DATE '2027-11-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01429';
UPDATE products
SET sku = 'NPH-01059',
    name = 'SILKA Soap  65g-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 69.22,
    cost = 53.65,
    reorder_level = 20,
    expiry_date = DATE '2028-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01430';
UPDATE products
SET sku = 'NPH-01060',
    name = 'SILKA Soap  90g-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 54.04,
    cost = 41.97,
    reorder_level = 20,
    expiry_date = DATE '2027-03-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01431';
UPDATE products
SET sku = 'NPH-01061',
    name = 'SILKA Soap  90g-Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 48.49,
    cost = 38.25,
    reorder_level = 20,
    expiry_date = DATE '2028-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01432';
UPDATE products
SET sku = 'NPH-01062',
    name = 'SILKA Soap 135g  Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 26.94,
    cost = 20.86,
    reorder_level = 20,
    expiry_date = DATE '2028-05-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01433';
UPDATE products
SET sku = 'NPH-01063',
    name = 'SILKA Soap 135g-Green Papaya',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Skin brightening and moisturizing soap enriched with natural enzymes and nourishing extracts.',
    quantity = 100,
    price = 35.88,
    cost = 29.12,
    reorder_level = 20,
    expiry_date = DATE '2027-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01434';
UPDATE products
SET sku = 'MED-00618',
    name = 'SINECOD Forte Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 97.96,
    cost = 80.60,
    reorder_level = 20,
    expiry_date = DATE '2030-08-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01435';
UPDATE products
SET sku = 'MED-00619',
    name = 'SINECOD Forte Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.92,
    cost = 17.55,
    reorder_level = 20,
    expiry_date = DATE '2029-04-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01436';
UPDATE products
SET sku = 'MED-00620',
    name = 'SINUPRET Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 10.07,
    cost = 8.36,
    reorder_level = 20,
    expiry_date = DATE '2030-08-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01437';
UPDATE products
SET sku = 'MED-00621',
    name = 'SINUTAB Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.80,
    cost = 10.49,
    reorder_level = 20,
    expiry_date = DATE '2028-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01438';
UPDATE products
SET sku = 'NPH-01064',
    name = 'SLEEPASIL Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 7.08,
    cost = 5.70,
    reorder_level = 20,
    expiry_date = DATE '2028-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01439';
UPDATE products
SET sku = 'MED-00622',
    name = 'SLEEPWELL Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.35,
    cost = 10.76,
    reorder_level = 20,
    expiry_date = DATE '2029-11-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01440';
UPDATE products
SET sku = 'MED-00623',
    name = 'SOLMUX 100mg/ 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 38.09,
    cost = 29.80,
    reorder_level = 20,
    expiry_date = DATE '2029-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01441';
UPDATE products
SET sku = 'MED-00624',
    name = 'SOLMUX 200mg/ 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 51.33,
    cost = 42.73,
    reorder_level = 20,
    expiry_date = DATE '2028-12-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01442';
UPDATE products
SET sku = 'MED-00625',
    name = 'SOLMUX 200mg/120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 57.57,
    cost = 44.97,
    reorder_level = 20,
    expiry_date = DATE '2027-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01443';
UPDATE products
SET sku = 'MED-00626',
    name = 'SOLMUX 500mg Capsule 4''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 65.09,
    cost = 50.17,
    reorder_level = 20,
    expiry_date = DATE '2030-04-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01444';
UPDATE products
SET sku = 'MED-00627',
    name = 'SOLMUX 500mg Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 8.34,
    cost = 6.65,
    reorder_level = 20,
    expiry_date = DATE '2030-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01445';
UPDATE products
SET sku = 'MED-00628',
    name = 'SOLMUX Broncho Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 13.00,
    cost = 10.82,
    reorder_level = 20,
    expiry_date = DATE '2027-09-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01446';
UPDATE products
SET sku = 'MED-00629',
    name = 'SOLMUX Broncho/ 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 62.12,
    cost = 48.25,
    reorder_level = 20,
    expiry_date = DATE '2028-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01447';
UPDATE products
SET sku = 'MED-00630',
    name = 'SOLMUX Drops*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 50.32,
    cost = 40.08,
    reorder_level = 20,
    expiry_date = DATE '2027-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01448';
UPDATE products
SET sku = 'MED-00631',
    name = 'SOLMUX Forte/ 60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Mucolytic agent for loosening tough phlegm, facilitating mucus clearance, and soothing productive coughs.',
    quantity = 100,
    price = 65.66,
    cost = 53.52,
    reorder_level = 20,
    expiry_date = DATE '2029-11-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01449';
UPDATE products
SET sku = 'NPH-01065',
    name = 'SPIRIT OF AMMONIA 15mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 37.84,
    cost = 29.02,
    reorder_level = 20,
    expiry_date = DATE '2029-11-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01450';
UPDATE products
SET sku = 'MED-00632',
    name = 'STREPSILS Cool  2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 34.84,
    cost = 28.75,
    reorder_level = 20,
    expiry_date = DATE '2027-12-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01451';
UPDATE products
SET sku = 'MED-00633',
    name = 'STREPSILS Cool  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.55,
    cost = 31.84,
    reorder_level = 20,
    expiry_date = DATE '2028-06-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01452';
UPDATE products
SET sku = 'MED-00634',
    name = 'STREPSILS Cool 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 336.89,
    cost = 261.82,
    reorder_level = 20,
    expiry_date = DATE '2029-09-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01453';
UPDATE products
SET sku = 'MED-00635',
    name = 'STREPSILS Dry Cough 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 70.19,
    cost = 57.83,
    reorder_level = 20,
    expiry_date = DATE '2028-06-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01454';
UPDATE products
SET sku = 'MED-00636',
    name = 'STREPSILS Extra Strong 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 35.25,
    cost = 27.42,
    reorder_level = 20,
    expiry_date = DATE '2029-05-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01455';
UPDATE products
SET sku = 'MED-00637',
    name = 'STREPSILS Honeylemon  2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 57.85,
    cost = 45.60,
    reorder_level = 20,
    expiry_date = DATE '2030-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01456';
UPDATE products
SET sku = 'MED-00638',
    name = 'STREPSILS Honeylemon  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.01,
    cost = 14.88,
    reorder_level = 20,
    expiry_date = DATE '2030-02-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01457';
UPDATE products
SET sku = 'MED-00639',
    name = 'STREPSILS Honeylemon 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 369.35,
    cost = 283.42,
    reorder_level = 20,
    expiry_date = DATE '2027-07-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01458';
UPDATE products
SET sku = 'MED-00640',
    name = 'STREPSILS Max  6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.21,
    cost = 40.94,
    reorder_level = 20,
    expiry_date = DATE '2030-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01459';
UPDATE products
SET sku = 'MED-00641',
    name = 'STREPSILS Orange  2''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.64,
    cost = 41.17,
    reorder_level = 20,
    expiry_date = DATE '2030-05-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01460';
UPDATE products
SET sku = 'MED-00642',
    name = 'STREPSILS Orange  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.37,
    cost = 29.57,
    reorder_level = 20,
    expiry_date = DATE '2028-01-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01461';
UPDATE products
SET sku = 'MED-00643',
    name = 'STREPSILS Orange 24''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 376.80,
    cost = 304.88,
    reorder_level = 20,
    expiry_date = DATE '2029-03-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01462';
UPDATE products
SET sku = 'MED-00644',
    name = 'STREPSILS Original  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 44.93,
    cost = 34.29,
    reorder_level = 20,
    expiry_date = DATE '2027-11-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01463';
UPDATE products
SET sku = 'MED-00645',
    name = 'STREPSILS Sugar-Free  6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 70.24,
    cost = 54.81,
    reorder_level = 20,
    expiry_date = DATE '2028-12-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01464';
UPDATE products
SET sku = 'MED-00646',
    name = 'STREPSILS Warm  8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.59,
    cost = 40.89,
    reorder_level = 20,
    expiry_date = DATE '2030-02-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01465';
UPDATE products
SET sku = 'MED-00647',
    name = 'STRESSTABS Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 13.38,
    cost = 10.93,
    reorder_level = 20,
    expiry_date = DATE '2027-01-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01466';
UPDATE products
SET sku = 'NPH-01066',
    name = 'STRONG AMMONIA  15mL (LAR)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 25.65,
    cost = 21.14,
    reorder_level = 20,
    expiry_date = DATE '2030-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01467';
UPDATE products
SET sku = 'NPH-01067',
    name = 'STYLEX Gel  50g (Clear)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 42.26,
    cost = 34.34,
    reorder_level = 20,
    expiry_date = DATE '2029-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01468';
UPDATE products
SET sku = 'NPH-01068',
    name = 'STYLEX Gel  50g (Green)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.53,
    cost = 30.64,
    reorder_level = 20,
    expiry_date = DATE '2030-01-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01469';
UPDATE products
SET sku = 'NPH-01069',
    name = 'STYLEX Gel  50g (Yellow)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 58.40,
    cost = 46.95,
    reorder_level = 20,
    expiry_date = DATE '2030-05-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01470';
UPDATE products
SET sku = 'NPH-01070',
    name = 'STYLEX Gel 125g (Clear)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 26.82,
    cost = 21.48,
    reorder_level = 20,
    expiry_date = DATE '2027-09-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01471';
UPDATE products
SET sku = 'NPH-01071',
    name = 'STYLEX Gel 125g (Green)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 43.38,
    cost = 35.79,
    reorder_level = 20,
    expiry_date = DATE '2027-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01472';
UPDATE products
SET sku = 'NPH-01072',
    name = 'STYLEX Gel 125g (Yellow)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 25.98,
    cost = 21.19,
    reorder_level = 20,
    expiry_date = DATE '2029-07-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01473';
UPDATE products
SET sku = 'NPH-01073',
    name = 'STYLEX Hair Polish  50mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 56.46,
    cost = 42.98,
    reorder_level = 20,
    expiry_date = DATE '2027-12-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01474';
UPDATE products
SET sku = 'NPH-01074',
    name = 'STYLEX Hair Polish 100mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 76.90,
    cost = 62.76,
    reorder_level = 20,
    expiry_date = DATE '2029-12-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01475';
UPDATE products
SET sku = 'NPH-01075',
    name = 'STYLEX Hair Polish 150mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 94.73,
    cost = 73.49,
    reorder_level = 20,
    expiry_date = DATE '2028-01-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01476';
UPDATE products
SET sku = 'NPH-01076',
    name = 'STYLEX Setting Lotion 125g (Clear)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.61,
    cost = 17.03,
    reorder_level = 20,
    expiry_date = DATE '2030-04-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01477';
UPDATE products
SET sku = 'NPH-01077',
    name = 'STYLEX Setting Lotion 250g (Clear)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.37,
    cost = 31.10,
    reorder_level = 20,
    expiry_date = DATE '2029-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01478';
UPDATE products
SET sku = 'NPH-01078',
    name = 'STYLEX Setting Lotion 500g (Clear)-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 39.75,
    cost = 31.16,
    reorder_level = 20,
    expiry_date = DATE '2027-11-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01479';
UPDATE products
SET sku = 'MED-00648',
    name = 'SUMAPEN Capsule 250mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.61,
    cost = 15.27,
    reorder_level = 20,
    expiry_date = DATE '2029-01-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01480';
UPDATE products
SET sku = 'MED-00649',
    name = 'SUMAPEN Capsule 500mg*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 8.61,
    cost = 6.95,
    reorder_level = 20,
    expiry_date = DATE '2027-08-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01481';
UPDATE products
SET sku = 'NPH-01079',
    name = 'SUNSILK Sham.180mL-Damage Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 51.36,
    cost = 41.23,
    reorder_level = 20,
    expiry_date = DATE '2029-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01482';
UPDATE products
SET sku = 'NPH-01080',
    name = 'SUNSILK Sham.180mL-Smooth&Mngble',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 103.92,
    cost = 79.36,
    reorder_level = 20,
    expiry_date = DATE '2030-05-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01483';
UPDATE products
SET sku = 'NPH-01081',
    name = 'SUNSILK Sham.90mL-Damage Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 59.27,
    cost = 48.34,
    reorder_level = 20,
    expiry_date = DATE '2028-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01484';
UPDATE products
SET sku = 'NPH-01082',
    name = 'SUNSILK Sham.90mL-Smooth&Mngble',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 27.39,
    cost = 21.48,
    reorder_level = 20,
    expiry_date = DATE '2030-03-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01485';
UPDATE products
SET sku = 'NPH-01083',
    name = 'SUNSILK Sham.90mL-Strong & Long',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 58.28,
    cost = 47.87,
    reorder_level = 20,
    expiry_date = DATE '2027-09-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01486';
UPDATE products
SET sku = 'NPH-01084',
    name = 'SUNSILK Sham.Sach-Damage Repair',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 69.03,
    cost = 52.45,
    reorder_level = 20,
    expiry_date = DATE '2030-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01487';
UPDATE products
SET sku = 'NPH-01085',
    name = 'SUNSILK Sham.Sach-Smooth & Mngble',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 56.31,
    cost = 43.82,
    reorder_level = 20,
    expiry_date = DATE '2028-06-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01488';
UPDATE products
SET sku = 'NPH-01086',
    name = 'SUNSILK Shamp Sach (Strong & Long)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Hair care shampoo and conditioner formula for smooth, manageable, and fragrant hair.',
    quantity = 100,
    price = 35.64,
    cost = 27.29,
    reorder_level = 20,
    expiry_date = DATE '2029-05-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01489';
UPDATE products
SET sku = 'NPH-01087',
    name = 'SUPERSCENT Oil  25mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 30.28,
    cost = 24.21,
    reorder_level = 20,
    expiry_date = DATE '2030-02-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01490';
UPDATE products
SET sku = 'NPH-01088',
    name = 'SUPERSCENT Oil  50mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 60.08,
    cost = 49.38,
    reorder_level = 20,
    expiry_date = DATE '2030-11-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01491';
UPDATE products
SET sku = 'NPH-01089',
    name = 'SUPERSCENT Oil 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 81.71,
    cost = 64.34,
    reorder_level = 20,
    expiry_date = DATE '2027-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01492';
UPDATE products
SET sku = 'MED-00650',
    name = 'SYNALAR-10 Cream 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 32.94,
    cost = 26.75,
    reorder_level = 20,
    expiry_date = DATE '2030-07-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01493';
UPDATE products
SET sku = 'MED-00651',
    name = 'SYNALAR-25 Ointment 5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.67,
    cost = 36.26,
    reorder_level = 20,
    expiry_date = DATE '2028-03-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01494';
UPDATE products
SET sku = 'MED-00652',
    name = 'TAUREX Drops 30mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.84,
    cost = 18.00,
    reorder_level = 20,
    expiry_date = DATE '2028-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01495';
UPDATE products
SET sku = 'MED-00653',
    name = 'TAUREX Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 43.29,
    cost = 33.29,
    reorder_level = 20,
    expiry_date = DATE '2029-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01496';
UPDATE products
SET sku = 'MED-00654',
    name = 'TAUREX Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 62.73,
    cost = 49.69,
    reorder_level = 20,
    expiry_date = DATE '2029-12-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01497';
UPDATE products
SET sku = 'MED-00655',
    name = 'TAUREX Syrup 240mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 123.63,
    cost = 97.48,
    reorder_level = 20,
    expiry_date = DATE '2027-07-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01498';
UPDATE products
SET sku = 'NPH-01090',
    name = 'TAWAS Powder 50g-Perfme SnowWhte',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 38.02,
    cost = 31.17,
    reorder_level = 20,
    expiry_date = DATE '2027-01-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01499';
UPDATE products
SET sku = 'NPH-01091',
    name = 'TAWAS Powder 50g-Reg. Snow White',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 74.29,
    cost = 56.64,
    reorder_level = 20,
    expiry_date = DATE '2027-12-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01500';
UPDATE products
SET sku = 'NPH-01092',
    name = 'TAWAS Scented Powder 50g (Hailey''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 35.41,
    cost = 27.20,
    reorder_level = 20,
    expiry_date = DATE '2028-04-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01501';
UPDATE products
SET sku = 'NPH-01093',
    name = 'TAWAS Unscented Powder 50g (Hailey''s)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Pediatric and infant care essential formulated with gentle ingredients for delicate baby skin.',
    quantity = 100,
    price = 66.67,
    cost = 53.70,
    reorder_level = 20,
    expiry_date = DATE '2030-09-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01502';
UPDATE products
SET sku = 'MED-00656',
    name = 'TEMPRA 1-5 yrs Syr  60mL-Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 59.21,
    cost = 45.11,
    reorder_level = 20,
    expiry_date = DATE '2030-10-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01503';
UPDATE products
SET sku = 'MED-00657',
    name = 'TEMPRA 1-5 yrs Syr  60mL-Strawberry',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.66,
    cost = 29.49,
    reorder_level = 20,
    expiry_date = DATE '2027-11-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01504';
UPDATE products
SET sku = 'MED-00658',
    name = 'TEMPRA 1-5 yrs Syr 120mL-Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 68.54,
    cost = 52.20,
    reorder_level = 20,
    expiry_date = DATE '2029-09-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01505';
UPDATE products
SET sku = 'MED-00659',
    name = 'TEMPRA 325mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.59,
    cost = 16.83,
    reorder_level = 20,
    expiry_date = DATE '2030-08-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01506';
UPDATE products
SET sku = 'MED-00660',
    name = 'TEMPRA Drops 15mL-Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 19.56,
    cost = 15.94,
    reorder_level = 20,
    expiry_date = DATE '2030-06-27',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01507';
UPDATE products
SET sku = 'MED-00661',
    name = 'TEMPRA Forte 500mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 11.57,
    cost = 8.90,
    reorder_level = 20,
    expiry_date = DATE '2030-06-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01508';
UPDATE products
SET sku = 'MED-00662',
    name = 'TEMPRA Forte Syr  60mL-Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 38.19,
    cost = 29.83,
    reorder_level = 20,
    expiry_date = DATE '2028-12-21',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01509';
UPDATE products
SET sku = 'MED-00663',
    name = 'TEMPRA Forte Syr  60mL-Strawberry',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.07,
    cost = 41.57,
    reorder_level = 20,
    expiry_date = DATE '2030-10-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01510';
UPDATE products
SET sku = 'MED-00664',
    name = 'TEMPRA Forte Syr 120mL-Orange',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 74.75,
    cost = 61.10,
    reorder_level = 20,
    expiry_date = DATE '2029-11-07',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01511';
UPDATE products
SET sku = 'NPH-01094',
    name = 'TENA Adult Diaper Maxi Large 9''S',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 47.79,
    cost = 36.32,
    reorder_level = 20,
    expiry_date = DATE '2029-11-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01512';
UPDATE products
SET sku = 'NPH-01095',
    name = 'TENA Adult Diaper Maxi Medium 9''S',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Breathable and ultra-absorbent baby diaper core engineered for long-lasting dryness and skin comfort.',
    quantity = 100,
    price = 67.41,
    cost = 52.01,
    reorder_level = 20,
    expiry_date = DATE '2027-12-05',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01513';
UPDATE products
SET sku = 'NPH-01096',
    name = 'TENDER CARE Powder 100g (Blue)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.21,
    cost = 20.98,
    reorder_level = 20,
    expiry_date = DATE '2029-01-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01514';
UPDATE products
SET sku = 'NPH-01097',
    name = 'TENDER CARE Powder 100g (Pink)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.08,
    cost = 39.97,
    reorder_level = 20,
    expiry_date = DATE '2027-02-02',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01515';
UPDATE products
SET sku = 'NPH-01098',
    name = 'TENDER CARE Powder 100g (Sakura)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 57.27,
    cost = 43.74,
    reorder_level = 20,
    expiry_date = DATE '2028-07-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01516';
UPDATE products
SET sku = 'MED-00665',
    name = 'TERRAMYCIN Eye Ointment 3.5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 17.02,
    cost = 14.15,
    reorder_level = 20,
    expiry_date = DATE '2029-01-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01517';
UPDATE products
SET sku = 'NPH-01099',
    name = 'TIGER BALM 19g (Red)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 32.22,
    cost = 24.88,
    reorder_level = 20,
    expiry_date = DATE '2029-11-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01518';
UPDATE products
SET sku = 'MED-00666',
    name = 'TIKI-TIKI Drops 15mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.25,
    cost = 14.04,
    reorder_level = 20,
    expiry_date = DATE '2028-12-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01519';
UPDATE products
SET sku = 'MED-00667',
    name = 'TIKI-TIKI Drops 30mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 37.27,
    cost = 30.74,
    reorder_level = 20,
    expiry_date = DATE '2030-01-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01520';
UPDATE products
SET sku = 'MED-00668',
    name = 'TIKI-TIKI STAR Syrup  60mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 57.79,
    cost = 47.85,
    reorder_level = 20,
    expiry_date = DATE '2030-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01521';
UPDATE products
SET sku = 'MED-00669',
    name = 'TIKI-TIKI STAR Syrup 120mL*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 59.32,
    cost = 46.12,
    reorder_level = 20,
    expiry_date = DATE '2030-12-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01522';
UPDATE products
SET sku = 'NPH-01100',
    name = 'TOOTHACHE Drops 7.5mL (Dann''s Aid)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Galenical first-aid preparation for minor skin irritations, soothing relief, or antiseptic application.',
    quantity = 100,
    price = 21.11,
    cost = 17.53,
    reorder_level = 20,
    expiry_date = DATE '2027-08-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01523';
UPDATE products
SET sku = 'NPH-01101',
    name = 'TOP-GEL Extra Pearl Cream',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 31.41,
    cost = 24.55,
    reorder_level = 20,
    expiry_date = DATE '2030-02-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01524';
UPDATE products
SET sku = 'NPH-01102',
    name = 'TOP-GEL Extra Pearl Crm w/ Vit. E',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 36.55,
    cost = 28.45,
    reorder_level = 20,
    expiry_date = DATE '2028-02-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01525';
UPDATE products
SET sku = 'NPH-01103',
    name = 'TOP-GEL M Cream (Medicated)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.09,
    cost = 36.59,
    reorder_level = 20,
    expiry_date = DATE '2029-05-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01526';
UPDATE products
SET sku = 'MED-00670',
    name = 'TROSYD Cream  5g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 48.73,
    cost = 39.92,
    reorder_level = 20,
    expiry_date = DATE '2029-11-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01527';
UPDATE products
SET sku = 'NPH-01104',
    name = 'TRUST Condom 24''s-Regular',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Electronically tested premium lubricated latex condom for effective protection and family planning.',
    quantity = 100,
    price = 316.51,
    cost = 249.03,
    reorder_level = 20,
    expiry_date = DATE '2030-07-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01528';
UPDATE products
SET sku = 'NPH-01105',
    name = 'TRUST Condom 24''s-Strawberry',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Electronically tested premium lubricated latex condom for effective protection and family planning.',
    quantity = 100,
    price = 391.57,
    cost = 320.93,
    reorder_level = 20,
    expiry_date = DATE '2028-04-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01529';
UPDATE products
SET sku = 'NPH-01106',
    name = 'TRUST Pills',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Electronically tested premium lubricated latex condom for effective protection and family planning.',
    quantity = 100,
    price = 63.16,
    cost = 50.71,
    reorder_level = 20,
    expiry_date = DATE '2028-06-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01530';
UPDATE products
SET sku = 'MED-00671',
    name = 'TUSERAN Forte Capsule 4''s*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.76,
    cost = 38.62,
    reorder_level = 20,
    expiry_date = DATE '2030-11-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01531';
UPDATE products
SET sku = 'MED-00672',
    name = 'TUSERAN Forte Capsule*',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 5.84,
    cost = 4.58,
    reorder_level = 20,
    expiry_date = DATE '2029-03-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01532';
UPDATE products
SET sku = 'MED-00673',
    name = 'TUSERAN Night  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 58.49,
    cost = 48.69,
    reorder_level = 20,
    expiry_date = DATE '2029-07-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01533';
UPDATE products
SET sku = 'NPH-01107',
    name = 'VASELINE Lotion  25mL (Healthy White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.14,
    cost = 23.82,
    reorder_level = 20,
    expiry_date = DATE '2027-03-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01534';
UPDATE products
SET sku = 'NPH-01108',
    name = 'VASELINE Lotion  25mL (Total Moisture)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 29.83,
    cost = 23.26,
    reorder_level = 20,
    expiry_date = DATE '2030-04-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01535';
UPDATE products
SET sku = 'NPH-01109',
    name = 'VASELINE Lotion 100mL (Healthy White)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 93.05,
    cost = 74.20,
    reorder_level = 20,
    expiry_date = DATE '2030-02-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01536';
UPDATE products
SET sku = 'NPH-01110',
    name = 'VASELINE Lotion 100mL (Total Moisture)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 77.14,
    cost = 61.45,
    reorder_level = 20,
    expiry_date = DATE '2028-07-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01537';
UPDATE products
SET sku = 'NPH-01111',
    name = 'VASELINE Lotion 100mL H/w Spf 24',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 101.93,
    cost = 81.03,
    reorder_level = 20,
    expiry_date = DATE '2027-08-13',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01538';
UPDATE products
SET sku = 'NPH-01112',
    name = 'VASELINE Lotion 200mL (Total Moisture)',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.36,
    cost = 37.48,
    reorder_level = 20,
    expiry_date = DATE '2028-02-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01539';
UPDATE products
SET sku = 'MED-00674',
    name = 'VENTOLIN Expectorant Syrup  60mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 38.93,
    cost = 31.81,
    reorder_level = 20,
    expiry_date = DATE '2030-02-11',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01540';
UPDATE products
SET sku = 'MED-00675',
    name = 'VENTOLIN Expectorant Syrup 120mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 96.73,
    cost = 79.78,
    reorder_level = 20,
    expiry_date = DATE '2030-07-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01541';
UPDATE products
SET sku = 'MED-00676',
    name = 'VENTOLIN Inhaler',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 26.77,
    cost = 20.93,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01542';
UPDATE products
SET sku = 'MED-00677',
    name = 'VENTOLIN Nebules 5''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 12.50,
    cost = 9.62,
    reorder_level = 20,
    expiry_date = DATE '2030-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01543';
UPDATE products
SET sku = 'MED-00678',
    name = 'VENTOLIN Rotacaps 128''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 8.41,
    cost = 6.64,
    reorder_level = 20,
    expiry_date = DATE '2029-11-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01544';
UPDATE products
SET sku = 'MED-00679',
    name = 'VENTOLIN Syrup  60mL (Orange)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 33.88,
    cost = 26.77,
    reorder_level = 20,
    expiry_date = DATE '2028-09-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01545';
UPDATE products
SET sku = 'MED-00680',
    name = 'VENTOLIN Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Bronchodilator respiratory medication for rapid relief and management of asthma and bronchospasm.',
    quantity = 100,
    price = 16.19,
    cost = 12.67,
    reorder_level = 20,
    expiry_date = DATE '2028-08-10',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01546';
UPDATE products
SET sku = 'MED-00681',
    name = 'VICKS BabyRub 20g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 50.44,
    cost = 39.93,
    reorder_level = 20,
    expiry_date = DATE '2028-11-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01547';
UPDATE products
SET sku = 'MED-00682',
    name = 'VICKS Formula-44 Syrup  54mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 14.51,
    cost = 11.48,
    reorder_level = 20,
    expiry_date = DATE '2027-06-06',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01548';
UPDATE products
SET sku = 'MED-00683',
    name = 'VICKS Formula-44 Syrup 100mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 94.90,
    cost = 75.26,
    reorder_level = 20,
    expiry_date = DATE '2027-10-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01549';
UPDATE products
SET sku = 'MED-00684',
    name = 'VICKS Inhaler 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 66.47,
    cost = 50.59,
    reorder_level = 20,
    expiry_date = DATE '2028-11-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01550';
UPDATE products
SET sku = 'MED-00685',
    name = 'VICKS Vaporub  5g 60''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 45.24,
    cost = 34.34,
    reorder_level = 20,
    expiry_date = DATE '2030-05-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01551';
UPDATE products
SET sku = 'MED-00686',
    name = 'VICKS Vaporub 10g 60''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 18.69,
    cost = 14.72,
    reorder_level = 20,
    expiry_date = DATE '2027-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01552';
UPDATE products
SET sku = 'MED-00687',
    name = 'VICKS Vaporub 25g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 29.12,
    cost = 23.20,
    reorder_level = 20,
    expiry_date = DATE '2029-12-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01553';
UPDATE products
SET sku = 'MED-00688',
    name = 'VICKS Vaporub 50g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 27.33,
    cost = 22.64,
    reorder_level = 20,
    expiry_date = DATE '2029-08-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01554';
UPDATE products
SET sku = 'MED-00689',
    name = 'VINO DE QUINA ( LA CARMINA )',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 52.71,
    cost = 43.85,
    reorder_level = 20,
    expiry_date = DATE '2029-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01555';
UPDATE products
SET sku = 'MED-00690',
    name = 'VIRLIX Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 22.20,
    cost = 17.13,
    reorder_level = 20,
    expiry_date = DATE '2027-04-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01556';
UPDATE products
SET sku = 'MED-00691',
    name = 'VISINE Eye Drops  6mL (Refresh)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 53.92,
    cost = 43.58,
    reorder_level = 20,
    expiry_date = DATE '2028-10-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01557';
UPDATE products
SET sku = 'MED-00692',
    name = 'VISINE Eye Drops  6mL (Regular)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 32.45,
    cost = 26.54,
    reorder_level = 20,
    expiry_date = DATE '2030-05-08',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01558';
UPDATE products
SET sku = 'MED-00693',
    name = 'VITAMIN B1+B6+B12 (Pharex) 500s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 16.08,
    cost = 12.66,
    reorder_level = 20,
    expiry_date = DATE '2030-05-03',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01559';
UPDATE products
SET sku = 'MED-00694',
    name = 'VITAMIN B-COMPLEX 100''s (RHEA)',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 506.20,
    cost = 398.56,
    reorder_level = 20,
    expiry_date = DATE '2027-02-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01560';
UPDATE products
SET sku = 'NPH-01113',
    name = 'VITRESS Hair C.Coat 15mL-CLASSIC-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.05,
    cost = 25.13,
    reorder_level = 20,
    expiry_date = DATE '2028-04-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01561';
UPDATE products
SET sku = 'NPH-01114',
    name = 'VITRESS Hair C.Coat 15mL-H/Protect-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 44.19,
    cost = 35.97,
    reorder_level = 20,
    expiry_date = DATE '2028-04-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01562';
UPDATE products
SET sku = 'NPH-01115',
    name = 'VITRESS Hair C.Coat 15mL-H/Repair-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.62,
    cost = 40.16,
    reorder_level = 20,
    expiry_date = DATE '2028-10-12',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01563';
UPDATE products
SET sku = 'NPH-01116',
    name = 'VITRESS Hair C.Coat 15mL-I/Relax-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 41.35,
    cost = 32.56,
    reorder_level = 20,
    expiry_date = DATE '2030-09-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01564';
UPDATE products
SET sku = 'NPH-01117',
    name = 'VITRESS Hair C.Coat 30mL-CLASSIC-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 27.41,
    cost = 22.78,
    reorder_level = 20,
    expiry_date = DATE '2029-08-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01565';
UPDATE products
SET sku = 'NPH-01118',
    name = 'VITRESS Hair C.Coat 30mL-CLSC-R 1+1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 45.29,
    cost = 37.73,
    reorder_level = 20,
    expiry_date = DATE '2029-03-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01566';
UPDATE products
SET sku = 'NPH-01119',
    name = 'VITRESS Hair C.Coat 30mL-H/Protect-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 20.67,
    cost = 17.15,
    reorder_level = 20,
    expiry_date = DATE '2027-02-17',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01567';
UPDATE products
SET sku = 'NPH-01120',
    name = 'VITRESS Hair C.Coat 30mL-H/Repair-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 48.57,
    cost = 40.07,
    reorder_level = 20,
    expiry_date = DATE '2027-10-16',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01568';
UPDATE products
SET sku = 'NPH-01121',
    name = 'VITRESS Hair C.Coat 30mL-I/Relax-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 23.87,
    cost = 18.25,
    reorder_level = 20,
    expiry_date = DATE '2027-03-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01569';
UPDATE products
SET sku = 'NPH-01122',
    name = 'VITRESS Hair C.Coat 50mL-CLASSIC-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 70.83,
    cost = 57.83,
    reorder_level = 20,
    expiry_date = DATE '2029-10-14',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01570';
UPDATE products
SET sku = 'NPH-01123',
    name = 'VITRESS Hair Freshener 50mL-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 52.53,
    cost = 40.93,
    reorder_level = 20,
    expiry_date = DATE '2030-08-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01571';
UPDATE products
SET sku = 'NPH-01124',
    name = 'VITRESS HairPolish L-Lasting  50mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 72.32,
    cost = 56.77,
    reorder_level = 20,
    expiry_date = DATE '2028-08-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01572';
UPDATE products
SET sku = 'NPH-01125',
    name = 'VITRESS HairPolish L-Lasting 100mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.19,
    cost = 41.63,
    reorder_level = 20,
    expiry_date = DATE '2029-02-26',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01573';
UPDATE products
SET sku = 'NPH-01126',
    name = 'VITRESS HairPolish Strengthng  50mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 73.24,
    cost = 56.56,
    reorder_level = 20,
    expiry_date = DATE '2027-05-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01574';
UPDATE products
SET sku = 'NPH-01127',
    name = 'VITRESS HairPolish Strengthng100mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 46.33,
    cost = 36.94,
    reorder_level = 20,
    expiry_date = DATE '2028-07-23',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01575';
UPDATE products
SET sku = 'NPH-01128',
    name = 'VITRESS HairPolish Sun Protect  50mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.23,
    cost = 37.68,
    reorder_level = 20,
    expiry_date = DATE '2029-04-29',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01576';
UPDATE products
SET sku = 'NPH-01129',
    name = 'VITRESS HairPolish Sun Protect 100mL-R',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 50.60,
    cost = 39.64,
    reorder_level = 20,
    expiry_date = DATE '2028-10-22',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01577';
UPDATE products
SET sku = 'NPH-01130',
    name = 'VITRESS Hr Frshr 50mL+Vitress 30mL-N',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 32.93,
    cost = 25.04,
    reorder_level = 20,
    expiry_date = DATE '2028-09-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01578';
UPDATE products
SET sku = 'NPH-01131',
    name = 'WHISPER Cottony Extra Long E/H/F 7''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 47.20,
    cost = 38.23,
    reorder_level = 20,
    expiry_date = DATE '2029-05-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01579';
UPDATE products
SET sku = 'NPH-01132',
    name = 'WHISPER Cottony Long W/Wing 8"s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 62.85,
    cost = 48.25,
    reorder_level = 20,
    expiry_date = DATE '2029-07-09',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01580';
UPDATE products
SET sku = 'NPH-01133',
    name = 'WHISPER Cottony RegFlow NoWing 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 65.70,
    cost = 50.23,
    reorder_level = 20,
    expiry_date = DATE '2027-04-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01581';
UPDATE products
SET sku = 'NPH-01134',
    name = 'WHISPER Cottony RegFlow Wings 8''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 59.87,
    cost = 47.55,
    reorder_level = 20,
    expiry_date = DATE '2029-10-31',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01582';
UPDATE products
SET sku = 'NPH-01135',
    name = 'WHISPER Cottony Single Wings 16''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Personal grooming and cosmetic hygiene product compliant with DTI consumer safety guidelines.',
    quantity = 100,
    price = 49.49,
    cost = 39.39,
    reorder_level = 20,
    expiry_date = DATE '2028-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01583';
UPDATE products
SET sku = 'NPH-01136',
    name = 'WHITE FLOWER #1',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 26.19,
    cost = 21.13,
    reorder_level = 20,
    expiry_date = DATE '2028-05-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01584';
UPDATE products
SET sku = 'NPH-01137',
    name = 'WHITE FLOWER #2',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 61.98,
    cost = 51.11,
    reorder_level = 20,
    expiry_date = DATE '2029-06-20',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01585';
UPDATE products
SET sku = 'NPH-01138',
    name = 'WHITE FLOWER #3',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 66.34,
    cost = 54.15,
    reorder_level = 20,
    expiry_date = DATE '2030-05-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01586';
UPDATE products
SET sku = 'NPH-01139',
    name = 'WHITE FLOWER #4',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 33.62,
    cost = 26.92,
    reorder_level = 20,
    expiry_date = DATE '2027-08-24',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01587';
UPDATE products
SET sku = 'NPH-01140',
    name = 'WHITE FLOWER #5 12''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Soothing topical analgesic balm / liniment for headache, dizziness, motion sickness, and muscle stiffness.',
    quantity = 100,
    price = 86.60,
    cost = 68.94,
    reorder_level = 20,
    expiry_date = DATE '2029-11-19',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01588';
UPDATE products
SET sku = 'NPH-01141',
    name = 'WILKINS Distilled Water 4000mL 4''s',
    category_id = (SELECT id FROM categories WHERE name = 'Non-pharmaceutical' LIMIT 1),
    description = 'Consumer merchandise product distributed in accordance with standard retail standards.',
    quantity = 100,
    price = 74.03,
    cost = 57.08,
    reorder_level = 20,
    expiry_date = DATE '2030-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01589';
UPDATE products
SET sku = 'MED-00695',
    name = 'WOODS'' 20mg/7mL Syrup Sachet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 12.77,
    cost = 10.63,
    reorder_level = 20,
    expiry_date = DATE '2028-07-30',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01590';
UPDATE products
SET sku = 'MED-00696',
    name = 'WOODS'' Peppermint Lozenges 6''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 65.12,
    cost = 53.23,
    reorder_level = 20,
    expiry_date = DATE '2028-06-04',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01591';
UPDATE products
SET sku = 'MED-00697',
    name = 'XANTHONE Plus Capsule',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 20.22,
    cost = 15.84,
    reorder_level = 20,
    expiry_date = DATE '2030-09-25',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01592';
UPDATE products
SET sku = 'MED-00698',
    name = 'XYLOGEL Teething Oral Gel 25g',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 51.88,
    cost = 40.52,
    reorder_level = 20,
    expiry_date = DATE '2027-08-28',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01593';
UPDATE products
SET sku = 'MED-00699',
    name = 'ZITHROMAX Capsule 500mg 3''s',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 71.63,
    cost = 59.59,
    reorder_level = 20,
    expiry_date = DATE '2028-11-01',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01594';
UPDATE products
SET sku = 'MED-00700',
    name = 'ZITHROMAX Suspension 15mL',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 21.06,
    cost = 17.23,
    reorder_level = 20,
    expiry_date = DATE '2028-03-15',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01595';
UPDATE products
SET sku = 'MED-00701',
    name = 'Zykast 10mg/5mg Tablet',
    category_id = (SELECT id FROM categories WHERE name = 'Pharmaceutical' LIMIT 1),
    description = 'Pharmaceutical oral/topical formulation indicated for health maintenance and clinical treatment.',
    quantity = 100,
    price = 18.58,
    cost = 15.29,
    reorder_level = 20,
    expiry_date = DATE '2029-10-18',
    new_stock_quantity = 0,
    new_stock_expiry = NULL
WHERE sku = 'MASTER-01596';

INSERT INTO audit_logs (user_name, action, details)
VALUES ('Bulk Product Update', 'Master Product Details Update',
'Updated 1842 products: MED/NPH structured SKU, quantity 100, reorder 20, supplied cost/SRP/expiry/description, and official category mapping.');

DO $$
DECLARE
  v_count integer;
  v_sku_count integer;
  v_qty_count integer;
  v_reorder_count integer;
  v_detail_count integer;
  v_pharma integer;
  v_nonpharma integer;
BEGIN
  SELECT COUNT(*) INTO v_count FROM products;
  SELECT COUNT(DISTINCT sku) INTO v_sku_count FROM products;
  SELECT COUNT(*) INTO v_qty_count FROM products
    WHERE quantity = 100 AND COALESCE(new_stock_quantity,0) = 0;
  SELECT COUNT(*) INTO v_reorder_count FROM products WHERE reorder_level = 20;
  SELECT COUNT(*) INTO v_detail_count FROM products
    WHERE price > 0 AND cost > 0 AND price >= cost
      AND expiry_date IS NOT NULL
      AND COALESCE(description,'') <> ''
      AND (sku ~ '^MED-[0-9]{5}$' OR sku ~ '^NPH-[0-9]{5}$');
  SELECT COUNT(*) INTO v_pharma
    FROM products p JOIN categories c ON c.id=p.category_id
    WHERE c.name='Pharmaceutical';
  SELECT COUNT(*) INTO v_nonpharma
    FROM products p JOIN categories c ON c.id=p.category_id
    WHERE c.name='Non-pharmaceutical';

  IF v_count <> 1842 THEN RAISE EXCEPTION 'Post-check failed: product count %', v_count; END IF;
  IF v_sku_count <> 1842 THEN RAISE EXCEPTION 'Post-check failed: unique SKU count %', v_sku_count; END IF;
  IF v_qty_count <> 1842 THEN RAISE EXCEPTION 'Post-check failed: quantity count %', v_qty_count; END IF;
  IF v_reorder_count <> 1842 THEN RAISE EXCEPTION 'Post-check failed: reorder count %', v_reorder_count; END IF;
  IF v_detail_count <> 1842 THEN RAISE EXCEPTION 'Post-check failed: populated detail count %', v_detail_count; END IF;
  IF v_pharma <> 701 THEN RAISE EXCEPTION 'Post-check failed: Pharmaceutical count %', v_pharma; END IF;
  IF v_nonpharma <> 1141 THEN RAISE EXCEPTION 'Post-check failed: Non-pharmaceutical count %', v_nonpharma; END IF;
END $$;

COMMIT;