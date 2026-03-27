SELECT id
FROM (
    SELECT 
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) t
WHERE temperature > prev_temp
  AND DATEDIFF(day, prev_date, recordDate) = 1;
