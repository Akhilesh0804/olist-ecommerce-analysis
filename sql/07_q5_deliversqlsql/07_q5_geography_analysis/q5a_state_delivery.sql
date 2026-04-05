-- Q5a: State level delivery time and satisfaction analysis
-- Purpose: Identify which Brazilian states experience the longest delivery
--          times and lowest satisfaction scores to determine whether poor
--          customer experience is driven by geographic and infrastructure
--          factors rather than seller quality
-- Tables used: customers, orders, order_reviews
-- Key decisions:
--   1. Filtered to delivered orders only (order_status = 'delivered')
--      for consistency with project methodology
--   2. CTE used to calculate delivery duration per order before
--      aggregating at state level, consistent with Q3 approach
--   3. Ordered by avg_delivery_days descending so worst performing
--      states appear first for immediate pattern identification
-- Output: 27 rows showing customer state, total orders, avg review
--         score and avg delivery days ordered by delivery time descending

WITH state_delivery AS (
    SELECT
        c.customer_state,
        o.order_id,
        orr.review_score,
        ROUND(
            DATE_PART('epoch', o.order_delivered_customer_date - o.order_purchase_timestamp)::NUMERIC / 86400,
            1
        ) AS delivery_days
    FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_reviews AS orr
        ON o.order_id = orr.order_id
    WHERE o.order_status = 'delivered'
)
SELECT
    customer_state,
    COUNT(DISTINCT order_id)     AS total_orders,
    ROUND(AVG(review_score), 1)  AS avg_review_score,
    ROUND(AVG(delivery_days), 1) AS avg_delivery_days
FROM state_delivery
GROUP BY customer_state
ORDER BY avg_delivery_days DESC;
