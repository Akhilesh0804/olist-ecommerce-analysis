-- 01: Table creation
-- Purpose: Create all 9 tables for the Olist Brazilian e-commerce dataset
-- Database: PostgreSQL
-- Source: Kaggle — Brazilian E-Commerce Public Dataset by Olist
-- Note: Load tables in the order listed to avoid foreign key conflicts
--       customers → products → sellers → orders → order_items
--       → order_payments → order_reviews → geolocation
--       → product_category_name_translation

CREATE TABLE customers (
    customer_id               VARCHAR PRIMARY KEY,
    customer_unique_id        VARCHAR,
    customer_zip_code_prefix  VARCHAR,
    customer_city             VARCHAR,
    customer_state            VARCHAR
);

CREATE TABLE orders (
    order_id                        VARCHAR PRIMARY KEY,
    customer_id                     VARCHAR,
    order_status                    VARCHAR,
    order_purchase_timestamp        TIMESTAMP,
    order_approved_at               TIMESTAMP,
    order_delivered_carrier_date    TIMESTAMP,
    order_delivered_customer_date   TIMESTAMP,
    order_estimated_delivery_date   TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id             VARCHAR,
    order_item_id        INTEGER,
    product_id           VARCHAR,
    seller_id            VARCHAR,
    shipping_limit_date  TIMESTAMP,
    price                NUMERIC(10,2),
    freight_value        NUMERIC(10,2),
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE order_payments (
    order_id              VARCHAR,
    payment_sequential    INTEGER,
    payment_type          VARCHAR,
    payment_installments  INTEGER,
    payment_value         NUMERIC(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE order_reviews (
    review_id               VARCHAR,
    order_id                VARCHAR,
    review_score            SMALLINT,
    review_comment_title    VARCHAR,
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE products (
    product_id                   VARCHAR PRIMARY KEY,
    product_category_name        VARCHAR,
    product_name_lenght          INTEGER,
    product_description_lenght   INTEGER,
    product_photos_qty           INTEGER,
    product_weight_g             NUMERIC(10,2),
    product_length_cm            NUMERIC(10,2),
    product_height_cm            NUMERIC(10,2),
    product_width_cm             NUMERIC(10,2)
);

CREATE TABLE sellers (
    seller_id               VARCHAR PRIMARY KEY,
    seller_zip_code_prefix  VARCHAR,
    seller_city             VARCHAR,
    seller_state            VARCHAR
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix  VARCHAR,
    geolocation_lat              NUMERIC(9,6),
    geolocation_lng              NUMERIC(9,6),
    geolocation_city             VARCHAR,
    geolocation_state            VARCHAR
);

CREATE TABLE product_category_name_translation (
    product_category_name          VARCHAR PRIMARY KEY,
    product_category_name_english  VARCHAR
);
