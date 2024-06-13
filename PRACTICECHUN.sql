create database chundb;

show databases;

grant all privileges on chundb.* to 'ohgiraffers'@'%';

show grants for 'ohgiraffers'@'%';

use chundb;


select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"으로 표시하도록 한다.

select
    tb_department.DEPARTMENT_NAME as '학과 명',
    tb_department.CATEGORY as '계열'
from tb_department;

-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.

select
    concat(DEPARTMENT_NAME, '정원은', tb_department.CAPACITY, '명입니다')
from
    tb_department;


-- 3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
-- 들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서
-- 찾아 내도록 하자)

select
    STUDENT_NAME
from tb_student
where DEPARTMENT_NO = 1
  and substring(STUDENT_SSN, 8, 1) in ('2', '4')
  and ABSENCE_YN = 'Y';

-- 4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 그 대상자들의
-- 학번이 다음과 같을 때 대상자들을 찾는 적 SQL 구문을 작성하시오.

-- A513079, A513090, A513091, A513110, A513119

select
    STUDENT_NAME
from tb_student
where STUDENT_NO in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
order by tb_student.STUDENT_NAME desc;


-- 5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.

select
    tb_department.DEPARTMENT_NAME,
    tb_department.CATEGORY
from tb_department
where CAPACITY >= 20 and CAPACITY <= 30;

-- 6. 춘기술대학교는총장을제외하고모든교수들이소속학과를가지고있다. 그럼 춘기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.

select
    tb_professor.PROFESSOR_NAME
from tb_professor
where tb_professor.DEPARTMENT_NO is null;

-- 7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다.
-- 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.

select
    *
from tb_student
where DEPARTMENT_NO is null;

-- 8. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
-- 과목들은 어떤 과목인지 과목번호를 조회해보시오.

-- CLASS_NO
-- --------
-- C0405500
-- C0409000
-- C3745400
-- C0432500
-- C3051900
-- C3221500

select
    CLASS_NO
from
    tb_class a
join tb_class b
on a.CLASS_NAME = b.CLASS_NAME
where CLASS_TYPE in ('전공필수', '전공선택');

-- 9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.

select
    distinct tb_department.CATEGORY
from tb_department;


-- 10. 19 학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외하고, 재학중인
-- 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.

select
    tb_student.STUDENT_NO,
    tb_student.STUDENT_NAME,
    tb_student.STUDENT_SSN
from
    tb_student
where substring(ENTRANCE_DATE, 1, 4) = '2019' and substring(STUDENT_ADDRESS, 1, 2) = '전주' and ABSENCE_YN = 'N'
order by STUDENT_NAME asc;



