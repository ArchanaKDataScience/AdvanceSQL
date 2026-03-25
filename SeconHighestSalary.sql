Sol 1:
SELECT ISNULL(
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET 1 ROW FETCH NEXT 1 ROW ONLY
    ),
    NULL
) AS SecondHighestSalary;

Sol 2:
SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
