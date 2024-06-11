select
    EMP_NAME,
    DEPT_TITLE
from
    employee a
        inner join department b
on a.DEPT_CODE = b.DEPT_ID;

select
    EMP_NAME,
    JOB_NAME
from
    employee a
inner join job b
on a.JOB_CODE = b.JOB_CODE
order by EMP_NAME;

select
    EMP_NAME,
    DEPT_TITLE
from
    employee a
left join department b
on a.DEPT_CODE = b.DEPT_ID
order by EMP_NAME;

select
    EMP_NAME,
    MANAGER_ID
from
    employee
order by EMP_NAME;



