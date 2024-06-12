-- DML (DATA Manipulation Language)
-- 데이터 조작 언어, 테이블에 값을 삽입, 수정 또는 삭제 하는 SQL

-- insert
-- 새로운 행을 추가하는 구문
-- 테이블의 행의 수가 증가한다.
-- null 허용 가능한

select *
from tbl_menu;

-- insert into [테이블명] values ([컬럼 내용])

insert into tbl_menu (25, '바나나해장국', 8500, 4, 'Y');

insert into tbl_menu (orderable_status, menu_price, menu_name, category_code)
values ('y', 5500, '파인애플탕', 4);

-- 여러 컬럼을 한번에 insert

insert into
    tbl_menu
values
    (null, '참치맛아이스크림', 1700, 12, 'Y'),
    (null, '멸치맛아이스크림', 1500, 11, 'Y'),
    (null, '소시지맛커피', 2500, 8, 'Y');


select
    *
from tbl_menu
where menu_name = '파인애플탕';

update tbl_menu
set category_code = 7
where -- 바꿀 행 조건
      menu_code = 25;

-- delete
-- 테이블의 행을 삭제하는 구문
-- 테이블의 행의 갯수 줄어든다

-- limit를 사용한 삭제
-- 20000원 이상인 데이터중, 가격이 높은 순으로 2개 삭제
delete
from tbl_menu
where -- 삭제할 행 조건
      menu_price >= 20000
order by menu_price desc
limit 2;-- 내림차순

-- 20000원 이상 가격 높은 순으로 조회
select
    menu_name, menu_price
from tbl_menu
where menu_price >= 20000
order by menu_price desc;

-- 단일 행 삭제
delete
from tbl_menu
where menu_code = 28;

select
    *
from
    tbl_menu;

-- 테이블 전체행 삭제
delete
from tbl_menu
where menu_code > 0;



/*
replace
-- replace를 통해 중복된 데이터를 덮어 쓸 수 있다.
-- 해당 행을 삭제하고 새로운 값을 삽입한다.

-- insert 시 PRIMARY KEY(기본키 ) 또는 UNIQUE KEY가 충돌이 발생할 수 있다.

-- UPDATE 조건을 충족하는 모든 행을 수정할 수 있지만,
-- REPLACE는 무조건 한 행에 대해 수행만 가능하다.
*/

/*
PRIMARY KEY : 기본키, pk 유일성과 최소성을 충족한다. 해당 행을 식별할 때 기준이 되는 필수 키
UNIQUE KEY : 테이블 내에서 유일성을 만족하는 키, 해당 행을 식별할 때 사용 가능

최소성 : 키를 구성하는 속성들 중 가장 최소로 필요한 속성들로만 키를 구성하는 성질
유일성 : 여러개의 데이터가 존재할 떄, 각각의 행을 유일하게 식별 가능한 조건
*/
select * from tbl_menu;
insert into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');

replace into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');

-- into 생략 가능
replace tbl_menu values (17, '참기름맥주', 5000, 10, 'Y');

replace tbl_menu
set menu_code = 2,
    menu_name = '우럭주스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';


replace tbl_menu values (9, '맥콜빙수', 7000, 12, 'Y');