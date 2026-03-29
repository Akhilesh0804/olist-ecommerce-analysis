SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP 
        (ORDER BY DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS p25,
    PERCENTILE_CONT(0.50) WITHIN GROUP 
        (ORDER BY DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP 
        (ORDER BY DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS p75,
    PERCENTILE_CONT(0.90) WITHIN GROUP 
        (ORDER BY DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS p90,
    MIN(DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS min_days,
    MAX(DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp)) AS max_days,
    ROUND(AVG(DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp))::numeric, 2) AS avg_days
FROM orders
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL;
