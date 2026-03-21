'🔹 Concept: ROW_NUMBER()
'Used to rank or deduplicate data.
'1.Get latest order per customer
  
  SELECT *,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) as rn
FROM orders;


  '2.Find the top 2 highest transactions per customer
SELECT customer_id, order_date, amount
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id 
               ORDER BY amount DESC
           ) AS rn
    FROM orders
) t
WHERE rn <= 2;  

  '3.Find the top 2 unique transaction values (include ties)
SELECT customer_id, order_date, amount
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id 
               ORDER BY amount DESC
           ) AS rn
    FROM orders
) t
WHERE rn <= 2;  
