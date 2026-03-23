SELECT 
    c.customer_id,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE 
            WHEN o.amount > 100 THEN 1 
            ELSE 0 
        END) AS high_value_orders
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
