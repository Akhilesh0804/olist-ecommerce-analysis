-- Q3b: Delivery time vs customer satisfaction analysis
-- Purpose: Understand the relationship between delivery duration and
--          customer review scores by bucketing orders into delivery
--          speed categories based on percentile distribution (Q3a)
-- Tables used: orders, order_reviews
-- Key decisions:
--   1. Filtered to delivered orders only (order_status = 'delivered')
--      for consistency with project methodology
--   2. Buckets set using percentile distribution from Q3a:
--      Fast < 7 days, Normal 7-10, Slow 11-20, Very slow > 20
--   3. EPOCH used instead of DATE_PART('day') to correctly handle
--      sub-24hr deliveries which would otherwise show as 0 days
--   4. LEFT JOIN on order_reviews to retain orders with no review
-- Output: 4 rows, one per delivery bucket showing order count,
--         avg review score, and avg delivery days ordered by speed
  
WITH delivery_buckets AS (
    SELECT
        order_id,
        ROUND(DATE_PART('epoch', order_delivered_customer_date - order_purchase_timestamp)::NUMERIC / 86400, 1) AS delivery_days,
        CASE
            WHEN ROUND(DATE_PART('epoch', order_delivered_customer_date - order_purchase_timestamp)::NUMERIC / 86400, 1) < 7  THEN 'Fast'
            WHEN ROUND(DATE_PART('epoch', order_delivered_customer_date - order_purchase_timestamp)::NUMERIC / 86400, 1) < 11 THEN 'Normal'
            WHEN ROUND(DATE_PART('epoch', order_delivered_customer_date - order_purchase_timestamp)::NUMERIC / 86400, 1) < 21 THEN 'Slow'
            ELSE 'Very slow'
        END AS delivery_bucket
    FROM orders
    WHERE order_status = 'delivered'
)
SELECT
    delivery_bucket,
    COUNT(DISTINCT db.order_id)    AS order_count,
    ROUND(AVG(orr.review_score), 2) AS avg_review_score,
    ROUND(AVG(delivery_days), 2)    AS avg_delivery_days
FROM delivery_buckets AS db
LEFT JOIN order_reviews AS orr
    ON db.order_id = orr.order_id
GROUP BY delivery_bucket
ORDER BY avg_delivery_days;
