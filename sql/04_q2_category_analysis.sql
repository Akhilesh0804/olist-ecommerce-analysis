-- Q2: Category performance analysis — revenue vs customer satisfaction
-- Purpose: Identify the top 20 revenue generating categories and their
--          average customer satisfaction scores to find high revenue
--          categories with disproportionately low ratings
-- Tables used: orders, order_items, products,
--              product_category_name_translation, order_reviews
-- Key decisions:
--   1. Filtered to delivered orders only (order_status = 'delivered')
--      for consistency with Q1 methodology
--   2. INNER JOIN on translation table to exclude 610 products with
--      no category name and 13 rows across 2 untranslated categories
--      combined exclusion rate under 2%, immaterial to findings
--   3. TOP 20 selected over TOP 10 as categories ranked 11-20
--      contain significant revenue generators worth investigating
-- Output: 20 rows showing category, total revenue, and avg review score
--         ordered by total revenue descending

SELECT 
    product_category_name_english as category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(AVG(orr.review_score), 2) AS avg_review_score
FROM orders AS o
LEFT JOIN order_items AS oi
    ON o.order_id = oi.order_id
LEFT JOIN products AS p
    ON oi.product_id = p.product_id
INNER JOIN product_category_name_translation pct
    ON p.product_category_name = pct.product_category_name
LEFT JOIN order_reviews orr
    ON o.order_id = orr.order_id
WHERE order_status = 'delivered'
GROUP BY product_category_name_english
ORDER BY total_revenue DESC
LIMIT 20;
