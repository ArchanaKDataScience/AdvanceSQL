select emp.Name as Employee
from Employee as emp
 join Employee as Mgr on emp.managerID=Mgr.id
where emp.Salary>Mgr.Salary
