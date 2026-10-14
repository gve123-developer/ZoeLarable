-- Zoe Pharmacy & General Merchandise
-- Official master synchronization
-- KEEP 246 | ADD 1596 | REMOVE/ARCHIVE 4 | FINAL ACTIVE PRODUCTS 1842

BEGIN;

INSERT INTO categories (name) SELECT 'Pharmaceutical'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Pharmaceutical');

INSERT INTO categories (name) SELECT 'Non-pharmaceutical'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Non-pharmaceutical');

-- Archive/remove live products not in official master list
INSERT INTO deleted_products
(original_id, sku, name, category, description, quantity, price, cost, reorder_level, expiry_date, deleted_by)
SELECT p.id, p.sku, p.name, c.name, p.description, p.quantity, p.price, p.cost,
       p.reorder_level, p.expiry_date, 'Bulk Master Sync'
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.id = 49
  AND NOT EXISTS (
    SELECT 1 FROM deleted_products d
    WHERE d.original_id = p.id AND d.sku = p.sku
  );
DELETE FROM products WHERE id = 49;

INSERT INTO deleted_products
(original_id, sku, name, category, description, quantity, price, cost, reorder_level, expiry_date, deleted_by)
SELECT p.id, p.sku, p.name, c.name, p.description, p.quantity, p.price, p.cost,
       p.reorder_level, p.expiry_date, 'Bulk Master Sync'
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.id = 48
  AND NOT EXISTS (
    SELECT 1 FROM deleted_products d
    WHERE d.original_id = p.id AND d.sku = p.sku
  );
DELETE FROM products WHERE id = 48;

INSERT INTO deleted_products
(original_id, sku, name, category, description, quantity, price, cost, reorder_level, expiry_date, deleted_by)
SELECT p.id, p.sku, p.name, c.name, p.description, p.quantity, p.price, p.cost,
       p.reorder_level, p.expiry_date, 'Bulk Master Sync'
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.id = 47
  AND NOT EXISTS (
    SELECT 1 FROM deleted_products d
    WHERE d.original_id = p.id AND d.sku = p.sku
  );
DELETE FROM products WHERE id = 47;

INSERT INTO deleted_products
(original_id, sku, name, category, description, quantity, price, cost, reorder_level, expiry_date, deleted_by)
SELECT p.id, p.sku, p.name, c.name, p.description, p.quantity, p.price, p.cost,
       p.reorder_level, p.expiry_date, 'Bulk Master Sync'
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.id = 46
  AND NOT EXISTS (
    SELECT 1 FROM deleted_products d
    WHERE d.original_id = p.id AND d.sku = p.sku
  );
DELETE FROM products WHERE id = 46;

