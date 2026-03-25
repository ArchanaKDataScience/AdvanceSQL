CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
     SELECT ISNULL(
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET @N-1 ROW FETCH NEXT 1 ROW ONLY
    ),
    NULL
) AS SecondHighestSalary
    );
END
