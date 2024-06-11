
select
    JOB_CODE,
    avg(employee.SALARY)
from
    employee
group by JOB_CODE;

select
    employee.SAL_LEVEL,
    min(employee.SALARY)
from
    employee
group by SAL_LEVEL;

select
    employee.DEPT_CODE,
    count(*)
from
    employee
group by DEPT_CODE
having count(*) >= 3;

select
    employee.JOB_CODE,
    avg(employee.SALARY)
from
    employee
group by JOB_CODE
having avg(SALARY) >= 4000000;

select
    employee.DEPT_CODE,
    employee.JOB_CODE,
    sum(employee.SALARY)
from
    employee
group by
    DEPT_CODE,
    JOB_CODE
with rollup



