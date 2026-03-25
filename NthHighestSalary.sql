CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        CASE WHEN @N < 1 THEN NULL
        ELSE (
            SELECT ISNULL(
                (
                    SELECT DISTINCT salary
                    FROM Employee
                    ORDER BY salary DESC
                    OFFSET abs(@N - 1) ROWS FETCH NEXT 1 ROW ONLY
                ), NULL)
        )
        END
    );
END


or 

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @offset INT = IIF(@N < 1, 0, @N - 1);
    DECLARE @result INT;

    SELECT @result = ISNULL(
        (
            SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
            OFFSET @offset ROWS FETCH NEXT 1 ROW ONLY
        ), NULL);

    RETURN IIF(@N < 1, NULL, @result);
END
