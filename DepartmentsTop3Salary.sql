/* Write your T-SQL query statement below */
with empData as
(
select name,salary,departmentid, dense_rank() 
over (partition by departmentid order by salary desc) rn
from Employee 
)
select dept.name Department,empData.name Employee,Salary
from empData left join department dept on 
empdata.departmentid =dept.id
where rn<=3 --order by empData.name
