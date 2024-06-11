
select
    employee.SALARY,
    employee.EMP_NAME
from
    employee
order by salary desc
limit 5;

select
    employee.HIRE_DATE,
    employee.EMP_NAME
from
    employee
order by HIRE_DATE desc
limit 10;

