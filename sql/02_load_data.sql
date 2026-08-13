-- Update the file paths below to your local CSV directory before running.
-- For MySQL Workbench, LOCAL INFILE may need to be enabled.

USE ecommerce_analytics;

LOAD DATA LOCAL INFILE 'data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/marketing_campaigns.csv'
INTO TABLE marketing_campaigns
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/campaign_performance.csv'
INTO TABLE campaign_performance
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/website_sessions.csv'
INTO TABLE website_sessions
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;
