-- =========================================================
-- Zoe Pharmacy & General Merchandise - Post Import Setup
-- File: 03_post_init.sql
-- =========================================================

SET TIME ZONE 'Asia/Manila';

-- 1. Sync Categories from products table
INSERT INTO categories (name, description)
SELECT DISTINCT category, 'Category: ' || category
FROM products
WHERE category IS NOT NULL AND category != ''
ON CONFLICT (name) DO NOTHING;

-- Link category_id in products table
UPDATE products p
SET category_id = c.id
FROM categories c
WHERE p.category = c.name AND (p.category_id IS NULL OR p.category_id = 0);

-- 2. Setup user credentials and names
-- Owner: live password hash
UPDATE users
SET
    full_name = 'Zoe Owner',
    email = 'owner@zoepharmacy.com',
    password_hash = COALESCE(password_hash, '$2y$12$.d/VfW05ikLAmKVA4YalYO3jNJE7ZP1xkfjt8UoiIWsxJ0Thu6Oqu')
WHERE username = 'owner';

-- Admin: default admin hash
UPDATE users
SET
    full_name = 'Zoe Admin',
    email = 'admin@zoepharmacy.com',
    password_hash = COALESCE(password_hash, '$2y$12$Trff1mtH5AkDfBflq5Jwru9OolDsnpq.Xj.w0zOdHJt2r6eB0jp4W')
WHERE username = 'admin';

-- Other imported users: ensure valid password and email
UPDATE users
SET
    full_name = COALESCE(full_name, username),
    email = COALESCE(email, LOWER(REPLACE(username, ' ', '')) || '@zoepharmacy.com'),
    password_hash = COALESCE(password_hash, '$2y$12$.d/VfW05ikLAmKVA4YalYO3jNJE7ZP1xkfjt8UoiIWsxJ0Thu6Oqu')
WHERE password_hash IS NULL;

-- 3. Sync Transactions
-- Align transaction_date with created_at
UPDATE transactions
SET transaction_date = created_at
WHERE transaction_date IS NULL;

-- Link cashier_id from users table matching cashier_name or username
UPDATE transactions t
SET cashier_id = u.id
FROM users u
WHERE t.cashier_id IS NULL AND (t.cashier_name = u.full_name OR t.cashier_name = u.username);

-- Default any remaining unassigned transactions to user 1 (owner)
UPDATE transactions
SET cashier_id = 1
WHERE cashier_id IS NULL;

-- 4. Sync Transaction Items price/cost with price_at_sale/cost_at_sale
UPDATE transaction_items
SET
    price_at_sale = COALESCE(price_at_sale, price),
    cost_at_sale = COALESCE(cost_at_sale, cost),
    price = COALESCE(price, price_at_sale),
    cost = COALESCE(cost, cost_at_sale)
WHERE price_at_sale IS NULL OR cost_at_sale IS NULL;

-- Populate product_name for reporting if missing
UPDATE transaction_items ti
SET product_name = p.name
FROM products p
WHERE ti.product_id = p.id AND (ti.product_name IS NULL OR ti.product_name = '');

-- 5. System Settings (Owner PIN Passcode)
INSERT INTO system_settings (key, value, updated_at)
VALUES ('owner_passcode', '$2y$12$M8wltWnN9/2BcW5bhXC60uQsN7hCbIRd2ihlQPwwUrpnri2x7Nd26', CURRENT_TIMESTAMP)
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;

-- 6. Create / Replace Reporting Views
CREATE OR REPLACE VIEW view_daily_sales_profit AS
SELECT
    CAST(t.transaction_date AS DATE) AS sale_date,
    COUNT(t.id) AS total_transactions,
    SUM(t.total_amount) AS gross_revenue,
    SUM(ti.quantity * COALESCE(ti.cost_at_sale, ti.cost, 0)) AS total_cost,
    SUM(t.total_amount) - SUM(ti.quantity * COALESCE(ti.cost_at_sale, ti.cost, 0)) AS gross_profit
FROM transactions t
JOIN transaction_items ti ON t.id = ti.transaction_id
GROUP BY CAST(t.transaction_date AS DATE);

CREATE OR REPLACE VIEW view_product_performance AS
SELECT
    p.id AS id,
    p.name AS name,
    c.name AS category_name,
    COALESCE(SUM(ti.quantity), 0) AS total_sold,
    COALESCE(SUM(ti.quantity * COALESCE(ti.price_at_sale, ti.price, 0)), 0) AS total_revenue
FROM products p
LEFT JOIN transaction_items ti ON p.id = ti.product_id
LEFT JOIN categories c ON p.category_id = c.id
GROUP BY p.id, p.name, c.name
ORDER BY total_sold DESC;

CREATE OR REPLACE VIEW view_stock_status AS
SELECT
    p.id AS id,
    p.sku AS sku,
    p.name AS name,
    p.quantity AS quantity,
    p.reorder_level AS reorder_level,
    CASE
        WHEN p.quantity = 0 THEN 'Out of Stock'
        WHEN p.quantity <= p.reorder_level THEN 'Low Stock'
        ELSE 'In Stock'
    END AS status
FROM products p;

-- 7. Reset all PostgreSQL sequences to avoid primary key collision
SELECT setval('products_id_seq', (SELECT COALESCE(MAX(id), 1) FROM products));
SELECT setval('users_id_seq', (SELECT COALESCE(MAX(id), 1) FROM users));
SELECT setval('transactions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM transactions));
SELECT setval('transaction_items_id_seq', (SELECT COALESCE(MAX(id), 1) FROM transaction_items));
SELECT setval('inventory_loss_id_seq', (SELECT COALESCE(MAX(id), 1) FROM inventory_loss));
SELECT setval('audit_logs_id_seq', (SELECT COALESCE(MAX(id), 1) FROM audit_logs));
SELECT setval('categories_id_seq', (SELECT COALESCE(MAX(id), 1) FROM categories));
SELECT setval('password_resets_id_seq', (SELECT COALESCE(MAX(id), 1) FROM password_resets));
SELECT setval('deleted_products_id_seq', (SELECT COALESCE(MAX(id), 1) FROM deleted_products));
SELECT setval('error_logs_id_seq', (SELECT COALESCE(MAX(id), 1) FROM error_logs));
