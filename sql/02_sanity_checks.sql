
-- 02: Sanity checks
-- Purpose: Verify all 9 tables loaded correctly after CSV import
-- Run these queries immediately after loading data
-- Expected results documented inline for quick validation

-- 1. Row counts across all 9 tables
-- Expected: customers 99441, orders 99441, order_items 112650,
--           order_payments 103886, order_reviews 99224,
--           products 32951, sellers 3095,
--           geolocation 1000163, translation 71
SELECT 'customers'                          AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'orders',                                           COUNT(*) FROM orders
UNION ALL
SELECT 'order_items',                                      COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments',                                   COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews',                                    COUNT(*) FROM order_reviews
UNION ALL
SELECT 'products',                                         COUNT(*) FROM products
UNION ALL
SELECT 'sellers',                                          COUNT(*) FROM sellers
UNION ALL
SELECT 'geolocation',                                      COUNT(*) FROM geolocation
UNION ALL
SELECT 'product_category_name_translation',                COUNT(*) FROM product_category_name_translation;

-- 2. NULL check on critical columns in orders table
-- Expected: null_delivery_date ~2980, all others very low
SELECT
    COUNT(*)                                                        AS total_orders,
    COUNT(*) FILTER (WHERE customer_id IS NULL)                     AS null_customer_id,
    COUNT(*) FILTER (WHERE order_status IS NULL)                    AS null_status,
    COUNT(*) FILTER (WHERE order_purchase_timestamp IS NULL)        AS null_purchase_date,
    COUNT(*) FILTER (WHERE order_approved_at IS NULL)               AS null_approved_date,
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL)   AS null_delivery_date,
    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL)   AS null_estimated_date
FROM orders;

-- 3. Order status breakdown
-- Expected: delivered should be the dominant status
SELECT order_status, COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- 4. Date range of dataset
-- Expected: 2016 to 2018
SELECT
    MIN(order_purchase_timestamp) AS earliest_order,
    MAX(order_purchase_timestamp) AS latest_order
FROM orders;

-- 5. Duplicate check on primary keys
-- Expected: all four should return 0
SELECT 'orders — duplicate order_ids'        AS check_name,
       COUNT(*) - COUNT(DISTINCT order_id)   AS duplicates FROM orders
UNION ALL
SELECT 'customers — duplicate customer_ids',
       COUNT(*) - COUNT(DISTINCT customer_id) FROM customers
UNION ALL
SELECT 'products — duplicate product_ids',
       COUNT(*) - COUNT(DISTINCT product_id) FROM products
UNION ALL
SELECT 'sellers — duplicate seller_ids',
       COUNT(*) - COUNT(DISTINCT seller_id)  FROM sellers;

-- 6. Review score distribution
-- Expected: only values 1 through 5
SELECT review_score, COUNT(*) AS total
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- 7. Join integrity check
-- Expected: 0 orphaned order_items
SELECT COUNT(*) AS orphaned_order_items
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 8. Payment types breakdown
SELECT payment_type, COUNT(*) AS total
FROM order_payments
GROUP BY payment_type
ORDER BY total DESC;
