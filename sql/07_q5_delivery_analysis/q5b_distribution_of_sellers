-- Q5b: Customer state vs seller state distribution analysis
-- Purpose: Identify the geographic concentration of sellers fulfilling
--          orders in each customer state to determine whether long
--          delivery times are driven by infrastructure gaps (distant
--          sellers) rather than seller quality issues
-- Tables used: customers, orders, order_items, sellers
-- Key decisions:
--   1. Filtered to delivered orders only (order_status = 'delivered')
--      for consistency with project methodology
--   2. Window function PARTITION BY customer_state used to calculate
--      each seller state's percentage share of that customer state's
--      total orders, enabling direct comparison of local vs distant
--      seller concentration per state
--   3. Ordered by customer_state then order_count descending so the
--      dominant seller state appears first for each customer state
-- Output: One row per customer state and seller state combination
--         showing order count and percentage share of that state's
--         total orders, revealing seller geographic concentration

SELECT
    c.customer_state,
    s.seller_state,
    COUNT(DISTINCT o.order_id) AS order_count,
    ROUND(
        COUNT(DISTINCT o.order_id) * 100.0 /
        SUM(COUNT(DISTINCT o.order_id)) OVER (PARTITION BY c.customer_state),
        1
    ) AS pct_of_state_orders
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN sellers AS s
    ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state, s.seller_state
ORDER BY c.customer_state, order_count DESC;
