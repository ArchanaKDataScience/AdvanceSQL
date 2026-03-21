'🔹 Concept: ROW_NUMBER()
'Used to rank or deduplicate data.
'Get latest order per customer
  
  SELECT *,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) as rn
FROM orders;
