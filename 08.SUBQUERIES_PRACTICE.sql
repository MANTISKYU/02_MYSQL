select
    EMP_NAME,
    SALARY,
    JOB_CODE
from
    employee
where DEPT_CODE = 'D5';

select
    a.employee.EMP_NAME,
    b.employee.SALARY,
    avg(employee.SALARY)
from
    employee
where b.salary = (

    select
        EMP_NAME,
        SALARY
    from
        employee
    where SALARY > avg(SALARY)


    )

