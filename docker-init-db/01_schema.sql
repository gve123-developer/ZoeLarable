-- =========================================================
-- Zoe Pharmacy & General Merchandise - PostgreSQL Schema
-- File: 01_schema.sql
-- =========================================================

SET TIME ZONE 'Asia/Manila';

-- 1. Users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255),
    full_name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50) DEFAULT 'admin',
    status VARCHAR(50) DEFAULT 'active',
    last_login_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. Password Resets table
CREATE TABLE IF NOT EXISTS password_resets (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    token VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_password_resets_email ON password_resets(email);

-- 3. Categories table
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 4. Products table
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    sku VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    category VARCHAR(100),
    description TEXT,
    quantity INTEGER NOT NULL DEFAULT 0,
    price NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    cost NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    reorder_level INTEGER NOT NULL DEFAULT 10,
    expiry_date DATE,
    batch_number VARCHAR(100),
    new_stock_quantity INTEGER NOT NULL DEFAULT 0,
    new_stock_expiry DATE,
    new_batch_queue TEXT DEFAULT '[]',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_products_sku ON products(sku);
CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);
CREATE INDEX IF NOT EXISTS idx_products_expiry_date ON products(expiry_date);
CREATE INDEX IF NOT EXISTS idx_products_category_id ON products(category_id);

-- 5. Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    cashier_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    cashier_name VARCHAR(100),
    total_amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    payment_method VARCHAR(50) NOT NULL DEFAULT 'cash',
    amount_received NUMERIC(10,2),
    change_amount NUMERIC(10,2),
    status VARCHAR(20) NOT NULL DEFAULT 'completed',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_transactions_cashier_id ON transactions(cashier_id);
CREATE INDEX IF NOT EXISTS idx_transactions_date ON transactions(transaction_date);

-- 6. Transaction Items table
CREATE TABLE IF NOT EXISTS transaction_items (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER NOT NULL REFERENCES transactions(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE SET NULL,
    product_name VARCHAR(255),
    quantity INTEGER NOT NULL DEFAULT 1,
    price NUMERIC(10,2),
    cost NUMERIC(10,2),
    price_at_sale NUMERIC(10,2),
    cost_at_sale NUMERIC(10,2),
    status VARCHAR(20) NOT NULL DEFAULT 'completed'
);
CREATE INDEX IF NOT EXISTS idx_transaction_items_tx ON transaction_items(transaction_id);
CREATE INDEX IF NOT EXISTS idx_transaction_items_product ON transaction_items(product_id);

-- 7. Inventory Loss table
CREATE TABLE IF NOT EXISTS inventory_loss (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL DEFAULT 0,
    cost_at_loss NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    reason VARCHAR(100),
    loss_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    logged_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    reported_by INTEGER REFERENCES users(id) ON DELETE SET NULL
);

-- 8. Audit Logs table
CREATE TABLE IF NOT EXISTS audit_logs (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    action VARCHAR(100) NOT NULL,
    details TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at);

-- 9. Deleted Products table
CREATE TABLE IF NOT EXISTS deleted_products (
    id SERIAL PRIMARY KEY,
    original_id INTEGER NOT NULL,
    sku VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    quantity INTEGER DEFAULT 0,
    price NUMERIC(10,2) DEFAULT 0.00,
    cost NUMERIC(10,2) DEFAULT 0.00,
    reorder_level INTEGER DEFAULT 0,
    expiry_date DATE,
    batch_number VARCHAR(100),
    new_stock_quantity INTEGER DEFAULT 0,
    new_stock_expiry DATE,
    new_batch_queue TEXT DEFAULT '[]',
    deleted_by VARCHAR(100),
    deleted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 10. Error Logs table
CREATE TABLE IF NOT EXISTS error_logs (
    id SERIAL PRIMARY KEY,
    source VARCHAR(20) NOT NULL DEFAULT 'php',
    level VARCHAR(20) NOT NULL DEFAULT 'error',
    message TEXT NOT NULL,
    file VARCHAR(500),
    line INTEGER,
    stack_trace TEXT,
    url VARCHAR(1000),
    user_name VARCHAR(100),
    extra TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 11. System Settings table
CREATE TABLE IF NOT EXISTS system_settings (
    key VARCHAR(50) PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 12. User Activity Logs table
CREATE TABLE IF NOT EXISTS user_activity_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    action VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------
-- Synchronization Triggers
-- ---------------------------------------------------------

-- Synchronize transaction_items price/cost columns
CREATE OR REPLACE FUNCTION fn_sync_transaction_items_prices()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price_at_sale IS NULL AND NEW.price IS NOT NULL THEN
        NEW.price_at_sale := NEW.price;
    ELSIF NEW.price IS NULL AND NEW.price_at_sale IS NOT NULL THEN
        NEW.price := NEW.price_at_sale;
    END IF;

    IF NEW.cost_at_sale IS NULL AND NEW.cost IS NOT NULL THEN
        NEW.cost_at_sale := NEW.cost;
    ELSIF NEW.cost IS NULL AND NEW.cost_at_sale IS NOT NULL THEN
        NEW.cost := NEW.cost_at_sale;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_sync_transaction_items ON transaction_items;
CREATE TRIGGER trg_sync_transaction_items
BEFORE INSERT OR UPDATE ON transaction_items
FOR EACH ROW
EXECUTE FUNCTION fn_sync_transaction_items_prices();

-- Synchronize transactions date columns
CREATE OR REPLACE FUNCTION fn_sync_transactions_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.transaction_date IS NULL AND NEW.created_at IS NOT NULL THEN
        NEW.transaction_date := NEW.created_at;
    ELSIF NEW.created_at IS NULL AND NEW.transaction_date IS NOT NULL THEN
        NEW.created_at := NEW.transaction_date;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_sync_transactions_date ON transactions;
CREATE TRIGGER trg_sync_transactions_date
BEFORE INSERT OR UPDATE ON transactions
FOR EACH ROW
EXECUTE FUNCTION fn_sync_transactions_date();

-- Synchronize inventory_loss date columns
CREATE OR REPLACE FUNCTION fn_sync_inventory_loss_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.loss_date IS NULL AND NEW.logged_at IS NOT NULL THEN
        NEW.loss_date := NEW.logged_at;
    ELSIF NEW.logged_at IS NULL AND NEW.loss_date IS NOT NULL THEN
        NEW.logged_at := NEW.loss_date;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_sync_inventory_loss_date ON inventory_loss;
CREATE TRIGGER trg_sync_inventory_loss_date
BEFORE INSERT OR UPDATE ON inventory_loss
FOR EACH ROW
EXECUTE FUNCTION fn_sync_inventory_loss_date();
