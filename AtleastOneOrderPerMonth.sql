
WITH customer_months AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT (YEAR(order_date) * 100 + MONTH(order_date))) AS months_ordered
    FROM orders
    GROUP BY customer_id
),
total_months AS (
    SELECT 
        COUNT(DISTINCT (YEAR(order_date) * 100 + MONTH(order_date))) AS total_months
    FROM orders
)
SELECT c.customer_id
FROM customer_months c
JOIN total_months t
  ON c.months_ordered = t.total_months;
---------------------------------
WITH customer_months AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT FORMAT(order_date, 'yyyy-MM')) AS months_ordered
    FROM orders
    GROUP BY customer_id
),
total_months AS (
    SELECT 
        COUNT(DISTINCT FORMAT(order_date, 'yyyy-MM')) AS total_months
    FROM orders
)
SELECT c.customer_id
FROM customer_months c
JOIN total_months t
  ON c.months_ordered = t.total_months;
