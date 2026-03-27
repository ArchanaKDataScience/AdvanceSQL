WITH cte AS (
    SELECT 
        Id,
        Email,
        ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Id) AS rn
    FROM Person
)
DELETE FROM cte
WHERE rn > 1;


or
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.Email = p2.Email
 AND p1.Id > p2.Id;