-- Add official master products missing from live system
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00001', 'ALCOPLUS Ethyl 70% 60mL 6''s+1 Doz.Hard&Mat 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ALCOPLUS Ethyl 70% 60mL 6''s+1 Doz.Hard&Mat 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00002', 'ALCOPLUS Ethyl.70% 60 3''s+free Grips WaxHM', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ALCOPLUS Ethyl.70% 60 3''s+free Grips WaxHM', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00003', 'ALCOPLUS Iso.70% 60 3''s+free GripClay', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ALCOPLUS Iso.70% 60 3''s+free GripClay', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00004', 'ALCOPLUS Iso.70% 60 6''s+freeGripClay', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ALCOPLUS Iso.70% 60 6''s+freeGripClay', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00005', 'ALCOPLUS Isopropyl 70% 60mL-Spray', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ALCOPLUS Isopropyl 70% 60mL-Spray', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00006', 'C.Y.GABRIEL Soap  60-Special', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('C.Y.GABRIEL Soap  60-Special', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00007', 'CALACTATE 650mg (UHP) 100''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALACTATE 650mg (UHP) 100''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00008', 'CALADRYL Lotion 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALADRYL Lotion 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00009', 'CALAMINE Lotion 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALAMINE Lotion 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00010', 'CALAMINE Lotion 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALAMINE Lotion 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00011', 'CALCIUM LACTATE 650mg-Rhea 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALCIUM LACTATE 650mg-Rhea 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00012', 'CALCIUMADE Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALCIUMADE Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00013', 'CALMOSEPTINE Sachet 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALMOSEPTINE Sachet 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00014', 'CALPOL Drops 0-2 years     10mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALPOL Drops 0-2 years     10mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00015', 'CALPOL Syrup  2-6 years  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALPOL Syrup  2-6 years  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00016', 'CALPOL Syrup  6-12 years  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALPOL Syrup  6-12 years  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00017', 'CALTRATE Plus Tablet (Foil)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CALTRATE Plus Tablet (Foil)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00018', 'CANESTEN Cream  5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CANESTEN Cream  5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00019', 'CARE Adult Diaper Large 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARE Adult Diaper Large 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00020', 'CARE Adult Diaper Medium 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARE Adult Diaper Medium 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00021', 'CARE Adult Diaper Medium Singles', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARE Adult Diaper Medium Singles', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00022', 'CAREFREE  8''s-Breathable', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE  8''s-Breathable', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00023', 'CAREFREE  8''s-Healthy Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE  8''s-Healthy Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00024', 'CAREFREE  8''s-Super Dry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE  8''s-Super Dry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00025', 'CAREFREE 20''s-Breathable', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE 20''s-Breathable', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00026', 'CAREFREE 20''s-Healthy Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE 20''s-Healthy Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00027', 'CAREFREE 20''s-Super Dry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CAREFREE 20''s-Super Dry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00028', 'CARESS Adult Diaper Large  2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Adult Diaper Large  2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00029', 'CARESS Adult Diaper Large 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Adult Diaper Large 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00030', 'CARESS Adult Diaper Medium  1''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Adult Diaper Medium  1''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00031', 'CARESS Adult Diaper Medium 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Adult Diaper Medium 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00032', 'CARESS Underpad Large 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Underpad Large 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00033', 'CARESS Underpad Medium 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Underpad Medium 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00034', 'CARESS Underpad X-Large 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CARESS Underpad X-Large 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00035', 'CASINO Alcohol  60mL (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol  60mL (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00036', 'CASINO Alcohol  60mL (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol  60mL (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00037', 'CASINO Alcohol 150mL (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 150mL (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00038', 'CASINO Alcohol 150mL (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 150mL (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00039', 'CASINO Alcohol 250mL (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 250mL (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00040', 'CASINO Alcohol 250mL (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 250mL (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00041', 'CASINO Alcohol 40% 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 40% 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00042', 'CASINO Alcohol 40% 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 40% 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00043', 'CASINO Alcohol 500mL (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 500mL (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00044', 'CASINO Alcohol 500mL (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 500mL (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00045', 'CASINO Alcohol 70% 150mL (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 70% 150mL (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00046', 'CASINO Alcohol 70% 250mL (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Alcohol 70% 250mL (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00047', 'CASINO Femme W/Dual Moist  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Femme W/Dual Moist  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00048', 'CASINO Femme W/Dual Moist 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Femme W/Dual Moist 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00049', 'CASINO Femme W/Dual Moist 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Femme W/Dual Moist 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00050', 'CASINO Femme W/Dual Moist 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASINO Femme W/Dual Moist 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00051', 'CASTOR OIL 30mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASTOR OIL 30mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00052', 'CASTOR OIL 60mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASTOR OIL 60mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00053', 'CASTORIA 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASTORIA 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00054', 'CASTORIA 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CASTORIA 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00055', 'CATAFLAM Tablet 50mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CATAFLAM Tablet 50mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00056', 'CATAPRES Tablet  75mcg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CATAPRES Tablet  75mcg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00057', 'CEBO DE MACHO 10g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEBO DE MACHO 10g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00058', 'CEBO DE MACHO 25g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEBO DE MACHO 25g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00059', 'CECLOR Drops 20mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CECLOR Drops 20mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00060', 'CEELIN Chewable Tablet 30''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Chewable Tablet 30''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00061', 'CEELIN Chewable Tablet 60''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Chewable Tablet 60''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00062', 'CEELIN Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00063', 'CEELIN Drops 30mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Drops 30mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00064', 'CEELIN Plus Chewable Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Chewable Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00065', 'CEELIN Plus Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00066', 'CEELIN Plus Drops 30mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Drops 30mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00067', 'CEELIN Plus Syrup  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Syrup  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00068', 'CEELIN Plus Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00069', 'CEELIN Plus Syrup 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Plus Syrup 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00070', 'CEELIN Syrup  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Syrup  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00071', 'CEELIN Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00072', 'CEELIN Syrup 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Syrup 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00073', 'CEELIN Syrup 500mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEELIN Syrup 500mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00074', 'CEFALEXIN Capsule 500mg (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFALEXIN Capsule 500mg (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00075', 'CEFALIN 125mg Suspension 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFALIN 125mg Suspension 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00076', 'CEFALIN 500mg Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFALIN 500mg Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00077', 'CEFALIN Drops 10mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFALIN Drops 10mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00078', 'CEFIXIME 200mg Tablet (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFIXIME 200mg Tablet (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00079', 'CEFUROXIME 500mg Tab.(Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEFUROXIME 500mg Tab.(Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00080', 'CENTRUM ADVANCE SILVER Tab. Foil', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CENTRUM ADVANCE SILVER Tab. Foil', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00081', 'CENTRUM Advance Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CENTRUM Advance Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00082', 'CENTRUM SILVER Tablet  30''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CENTRUM SILVER Tablet  30''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00083', 'CEPOREX 500mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CEPOREX 500mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00084', 'CETIRIZINE 10mg Tab 100s (Pasteur)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CETIRIZINE 10mg Tab 100s (Pasteur)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00085', 'CETIRIZINE 10mg Tablet (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CETIRIZINE 10mg Tablet (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00086', 'CHARMEE All Night Plus 4''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE All Night Plus 4''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00087', 'CHARMEE Breathble 20''s-Green Tea', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 20''s-Green Tea', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00088', 'CHARMEE Breathble 20''s-LavndrScent', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 20''s-LavndrScent', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00089', 'CHARMEE Breathble 20''s-Unscented', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 20''s-Unscented', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00090', 'CHARMEE Breathble 8''s-Green Tea', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 8''s-Green Tea', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00091', 'CHARMEE Breathble 8''s-LavndrScent', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 8''s-LavndrScent', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00092', 'CHARMEE Breathble 8''s-Unscented', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Breathble 8''s-Unscented', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00093', 'CHARMEE Dry Net Non Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Dry Net Non Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00094', 'CHARMEE Dry Net With Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Dry Net With Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00095', 'CHARMEE Heavy Flow Overnight 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Heavy Flow Overnight 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00096', 'CHARMEE Menstrual Pants- M 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Menstrual Pants- M 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00097', 'CHARMEE Non Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Non Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00098', 'CHARMEE P/L Go Girl 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE P/L Go Girl 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00099', 'CHARMEE Pantyliners 20''s-Unscented', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Pantyliners 20''s-Unscented', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00100', 'CHARMEE Pantyliners 8''s-Go Girl Rose', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Pantyliners 8''s-Go Girl Rose', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00101', 'CHARMEE Pantyliners 8''s-Unscented', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE Pantyliners 8''s-Unscented', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00102', 'CHARMEE with Wings 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE with Wings 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00103', 'CHARMEE with Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHARMEE with Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00104', 'CHERIFER Drops 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Drops 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00105', 'CHERIFER Drops 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Drops 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00106', 'CHERIFER Forte Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Forte Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00107', 'CHERIFER Forte Syrup 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Forte Syrup 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00108', 'CHERIFER Forte with Zinc 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Forte with Zinc 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00109', 'CHERIFER Forte with Zinc 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Forte with Zinc 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00110', 'CHERIFER Immunomax Syr.120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Immunomax Syr.120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00111', 'CHERIFER PGM 10-22 Capsule  30''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER PGM 10-22 Capsule  30''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00112', 'CHERIFER PGM 10-22 Capsule 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER PGM 10-22 Capsule 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00113', 'CHERIFER PGM Immunomax Cap 30''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER PGM Immunomax Cap 30''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00114', 'CHERIFER PGM with Zinc Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER PGM with Zinc Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00115', 'CHERIFER Premium Capsule 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Premium Capsule 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00116', 'CHERIFER Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00117', 'CHERIFER Syrup 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER Syrup 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00118', 'CHERIFER with CGF + Zinc 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER with CGF + Zinc 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00119', 'CHERIFER with CGF + Zinc 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHERIFER with CGF + Zinc 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00120', 'CHILLI PLASTER (20 packs x 10''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHILLI PLASTER (20 packs x 10''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00121', 'CHIN CHUN SU (Blue)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHIN CHUN SU (Blue)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00122', 'CHIN CHUN SU (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHIN CHUN SU (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00123', 'CHIN CHUN SU with Beta Carotene', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CHIN CHUN SU with Beta Carotene', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00124', 'CIPROBAY Tablet 500mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CIPROBAY Tablet 500mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00125', 'CIPROFLOXACIN 500mg Tab.(Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CIPROFLOXACIN 500mg Tab.(Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00126', 'CLARICORT Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARICORT Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00127', 'CLARITHROMYCIN 500mg (Natra)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARITHROMYCIN 500mg (Natra)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00128', 'CLARITHROMYCIN 500mg (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARITHROMYCIN 500mg (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00129', 'CLARITIN Syrup 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARITIN Syrup 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00130', 'CLARITIN Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARITIN Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00131', 'CLARITIN Tablet 5''s (4+1)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLARITIN Tablet 5''s (4+1)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00132', 'CLEAR Men Shamp Sach (Cool Sport)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLEAR Men Shamp Sach (Cool Sport)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00133', 'CLEAR Shamp Sach (C/Soft Care) 12mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLEAR Shamp Sach (C/Soft Care) 12mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00134', 'CLINDAMYCIN 150mg Cap.(Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLINDAMYCIN 150mg Cap.(Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00135', 'C-LIUM Fibre Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('C-LIUM Fibre Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00136', 'C-LIUM Fibre Habit Pack 30''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('C-LIUM Fibre Habit Pack 30''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00137', 'C-LIUM Fibre Sachet 7''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('C-LIUM Fibre Sachet 7''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00138', 'CLOPIDOGREL 75mg (FLAMDOVIX)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOPIDOGREL 75mg (FLAMDOVIX)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00139', 'CLOPIDOGREL 75mg (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOPIDOGREL 75mg (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00140', 'CLOPIDOGREL 75mg Tablet 14''s (Winthrop)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOPIDOGREL 75mg Tablet 14''s (Winthrop)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00141', 'CLOSE-UP  25mL (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  25mL (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00142', 'CLOSE-UP  25mL (Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  25mL (Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00143', 'CLOSE-UP  50mL (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  50mL (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00144', 'CLOSE-UP  50mL (Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  50mL (Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00145', 'CLOSE-UP  95mL (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  95mL (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00146', 'CLOSE-UP  95mL (Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP  95mL (Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00147', 'CLOSE-UP 145mL  (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP 145mL  (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00148', 'CLOSE-UP 145mL (Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP 145mL (Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00149', 'CLOSE-UP Sachet Green 6''s Free N-Book', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP Sachet Green 6''s Free N-Book', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00150', 'CLOSE-UP Sachet-Green Twn/Pck 22g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP Sachet-Green Twn/Pck 22g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00151', 'CLOSE-UP Sachet-Red Twn/Pck 22g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOSE-UP Sachet-Red Twn/Pck 22g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00152', 'CLOXACILLIN 500mg Cap.(Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLOXACILLIN 500mg Cap.(Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00153', 'CLUSIVOL Plus Capsule (Foil)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLUSIVOL Plus Capsule (Foil)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00154', 'CLUSIVOL Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLUSIVOL Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00155', 'CLUSIVOL Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLUSIVOL Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00156', 'CLUSIVOL Syrup 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLUSIVOL Syrup 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00157', 'CLUSIVOL-OB Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CLUSIVOL-OB Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00158', 'CO-ALEVA 10mg/500mcg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CO-ALEVA 10mg/500mcg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00159', 'CO-ALTRIA 10mg/5mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CO-ALTRIA 10mg/5mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00160', 'CO-AMOXICLAV 500/125 Tab (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CO-AMOXICLAV 500/125 Tab (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00161', 'CO-APROVEL 150mg 12.5mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CO-APROVEL 150mg 12.5mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00162', 'COLCHICINE Tablet 500mcg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLCHICINE Tablet 500mcg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00163', 'COLGATE   66g F/C Spicy Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE   66g F/C Spicy Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00164', 'COLGATE  25mL Great Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  25mL Great Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00165', 'COLGATE  25mL Triple Action', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  25mL Triple Action', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00166', 'COLGATE  50mL  F/C Peppermint Ice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  50mL  F/C Peppermint Ice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00167', 'COLGATE  50mL F/C KoolMentholFresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  50mL F/C KoolMentholFresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00168', 'COLGATE  50mL Great Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  50mL Great Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00169', 'COLGATE  50mL Triple Action', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  50mL Triple Action', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00170', 'COLGATE  95mL F/C KoolMentholFresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  95mL F/C KoolMentholFresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00171', 'COLGATE  95mL F/C Peppermint Ice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  95mL F/C Peppermint Ice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00172', 'COLGATE  95mL Great Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  95mL Great Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00173', 'COLGATE  95mL Triple Action', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE  95mL Triple Action', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00174', 'COLGATE 126g F/C Spicy Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 126g F/C Spicy Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00175', 'COLGATE 145mL F/C KoolMentholFresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 145mL F/C KoolMentholFresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00176', 'COLGATE 145mL F/C Peppermint Ice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 145mL F/C Peppermint Ice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00177', 'COLGATE 145mL Great Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 145mL Great Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00178', 'COLGATE 145mL Triple Action', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 145mL Triple Action', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00179', 'COLGATE 193g F/C Spicy Fresh.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 193g F/C Spicy Fresh.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00180', 'COLGATE 40g (Kids Barbie)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 40g (Kids Barbie)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00181', 'COLGATE 40g (Kids Spiderman)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE 40g (Kids Spiderman)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00182', 'COLGATE Sach.-Great Reg.Twn/Pack', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE Sach.-Great Reg.Twn/Pack', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00183', 'COLGATE Sach-K/MntholFrsh Twn/Pck', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE Sach-K/MntholFrsh Twn/Pck', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00184', 'COLGATE Sach-Spicy Fresh Twn/Pack', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE Sach-Spicy Fresh Twn/Pack', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00185', 'COLGATE TBrush Classic (Adult) 1+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE TBrush Classic (Adult) 1+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00186', 'COLGATE Toothbrush w/ cap (Adult)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE Toothbrush w/ cap (Adult)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00187', 'COLGATE Toothbrush w/ cap (Child)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLGATE Toothbrush w/ cap (Child)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00188', 'COLVAN Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLVAN Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00189', 'COLVAN Drops', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLVAN Drops', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00190', 'COLVAN Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COLVAN Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00191', 'COMBANTRIN Suspension 10mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COMBANTRIN Suspension 10mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00192', 'COMBANTRIN Tablet 125mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COMBANTRIN Tablet 125mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00193', 'COMBIVENT UDV Nebules 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COMBIVENT UDV Nebules 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00194', 'COMBIZAR Tablet  50mg*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COMBIZAR Tablet  50mg*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00195', 'COMBIZAR Tablet 100mg*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COMBIZAR Tablet 100mg*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00196', 'CONCORE AM 5mg/5mg Tab', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CONCORE AM 5mg/5mg Tab', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00197', 'CONTRACTUBEX Gel 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CONTRACTUBEX Gel 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00198', 'CONTRACTUBEX Gel 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CONTRACTUBEX Gel 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00199', 'CONZACE Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CONZACE Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00200', 'CORTAL 500 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CORTAL 500 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00201', 'COTRIMOXAZOLE 800mg (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COTRIMOXAZOLE 800mg (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00202', 'COTRIMOXAZOLE 800mg Tab-Pharex', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COTRIMOXAZOLE 800mg Tab-Pharex', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00203', 'COTRIMOXAZOLE Susp. 60mL (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('COTRIMOXAZOLE Susp. 60mL (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00204', 'CRACKERS Garlic Bread  24G 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CRACKERS Garlic Bread  24G 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00205', 'CRACKERS Garlic Bread 108G 6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CRACKERS Garlic Bread 108G 6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00206', 'CREAMSILK  90mL-Blue:D/Control', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK  90mL-Blue:D/Control', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00207', 'CREAMSILK  90mL-Grn:HairFall Defnse', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK  90mL-Grn:HairFall Defnse', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00208', 'CREAMSILK  90mL-Pink:S/Straight', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK  90mL-Pink:S/Straight', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00209', 'CREAMSILK 180mL-Blue:D/Control', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK 180mL-Blue:D/Control', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00210', 'CREAMSILK 180mL-Grn:HairFall Defnse', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK 180mL-Grn:HairFall Defnse', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00211', 'CREAMSILK 180mL-Pink:S/Straight', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK 180mL-Pink:S/Straight', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00212', 'CREAMSILK Sach (Blue: Damage Control)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach (Blue: Damage Control)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00213', 'CREAMSILK Sach (Brilliant Black)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach (Brilliant Black)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00214', 'CREAMSILK Sach (Pink/Standout Straight)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach (Pink/Standout Straight)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00215', 'CREAMSILK Sach (Stunning Shine)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach (Stunning Shine)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00216', 'CREAMSILK Sach (Violet: Dandruff-Free)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach (Violet: Dandruff-Free)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00217', 'CREAMSILK Sach Pink/SS (6+1) 11mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach Pink/SS (6+1) 11mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00218', 'CREAMSILK Sach-Color Protect', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach-Color Protect', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00219', 'CREAMSILK Sach-Grn:HairFall Defnse', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach-Grn:HairFall Defnse', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00220', 'CREAMSILK Sach-Grn:HFD (6+1) 11mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CREAMSILK Sach-Grn:HFD (6+1) 11mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00221', 'CUTICLE REMOVER 60mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('CUTICLE REMOVER 60mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00222', 'DAFLON Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DAFLON Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00223', 'DAKTARIN Oral Gel  3.5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DAKTARIN Oral Gel  3.5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00224', 'DALACIN-C 150mg Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DALACIN-C 150mg Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00225', 'DALACIN-C 300mg Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DALACIN-C 300mg Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00226', 'DAPHNE Pills', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DAPHNE Pills', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00227', 'DECILONE Forte Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECILONE Forte Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00228', 'DECILONE Plain Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECILONE Plain Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00229', 'DECOLGEN Forte Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECOLGEN Forte Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00230', 'DECOLGEN No-Drowse Tablet 4''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECOLGEN No-Drowse Tablet 4''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00231', 'DECOLGEN No-Drowse Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECOLGEN No-Drowse Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00232', 'DECOLSIN Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECOLSIN Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00233', 'DECOLSIN Suspension  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DECOLSIN Suspension  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00234', 'DEQUADIN Lozenges', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DEQUADIN Lozenges', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00235', 'DEQUADIN Paint', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DEQUADIN Paint', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00236', 'DERMALIN Whitfield''s Oint. 15g* UHP', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DERMALIN Whitfield''s Oint. 15g* UHP', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00237', 'DERMOVATE Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DERMOVATE Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00238', 'DERMOVATE Ointment 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DERMOVATE Ointment 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00239', 'DESITIN Cream 56g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DESITIN Cream 56g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00240', 'DIANE 35 Dragees 21''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIANE 35 Dragees 21''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00241', 'DIATABS Capsule 4''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIATABS Capsule 4''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00242', 'DIATABS Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIATABS Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00243', 'DICLOFENAC 50mg Tab. (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DICLOFENAC 50mg Tab. (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00244', 'DIFENAX 50mg (Diclofenac Sodium)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIFENAX 50mg (Diclofenac Sodium)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00245', 'DIFFLAM Lozenges', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIFFLAM Lozenges', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00246', 'DIFFLAM Solution 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIFFLAM Solution 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00247', 'DIGITAL Thermometer (Advan)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIGITAL Thermometer (Advan)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00248', 'DIGITAL Thermometer (Surgitech)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIGITAL Thermometer (Surgitech)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00249', 'DIMETAPP Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIMETAPP Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00250', 'DIPROLENE Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIPROLENE Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00251', 'DIPROLENE Ointment 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIPROLENE Ointment 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00252', 'DIPROSALIC Ointment 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DIPROSALIC Ointment 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00253', 'DISPOSABLE Syringe  1mL-SureShot', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISPOSABLE Syringe  1mL-SureShot', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00254', 'DISPOSABLE Syringe  3mL-SureShot', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISPOSABLE Syringe  3mL-SureShot', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00255', 'DISPOSABLE Syringe  5mL-SureShot', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISPOSABLE Syringe  5mL-SureShot', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00256', 'DISUDRIN Drops 10mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISUDRIN Drops 10mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00257', 'DISUDRIN Syrup  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISUDRIN Syrup  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00258', 'DISUDRIN Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DISUDRIN Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00259', 'DOLAN Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLAN Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00260', 'DOLAN FP Forte Syrup 200mg 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLAN FP Forte Syrup 200mg 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00261', 'DOLAN FP Syrup 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLAN FP Syrup 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00262', 'DOLCET 37.5/325mg Tablet (50''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLCET 37.5/325mg Tablet (50''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00263', 'DOLFENAL 250mg Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLFENAL 250mg Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00264', 'DOLFENAL 500mg Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLFENAL 500mg Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00265', 'DOLO-NEUROBION Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOLO-NEUROBION Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00266', 'DOVE Cond.Sach-Hair Fall Rescue', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-Hair Fall Rescue', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00267', 'DOVE Cond.Sach-Intense Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-Intense Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00268', 'DOVE Cond.Sach-IntenseRepair(11+1)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-IntenseRepair(11+1)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00269', 'DOVE Cond.Sach-Nourshng Oil Care', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-Nourshng Oil Care', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00270', 'DOVE Cond.Sach-Straight & Silky', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-Straight & Silky', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00271', 'DOVE Cond.Sach-Straight Silky (11+1)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cond.Sach-Straight Silky (11+1)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00272', 'DOVE Cream Bar  50g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar  50g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00273', 'DOVE Cream Bar  75g (Rich Moisture)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar  75g (Rich Moisture)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00274', 'DOVE Cream Bar  75g (Sensitive)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar  75g (Sensitive)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00275', 'DOVE Cream Bar 100g (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar 100g (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00276', 'DOVE Cream Bar 100g (Sensitive )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar 100g (Sensitive )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00277', 'DOVE Cream Bar 100g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar 100g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00278', 'DOVE Cream Bar 135g (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar 135g (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00279', 'DOVE Cream Bar 135g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Cream Bar 135g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00280', 'DOVE Roll-on (Cucumber)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Roll-on (Cucumber)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00281', 'DOVE Roll-on (Fresh Touch)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Roll-on (Fresh Touch)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00282', 'DOVE Roll-on (Original)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Roll-on (Original)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00283', 'DOVE Roll-on (Original) 25mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Roll-on (Original) 25mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00284', 'DOVE Sham.170mL Intense Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.170mL Intense Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00285', 'DOVE Sham.Sach-Hair Fall Rescue', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Hair Fall Rescue', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00286', 'DOVE Sham.Sach-Intense Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Intense Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00287', 'DOVE Sham.Sach-Intense Repair 11+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Intense Repair 11+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00288', 'DOVE Sham.Sach-Nourshng Oil Care', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Nourshng Oil Care', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00289', 'DOVE Sham.Sach-Straight & Silky', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Straight & Silky', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00290', 'DOVE Sham.Sach-Straight & Silky 11+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOVE Sham.Sach-Straight & Silky 11+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00291', 'DOXYCYCLINE Capsule (Dyna)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DOXYCYCLINE Capsule (Dyna)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00292', 'DR. KAUFMANN IR Soap 80g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. KAUFMANN IR Soap 80g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00293', 'DR. KAUFMANN Soap (XPS) 80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. KAUFMANN Soap (XPS) 80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00294', 'DR. KAUFMANN Soap (YELLOW) 80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. KAUFMANN Soap (YELLOW) 80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00295', 'DR. P Adult Diaper (Basic Large 2''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Basic Large 2''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00296', 'DR. P Adult Diaper (Basic Large 8''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Basic Large 8''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00297', 'DR. P Adult Diaper (Basic Medium  2''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Basic Medium  2''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00298', 'DR. P Adult Diaper (Basic Medium 10''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Basic Medium 10''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00299', 'DR. P Adult Diaper (Standard Large 13''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Standard Large 13''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00300', 'DR. P Adult Diaper (Standard Med. 16''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Standard Med. 16''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00301', 'DR. P Adult Diaper (Standard Medium  2''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR. P Adult Diaper (Standard Medium  2''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00302', 'DR.WONG''S w/ Moisturizer  80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR.WONG''S w/ Moisturizer  80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00303', 'DR.WONG''S w/ Moisturizer 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR.WONG''S w/ Moisturizer 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00304', 'DR.WONG''S Yellow  80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR.WONG''S Yellow  80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00305', 'DR.WONG''S Yellow 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR.WONG''S Yellow 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00306', 'DR.WONG''S Yellow 135g-w/soapcase', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DR.WONG''S Yellow 135g-w/soapcase', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00307', 'DRAGON BALM 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRAGON BALM 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00308', 'DRAPOLENE Cream 55g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRAPOLENE Cream 55g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00309', 'DRENEX 0.75mg Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRENEX 0.75mg Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00310', 'DRENEX 3mg Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRENEX 3mg Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00311', 'DRIVEMAX Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRIVEMAX Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00312', 'DRIVEMAX Coffee Mix 15''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRIVEMAX Coffee Mix 15''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00313', 'DRIXINE Nasal Drops 10mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRIXINE Nasal Drops 10mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00314', 'DRIXINE Nasal Spray 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DRIXINE Nasal Spray 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00315', 'DUAVENT PulmoNeb 500mcg 5''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUAVENT PulmoNeb 500mcg 5''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00316', 'DULCOLAX Sulit Pack Tablet 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DULCOLAX Sulit Pack Tablet 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00317', 'DULCOLAX Suppository (Adult)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DULCOLAX Suppository (Adult)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00318', 'DULCOLAX Suppository (Pedia)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DULCOLAX Suppository (Pedia)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00319', 'DUOMAX Tablet 4''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUOMAX Tablet 4''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00320', 'DUPHALAC Syrup  45mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUPHALAC Syrup  45mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00321', 'DUPHALAC Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUPHALAC Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00322', 'DUPHASTON Tablet 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUPHASTON Tablet 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00323', 'DUVADILAN Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DUVADILAN Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00324', 'DYNATUSSIN Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DYNATUSSIN Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00325', 'DYNATUSSIN Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DYNATUSSIN Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00326', 'DYNATUSSIN Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('DYNATUSSIN Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00327', 'EFFICASCENT Oil  25mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  25mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00328', 'EFFICASCENT Oil  25mL (Extra Strength)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  25mL (Extra Strength)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00329', 'EFFICASCENT Oil  25mL (Extreme)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  25mL (Extreme)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00330', 'EFFICASCENT Oil  50mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  50mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00331', 'EFFICASCENT Oil  50mL (Extra Strength)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  50mL (Extra Strength)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00332', 'EFFICASCENT Oil  50mL (Extreme)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil  50mL (Extreme)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00333', 'EFFICASCENT Oil 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00334', 'EFFICASCENT Oil 100mL (Extra Strength)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Oil 100mL (Extra Strength)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00335', 'EFFICASCENT Ointment  10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Ointment  10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00336', 'EFFICASCENT Ointment  5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Ointment  5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00337', 'EFFICASCENT Relaxing Oil 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Relaxing Oil 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00338', 'EFFICASCENT Relaxing Oil 6mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EFFICASCENT Relaxing Oil 6mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00339', 'ELICA Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ELICA Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00340', 'ELICA Ointment 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ELICA Ointment 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00341', 'ENERVON Syrup  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON Syrup  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00342', 'ENERVON Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00343', 'ENERVON Syrup 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON Syrup 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00344', 'ENERVON Syrup 500mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON Syrup 500mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00345', 'ENERVON-C Tablet (Flex)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON-C Tablet (Flex)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00346', 'ENERVON-C Tablet 30''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ENERVON-C Tablet 30''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00347', 'EQ Diapers Dry ( Large  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Large  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00348', 'EQ Diapers Dry ( Large 16''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Large 16''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00349', 'EQ Diapers Dry ( Large 32''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Large 32''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00350', 'EQ Diapers Dry ( Large 48''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Large 48''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00351', 'EQ Diapers Dry ( Large 72''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Large 72''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00352', 'EQ Diapers Dry ( Medium  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Medium  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00353', 'EQ Diapers Dry ( Medium 18''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Medium 18''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00354', 'EQ Diapers Dry ( Medium 36''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Medium 36''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00355', 'EQ Diapers Dry ( Medium 54''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Medium 54''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00356', 'EQ Diapers Dry ( New Born  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( New Born  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00357', 'EQ Diapers Dry ( New Born 22''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( New Born 22''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00358', 'EQ Diapers Dry ( Small  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Small  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00359', 'EQ Diapers Dry ( Small 20''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Small 20''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00360', 'EQ Diapers Dry ( Small 40''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Small 40''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00361', 'EQ Diapers Dry ( Small 60''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( Small 60''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00362', 'EQ Diapers Dry ( X-Large  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( X-Large  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00363', 'EQ Diapers Dry ( X-Large 14''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( X-Large 14''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00364', 'EQ Diapers Dry ( X-Large 28''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( X-Large 28''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00365', 'EQ Diapers Dry ( X-Large 42''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( X-Large 42''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00366', 'EQ Diapers Dry ( XX-Large  3''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( XX-Large  3''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00367', 'EQ Diapers Dry ( XX-Large 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( XX-Large 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00368', 'EQ Diapers Dry ( XX-Large 24''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry ( XX-Large 24''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00369', 'EQ Diapers Dry (XX-Large 36''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Dry (XX-Large 36''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00370', 'EQ Diapers Plus ( Large  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Large  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00371', 'EQ Diapers Plus ( Large 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Large 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00372', 'EQ Diapers Plus ( Large 28''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Large 28''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00373', 'EQ Diapers Plus ( Medium  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Medium  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00374', 'EQ Diapers Plus ( Medium 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Medium 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00375', 'EQ Diapers Plus ( Medium 32''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Medium 32''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00376', 'EQ Diapers Plus ( Small  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Small  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00377', 'EQ Diapers Plus ( Small 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Small 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00378', 'EQ Diapers Plus ( Small 36''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( Small 36''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00379', 'EQ Diapers Plus ( X-Large  4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( X-Large  4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00380', 'EQ Diapers Plus ( X-Large 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( X-Large 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00381', 'EQ Diapers Plus ( X-Large 24''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( X-Large 24''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00382', 'EQ Diapers Plus ( XX-Large 12''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( XX-Large 12''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00383', 'EQ Diapers Plus ( XX-Large 20''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Diapers Plus ( XX-Large 20''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00384', 'EQ Pants ( Large 10''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Pants ( Large 10''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00385', 'EQ Pants ( Large 4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Pants ( Large 4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00386', 'EQ Pants ( Medium 4''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Pants ( Medium 4''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00387', 'EQ Pants ( X-Large 10''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Pants ( X-Large 10''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00388', 'EQ Pants ( XX-Large 10''s )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EQ Pants ( XX-Large 10''s )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00389', 'ERCEFLORA Oral Suspension 5mL 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ERCEFLORA Oral Suspension 5mL 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00390', 'ERYTHROCIN Tablet 500mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ERYTHROCIN Tablet 500mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00391', 'ERYTHROMYCIN 200mg Susp. 60mL (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ERYTHROMYCIN 200mg Susp. 60mL (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00392', 'ERYTHROMYCIN 500mg Tablet (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ERYTHROMYCIN 500mg Tablet (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00393', 'ESKINOL F/C C/White w/Grains  75mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C C/White w/Grains  75mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00394', 'ESKINOL F/C C/White w/Grains 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C C/White w/Grains 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00395', 'ESKINOL F/C C/White w/Grains 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C C/White w/Grains 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00396', 'ESKINOL F/C Classic White  75mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Classic White  75mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00397', 'ESKINOL F/C Classic White 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Classic White 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00398', 'ESKINOL F/C Classic White 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Classic White 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00399', 'ESKINOL F/C Forteens  75mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Forteens  75mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00400', 'ESKINOL F/C Forteens 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Forteens 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00401', 'ESKINOL F/C Forteens 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Forteens 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00402', 'ESKINOL F/C IcePore Minimizing  75mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C IcePore Minimizing  75mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00403', 'ESKINOL F/C IcePore Minimizing 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C IcePore Minimizing 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00404', 'ESKINOL F/C IcePore Minimizing 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C IcePore Minimizing 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00405', 'ESKINOL F/C Oil Control  75mL-Lem.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Oil Control  75mL-Lem.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00406', 'ESKINOL F/C Oil Control 135mL-Lem.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Oil Control 135mL-Lem.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00407', 'ESKINOL F/C Oil Control 225mL-Lem.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Oil Control 225mL-Lem.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00408', 'ESKINOL F/C Papaya Smooth  75mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Papaya Smooth  75mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00409', 'ESKINOL F/C Papaya Smooth 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Papaya Smooth 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00410', 'ESKINOL F/C Papaya Smooth 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Papaya Smooth 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00411', 'ESKINOL F/C PimpleFighting  75mL-DC', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C PimpleFighting  75mL-DC', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00412', 'ESKINOL F/C PimpleFighting 135mL-DC', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C PimpleFighting 135mL-DC', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00413', 'ESKINOL F/C PimpleFighting 225mL-DC', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C PimpleFighting 225mL-DC', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00414', 'ESKINOL F/C Refreshng  75mL-Ccmbr', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Refreshng  75mL-Ccmbr', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00415', 'ESKINOL F/C Refreshng 135mL-Ccmbr', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Refreshng 135mL-Ccmbr', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00416', 'ESKINOL F/C Refreshng 225mL-Ccmbr', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C Refreshng 225mL-Ccmbr', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00417', 'ESKINOL F/C SpotlessWhte  75mL-Cal', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C SpotlessWhte  75mL-Cal', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00418', 'ESKINOL F/C SpotlessWhte 135mL-Cal', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C SpotlessWhte 135mL-Cal', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00419', 'ESKINOL F/C SpotlessWhte 225mL-Cal', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/C SpotlessWhte 225mL-Cal', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00420', 'ESKINOL F/Scrub PapayaSmooth 6g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/Scrub PapayaSmooth 6g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00421', 'ESKINOL F/Wash PimpleFighting 100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESKINOL F/Wash PimpleFighting 100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00422', 'ESSENTIALE Forte Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ESSENTIALE Forte Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00423', 'EUCALYPTUS Oil  7.5mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EUCALYPTUS Oil  7.5mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00424', 'EYE-MO 7.5mL (Moisturizing Formula)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EYE-MO 7.5mL (Moisturizing Formula)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00425', 'EYE-MO 7.5mL (Red Eye Formula)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EYE-MO 7.5mL (Red Eye Formula)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00426', 'EZ Lubricating Jelly', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EZ Lubricating Jelly', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00427', 'EZ Lubricating Jelly 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('EZ Lubricating Jelly 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00428', 'E-ZINC 55mg/5mL Syrup 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('E-ZINC 55mg/5mL Syrup 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00429', 'E-ZINC Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('E-ZINC Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00430', 'FACE MASK Earloop-Medimax 50''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FACE MASK Earloop-Medimax 50''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00431', 'FAKTU Ointment 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAKTU Ointment 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00432', 'FAKTU Suppository 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAKTU Suppository 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00433', 'FAMILY Rubbing Alcohol 36% 180mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 36% 180mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00434', 'FAMILY Rubbing Alcohol 36% 473mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 36% 473mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00435', 'FAMILY Rubbing Alcohol 40%  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 40%  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00436', 'FAMILY Rubbing Alcohol 40% 180mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 40% 180mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00437', 'FAMILY Rubbing Alcohol 40% 473mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 40% 473mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00438', 'FAMILY Rubbing Alcohol 70%  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 70%  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00439', 'FAMILY Rubbing Alcohol 70% 180mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 70% 180mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00440', 'FAMILY Rubbing Alcohol 70% 473mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FAMILY Rubbing Alcohol 70% 473mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00441', 'FERLIN Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FERLIN Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00442', 'FERLIN Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FERLIN Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00443', 'FERSULFATE Tablet (UHP)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FERSULFATE Tablet (UHP)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00444', 'FISSAN Powder  25g (Diaper Rash)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  25g (Diaper Rash)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00445', 'FISSAN Powder  25g (Extra Cool)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  25g (Extra Cool)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00446', 'FISSAN Powder  25g (Foot Powder)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  25g (Foot Powder)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00447', 'FISSAN Powder  25g (Prickly Heat)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  25g (Prickly Heat)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00448', 'FISSAN Powder  50g (Diaper Rash)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  50g (Diaper Rash)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00449', 'FISSAN Powder  50g (Extra Cool)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  50g (Extra Cool)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00450', 'FISSAN Powder  50g (Foot Powder)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  50g (Foot Powder)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00451', 'FISSAN Powder  50g (Prickly Heat)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder  50g (Prickly Heat)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00452', 'FISSAN Powder 100g (Diaper Rash)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder 100g (Diaper Rash)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00453', 'FISSAN Powder 100g (Extra Cool)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder 100g (Extra Cool)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00454', 'FISSAN Powder 100g (Foot Powder)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder 100g (Foot Powder)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00455', 'FISSAN Powder 100g (Prickly Heat)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FISSAN Powder 100g (Prickly Heat)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00456', 'FITRUM Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FITRUM Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00457', 'FIX HS Jar 25g Clay Doh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 25g Clay Doh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00458', 'FIX HS Jar 25g Clay Doh Lite', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 25g Clay Doh Lite', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00459', 'FIX HS Jar 25g Hairlastic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 25g Hairlastic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00460', 'FIX HS Jar 25g Rock & Rule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 25g Rock & Rule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00461', 'FIX HS Jar 25g Shape Shifter', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 25g Shape Shifter', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00462', 'FIX HS Jar 80g Clay Doh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 80g Clay Doh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00463', 'FIX HS Jar 80g Clay Doh Lite', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Jar 80g Clay Doh Lite', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00464', 'FIX HS Sachet Clay Doh 4g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Sachet Clay Doh 4g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00465', 'FIX HS Sachet Shape Shifter 4g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIX HS Sachet Shape Shifter 4g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00466', 'FIXCOM 3 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIXCOM 3 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00467', 'FIXCOM 4 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FIXCOM 4 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00468', 'FLAGYL Forte Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLAGYL Forte Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00469', 'FLAGYL Suspension 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLAGYL Suspension 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00470', 'FLAGYSTATINE Suppository 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLAGYSTATINE Suppository 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00471', 'FLAMMAZINE Cream 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLAMMAZINE Cream 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00472', 'FLAMMAZINE Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLAMMAZINE Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00473', 'FLANAX Tablet 275mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLANAX Tablet 275mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00474', 'FLANAX Tablet 550mg Forte', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLANAX Tablet 550mg Forte', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00475', 'FLUIMUCIL 100mg Powder', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLUIMUCIL 100mg Powder', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00476', 'FLUIMUCIL 200mg Powder', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLUIMUCIL 200mg Powder', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00477', 'FLUIMUCIL 600mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FLUIMUCIL 600mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00478', 'FOLART 5mg Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FOLART 5mg Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00479', 'FORTIFER-FA Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FORTIFER-FA Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00480', 'FUN G. Antibacterial Soap 75g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FUN G. Antibacterial Soap 75g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00481', 'FUNGISOL Solution 4mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('FUNGISOL Solution 4mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00482', 'GATORADE  500mL-Blue Bolt 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Blue Bolt 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00483', 'GATORADE  500mL-Grape 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Grape 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00484', 'GATORADE  500mL-Lemon Lime 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Lemon Lime 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00485', 'GATORADE  500mL-Orange Chill 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Orange Chill 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00486', 'GATORADE  500mL-Pink Lemonade', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Pink Lemonade', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00487', 'GATORADE  500mL-Tropical 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATORADE  500mL-Tropical 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00488', 'GATSBY Pomade Supreme Grease 30G', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Pomade Supreme Grease 30G', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00489', 'GATSBY Pomade Supreme Grease 80G', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Pomade Supreme Grease 80G', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00490', 'GATSBY Pomade Supreme Hold 30G', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Pomade Supreme Hold 30G', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00491', 'GATSBY Pomade Supreme Hold 75G', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Pomade Supreme Hold 75G', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00492', 'GATSBY Pomade Supreme Hold Sach.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Pomade Supreme Hold Sach.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00493', 'GATSBY Set & Keep Spray 30g E/Hold', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Set & Keep Spray 30g E/Hold', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00494', 'GATSBY THC Sachet  Normal', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY THC Sachet  Normal', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00495', 'GATSBY THC Sachet (Anti-Dandruff)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY THC Sachet (Anti-Dandruff)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00496', 'GATSBY THC Sachet (Soft)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY THC Sachet (Soft)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00497', 'GATSBY THC Sachet (Super Hard)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY THC Sachet (Super Hard)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00498', 'GATSBY Wax Jar 25gm (Hard & Free)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 25gm (Hard & Free)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00499', 'GATSBY Wax Jar 25gm (Mat & Hard)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 25gm (Mat & Hard)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00500', 'GATSBY Wax Jar 25gm (Power & Spike)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 25gm (Power & Spike)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00501', 'GATSBY Wax Jar 25gm (U-Shaggy)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 25gm (U-Shaggy)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00502', 'GATSBY Wax Jar 75gm (Hard & Free)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 75gm (Hard & Free)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00503', 'GATSBY Wax Jar 75gm (Mat & Hard)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 75gm (Mat & Hard)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00504', 'GATSBY Wax Jar 75gm (Power & Spike)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 75gm (Power & Spike)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00505', 'GATSBY Wax Jar 75gm (U-Shaggy)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Jar 75gm (U-Shaggy)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00506', 'GATSBY Wax Sachet (Hard & Free)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Sachet (Hard & Free)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00507', 'GATSBY Wax Sachet (Light & Natural) X', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Sachet (Light & Natural) X', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00508', 'GATSBY Wax Sachet (Mat & Hard)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Sachet (Mat & Hard)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00509', 'GATSBY Wax Sachet (Power & Spike)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Sachet (Power & Spike)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00510', 'GATSBY Wax Sachet (U-Shaggy)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GATSBY Wax Sachet (U-Shaggy)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00511', 'GAVISCON Double Action Sach (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GAVISCON Double Action Sach (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00512', 'GAVISCON Double Action Tablet 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GAVISCON Double Action Tablet 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00513', 'GAVISCON Original 250mg Tablet 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GAVISCON Original 250mg Tablet 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00514', 'GAVISCON Original Susp. 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GAVISCON Original Susp. 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00515', 'GAVISCON-Ppprmnt(Orig)Sach24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GAVISCON-Ppprmnt(Orig)Sach24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00516', 'GILLETTE Rubie II Razor (Yellow)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GILLETTE Rubie II Razor (Yellow)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00517', 'GLUCOLYTE PLUS Powder (Grape)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLUCOLYTE PLUS Powder (Grape)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00518', 'GLUCOLYTE PLUS Powder (Orange)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLUCOLYTE PLUS Powder (Orange)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00519', 'GLUCOLYTE PLUS Powder (Strawberry)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLUCOLYTE PLUS Powder (Strawberry)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00520', 'GLUTAPHOS Tablet 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLUTAPHOS Tablet 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00521', 'GLYCERINE Supp.Adult (Rhea)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLYCERINE Supp.Adult (Rhea)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00522', 'GLYCERINE Supp.Infant (Rhea)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLYCERINE Supp.Infant (Rhea)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00523', 'GLYDOLAX Suppository Adult (UL)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLYDOLAX Suppository Adult (UL)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00524', 'GLYDOLAX Suppository Infant (UL)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GLYDOLAX Suppository Infant (UL)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00525', 'GRAND Adult Diapers Large 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GRAND Adult Diapers Large 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00526', 'GRAND Adult Diapers Large 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GRAND Adult Diapers Large 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00527', 'GRAND Adult Diapers Medium 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GRAND Adult Diapers Medium 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00528', 'GRAND Adult Diapers Medium 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GRAND Adult Diapers Medium 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00529', 'GROWEE with Chlorella Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GROWEE with Chlorella Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00530', 'GROWEE with Chlorella Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GROWEE with Chlorella Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00531', 'GROWEE with Chlorella Syrup 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GROWEE with Chlorella Syrup 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00532', 'GUARD - C  500mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARD - C  500mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00533', 'GUARDIAN Alcohol 40% 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 40% 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00534', 'GUARDIAN Alcohol 40% 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 40% 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00535', 'GUARDIAN Alcohol 40% 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 40% 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00536', 'GUARDIAN Alcohol 70% 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 70% 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00537', 'GUARDIAN Alcohol 70% 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 70% 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00538', 'GUARDIAN Alcohol 70% 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GUARDIAN Alcohol 70% 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00539', 'GYNEPRO Feminine Wash 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GYNEPRO Feminine Wash 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00540', 'GYNERA Pills', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('GYNERA Pills', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00541', 'H & S Shamp.  70mL (Apple Fresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.  70mL (Apple Fresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00542', 'H & S Shamp.  70mL (Smooth & Silky)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.  70mL (Smooth & Silky)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00543', 'H & S Shamp.  75mL (Cool Menthol)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.  75mL (Cool Menthol)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00544', 'H & S Shamp. 170mL (Apple Fresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp. 170mL (Apple Fresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00545', 'H & S Shamp. 170mL (Cool Menthol)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp. 170mL (Cool Menthol)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00546', 'H & S Shamp. 170mL (Smooth & Silky)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp. 170mL (Smooth & Silky)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00547', 'H & S Shamp.Sach (Apple Fresh) 12mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.Sach (Apple Fresh) 12mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00548', 'H & S Shamp.Sach (Menthol) 12mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.Sach (Menthol) 12mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00549', 'H & S Shamp.Sach (Smooth & Silky) 12mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('H & S Shamp.Sach (Smooth & Silky) 12mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00550', 'HAIR BLACKENING Black 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAIR BLACKENING Black 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00551', 'HAIR BLACKENING Chestnut Brown 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAIR BLACKENING Chestnut Brown 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00552', 'HAPEE  25mL (Fresh Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE  25mL (Fresh Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00553', 'HAPEE  25mL (Menthol Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE  25mL (Menthol Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00554', 'HAPEE  50mL (Fresh Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE  50mL (Fresh Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00555', 'HAPEE  50mL (Menthol Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE  50mL (Menthol Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00556', 'HAPEE 100mL (Blue Chill)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 100mL (Blue Chill)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00557', 'HAPEE 100mL (Fresh Cool White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 100mL (Fresh Cool White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00558', 'HAPEE 100mL (Fresh Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 100mL (Fresh Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00559', 'HAPEE 100mL (Menthol Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 100mL (Menthol Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00560', 'HAPEE 150mL (Blue Chill)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Blue Chill)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00561', 'HAPEE 150mL (Fresh Cool White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Fresh Cool White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00562', 'HAPEE 150mL (Fresh Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Fresh Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00563', 'HAPEE 150mL (Icy Fresh + Whitening)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Icy Fresh + Whitening)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00564', 'HAPEE 150mL (Icy Fresh Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Icy Fresh Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00565', 'HAPEE 150mL (Menthol Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPEE 150mL (Menthol Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00566', 'HAPPY Baby Pants  4''s Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants  4''s Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00567', 'HAPPY Baby Pants  4''s Medium', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants  4''s Medium', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00568', 'HAPPY Baby Pants  4''s X-Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants  4''s X-Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00569', 'HAPPY Baby Pants  4''s XX-Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants  4''s XX-Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00570', 'HAPPY Baby Pants 12''s Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 12''s Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00571', 'HAPPY Baby Pants 12''s Medium', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 12''s Medium', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00572', 'HAPPY Baby Pants 12''s X Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 12''s X Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00573', 'HAPPY Baby Pants 12''s XX-Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 12''s XX-Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00574', 'HAPPY Baby Pants 24''s Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 24''s Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00575', 'HAPPY Baby Pants 24''s Medium', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 24''s Medium', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00576', 'HAPPY Baby Pants 24''s X-Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 24''s X-Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00577', 'HAPPY Baby Pants 24''s XX-Large', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Baby Pants 24''s XX-Large', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00578', 'HAPPY Cotton  10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton  10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00579', 'HAPPY Cotton  40g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton  40g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00580', 'HAPPY Cotton  80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton  80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00581', 'HAPPY Cotton 150g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton 150g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00582', 'HAPPY Cotton Balls  50''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Balls  50''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00583', 'HAPPY Cotton Balls 150''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Balls 150''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00584', 'HAPPY Cotton Balls 300''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Balls 300''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00585', 'HAPPY Cotton Buds  36''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Buds  36''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00586', 'HAPPY Cotton Buds  72''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Buds  72''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00587', 'HAPPY Cotton Buds 108''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Buds 108''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00588', 'HAPPY Cotton Buds 200''s (Can)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Buds 200''s (Can)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00589', 'HAPPY Cotton Buds 200''s (Plastic)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HAPPY Cotton Buds 200''s (Plastic)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00590', 'HEMARATE FA Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HEMARATE FA Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00591', 'HEMARATE Film Coated Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HEMARATE Film Coated Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00592', 'HEMOSTAN 500mg Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HEMOSTAN 500mg Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00593', 'HENO DE PRAVIA Soap  90g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HENO DE PRAVIA Soap  90g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00594', 'HENO DE PRAVIA Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HENO DE PRAVIA Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00595', 'HERACLENE 1mg Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HERACLENE 1mg Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00596', 'HERACLENE Forte Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HERACLENE Forte Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00597', 'HYDRITE Sachet 4.1g* (Apple)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HYDRITE Sachet 4.1g* (Apple)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00598', 'HYDRITE Sachet 4.1g* (Plain)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HYDRITE Sachet 4.1g* (Plain)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00599', 'HYDROGEN PEROXIDE 10 vol.120-Rhea', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HYDROGEN PEROXIDE 10 vol.120-Rhea', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00600', 'HYDROGEN PEROXIDE 20 vol.120-LAR', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HYDROGEN PEROXIDE 20 vol.120-LAR', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00601', 'HYDROGEN PEROXIDE 20 vol.120-Rhea', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('HYDROGEN PEROXIDE 20 vol.120-Rhea', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00602', 'IBERET Active Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IBERET Active Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00603', 'IBERET Folic Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IBERET Folic Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00604', 'IMMUNOMAX 10mg Syr 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUNOMAX 10mg Syr 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00605', 'IMMUNOMAX Forte Syr 20mg 60ml', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUNOMAX Forte Syr 20mg 60ml', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00606', 'IMMUNOSIN Syrup 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUNOSIN Syrup 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00607', 'IMMUNOSIN Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUNOSIN Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00608', 'IMMUVIT Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUVIT Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00609', 'IMMUZINC Drops 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUZINC Drops 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00610', 'IMMUZINC Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMMUZINC Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00611', 'IMODIUM Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMODIUM Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00612', 'IMODIUM Capsule Buy 3 Get 1 Free', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('IMODIUM Capsule Buy 3 Get 1 Free', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00613', 'INOFLOX 200mg Tablet (100''s)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('INOFLOX 200mg Tablet (100''s)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00614', 'INOFLOX 400mg Tablet (100''s)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('INOFLOX 400mg Tablet (100''s)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00615', 'INOFLOX Ophtha. Sol''n (Eye Drops)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('INOFLOX Ophtha. Sol''n (Eye Drops)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00616', 'INOFLOX Otic Solution*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('INOFLOX Otic Solution*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00617', 'ISOPRINOSINE Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ISOPRINOSINE Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00618', 'ISOPRINOSINE Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ISOPRINOSINE Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00619', 'JERGENS Lot.  50-Age Defying Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Age Defying Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00620', 'JERGENS Lot.  50-Anti-Bac D/Blue', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Anti-Bac D/Blue', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00621', 'JERGENS Lot.  50-Original Scent Pink', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Original Scent Pink', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00622', 'JERGENS Lot.  50-Skin Lightening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Skin Lightening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00623', 'JERGENS Lot.  50-Soothing Aloe Grn', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Soothing Aloe Grn', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00624', 'JERGENS Lot.  50-U/H Fragrance Free', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-U/H Fragrance Free', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00625', 'JERGENS Lot.  50-Ultra Healing Yellow', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.  50-Ultra Healing Yellow', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00626', 'JERGENS Lot.100-Age Defying Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.100-Age Defying Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00627', 'JERGENS Lot.100-Original Scent Pink', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.100-Original Scent Pink', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00628', 'JERGENS Lot.100-Soothing Aloe Grn', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.100-Soothing Aloe Grn', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00629', 'JERGENS Lot.100-Ultra Healing Yellow', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.100-Ultra Healing Yellow', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00630', 'JERGENS Lot.200-Age Defying Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.200-Age Defying Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00631', 'JERGENS Lot.200-Original Scent Pink', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.200-Original Scent Pink', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00632', 'JERGENS Lot.200-Soothing Aloe Grn', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.200-Soothing Aloe Grn', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00633', 'JERGENS Lot.200-Ultra Healing Yellow', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.200-Ultra Healing Yellow', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00634', 'JERGENS Lot.500-Age Defying Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.500-Age Defying Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00635', 'JERGENS Lot.500-Original Scent Pink', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.500-Original Scent Pink', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00636', 'JERGENS Lot.500-Soothing Aloe Grn', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.500-Soothing Aloe Grn', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00637', 'JERGENS Lot.500-Ultra Healing Yellow', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JERGENS Lot.500-Ultra Healing Yellow', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00638', 'JOHNSON''S Bath 100mL-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 100mL-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00639', 'JOHNSON''S Bath 100mL-Milk+Oats', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 100mL-Milk+Oats', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00640', 'JOHNSON''S Bath 100mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 100mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00641', 'JOHNSON''S Bath 200mL-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 200mL-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00642', 'JOHNSON''S Bath 200mL-Clean & Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 200mL-Clean & Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00643', 'JOHNSON''S Bath 200mL-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 200mL-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00644', 'JOHNSON''S Bath 200mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath 200mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00645', 'JOHNSON''S Bath Refill 200mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath Refill 200mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00646', 'JOHNSON''S Bath Refill 200mL-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Bath Refill 200mL-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00647', 'JOHNSON''S Col.  25mL-Forever Mine', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Forever Mine', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00648', 'JOHNSON''S Col.  25mL-Happy Berries', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Happy Berries', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00649', 'JOHNSON''S Col.  25mL-Heaven', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Heaven', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00650', 'JOHNSON''S Col.  25mL-Morning Dew', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Morning Dew', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00651', 'JOHNSON''S Col.  25mL-Powder Mist', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Powder Mist', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00652', 'JOHNSON''S Col.  25mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00653', 'JOHNSON''S Col.  25mL-Slide', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-Slide', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00654', 'JOHNSON''S Col.  25mL-SummerSwing', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  25mL-SummerSwing', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00655', 'JOHNSON''S Col.  50mL-Forever Mine', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Forever Mine', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00656', 'JOHNSON''S Col.  50mL-Happy Berries', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Happy Berries', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00657', 'JOHNSON''S Col.  50mL-Heaven', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Heaven', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00658', 'JOHNSON''S Col.  50mL-Morning Dew', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Morning Dew', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00659', 'JOHNSON''S Col.  50mL-Powder Mist', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Powder Mist', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00660', 'JOHNSON''S Col.  50mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00661', 'JOHNSON''S Col.  50mL-Slide', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-Slide', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00662', 'JOHNSON''S Col.  50mL-SummerSwing', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col.  50mL-SummerSwing', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00663', 'JOHNSON''S Col. 125mL-Forever Mine', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Forever Mine', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00664', 'JOHNSON''S Col. 125mL-Happy Berries', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Happy Berries', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00665', 'JOHNSON''S Col. 125mL-Heaven', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Heaven', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00666', 'JOHNSON''S Col. 125mL-Morning Dew', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Morning Dew', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00667', 'JOHNSON''S Col. 125mL-Powder Mist', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Powder Mist', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00668', 'JOHNSON''S Col. 125mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00669', 'JOHNSON''S Col. 125mL-Slide', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-Slide', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00670', 'JOHNSON''S Col. 125mL-SummerSwing', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Col. 125mL-SummerSwing', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00671', 'JOHNSON''S Lot.  50mL-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot.  50mL-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00672', 'JOHNSON''S Lot.  50mL-Pink 24-hour', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot.  50mL-Pink 24-hour', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00673', 'JOHNSON''S Lot. 100mL-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 100mL-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00674', 'JOHNSON''S Lot. 100mL-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 100mL-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00675', 'JOHNSON''S Lot. 100mL-Pink 24-hour', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 100mL-Pink 24-hour', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00676', 'JOHNSON''S Lot. 200mL-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 200mL-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00677', 'JOHNSON''S Lot. 200mL-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 200mL-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00678', 'JOHNSON''S Lot. 200mL-Pink 24-hour', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Lot. 200mL-Pink 24-hour', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00679', 'JOHNSON''S Oil  25mL-Aloe Vera', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  25mL-Aloe Vera', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00680', 'JOHNSON''S Oil  25mL-Lite', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  25mL-Lite', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00681', 'JOHNSON''S Oil  25mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  25mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00682', 'JOHNSON''S Oil  50mL-Aloe Vera', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  50mL-Aloe Vera', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00683', 'JOHNSON''S Oil  50mL-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  50mL-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00684', 'JOHNSON''S Oil  50mL-Lite', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  50mL-Lite', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00685', 'JOHNSON''S Oil  50mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil  50mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00686', 'JOHNSON''S Oil 125mL-Aloe Vera', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil 125mL-Aloe Vera', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00687', 'JOHNSON''S Oil 125mL-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil 125mL-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00688', 'JOHNSON''S Oil 125mL-Lite', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil 125mL-Lite', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00689', 'JOHNSON''S Oil 125mL-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Oil 125mL-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00690', 'JOHNSON''S Powder  25g-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  25g-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00691', 'JOHNSON''S Powder  25g-Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  25g-Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00692', 'JOHNSON''S Powder  25g-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  25g-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00693', 'JOHNSON''S Powder  25g-Pink Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  25g-Pink Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00694', 'JOHNSON''S Powder  50g-Active Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Active Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00695', 'JOHNSON''S Powder  50g-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00696', 'JOHNSON''S Powder  50g-Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00697', 'JOHNSON''S Powder  50g-Complete Care', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Complete Care', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00698', 'JOHNSON''S Powder  50g-Cooling', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Cooling', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00699', 'JOHNSON''S Powder  50g-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00700', 'JOHNSON''S Powder  50g-Pink Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder  50g-Pink Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00701', 'JOHNSON''S Powder 100g-Active Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Active Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00702', 'JOHNSON''S Powder 100g-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00703', 'JOHNSON''S Powder 100g-Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00704', 'JOHNSON''S Powder 100g-Cooling', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Cooling', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00705', 'JOHNSON''S Powder 100g-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00706', 'JOHNSON''S Powder 100g-Pink Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 100g-Pink Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00707', 'JOHNSON''S Powder 200g-Active Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Active Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00708', 'JOHNSON''S Powder 200g-Bedtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Bedtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00709', 'JOHNSON''S Powder 200g-Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00710', 'JOHNSON''S Powder 200g-Cooling', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Cooling', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00711', 'JOHNSON''S Powder 200g-Cornstarch', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Cornstarch', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00712', 'JOHNSON''S Powder 200g-Milk+Rice', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Milk+Rice', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00713', 'JOHNSON''S Powder 200g-Pink Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 200g-Pink Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00714', 'JOHNSON''S Powder 500g-Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Powder 500g-Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00715', 'JOHNSON''S Sham. 100-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. 100-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00716', 'JOHNSON''S Sham. 100-Shiny drops', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. 100-Shiny drops', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00717', 'JOHNSON''S Sham. 200-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. 200-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00718', 'JOHNSON''S Sham. 200-Soft & Shiny', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. 200-Soft & Shiny', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00719', 'JOHNSON''S Sham. Sach-Active Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. Sach-Active Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00720', 'JOHNSON''S Sham. Sach-Shiny Drops', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham. Sach-Shiny Drops', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00721', 'JOHNSON''S Sham.100-Clean & Fresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham.100-Clean & Fresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00722', 'JOHNSON''S Sham.100-Soft & Smooth', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Sham.100-Soft & Smooth', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00723', 'JOHNSON''S Soap  60g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap  60g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00724', 'JOHNSON''S Soap  60g-Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap  60g-Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00725', 'JOHNSON''S Soap  60g-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap  60g-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00726', 'JOHNSON''S Soap 100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00727', 'JOHNSON''S Soap 100g-Blossom', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 100g-Blossom', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00728', 'JOHNSON''S Soap 100g-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 100g-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00729', 'JOHNSON''S Soap 150g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 150g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00730', 'JOHNSON''S Soap 150g-Blossoms', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 150g-Blossoms', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00731', 'JOHNSON''S Soap 150g-Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Soap 150g-Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00732', 'JOHNSON''S Top-to-Toe 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Top-to-Toe 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00733', 'JOHNSON''S Top-to-Toe 200mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Top-to-Toe 200mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00734', 'JOHNSON''S Wipes 20cts (Blue)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Wipes 20cts (Blue)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00735', 'JOHNSON''S Wipes 20cts (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOHNSON''S Wipes 20cts (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00736', 'JOY Bathroom Tissue 2-Ply Extra (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JOY Bathroom Tissue 2-Ply Extra (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00737', 'JUICY Col.  25mL (Angel''s Bliss)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Angel''s Bliss)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00738', 'JUICY Col.  25mL (Dreamsicle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Dreamsicle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00739', 'JUICY Col.  25mL (Icylicious)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Icylicious)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00740', 'JUICY Col.  25mL (Orange Twist)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Orange Twist)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00741', 'JUICY Col.  25mL (Sprightly Sprinkle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Sprightly Sprinkle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00742', 'JUICY Col.  25mL (Sugar Frosting)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Sugar Frosting)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00743', 'JUICY Col.  25mL (Sweet Delight)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Sweet Delight)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00744', 'JUICY Col.  25mL (Up, Up & Away)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  25mL (Up, Up & Away)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00745', 'JUICY Col.  50mL (Angel''s Bliss)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Angel''s Bliss)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00746', 'JUICY Col.  50mL (Dreamsicle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Dreamsicle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00747', 'JUICY Col.  50mL (Icylicious)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Icylicious)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00748', 'JUICY Col.  50mL (Orange Twist)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Orange Twist)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00749', 'JUICY Col.  50mL (Sprightly Sprinkle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Sprightly Sprinkle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00750', 'JUICY Col.  50mL (Sweet Delight)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  50mL (Sweet Delight)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00751', 'JUICY Col.  75mL (Angel''s Bliss)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Angel''s Bliss)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00752', 'JUICY Col.  75mL (Dreamsicle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Dreamsicle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00753', 'JUICY Col.  75mL (Icylicious)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Icylicious)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00754', 'JUICY Col.  75mL (Sprightly Sprinkle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Sprightly Sprinkle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00755', 'JUICY Col.  75mL (Sugar Frosting)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Sugar Frosting)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00756', 'JUICY Col.  75mL (Up,Up & Away)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col.  75mL (Up,Up & Away)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00757', 'JUICY Col. 125mL (Angel''s Bliss)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Angel''s Bliss)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00758', 'JUICY Col. 125mL (Dreamsicle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Dreamsicle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00759', 'JUICY Col. 125mL (Icylicious)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Icylicious)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00760', 'JUICY Col. 125mL (Orange Twist)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Orange Twist)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00761', 'JUICY Col. 125mL (Sprightly Sprnkle)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Sprightly Sprnkle)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00762', 'JUICY Col. 125mL (Sugar Frosting)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Sugar Frosting)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00763', 'JUICY Col. 125mL (Sweet Delight)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Sweet Delight)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00764', 'JUICY Col. 125mL (Up,Up & Away)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('JUICY Col. 125mL (Up,Up & Away)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00765', 'KAMI Bathroom Tissue 2-Ply', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KAMI Bathroom Tissue 2-Ply', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00766', 'KAMILLOSAN M Spray 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KAMILLOSAN M Spray 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00767', 'KATIALIS Ointment Big 30g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATIALIS Ointment Big 30g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00768', 'KATIALIS Ointment Medium 15g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATIALIS Ointment Medium 15g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00769', 'KATIALIS Ointment Small 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATIALIS Ointment Small 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00770', 'KATIALIS Soap 90g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATIALIS Soap 90g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00771', 'KATINKO Ointment 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATINKO Ointment 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00772', 'KATINKO Ointment 30g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATINKO Ointment 30g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00773', 'KATINKO Stick 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KATINKO Stick 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00774', 'KISSA Papaya Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KISSA Papaya Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00775', 'KIWI Sachet 5mL (Black)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KIWI Sachet 5mL (Black)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00776', 'KIWI Sachet 5mL (Brown)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KIWI Sachet 5mL (Brown)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00777', 'KLEENEX Tissue (Big Travellers)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KLEENEX Tissue (Big Travellers)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00778', 'KLEENEX Tissue (Little Travellers)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KLEENEX Tissue (Little Travellers)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00779', 'KLEENEX Tissue (Mini Pack) 6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KLEENEX Tissue (Mini Pack) 6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00780', 'KOJIC Acid Soap 135g (Plastic)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIC Acid Soap 135g (Plastic)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00781', 'KOJIESAN Body LghtngLot.SPF25  50g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Body LghtngLot.SPF25  50g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00782', 'KOJIESAN Body LghtngLot.SPF25 150g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Body LghtngLot.SPF25 150g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00783', 'KOJIESAN Body Lightening Lot.100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Body Lightening Lot.100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00784', 'KOJIESAN Body Lightening Lot.200g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Body Lightening Lot.200g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00785', 'KOJIESAN Body Lightng Lot.15g 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Body Lightng Lot.15g 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00786', 'KOJIESAN Cleanser + Toner  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Cleanser + Toner  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00787', 'KOJIESAN Cleanser + Toner 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Cleanser + Toner 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00788', 'KOJIESAN Dream White Soap  65g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Dream White Soap  65g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00789', 'KOJIESAN Dream White Soap  65g 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Dream White Soap  65g 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00790', 'KOJIESAN Dream White Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Dream White Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00791', 'KOJIESAN Dream White Soap 135g 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Dream White Soap 135g 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00792', 'KOJIESAN Face Lightening Cream 30g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN Face Lightening Cream 30g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00793', 'KOJIESAN MEN Soap-EXTRA FRESH', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN MEN Soap-EXTRA FRESH', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00794', 'KOJIESAN S/Lightening Soap  45g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap  45g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00795', 'KOJIESAN S/Lightening Soap  65g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap  65g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00796', 'KOJIESAN S/Lightening Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00797', 'KOJIESAN S/Lightening Soap 2''s  65g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap 2''s  65g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00798', 'KOJIESAN S/Lightening Soap 2''s 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap 2''s 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00799', 'KOJIESAN S/Lightening Soap 3''s  65g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap 3''s  65g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00800', 'KOJIESAN S/Lightening Soap 3''s 100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOJIESAN S/Lightening Soap 3''s 100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00801', 'KOLOURS Balinese Brown w/ Vitress-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Balinese Brown w/ Vitress-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00802', 'KOLOURS Balinese Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Balinese Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00803', 'KOLOURS Black-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Black-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00804', 'KOLOURS Burgundy-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Burgundy-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00805', 'KOLOURS Caramel Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Caramel Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00806', 'KOLOURS ChestnutBrwn w/ Vitress -R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS ChestnutBrwn w/ Vitress -R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00807', 'KOLOURS ChestnutBrwn-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS ChestnutBrwn-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00808', 'KOLOURS Choc.Brown w/ Vitress-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Choc.Brown w/ Vitress-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00809', 'KOLOURS Choc.Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Choc.Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00810', 'KOLOURS Dark Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Dark Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00811', 'KOLOURS Light Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Light Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00812', 'KOLOURS Mahogany-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Mahogany-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00813', 'KOLOURS Medium Brown w/ Vitress-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Medium Brown w/ Vitress-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00814', 'KOLOURS Medium Brown-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Medium Brown-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00815', 'KOLOURS MEN Black + Free Gel -R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS MEN Black + Free Gel -R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00816', 'KOLOURS MEN Black-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS MEN Black-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00817', 'KOLOURS MEN Dark Brwn+Free Gel-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS MEN Dark Brwn+Free Gel-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00818', 'KOLOURS MEN Dark Brwn-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS MEN Dark Brwn-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00819', 'KOLOURS Shanghai Mhgny-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Shanghai Mhgny-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00820', 'KOLOURS Solenn Ash Brown-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Solenn Ash Brown-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00821', 'KOLOURS Solenn Honey Amber-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Solenn Honey Amber-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00822', 'KOLOURS Solenn Raspberry Red-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Solenn Raspberry Red-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00823', 'KOLOURS Thai Tamarind-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOLOURS Thai Tamarind-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00824', 'KOOLFEVER Adults 6 sheets', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOOLFEVER Adults 6 sheets', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00825', 'KOOLFEVER Babies 2 sheets (12''s) X', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOOLFEVER Babies 2 sheets (12''s) X', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00826', 'KOOLFEVER Babies 6 sheets', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOOLFEVER Babies 6 sheets', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00827', 'KOOLFEVER Kids 1 Sheet 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOOLFEVER Kids 1 Sheet 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00828', 'KOOLFEVER Kids 6 sheets', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KOOLFEVER Kids 6 sheets', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00829', 'KREMIL-S ADVANCE Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KREMIL-S ADVANCE Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00830', 'KREMIL-S Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KREMIL-S Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00831', 'KWELL Shampoo 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KWELL Shampoo 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00832', 'KWELL Shampoo 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KWELL Shampoo 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00833', 'KWELL Shampoo Sachet 10mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('KWELL Shampoo Sachet 10mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00834', 'K-Y Jelly 100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('K-Y Jelly 100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00835', 'LACTACYD Blue  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Blue  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00836', 'LACTACYD Blue 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Blue 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00837', 'LACTACYD Blue 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Blue 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00838', 'LACTACYD Blue 250mL + Baby Wash', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Blue 250mL + Baby Wash', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00839', 'LACTACYD Cool & Fresh  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Cool & Fresh  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00840', 'LACTACYD Cool & Fresh 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Cool & Fresh 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00841', 'LACTACYD Cool & Fresh 5mL Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Cool & Fresh 5mL Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00842', 'LACTACYD Pink 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Pink 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00843', 'LACTACYD Pink 250mL + Pond''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Pink 250mL + Pond''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00844', 'LACTACYD Protecting  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Protecting  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00845', 'LACTACYD Protecting 150mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Protecting 150mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00846', 'LACTACYD Protecting 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Protecting 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00847', 'LACTACYD Protecting 5mL Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Protecting 5mL Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00848', 'LACTACYD Revitalize 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Revitalize 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00849', 'LACTACYD Revitalize 5mL Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Revitalize 5mL Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00850', 'LACTACYD Revitalize 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Revitalize 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00851', 'LACTACYD Teens 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD Teens 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00852', 'LACTACYD White Intimate  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD White Intimate  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00853', 'LACTACYD White Intimate 150ml', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD White Intimate 150ml', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00854', 'LACTACYD White Intimate 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD White Intimate 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00855', 'LACTACYD White Intimate 5mL Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LACTACYD White Intimate 5mL Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00856', 'LADY Pills', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LADY Pills', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00857', 'LEVOFLOXACIN 500mg Tablet (Winthrop)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEVOFLOXACIN 500mg Tablet (Winthrop)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00858', 'LEVOPRONT Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEVOPRONT Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00859', 'LEVOPRONT Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEVOPRONT Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00860', 'LEWIS & PEARL B.Spray70mL-CherryB.', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL B.Spray70mL-CherryB.', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00861', 'LEWIS & PEARL Col.  25mL-Blue Navy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Blue Navy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00862', 'LEWIS & PEARL Col.  25mL-C/Fantasy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-C/Fantasy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00863', 'LEWIS & PEARL Col.  25mL-Candy Kiss', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Candy Kiss', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00864', 'LEWIS & PEARL Col.  25mL-Dream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Dream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00865', 'LEWIS & PEARL Col.  25mL-Ice Water', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Ice Water', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00866', 'LEWIS & PEARL Col.  25mL-New York', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-New York', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00867', 'LEWIS & PEARL Col.  25mL-P-Passion', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-P-Passion', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00868', 'LEWIS & PEARL Col.  25mL-Rain', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Rain', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00869', 'LEWIS & PEARL Col.  25mL-Rock''n Rio', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Rock''n Rio', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00870', 'LEWIS & PEARL Col.  25mL-Rush', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-Rush', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00871', 'LEWIS & PEARL Col.  25mL-SweetParis', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  25mL-SweetParis', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00872', 'LEWIS & PEARL Col.  50mL-Blue Navy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Blue Navy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00873', 'LEWIS & PEARL Col.  50mL-C/Fantasy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-C/Fantasy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00874', 'LEWIS & PEARL Col.  50mL-Dream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Dream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00875', 'LEWIS & PEARL Col.  50mL-Ice Water', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Ice Water', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00876', 'LEWIS & PEARL Col.  50mL-New York', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-New York', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00877', 'LEWIS & PEARL Col.  50mL-P-Passion', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-P-Passion', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00878', 'LEWIS & PEARL Col.  50mL-Rain', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Rain', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00879', 'LEWIS & PEARL Col.  50mL-Rock''n Rio', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Rock''n Rio', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00880', 'LEWIS & PEARL Col.  50mL-Rush', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Rush', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00881', 'LEWIS & PEARL Col.  50mL-Summer', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-Summer', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00882', 'LEWIS & PEARL Col.  50mL-SweetParis', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col.  50mL-SweetParis', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00883', 'LEWIS & PEARL Col. 125mL-Blue Navy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Blue Navy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00884', 'LEWIS & PEARL Col. 125mL-C/Fantasy', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-C/Fantasy', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00885', 'LEWIS & PEARL Col. 125mL-Candy Kiss', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Candy Kiss', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00886', 'LEWIS & PEARL Col. 125mL-Dream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Dream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00887', 'LEWIS & PEARL Col. 125mL-Ice Water', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Ice Water', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00888', 'LEWIS & PEARL Col. 125mL-New York', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-New York', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00889', 'LEWIS & PEARL Col. 125mL-P-Passion', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-P-Passion', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00890', 'LEWIS & PEARL Col. 125mL-Rain', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Rain', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00891', 'LEWIS & PEARL Col. 125mL-Rock''n Rio', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Rock''n Rio', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00892', 'LEWIS & PEARL Col. 125mL-Rush', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Rush', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00893', 'LEWIS & PEARL Col. 125mL-Summer', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-Summer', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00894', 'LEWIS & PEARL Col. 125mL-SweetParis', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LEWIS & PEARL Col. 125mL-SweetParis', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00895', 'LICEALIZ Sachet Regular 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LICEALIZ Sachet Regular 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00896', 'LISTERINE 100mL (Coolmint)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 100mL (Coolmint)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00897', 'LISTERINE 100mL (Freshburst)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 100mL (Freshburst)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00898', 'LISTERINE 100mL (Total Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 100mL (Total Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00899', 'LISTERINE 250mL (Coolmint)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 250mL (Coolmint)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00900', 'LISTERINE 250mL (Fresh Burst)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 250mL (Fresh Burst)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00901', 'LISTERINE 250mL (Tartar Control)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 250mL (Tartar Control)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00902', 'LISTERINE 250mL (Total Care Zero)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 250mL (Total Care Zero)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00903', 'LISTERINE 250mL (Total Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LISTERINE 250mL (Total Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00904', 'LIVERAIDE Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LIVERAIDE Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00905', 'LOLA Remedios Sach. Syrup 15mL 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOLA Remedios Sach. Syrup 15mL 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00906', 'LOMOTIL Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOMOTIL Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00907', 'LORMIDE Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LORMIDE Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00908', 'LOSEC 10mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOSEC 10mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00909', 'LOSEC 20mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOSEC 20mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00910', 'LOVELY LOOK Hair Spray  50mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOVELY LOOK Hair Spray  50mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00911', 'LOVELY LOOK Hair Spray 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('LOVELY LOOK Hair Spray 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00912', 'MAALOX No.1  Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAALOX No.1  Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00913', 'MAALOX Plus Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAALOX Plus Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00914', 'MAALOX Suspension  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAALOX Suspension  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00915', 'MAALOX Suspension 180mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAALOX Suspension 180mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00916', 'MANZANILLA   25mL (IPI)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA   25mL (IPI)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00917', 'MANZANILLA   50mL (IPI)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA   50mL (IPI)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00918', 'MANZANILLA  100mL (IPI)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  100mL (IPI)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00919', 'MANZANILLA  15mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  15mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00920', 'MANZANILLA  30mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  30mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00921', 'MANZANILLA  30mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  30mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00922', 'MANZANILLA  60mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  60mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00923', 'MANZANILLA  60mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MANZANILLA  60mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00924', 'MARVELON Tablet 28''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MARVELON Tablet 28''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00925', 'MASTER Active Whitening F/Scrub 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Active Whitening F/Scrub 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00926', 'MASTER F/C Active Whitening  70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Active Whitening  70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00927', 'MASTER F/C Active Whitening 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Active Whitening 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00928', 'MASTER F/C Active Whitening 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Active Whitening 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00929', 'MASTER F/C Anti Pimple  70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Anti Pimple  70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00930', 'MASTER F/C Anti Pimple 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Anti Pimple 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00931', 'MASTER F/C Anti Pimple 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Anti Pimple 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00932', 'MASTER F/C Oil Control Max  70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Oil Control Max  70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00933', 'MASTER F/C Oil Control Max 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Oil Control Max 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00934', 'MASTER F/C Oil Control Max 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Oil Control Max 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00935', 'MASTER F/C Whitening Plus  70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Whitening Plus  70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00936', 'MASTER F/C Whitening Plus 135mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Whitening Plus 135mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00937', 'MASTER F/C Whitening Plus 225mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/C Whitening Plus 225mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00938', 'MASTER F/Wash  50mL (Derma-C)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER F/Wash  50mL (Derma-C)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00939', 'MASTER Facial Scrub  50mL (Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Facial Scrub  50mL (Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00940', 'MASTER Oil Control Facial Scrub 4g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Oil Control Facial Scrub 4g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00941', 'MASTER Oil Control Max Facial Scrub 50g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Oil Control Max Facial Scrub 50g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00942', 'MASTER Whitening Plus F/Scrub  50g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Whitening Plus F/Scrub  50g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00943', 'MASTER Whitening Plus F/Scrub 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Whitening Plus F/Scrub 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00944', 'MASTER Whtng Plus Facial Scrub 4g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MASTER Whtng Plus Facial Scrub 4g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00945', 'MAXI-PEEL #1 60mL+free Moist.crm-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL #1 60mL+free Moist.crm-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00946', 'MAXI-PEEL #2 60mL+free Moist.crm-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL #2 60mL+free Moist.crm-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00947', 'MAXI-PEEL #3 60mL+free Moist.crm-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL #3 60mL+free Moist.crm-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00948', 'MAXI-PEEL Astringent #1 60mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #1 60mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00949', 'MAXI-PEEL Astringent #2 15mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #2 15mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00950', 'MAXI-PEEL Astringent #2 30mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #2 30mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00951', 'MAXI-PEEL Astringent #2 60mL 3+1-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #2 60mL 3+1-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00952', 'MAXI-PEEL Astringent #2 60mL+Sunprtcrm15g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #2 60mL+Sunprtcrm15g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00953', 'MAXI-PEEL Astringent #2 60mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #2 60mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00954', 'MAXI-PEEL Astringent #3 15mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 15mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00955', 'MAXI-PEEL Astringent #3 30mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 30mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00956', 'MAXI-PEEL Astringent #3 60mL 3+1-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 60mL 3+1-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00957', 'MAXI-PEEL Astringent #3 60mL 8+4 R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 60mL 8+4 R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00958', 'MAXI-PEEL Astringent #3 60mL+Sunprtcrm15g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 60mL+Sunprtcrm15g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00959', 'MAXI-PEEL Astringent #3 60mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Astringent #3 60mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00960', 'MAXI-PEEL Conc.Crm.Fair 10g 12s-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Conc.Crm.Fair 10g 12s-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00961', 'MAXI-PEEL Conc.Crm.Fair 10g 2+1- R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Conc.Crm.Fair 10g 2+1- R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00962', 'MAXI-PEEL Conc.Crm.Fair 10g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Conc.Crm.Fair 10g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00963', 'MAXI-PEEL Conc.Crm.Nat. 10g 12''s-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Conc.Crm.Nat. 10g 12''s-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00964', 'MAXI-PEEL Conc.Crm.Nat. 10g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Conc.Crm.Nat. 10g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00965', 'MAXI-PEEL Concealing Crm. Fair 25g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Concealing Crm. Fair 25g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00966', 'MAXI-PEEL Concealing Crm. Nat. 25g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Concealing Crm. Nat. 25g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00967', 'MAXI-PEEL Facial Wash 25g-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Facial Wash 25g-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00968', 'MAXI-PEEL Facial Wash 7g Sach.12''s-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Facial Wash 7g Sach.12''s-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00969', 'MAXI-PEEL Facial Wash 7g Sach-N (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Facial Wash 7g Sach-N (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00970', 'MAXI-PEEL Moistrizing Crm 15g 2+1-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moistrizing Crm 15g 2+1-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00971', 'MAXI-PEEL Moisturizing Cream 15g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moisturizing Cream 15g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00972', 'MAXI-PEEL Moisturizing Cream 25g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moisturizing Cream 25g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00973', 'MAXI-PEEL Moisturizing Cream 8g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moisturizing Cream 8g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00974', 'MAXI-PEEL Moisturizing Crm 15g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moisturizing Crm 15g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00975', 'MAXI-PEEL Moisturizing Crm 8g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Moisturizing Crm 8g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00976', 'MAXI-PEEL Soap Ppya Enzym  65g-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Soap Ppya Enzym  65g-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00977', 'MAXI-PEEL Soap Ppya Enzym  90g-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Soap Ppya Enzym  90g-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00978', 'MAXI-PEEL Soap Ppya Enzym 125g-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Soap Ppya Enzym 125g-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00979', 'MAXI-PEEL Sunblock Cream  8g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Cream  8g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00980', 'MAXI-PEEL Sunblock Cream  8g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Cream  8g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00981', 'MAXI-PEEL Sunblock Cream 15g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Cream 15g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00982', 'MAXI-PEEL Sunblock Cream 15g-R (S)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Cream 15g-R (S)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00983', 'MAXI-PEEL Sunblock Cream 25g-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Cream 25g-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00984', 'MAXI-PEEL Sunblock Crm 15g 2+1-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Sunblock Crm 15g 2+1-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00985', 'MAXI-PEEL Zero 50mL-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL Zero 50mL-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00986', 'MAXI-PEEL#2 60+SB25+MC25+FW25-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXI-PEEL#2 60+SB25+MC25+FW25-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00987', 'MAXVIT Softgel Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MAXVIT Softgel Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00988', 'MEDICOL Advance 200 Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEDICOL Advance 200 Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00989', 'MEDICOL Advance 400 Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEDICOL Advance 400 Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00990', 'MEDIFORTAN-AS Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEDIFORTAN-AS Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00991', 'MEFENAMIC ACID 500mg (Winthrop)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEFENAMIC ACID 500mg (Winthrop)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00992', 'MELOXICAM  7.5mg Tablet (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MELOXICAM  7.5mg Tablet (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00993', 'MELOXICAM  7.5mg Tablet (Winthrop)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MELOXICAM  7.5mg Tablet (Winthrop)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00994', 'MELOXICAM 15mg Tab (FLAMICXINE)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MELOXICAM 15mg Tab (FLAMICXINE)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00995', 'MELOXICAM 15mg Tablet (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MELOXICAM 15mg Tablet (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00996', 'MELOXICAM 15mg Tablet (Winthrop)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MELOXICAM 15mg Tablet (Winthrop)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00997', 'MEMO PLUS GOLD Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEMO PLUS GOLD Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00998', 'MEMORY PLUS PREMIUM  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEMORY PLUS PREMIUM  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-00999', 'MEMORY PLUS PREMIUM 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEMORY PLUS PREMIUM 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01000', 'MEMORY PLUS Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEMORY PLUS Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01001', 'MEMORY PLUS Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEMORY PLUS Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01002', 'MENA Cream Stick', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MENA Cream Stick', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01003', 'MENA Facial Cream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MENA Facial Cream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01004', 'MENA Pearl White Cream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MENA Pearl White Cream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01005', 'MEPTIN Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEPTIN Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01006', 'MEPTIN Tablet 25mcg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEPTIN Tablet 25mcg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01007', 'MEPTIN Tablet 50mcg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MEPTIN Tablet 50mcg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01008', 'METRONIDAZOLE 500mg (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('METRONIDAZOLE 500mg (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01009', 'METRONIDAZOLE Suspension (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('METRONIDAZOLE Suspension (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01010', 'MICROPIL Pills', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MICROPIL Pills', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01011', 'MIDOL Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MIDOL Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01012', 'MILCU 2-N-1 Underarm /Foot Powder 40g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MILCU 2-N-1 Underarm /Foot Powder 40g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01013', 'MILCU 2-N-1 Underarm /Foot Powder 80g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MILCU 2-N-1 Underarm /Foot Powder 80g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01014', 'MILCU Deodorant Roll-On 50mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MILCU Deodorant Roll-On 50mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01015', 'MINERAL OIL 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MINERAL OIL 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01016', 'MINERAL OIL 30mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MINERAL OIL 30mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01017', 'MINERAL OIL 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MINERAL OIL 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01018', 'MINERAL OIL 60mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MINERAL OIL 60mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01019', 'MOBIC 15mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOBIC 15mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01020', 'MODESS All Nights 4''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS All Nights 4''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01021', 'MODESS Cottony Non-Wing  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Cottony Non-Wing  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01022', 'MODESS Cottony Non-Wing 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Cottony Non-Wing 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01023', 'MODESS Cottony w/ Wing 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Cottony w/ Wing 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01024', 'MODESS Cottony w/ Wing Single 16''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Cottony w/ Wing Single 16''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01025', 'MODESS Dry Max Reg With Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Dry Max Reg With Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01026', 'MODESS Maternity 7''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MODESS Maternity 7''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01027', 'MORIAMIN Forte Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MORIAMIN Forte Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01028', 'MOSEGOR-VITA Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOSEGOR-VITA Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01029', 'MOSEGOR-VITA Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOSEGOR-VITA Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01030', 'MOSEGOR-VITA Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOSEGOR-VITA Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01031', 'MOTILIUM Suspension 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOTILIUM Suspension 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01032', 'MOTILIUM Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MOTILIUM Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01033', 'MUCOBRON Forte Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOBRON Forte Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01034', 'MUCOBRON Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOBRON Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01035', 'MUCOBRON Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOBRON Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01036', 'MUCOBRON-D Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOBRON-D Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01037', 'MUCOBRON-D Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOBRON-D Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01038', 'MUCOSOLVAN Drops 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Drops 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01039', 'MUCOSOLVAN Retard Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Retard Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01040', 'MUCOSOLVAN Syrup Adult  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Syrup Adult  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01041', 'MUCOSOLVAN Syrup Adult 125mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Syrup Adult 125mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01042', 'MUCOSOLVAN Syrup Pedia  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Syrup Pedia  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01043', 'MUCOSOLVAN Syrup Pedia 125mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Syrup Pedia 125mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01044', 'MUCOSOLVAN Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUCOSOLVAN Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01045', 'MUPICIN Ointment 5g*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MUPICIN Ointment 5g*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01046', 'MX3 Coffee Mix 10''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MX3 Coffee Mix 10''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01047', 'MYONAL 50mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYONAL 50mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01048', 'MYRA-300 E Capsule  30''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRA-300 E Capsule  30''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01049', 'MYRA-400 E Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRA-400 E Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01050', 'MYRACOF Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRACOF Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01051', 'MYRA-E Facial Moisturizer 50mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRA-E Facial Moisturizer 50mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01052', 'MYRIN Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRIN Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01053', 'MYRIN-P Forte Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('MYRIN-P Forte Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01054', 'NAFARIN-A Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NAFARIN-A Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01055', 'NAPROXEN 550mg Tablet (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NAPROXEN 550mg Tablet (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01056', 'NASATAPP Drops', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NASATAPP Drops', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01057', 'NASATAPP Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NASATAPP Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01058', 'NASATAPP Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NASATAPP Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01059', 'NASATHERA Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NASATHERA Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01060', 'NATRAVOX 500mg/125mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX 500mg/125mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01061', 'NATRAVOX Susp. 312.5mg 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Susp. 312.5mg 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01062', 'NATRAVOX Susp.125mg/31.25mg 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Susp.125mg/31.25mg 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01063', 'NATRAVOX Susp.200mg/28.5mg 70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Susp.200mg/28.5mg 70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01064', 'NATRAVOX Susp.400mg/57mg 35mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Susp.400mg/57mg 35mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01065', 'NATRAVOX Susp.400mg/57mg 70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Susp.400mg/57mg 70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01066', 'NATRAVOX Suspension 600mg/ 50mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Suspension 600mg/ 50mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01067', 'NATRAVOX Suspension 600mg/100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Suspension 600mg/100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01068', 'NATRAVOX Suspension 600mg/70mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NATRAVOX Suspension 600mg/70mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01069', 'NEOBLOC  50mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOBLOC  50mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01070', 'NEOBLOC 100mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOBLOC 100mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01071', 'NEO-BROMEXAN Forte Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEO-BROMEXAN Forte Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01072', 'NEO-BROMEXAN Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEO-BROMEXAN Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01073', 'NEO-PYRAZON  50mg Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEO-PYRAZON  50mg Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01074', 'NEOZEP Drops 10mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOZEP Drops 10mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01075', 'NEOZEP Forte Tablet  4''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOZEP Forte Tablet  4''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01076', 'NEOZEP Forte Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOZEP Forte Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01077', 'NEOZEP No-Drowse Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOZEP No-Drowse Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01078', 'NEOZEP Syrup 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEOZEP Syrup 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01079', 'NEUROBION Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEUROBION Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01080', 'NEUROGEN-E Tablet 8''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEUROGEN-E Tablet 8''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01081', 'NEUROGEN-E Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NEUROGEN-E Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01082', 'NIVEA Creme 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Creme 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01083', 'NIVEA Creme 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Creme 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01084', 'NIVEA Creme Soap 100g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Creme Soap 100g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01085', 'NIVEA Lot.  50mL-Extra White S/Firm', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.  50mL-Extra White S/Firm', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01086', 'NIVEA Lot.  50mL-White & Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.  50mL-White & Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01087', 'NIVEA Lot.  75mL-Intensive Body Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.  75mL-Intensive Body Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01088', 'NIVEA Lot. 125mL-Intensive Body Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot. 125mL-Intensive Body Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01089', 'NIVEA Lot.125mL-White & Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.125mL-White & Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01090', 'NIVEA Lot.250mL-Extra White S/Firm', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.250mL-Extra White S/Firm', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01091', 'NIVEA Lot.250mL-Intensive', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.250mL-Intensive', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01092', 'NIVEA Lot.250mL-White & Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Lot.250mL-White & Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01093', 'NIVEA R-O Men 25mL-Invsble Fresh B/W', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA R-O Men 25mL-Invsble Fresh B/W', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01094', 'NIVEA R-O Men 50mL-Invsble Orig.B/W', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA R-O Men 50mL-Invsble Orig.B/W', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01095', 'NIVEA Roll-On 20mL E/W Serum', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 20mL E/W Serum', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01096', 'NIVEA Roll-On 25mL E-White  & Firm', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 25mL E-White  & Firm', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01097', 'NIVEA Roll-On 25mL-Invsble Clear BW', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 25mL-Invsble Clear BW', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01098', 'NIVEA Roll-On 25mL-Pearl', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 25mL-Pearl', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01099', 'NIVEA Roll-On 25mL-Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 25mL-Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01100', 'NIVEA Roll-On 40mL E/W Serum', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 40mL E/W Serum', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01101', 'NIVEA Roll-On 50mL E-White & Firm', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL E-White & Firm', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01102', 'NIVEA Roll-On 50mL-Extra Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL-Extra Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01103', 'NIVEA Roll-On 50mL-Invsble Clear BW', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL-Invsble Clear BW', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01104', 'NIVEA Roll-On 50mL-Invsble Fresh BW', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL-Invsble Fresh BW', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01105', 'NIVEA Roll-On 50mL-Pearl', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL-Pearl', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01106', 'NIVEA Roll-On 50mL-Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On 50mL-Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01107', 'NIVEA Roll-On Men 25mL-Cool Kick', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 25mL-Cool Kick', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01108', 'NIVEA Roll-On Men 25mL-Dry Impact', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 25mL-Dry Impact', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01109', 'NIVEA Roll-On Men 25mL-Fresh Active', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 25mL-Fresh Active', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01110', 'NIVEA Roll-On Men 25mL-Silver Protect', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 25mL-Silver Protect', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01111', 'NIVEA Roll-On Men 25mL-Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 25mL-Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01112', 'NIVEA Roll-On Men 50mL-Cool Kick', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 50mL-Cool Kick', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01113', 'NIVEA Roll-On Men 50mL-Dry Impact', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 50mL-Dry Impact', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01114', 'NIVEA Roll-On Men 50mL-Fresh Active', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 50mL-Fresh Active', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01115', 'NIVEA Roll-On Men 50mL-Silver Protect', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 50mL-Silver Protect', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01116', 'NIVEA Roll-On Men 50mL-Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Men 50mL-Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01117', 'NIVEA Roll-On Women 25mL-DryCmfrt', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Women 25mL-DryCmfrt', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01118', 'NIVEA Roll-On Women 50mL-DryCmfrt', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIVEA Roll-On Women 50mL-DryCmfrt', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01119', 'NIZORAL Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIZORAL Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01120', 'NIZORAL Shampoo Sachet (1% - Blue)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIZORAL Shampoo Sachet (1% - Blue)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01121', 'NIZORAL Shampoo Sachet (2% - Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NIZORAL Shampoo Sachet (2% - Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01122', 'NORGESIC Forte Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NORGESIC Forte Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01123', 'NORVASC  5mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NORVASC  5mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01124', 'NORVASC 10mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NORVASC 10mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01125', 'NUTRILIN Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTRILIN Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01126', 'NUTRILIN Drops 30mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTRILIN Drops 30mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01127', 'NUTRILIN Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTRILIN Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01128', 'NUTRILIN Syrup 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTRILIN Syrup 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01129', 'NUTROPLEX Syrup with Lysine  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTROPLEX Syrup with Lysine  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01130', 'NUTROPLEX Syrup with Lysine 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTROPLEX Syrup with Lysine 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01131', 'NUTROPLEX Syrup with Lysine 250mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('NUTROPLEX Syrup with Lysine 250mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01132', 'OBYNAL-M Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OBYNAL-M Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01133', 'OFF Lotion  50mL (Soft and Scented)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion  50mL (Soft and Scented)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01134', 'OFF Lotion  50mL Kids', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion  50mL Kids', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01135', 'OFF Lotion  50mL Overtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion  50mL Overtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01136', 'OFF Lotion  50mL Overtime w/ 3 sach', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion  50mL Overtime w/ 3 sach', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01137', 'OFF Lotion 100mL (Soft and Scented)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion 100mL (Soft and Scented)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01138', 'OFF Lotion 100mL Kids', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion 100mL Kids', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01139', 'OFF Lotion 100mL Overtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion 100mL Overtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01140', 'OFF Lotion Sachet (Clean Feel) X', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion Sachet (Clean Feel) X', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01141', 'OFF Lotion Sachet Kids', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion Sachet Kids', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01142', 'OFF Lotion Sachet Overtime', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion Sachet Overtime', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01143', 'OFF Lotion Sachet Soft and Scented', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OFF Lotion Sachet Soft and Scented', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01144', 'OIL OF WINTERGREEN 15 (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 15 (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01145', 'OIL OF WINTERGREEN 15mL (J. Chemie)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 15mL (J. Chemie)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01146', 'OIL OF WINTERGREEN 15mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 15mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01147', 'OIL OF WINTERGREEN 30 (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 30 (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01148', 'OIL OF WINTERGREEN 30mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 30mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01149', 'OIL OF WINTERGREEN 60 (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 60 (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01150', 'OIL OF WINTERGREEN 60mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OIL OF WINTERGREEN 60mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01151', 'OILGANICS Headlice Shampoo Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OILGANICS Headlice Shampoo Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01152', 'OLAY Facial Foam Sach 7.5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Facial Foam Sach 7.5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01153', 'OLAY N/W Pink Fairness Cream 7.5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY N/W Pink Fairness Cream 7.5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01154', 'OLAY N/W Pink Fairness Cream 7.5g 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY N/W Pink Fairness Cream 7.5g 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01155', 'OLAY N/W Yellow w/ Cream 7.5g 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY N/W Yellow w/ Cream 7.5g 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01156', 'OLAY Nat.White Light Sach 7.5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Nat.White Light Sach 7.5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01157', 'OLAY Nat.White Sach Crm 7.5g 5+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Nat.White Sach Crm 7.5g 5+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01158', 'OLAY Pink Fairness Cream 7.5g 2x3''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Pink Fairness Cream 7.5g 2x3''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01159', 'OLAY Pinkish Fairness Cream 7.5g 3''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Pinkish Fairness Cream 7.5g 3''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01160', 'OLAY Skin Whitng 60g w/ Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Skin Whitng 60g w/ Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01161', 'OLAY Skin Whitng 60g w/ Rose&Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Skin Whitng 60g w/ Rose&Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01162', 'OLAY Skin Whitng 60g w/ Vit. C', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Skin Whitng 60g w/ Vit. C', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01163', 'OLAY Skin Whitng 90g w/ Rose&Milk', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Skin Whitng 90g w/ Rose&Milk', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01164', 'OLAY Skin Whitng 90g w/ Vit. C', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLAY Skin Whitng 90g w/ Vit. C', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01165', 'OLD SPICE  14g (Fresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLD SPICE  14g (Fresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01166', 'OLD SPICE  14g (Pure Sport)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OLD SPICE  14g (Pure Sport)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01167', 'OMEGA Pain Killer  15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OMEGA Pain Killer  15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01168', 'OMEGA Pain Killer  30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OMEGA Pain Killer  30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01169', 'OMEGA Pain Killer  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OMEGA Pain Killer  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01170', 'OMEGA Pain Killer 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OMEGA Pain Killer 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01171', 'OMEPRAZOLE 20mg (ZOLETESTINE)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OMEPRAZOLE 20mg (ZOLETESTINE)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01172', 'OPIGESIC Suppository 125mg 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OPIGESIC Suppository 125mg 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01173', 'OPIGESIC Suppository 250mg 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OPIGESIC Suppository 250mg 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01174', 'OTOSOL Ear Drops 10mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('OTOSOL Ear Drops 10mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01175', 'PAGODA Cold Wave 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PAGODA Cold Wave 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01176', 'PALMOLIVE Sham. 90mL(Brilliant Shine)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham. 90mL(Brilliant Shine)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01177', 'PALMOLIVE Sham. 90mL(Grn:H/Smooth)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham. 90mL(Grn:H/Smooth)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01178', 'PALMOLIVE Sham. 90mL(Pink: Dry)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham. 90mL(Pink: Dry)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01179', 'PALMOLIVE Sham.180mL(Anti-Hair Fall)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(Anti-Hair Fall)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01180', 'PALMOLIVE Sham.180mL(Blue: A/D)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(Blue: A/D)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01181', 'PALMOLIVE Sham.180mL(BrilliantShine)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(BrilliantShine)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01182', 'PALMOLIVE Sham.180mL(Comp.Repair)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(Comp.Repair)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01183', 'PALMOLIVE Sham.180mL(F/Girl) Pink', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(F/Girl) Pink', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01184', 'PALMOLIVE Sham.180mL(Grn:Normal)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(Grn:Normal)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01185', 'PALMOLIVE Sham.180mL(Pink: Dry)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Sham.180mL(Pink: Dry)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01186', 'PALMOLIVE Soap 115g (Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Soap 115g (Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01187', 'PALMOLIVE Soap 115g (Pink: I/Softness)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Soap 115g (Pink: I/Softness)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01188', 'PALMOLIVE Soap 115g-Grn(Moist/Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Soap 115g-Grn(Moist/Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01189', 'PALMOLIVE Soap 125g (Grn.Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PALMOLIVE Soap 125g (Grn.Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01190', 'PANTENE Shampoo  70mL (Hair Fall Control)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo  70mL (Hair Fall Control)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01191', 'PANTENE Shampoo  90mL (Anti-Dandruff)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo  90mL (Anti-Dandruff)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01192', 'PANTENE Shampoo 150mL (Hair Fall)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo 150mL (Hair Fall)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01193', 'PANTENE Shampoo 150mL (Total D/Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo 150mL (Total D/Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01194', 'PANTENE Shampoo 170mL (Glossy Shine)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo 170mL (Glossy Shine)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01195', 'PANTENE Shampoo 170mL (Hair Fall)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo 170mL (Hair Fall)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01196', 'PANTENE Shampoo 170mL (Total D/Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PANTENE Shampoo 170mL (Total D/Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01197', 'PAU Liniment 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PAU Liniment 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01198', 'PAU Liniment 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PAU Liniment 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01199', 'PAU Masaje Liniment 60mL Classic', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PAU Masaje Liniment 60mL Classic', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01200', 'PAU Masaje Liniment 60mL Peppermint', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PAU Masaje Liniment 60mL Peppermint', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01201', 'PEDIAFORTAN-AS Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAFORTAN-AS Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01202', 'PEDIAFORTAN-AS Syrup 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAFORTAN-AS Syrup 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01203', 'PEDIAFORTAN-C Drops 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAFORTAN-C Drops 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01204', 'PEDIAFORTAN-C Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAFORTAN-C Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01205', 'PEDIALYTE 30 Apple 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIALYTE 30 Apple 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01206', 'PEDIALYTE 30 Grapes 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIALYTE 30 Grapes 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01207', 'PEDIALYTE 30 Strawberry 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIALYTE 30 Strawberry 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01208', 'PEDIALYTE 45 Bubble Gum 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIALYTE 45 Bubble Gum 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01209', 'PEDIALYTE 45 Fruit Flavor 500mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIALYTE 45 Fruit Flavor 500mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01210', 'PEDIAMOX 250mg Suspension 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAMOX 250mg Suspension 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01211', 'PEDIAMOX Drops*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDIAMOX Drops*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01212', 'PEDZINC Plus C Drops 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDZINC Plus C Drops 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01213', 'PEDZINC Plus C Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDZINC Plus C Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01214', 'PEDZINC Plus C Syrup 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PEDZINC Plus C Syrup 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01215', 'PETROLEUM JELLY  25g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY  25g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01216', 'PETROLEUM JELLY  50g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY  50g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01217', 'PETROLEUM JELLY 100g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY 100g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01218', 'PETROLEUM JELLY 200g (Apollo)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY 200g (Apollo)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01219', 'PETROLEUM JELLY 20g (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY 20g (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01220', 'PETROLEUM JELLY 50g (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PETROLEUM JELLY 50g (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01221', 'pH CARE  50mL (Cool Wind)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Cool Wind)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01222', 'pH CARE  50mL (Fragrance Free)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Fragrance Free)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01223', 'pH CARE  50mL (Fresh Blossom)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Fresh Blossom)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01224', 'pH CARE  50mL (Guava)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Guava)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01225', 'pH CARE  50mL (Happy Daisies)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Happy Daisies)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01226', 'pH CARE  50mL (Papaya)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Papaya)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01227', 'pH CARE  50mL (Passionate Bloom)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Passionate Bloom)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01228', 'pH CARE  50mL (Shower Splash)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE  50mL (Shower Splash)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01229', 'pH CARE 150mL (Cool Wind)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Cool Wind)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01230', 'pH CARE 150mL (Fragrance Free)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Fragrance Free)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01231', 'pH CARE 150mL (Fresh Blossoms)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Fresh Blossoms)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01232', 'pH CARE 150mL (Guava)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Guava)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01233', 'pH CARE 150mL (Happy Daisies)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Happy Daisies)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01234', 'pH CARE 150mL (Papaya)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Papaya)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01235', 'pH CARE 150mL (Passionate Bloom)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Passionate Bloom)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01236', 'pH CARE 150mL (Shower Splash)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 150mL (Shower Splash)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01237', 'pH CARE 250mL (Passionate Bloom)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 250mL (Passionate Bloom)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01238', 'pH CARE 250mL (Shower Splash)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE 250mL (Shower Splash)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01239', 'pH CARE Sach Passionate Bloom 12''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE Sach Passionate Bloom 12''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01240', 'pH CARE Sachet (Cool Wind) 12''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('pH CARE Sachet (Cool Wind) 12''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01241', 'PHARMATON Capsule 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PHARMATON Capsule 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01242', 'PLASIL Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLASIL Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01243', 'PLEMEX For Kids Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLEMEX For Kids Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01244', 'PLEMEX For Kids Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLEMEX For Kids Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01245', 'PLEMEX Forte Capsule 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLEMEX Forte Capsule 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01246', 'PLEMEX Forte Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLEMEX Forte Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01247', 'PLEMEX Forte Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PLEMEX Forte Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01248', 'POLYNERV- 500 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POLYNERV- 500 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01249', 'POLYNERV-1000 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POLYNERV-1000 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01250', 'POND''S Anti-Bact.F/Scrub Sach 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Anti-Bact.F/Scrub Sach 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01251', 'POND''S Anti-Bact.F/Scrub Sach 6g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Anti-Bact.F/Scrub Sach 6g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01252', 'POND''S Detox Cream 12G x 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Detox Cream 12G x 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01253', 'POND''S Oil Control Clnsing Foam Sach', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Oil Control Clnsing Foam Sach', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01254', 'POND''S Perfect Care F/Wash Sach 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Perfect Care F/Wash Sach 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01255', 'POND''S Perfect Care F/Wash Sach 4g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Perfect Care F/Wash Sach 4g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01256', 'POND''S Pinkish-White Cream 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Pinkish-White Cream 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01257', 'POND''S Pinkish-White Lotion Sach 10g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S Pinkish-White Lotion Sach 10g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01258', 'POND''S W/B Pink Normal Skin Box 12g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S W/B Pink Normal Skin Box 12g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01259', 'POND''S W/B Pink Normal Skin No-Mess x6', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S W/B Pink Normal Skin No-Mess x6', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01260', 'POND''S W/B Pink Normal Skin Sach 6g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POND''S W/B Pink Normal Skin Sach 6g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01261', 'PONSTAN SF Capsule 250mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PONSTAN SF Capsule 250mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01262', 'PONSTAN SF Capsule 500mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PONSTAN SF Capsule 500mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01263', 'PONSTAN Tablet 500mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PONSTAN Tablet 500mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01264', 'POTENCEE Forte 1000mg Tablet 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE Forte 1000mg Tablet 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01265', 'POTENCEE N.A. Cap.(Sod.Ascorbate)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE N.A. Cap.(Sod.Ascorbate)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01266', 'POTENCEE Tablet 500mg (REG) 100''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE Tablet 500mg (REG) 100''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01267', 'POTENCEE Tablet 500mg 20+2 X', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE Tablet 500mg 20+2 X', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01268', 'POTENCEE Tablet Sugar Free 20+2', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE Tablet Sugar Free 20+2', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01269', 'POTENCEE Tablet Sugar-Free', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('POTENCEE Tablet Sugar-Free', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01270', 'PRED  5 Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PRED  5 Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01271', 'PRED 10 Syrup 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PRED 10 Syrup 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01272', 'PRED 10 Syrup 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PRED 10 Syrup 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01273', 'PRED 10 Tablet (100''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PRED 10 Tablet (100''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01274', 'PREGNANCY Test (One Step) Femme', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PREGNANCY Test (One Step) Femme', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01275', 'PROPAN Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01276', 'PROPAN Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01277', 'PROPAN TLC Drops 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN TLC Drops 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01278', 'PROPAN TLC Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN TLC Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01279', 'PROPAN TLC Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN TLC Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01280', 'PROPAN TLC Syrup 250mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN TLC Syrup 250mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01281', 'PROPAN with Iron Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROPAN with Iron Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01282', 'PROVERA 10mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROVERA 10mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01283', 'PROVEXEL NS  Solution 2.5mL 30''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('PROVEXEL NS  Solution 2.5mL 30''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01284', 'RANITIDINE Tablet 150mg (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RANITIDINE Tablet 150mg (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01285', 'RANITIDINE Tablet 300mg (Pharex)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RANITIDINE Tablet 300mg (Pharex)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01286', 'RASHFREE Ointment 30g*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RASHFREE Ointment 30g*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01287', 'RAXIDE 150mg Tablet (GX)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RAXIDE 150mg Tablet (GX)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01288', 'RDL Astringent #1 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #1 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01289', 'RDL Astringent #1 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #1 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01290', 'RDL Astringent #2 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #2 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01291', 'RDL Astringent #2 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #2 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01292', 'RDL Astringent #3 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #3 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01293', 'RDL Astringent #3 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Astringent #3 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01294', 'RDL F/Cleanser 150mL-Avocado', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL F/Cleanser 150mL-Avocado', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01295', 'RDL F/Cleanser 150mL-Cucumber', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL F/Cleanser 150mL-Cucumber', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01296', 'RDL F/Cleanser 150mL-Kalamansi', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL F/Cleanser 150mL-Kalamansi', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01297', 'RDL F/Cleanser 150mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL F/Cleanser 150mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01298', 'RDL F/Cleanser 75mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL F/Cleanser 75mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01299', 'RDL Papaya Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Papaya Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01300', 'RDL Papaya With Milk Soap 135g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Papaya With Milk Soap 135g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01301', 'RDL Sunblock Cream  6g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Sunblock Cream  6g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01302', 'RDL Sunblock Cream 12g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Sunblock Cream 12g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01303', 'RDL Sunblock Cream 15g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Sunblock Cream 15g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01304', 'RDL Whitening Cream  6g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RDL Whitening Cream  6g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01305', 'REJOICE Sham.  70mL  3-In-1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.  70mL  3-In-1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01306', 'REJOICE Sham.  70mL  Moist & Smooth', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.  70mL  Moist & Smooth', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01307', 'REJOICE Sham.  70mL  Rich', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.  70mL  Rich', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01308', 'REJOICE Sham.  70mL  Soft & Smooth', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.  70mL  Soft & Smooth', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01309', 'REJOICE Sham. 170mL  3-In-1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham. 170mL  3-In-1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01310', 'REJOICE Sham. 170mL  Anti-Frizz', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham. 170mL  Anti-Frizz', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01311', 'REJOICE Sham. 170mL  Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham. 170mL  Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01312', 'REJOICE Sham. 170mL  Rich', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham. 170mL  Rich', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01313', 'REJOICE Sham. 170mL  Soft & Smooth', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham. 170mL  Soft & Smooth', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01314', 'REJOICE Sham.Sach Rich 16mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.Sach Rich 16mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01315', 'REJOICE Sham.Sach Rich 16mL 11+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.Sach Rich 16mL 11+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01316', 'REJOICE Sham.Sach Soft&Smth 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REJOICE Sham.Sach Soft&Smth 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01317', 'RE-LEAF 250mg Tablet (Sambong)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RE-LEAF 250mg Tablet (Sambong)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01318', 'RE-LEAF Forte 500mg Tab. (Sambong)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('RE-LEAF Forte 500mg Tab. (Sambong)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01319', 'REVICON Tablet (Flex)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REVICON Tablet (Flex)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01320', 'REVICON Tablet 30''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REVICON Tablet 30''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01321', 'REXIDOL Forte Tablet*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXIDOL Forte Tablet*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01322', 'REXONA MEN R/On 25mL Ice Cool', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 25mL Ice Cool', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01323', 'REXONA MEN R/On 25mL Quantum', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 25mL Quantum', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01324', 'REXONA MEN R/On 25mL SportDefense', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 25mL SportDefense', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01325', 'REXONA MEN R/On 50mL Ice Cool', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 50mL Ice Cool', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01326', 'REXONA MEN R/On 50mL Invisible Dry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 50mL Invisible Dry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01327', 'REXONA MEN R/On 50mL Quantum', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 50mL Quantum', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01328', 'REXONA MEN R/On 50mL SportDefense', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 50mL SportDefense', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01329', 'REXONA MEN R/On 50mL V8', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA MEN R/On 50mL V8', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01330', 'REXONA R/On 25mL Passion', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 25mL Passion', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01331', 'REXONA R/On 25mL Powder Dry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 25mL Powder Dry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01332', 'REXONA R/On 25mL ShowerClean', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 25mL ShowerClean', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01333', 'REXONA R/On 25mL Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 25mL Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01334', 'REXONA R/On 50mL AntiBact Defense', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 50mL AntiBact Defense', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01335', 'REXONA R/On 50mL Passion', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 50mL Passion', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01336', 'REXONA R/On 50mL Powder Dry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 50mL Powder Dry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01337', 'REXONA R/On 50mL Shower Clean', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 50mL Shower Clean', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01338', 'REXONA R/On 50mL Whitening', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA R/On 50mL Whitening', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01339', 'REXONA Sachet Ice Cool SP 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Ice Cool SP 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01340', 'REXONA Sachet Passion SP 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Passion SP 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01341', 'REXONA Sachet Powder Dry SP 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Powder Dry SP 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01342', 'REXONA Sachet Quantum SP 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Quantum SP 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01343', 'REXONA Sachet Shower Clean SP 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Shower Clean SP 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01344', 'REXONA Sachet Whitening 3mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('REXONA Sachet Whitening 3mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01345', 'ROBIKIDS Suspension  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBIKIDS Suspension  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01346', 'ROBIKIDS Suspension 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBIKIDS Suspension 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01347', 'ROBITUSSIN Liqui-Gel Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBITUSSIN Liqui-Gel Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01348', 'ROBITUSSIN Syrup  60mL (DM)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBITUSSIN Syrup  60mL (DM)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01349', 'ROBITUSSIN Syrup  60mL (Regular)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBITUSSIN Syrup  60mL (Regular)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01350', 'ROBITUSSIN Syrup 120mL (DM)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBITUSSIN Syrup 120mL (DM)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01351', 'ROBITUSSIN Syrup 120mL (Regular)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBITUSSIN Syrup 120mL (Regular)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01352', 'ROBUST 400mg Extreme 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBUST 400mg Extreme 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01353', 'ROBUST 550mg For Men 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBUST 550mg For Men 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01354', 'ROBUST 550mg For Men 2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBUST 550mg For Men 2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01355', 'ROBUST Energy Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROBUST Energy Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01356', 'ROGIN-E Cap. Value Pack 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROGIN-E Cap. Value Pack 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01357', 'ROWATINEX Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ROWATINEX Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01358', 'SAFEGUARD Advntge14g-ActiveFresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Advntge14g-ActiveFresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01359', 'SAFEGUARD Advntge14g-ForestFresh', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Advntge14g-ForestFresh', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01360', 'SAFEGUARD Advntge14g-Sport', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Advntge14g-Sport', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01361', 'SAFEGUARD Body Wash 200mL (Aloe)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Body Wash 200mL (Aloe)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01362', 'SAFEGUARD Hand Sanitizer 59mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Hand Sanitizer 59mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01363', 'SAFEGUARD Soap  42g Calamansi', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  42g Calamansi', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01364', 'SAFEGUARD Soap  60g (Deo-Beige)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Deo-Beige)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01365', 'SAFEGUARD Soap  60g (Eucalyptus)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Eucalyptus)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01366', 'SAFEGUARD Soap  60g (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01367', 'SAFEGUARD Soap  60g (Guava)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Guava)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01368', 'SAFEGUARD Soap  60g (Menthol)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Menthol)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01369', 'SAFEGUARD Soap  60g (Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01370', 'SAFEGUARD Soap  60g (Tawas Fresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (Tawas Fresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01371', 'SAFEGUARD Soap  60g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01372', 'SAFEGUARD Soap  60g-Icy Cool Mint', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g-Icy Cool Mint', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01373', 'SAFEGUARD Soap  60g-Ivory White Care', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  60g-Ivory White Care', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01374', 'SAFEGUARD Soap  90g (Beige)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Beige)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01375', 'SAFEGUARD Soap  90g (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01376', 'SAFEGUARD Soap  90g (Guava)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Guava)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01377', 'SAFEGUARD Soap  90g (Ivory White Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Ivory White Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01378', 'SAFEGUARD Soap  90g (Lemon)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Lemon)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01379', 'SAFEGUARD Soap  90g (Menthol)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Menthol)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01380', 'SAFEGUARD Soap  90g (Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01381', 'SAFEGUARD Soap  90g (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01382', 'SAFEGUARD Soap  90g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap  90g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01383', 'SAFEGUARD Soap 128g 3-pid (Deo-Blast Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 128g 3-pid (Deo-Blast Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01384', 'SAFEGUARD Soap 135g (Beige)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Beige)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01385', 'SAFEGUARD Soap 135g (Eucalyptus)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Eucalyptus)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01386', 'SAFEGUARD Soap 135g (Green)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Green)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01387', 'SAFEGUARD Soap 135g (Guava)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Guava)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01388', 'SAFEGUARD Soap 135g (Ivory White Care)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Ivory White Care)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01389', 'SAFEGUARD Soap 135g (Lemon)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Lemon)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01390', 'SAFEGUARD Soap 135g (Menthol)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Menthol)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01391', 'SAFEGUARD Soap 135g (Papaya)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Papaya)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01392', 'SAFEGUARD Soap 135g (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01393', 'SAFEGUARD Soap 135g (Tawas Fresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (Tawas Fresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01394', 'SAFEGUARD Soap 135g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01395', 'SAFEGUARD Soap 135g 3-Pid Pack (IvoryWhtCare)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g 3-Pid Pack (IvoryWhtCare)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01396', 'SAFEGUARD Soap 135g 3-Pid Pack (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g 3-Pid Pack (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01397', 'SAFEGUARD Soap 135g-Icy Cool Mint', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 135g-Icy Cool Mint', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01398', 'SAFEGUARD Soap 180g (White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SAFEGUARD Soap 180g (White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01399', 'SALBUTAMOL 2mg Tablet (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALBUTAMOL 2mg Tablet (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01400', 'SALBUTAMOL Syrup 60mL (Ritemed)*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALBUTAMOL Syrup 60mL (Ritemed)*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01401', 'SALICYLIC ACID 50mL (IPI)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALICYLIC ACID 50mL (IPI)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01402', 'SALINASE Nasal Drop 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALINASE Nasal Drop 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01403', 'SALINASE Nasal Drop 60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALINASE Nasal Drop 60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01404', 'SALINASE Nasal Spray 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALINASE Nasal Spray 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01405', 'SALONPAS Plaster 20''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SALONPAS Plaster 20''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01406', 'SANGOBION Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SANGOBION Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01407', 'SANGOBION Kids Syrup 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SANGOBION Kids Syrup 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01408', 'SANGOBION Prenatal  FA Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SANGOBION Prenatal  FA Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01409', 'SANITARY BALM 32g (Big)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SANITARY BALM 32g (Big)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01410', 'SARIDON Triple Action Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SARIDON Triple Action Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01411', 'SENOKOT Forte Tablet 374mg', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SENOKOT Forte Tablet 374mg', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01412', 'SERC  8mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SERC  8mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01413', 'SERC 16mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SERC 16mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01414', 'SERC 24mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SERC 24mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01415', 'SHADES Cream 100mL-Burgundy-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SHADES Cream 100mL-Burgundy-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01416', 'SHADES Cream 100mL-DarkBrown-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SHADES Cream 100mL-DarkBrown-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01417', 'SHADES Cream 100mL-LightBrown-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SHADES Cream 100mL-LightBrown-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01418', 'SHADES Cream 100mL-Mahogany-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SHADES Cream 100mL-Mahogany-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01419', 'SHADES Cream 100mL-Med.Brown-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SHADES Cream 100mL-Med.Brown-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01420', 'SILKA Lotion  50mL-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion  50mL-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01421', 'SILKA Lotion  50mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion  50mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01422', 'SILKA Lotion 100mL-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion 100mL-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01423', 'SILKA Lotion 100mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion 100mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01424', 'SILKA Lotion 200mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion 200mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01425', 'SILKA Lotion 300mL-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Lotion 300mL-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01426', 'SILKA Soap  25g-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  25g-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01427', 'SILKA Soap  45g-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  45g-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01428', 'SILKA Soap  45g-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  45g-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01429', 'SILKA Soap  65g-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  65g-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01430', 'SILKA Soap  65g-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  65g-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01431', 'SILKA Soap  90g-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  90g-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01432', 'SILKA Soap  90g-Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap  90g-Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01433', 'SILKA Soap 135g  Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap 135g  Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01434', 'SILKA Soap 135g-Green Papaya', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SILKA Soap 135g-Green Papaya', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01435', 'SINECOD Forte Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SINECOD Forte Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01436', 'SINECOD Forte Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SINECOD Forte Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01437', 'SINUPRET Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SINUPRET Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01438', 'SINUTAB Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SINUTAB Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01439', 'SLEEPASIL Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SLEEPASIL Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01440', 'SLEEPWELL Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SLEEPWELL Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01441', 'SOLMUX 100mg/ 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX 100mg/ 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01442', 'SOLMUX 200mg/ 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX 200mg/ 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01443', 'SOLMUX 200mg/120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX 200mg/120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01444', 'SOLMUX 500mg Capsule 4''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX 500mg Capsule 4''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01445', 'SOLMUX 500mg Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX 500mg Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01446', 'SOLMUX Broncho Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX Broncho Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01447', 'SOLMUX Broncho/ 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX Broncho/ 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01448', 'SOLMUX Drops*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX Drops*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01449', 'SOLMUX Forte/ 60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SOLMUX Forte/ 60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01450', 'SPIRIT OF AMMONIA 15mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SPIRIT OF AMMONIA 15mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01451', 'STREPSILS Cool  2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Cool  2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01452', 'STREPSILS Cool  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Cool  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01453', 'STREPSILS Cool 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Cool 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01454', 'STREPSILS Dry Cough 6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Dry Cough 6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01455', 'STREPSILS Extra Strong 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Extra Strong 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01456', 'STREPSILS Honeylemon  2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Honeylemon  2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01457', 'STREPSILS Honeylemon  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Honeylemon  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01458', 'STREPSILS Honeylemon 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Honeylemon 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01459', 'STREPSILS Max  6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Max  6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01460', 'STREPSILS Orange  2''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Orange  2''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01461', 'STREPSILS Orange  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Orange  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01462', 'STREPSILS Orange 24''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Orange 24''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01463', 'STREPSILS Original  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Original  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01464', 'STREPSILS Sugar-Free  6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Sugar-Free  6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01465', 'STREPSILS Warm  8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STREPSILS Warm  8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01466', 'STRESSTABS Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STRESSTABS Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01467', 'STRONG AMMONIA  15mL (LAR)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STRONG AMMONIA  15mL (LAR)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01468', 'STYLEX Gel  50g (Clear)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel  50g (Clear)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01469', 'STYLEX Gel  50g (Green)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel  50g (Green)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01470', 'STYLEX Gel  50g (Yellow)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel  50g (Yellow)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01471', 'STYLEX Gel 125g (Clear)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel 125g (Clear)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01472', 'STYLEX Gel 125g (Green)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel 125g (Green)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01473', 'STYLEX Gel 125g (Yellow)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Gel 125g (Yellow)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01474', 'STYLEX Hair Polish  50mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Hair Polish  50mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01475', 'STYLEX Hair Polish 100mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Hair Polish 100mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01476', 'STYLEX Hair Polish 150mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Hair Polish 150mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01477', 'STYLEX Setting Lotion 125g (Clear)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Setting Lotion 125g (Clear)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01478', 'STYLEX Setting Lotion 250g (Clear)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Setting Lotion 250g (Clear)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01479', 'STYLEX Setting Lotion 500g (Clear)-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('STYLEX Setting Lotion 500g (Clear)-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01480', 'SUMAPEN Capsule 250mg*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUMAPEN Capsule 250mg*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01481', 'SUMAPEN Capsule 500mg*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUMAPEN Capsule 500mg*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01482', 'SUNSILK Sham.180mL-Damage Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.180mL-Damage Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01483', 'SUNSILK Sham.180mL-Smooth&Mngble', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.180mL-Smooth&Mngble', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01484', 'SUNSILK Sham.90mL-Damage Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.90mL-Damage Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01485', 'SUNSILK Sham.90mL-Smooth&Mngble', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.90mL-Smooth&Mngble', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01486', 'SUNSILK Sham.90mL-Strong & Long', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.90mL-Strong & Long', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01487', 'SUNSILK Sham.Sach-Damage Repair', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.Sach-Damage Repair', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01488', 'SUNSILK Sham.Sach-Smooth & Mngble', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Sham.Sach-Smooth & Mngble', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01489', 'SUNSILK Shamp Sach (Strong & Long)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUNSILK Shamp Sach (Strong & Long)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01490', 'SUPERSCENT Oil  25mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUPERSCENT Oil  25mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01491', 'SUPERSCENT Oil  50mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUPERSCENT Oil  50mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01492', 'SUPERSCENT Oil 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SUPERSCENT Oil 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01493', 'SYNALAR-10 Cream 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SYNALAR-10 Cream 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01494', 'SYNALAR-25 Ointment 5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('SYNALAR-25 Ointment 5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01495', 'TAUREX Drops 30mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAUREX Drops 30mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01496', 'TAUREX Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAUREX Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01497', 'TAUREX Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAUREX Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01498', 'TAUREX Syrup 240mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAUREX Syrup 240mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01499', 'TAWAS Powder 50g-Perfme SnowWhte', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAWAS Powder 50g-Perfme SnowWhte', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01500', 'TAWAS Powder 50g-Reg. Snow White', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAWAS Powder 50g-Reg. Snow White', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01501', 'TAWAS Scented Powder 50g (Hailey''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAWAS Scented Powder 50g (Hailey''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01502', 'TAWAS Unscented Powder 50g (Hailey''s)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TAWAS Unscented Powder 50g (Hailey''s)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01503', 'TEMPRA 1-5 yrs Syr  60mL-Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA 1-5 yrs Syr  60mL-Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01504', 'TEMPRA 1-5 yrs Syr  60mL-Strawberry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA 1-5 yrs Syr  60mL-Strawberry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01505', 'TEMPRA 1-5 yrs Syr 120mL-Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA 1-5 yrs Syr 120mL-Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01506', 'TEMPRA 325mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA 325mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01507', 'TEMPRA Drops 15mL-Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA Drops 15mL-Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01508', 'TEMPRA Forte 500mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA Forte 500mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01509', 'TEMPRA Forte Syr  60mL-Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA Forte Syr  60mL-Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01510', 'TEMPRA Forte Syr  60mL-Strawberry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA Forte Syr  60mL-Strawberry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01511', 'TEMPRA Forte Syr 120mL-Orange', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TEMPRA Forte Syr 120mL-Orange', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01512', 'TENA Adult Diaper Maxi Large 9''S', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TENA Adult Diaper Maxi Large 9''S', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01513', 'TENA Adult Diaper Maxi Medium 9''S', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TENA Adult Diaper Maxi Medium 9''S', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01514', 'TENDER CARE Powder 100g (Blue)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TENDER CARE Powder 100g (Blue)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01515', 'TENDER CARE Powder 100g (Pink)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TENDER CARE Powder 100g (Pink)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01516', 'TENDER CARE Powder 100g (Sakura)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TENDER CARE Powder 100g (Sakura)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01517', 'TERRAMYCIN Eye Ointment 3.5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TERRAMYCIN Eye Ointment 3.5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01518', 'TIGER BALM 19g (Red)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TIGER BALM 19g (Red)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01519', 'TIKI-TIKI Drops 15mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TIKI-TIKI Drops 15mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01520', 'TIKI-TIKI Drops 30mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TIKI-TIKI Drops 30mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01521', 'TIKI-TIKI STAR Syrup  60mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TIKI-TIKI STAR Syrup  60mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01522', 'TIKI-TIKI STAR Syrup 120mL*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TIKI-TIKI STAR Syrup 120mL*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01523', 'TOOTHACHE Drops 7.5mL (Dann''s Aid)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TOOTHACHE Drops 7.5mL (Dann''s Aid)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01524', 'TOP-GEL Extra Pearl Cream', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TOP-GEL Extra Pearl Cream', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01525', 'TOP-GEL Extra Pearl Crm w/ Vit. E', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TOP-GEL Extra Pearl Crm w/ Vit. E', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01526', 'TOP-GEL M Cream (Medicated)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TOP-GEL M Cream (Medicated)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01527', 'TROSYD Cream  5g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TROSYD Cream  5g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01528', 'TRUST Condom 24''s-Regular', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TRUST Condom 24''s-Regular', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01529', 'TRUST Condom 24''s-Strawberry', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TRUST Condom 24''s-Strawberry', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01530', 'TRUST Pills', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TRUST Pills', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01531', 'TUSERAN Forte Capsule 4''s*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TUSERAN Forte Capsule 4''s*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01532', 'TUSERAN Forte Capsule*', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TUSERAN Forte Capsule*', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01533', 'TUSERAN Night  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('TUSERAN Night  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01534', 'VASELINE Lotion  25mL (Healthy White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion  25mL (Healthy White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01535', 'VASELINE Lotion  25mL (Total Moisture)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion  25mL (Total Moisture)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01536', 'VASELINE Lotion 100mL (Healthy White)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion 100mL (Healthy White)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01537', 'VASELINE Lotion 100mL (Total Moisture)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion 100mL (Total Moisture)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01538', 'VASELINE Lotion 100mL H/w Spf 24', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion 100mL H/w Spf 24', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01539', 'VASELINE Lotion 200mL (Total Moisture)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VASELINE Lotion 200mL (Total Moisture)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01540', 'VENTOLIN Expectorant Syrup  60mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Expectorant Syrup  60mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01541', 'VENTOLIN Expectorant Syrup 120mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Expectorant Syrup 120mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01542', 'VENTOLIN Inhaler', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Inhaler', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01543', 'VENTOLIN Nebules 5''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Nebules 5''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01544', 'VENTOLIN Rotacaps 128''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Rotacaps 128''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01545', 'VENTOLIN Syrup  60mL (Orange)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Syrup  60mL (Orange)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01546', 'VENTOLIN Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VENTOLIN Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01547', 'VICKS BabyRub 20g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS BabyRub 20g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01548', 'VICKS Formula-44 Syrup  54mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Formula-44 Syrup  54mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01549', 'VICKS Formula-44 Syrup 100mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Formula-44 Syrup 100mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01550', 'VICKS Inhaler 6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Inhaler 6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01551', 'VICKS Vaporub  5g 60''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Vaporub  5g 60''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01552', 'VICKS Vaporub 10g 60''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Vaporub 10g 60''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01553', 'VICKS Vaporub 25g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Vaporub 25g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01554', 'VICKS Vaporub 50g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VICKS Vaporub 50g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01555', 'VINO DE QUINA ( LA CARMINA )', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VINO DE QUINA ( LA CARMINA )', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01556', 'VIRLIX Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VIRLIX Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01557', 'VISINE Eye Drops  6mL (Refresh)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VISINE Eye Drops  6mL (Refresh)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01558', 'VISINE Eye Drops  6mL (Regular)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VISINE Eye Drops  6mL (Regular)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01559', 'VITAMIN B1+B6+B12 (Pharex) 500s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITAMIN B1+B6+B12 (Pharex) 500s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01560', 'VITAMIN B-COMPLEX 100''s (RHEA)', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITAMIN B-COMPLEX 100''s (RHEA)', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01561', 'VITRESS Hair C.Coat 15mL-CLASSIC-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 15mL-CLASSIC-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01562', 'VITRESS Hair C.Coat 15mL-H/Protect-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 15mL-H/Protect-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01563', 'VITRESS Hair C.Coat 15mL-H/Repair-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 15mL-H/Repair-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01564', 'VITRESS Hair C.Coat 15mL-I/Relax-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 15mL-I/Relax-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01565', 'VITRESS Hair C.Coat 30mL-CLASSIC-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 30mL-CLASSIC-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01566', 'VITRESS Hair C.Coat 30mL-CLSC-R 1+1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 30mL-CLSC-R 1+1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01567', 'VITRESS Hair C.Coat 30mL-H/Protect-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 30mL-H/Protect-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01568', 'VITRESS Hair C.Coat 30mL-H/Repair-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 30mL-H/Repair-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01569', 'VITRESS Hair C.Coat 30mL-I/Relax-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 30mL-I/Relax-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01570', 'VITRESS Hair C.Coat 50mL-CLASSIC-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair C.Coat 50mL-CLASSIC-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01571', 'VITRESS Hair Freshener 50mL-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hair Freshener 50mL-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01572', 'VITRESS HairPolish L-Lasting  50mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish L-Lasting  50mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01573', 'VITRESS HairPolish L-Lasting 100mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish L-Lasting 100mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01574', 'VITRESS HairPolish Strengthng  50mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish Strengthng  50mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01575', 'VITRESS HairPolish Strengthng100mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish Strengthng100mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01576', 'VITRESS HairPolish Sun Protect  50mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish Sun Protect  50mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01577', 'VITRESS HairPolish Sun Protect 100mL-R', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS HairPolish Sun Protect 100mL-R', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01578', 'VITRESS Hr Frshr 50mL+Vitress 30mL-N', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('VITRESS Hr Frshr 50mL+Vitress 30mL-N', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01579', 'WHISPER Cottony Extra Long E/H/F 7''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHISPER Cottony Extra Long E/H/F 7''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01580', 'WHISPER Cottony Long W/Wing 8"s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHISPER Cottony Long W/Wing 8"s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01581', 'WHISPER Cottony RegFlow NoWing 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHISPER Cottony RegFlow NoWing 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01582', 'WHISPER Cottony RegFlow Wings 8''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHISPER Cottony RegFlow Wings 8''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01583', 'WHISPER Cottony Single Wings 16''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHISPER Cottony Single Wings 16''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01584', 'WHITE FLOWER #1', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHITE FLOWER #1', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01585', 'WHITE FLOWER #2', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHITE FLOWER #2', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01586', 'WHITE FLOWER #3', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHITE FLOWER #3', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01587', 'WHITE FLOWER #4', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHITE FLOWER #4', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01588', 'WHITE FLOWER #5 12''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WHITE FLOWER #5 12''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01589', 'WILKINS Distilled Water 4000mL 4''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Non-pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WILKINS Distilled Water 4000mL 4''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01590', 'WOODS'' 20mg/7mL Syrup Sachet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WOODS'' 20mg/7mL Syrup Sachet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01591', 'WOODS'' Peppermint Lozenges 6''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('WOODS'' Peppermint Lozenges 6''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01592', 'XANTHONE Plus Capsule', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('XANTHONE Plus Capsule', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01593', 'XYLOGEL Teething Oral Gel 25g', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('XYLOGEL Teething Oral Gel 25g', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01594', 'ZITHROMAX Capsule 500mg 3''s', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ZITHROMAX Capsule 500mg 3''s', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01595', 'ZITHROMAX Suspension 15mL', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('ZITHROMAX Suspension 15mL', '[^a-zA-Z0-9]+', ' ', 'g'))
  );
INSERT INTO products
(sku, name, category_id, description, quantity, price, cost, reorder_level, expiry_date, new_stock_quantity, new_stock_expiry)
SELECT 'MASTER-01596', 'Zykast 10mg/5mg Tablet', c.id, '', 0, 0, 0, 0, NULL, 0, NULL
FROM categories c
WHERE c.name = 'Pharmaceutical'
  AND NOT EXISTS (
    SELECT 1 FROM products p
    WHERE lower(regexp_replace(p.name, '[^a-zA-Z0-9]+', ' ', 'g')) =
          lower(regexp_replace('Zykast 10mg/5mg Tablet', '[^a-zA-Z0-9]+', ' ', 'g'))
  );

INSERT INTO audit_logs (user_name, action, details)
VALUES ('Bulk Master Sync', 'Bulk Product Reconciliation',
'Official master sync: kept 246 products, added 1596 missing products, and archived 4 products not in the official master list.');

DO $$
DECLARE v_count integer;
BEGIN
  SELECT COUNT(*) INTO v_count FROM products;
  IF v_count <> 1842 THEN
    RAISE EXCEPTION 'Safety check failed: expected 1842 active products, found %', v_count;
  END IF;
END $$;

COMMIT;