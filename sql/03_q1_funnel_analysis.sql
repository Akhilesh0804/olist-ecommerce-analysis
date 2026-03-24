-- Q1: Purchase funnel analysis
-- Purpose: Count orders at each stage of the funnel and calculate
--          conversion rates between stages
-- Tables used: orders, order_reviews
-- Key decision: Stage 5 filtered to delivered orders only
--               to maintain funnel consistency
-- Output: 5 rows, one per funnel stage with conversion rate

WITH cte AS (
    SELECT
        1 AS sort_order,
        'Stage 1 — order placed' AS stage,
        COUNT(*) AS order_count
    FROM orders
    UNION ALL
    SELECT
        2,
        'Stage 2 — payment approved',
        COUNT(*) FILTER (WHERE order_approved_at IS NOT NULL)
    FROM orders
    UNION ALL
    SELECT
        3,
        'Stage 3 — shipped to carrier',
        COUNT(*) FILTER (WHERE order_status IN ('shipped','delivered','invoiced'))
    FROM orders
    UNION ALL
    SELECT
        4,
        'Stage 4 — delivered to customer',
        COUNT(*) FILTER (WHERE order_delivered_customer_date IS NOT NULL
                         AND order_status = 'delivered')
    FROM orders
    UNION ALL
    SELECT
        5,
        'Stage 5 — review left',
        COUNT(DISTINCT orr.review_id) filter (where order_status ='delivered')
    FROM orders o
    LEFT JOIN order_reviews orr
        ON o.order_id = orr.order_id
)
SELECT
    sort_order,
    stage,
    order_count,
    ROUND(
        (order_count::NUMERIC / LAG(order_count) OVER (ORDER BY sort_order)) * 100
    , 2) AS conversion_rate_pct
FROM cte
ORDER BY sort_order;
