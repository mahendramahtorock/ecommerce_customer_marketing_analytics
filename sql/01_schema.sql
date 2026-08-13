-- MySQL 8.0+
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

DROP TABLE IF EXISTS campaign_performance;
DROP TABLE IF EXISTS website_sessions;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS marketing_campaigns;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    city VARCHAR(50),
    age INT,
    gender VARCHAR(20),
    acquisition_channel VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(80),
    cost_price DECIMAL(12,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    quantity INT,
    selling_price DECIMAL(12,2),
    discount_pct DECIMAL(5,2),
    revenue DECIMAL(14,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(12,2),
    discount_pct DECIMAL(5,2),
    revenue DECIMAL(14,2),
    cost DECIMAL(14,2),
    gross_profit DECIMAL(14,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE marketing_campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(150),
    channel VARCHAR(50),
    campaign_type VARCHAR(50),
    campaign_start_date DATE,
    spend DECIMAL(14,2),
    impressions BIGINT,
    clicks BIGINT,
    conversions BIGINT
);

CREATE TABLE campaign_performance (
    campaign_id INT,
    date DATE,
    spend DECIMAL(14,2),
    impressions BIGINT,
    clicks BIGINT,
    conversions BIGINT,
    PRIMARY KEY (campaign_id, date),
    FOREIGN KEY (campaign_id) REFERENCES marketing_campaigns(campaign_id)
);

CREATE TABLE website_sessions (
    session_id BIGINT PRIMARY KEY,
    customer_id INT NULL,
    session_date DATE,
    channel VARCHAR(50),
    device VARCHAR(30),
    page_views INT,
    add_to_cart TINYINT,
    checkout TINYINT,
    purchase TINYINT,
    bounce_flag TINYINT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_campaign_perf_date ON campaign_performance(date);
CREATE INDEX idx_sessions_date_channel ON website_sessions(session_date, channel);
