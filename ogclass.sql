create database ogclass;

show databases;

grant all privileges on ogclass.* to 'ohgiraffers'@'%';

show grants for 'ohgiraffers'@'%';

use ogclass;

create table if not exists class
(
    student_no int primary key auto_increment,
    student_name varchar(255) not null,
    gender varchar(5) not null check (gender in( '남', '여') ),
    github_id varchar(255) not null unique,
    email varchar(255) not null ,
    mbti varchar(10),
    subject_no int,
    foreign key (subject_no)
references favorite_subject (subject_no)

);

insert into favorite_subject (subject_name)
values ('spring'),
       ('jdbc'),
       ('java'),
       ('mysql'),
       ('mybatis'),
       ('react');

select *
from favorite_subject
order by subject_no;



update favorite_subject
set subject_name = ('java', 'mysql', 'jdbc', 'mybatis', 'spring', 'react')
where subject_no = (1, 2, 3, 4, 5, 6);





insert into class
( student_name, gender, github_id, mbti, subject_no)
values
    ( '박태근', '남', 'Ohgiraffers-bear', 'ENFJ', 5),
    ( '지동현', '남', 'Bring2it2on', '모름', 3),
    ( '김강현', '남', 'kimkinghyeon', 'ISFP', 1),
    ( '이득규', '남', 'MANTISKYU', 'ESTJ', 2),
    ( '홍주연', '여', 'juyeon99', 'ISFP', 1),
    ( '양혜연', '여', 'yanghyeyeon', '모름', 5),
    ( '이규섭', '남', 'LKS9616', '모름', 2),
    ( '전유안', '남', 'euuuuuuan', '모름', 4),
    ( '박성은', '남', 'seongeun223', '모름', 2),
    ( '박하얀', '여', 'parkhayarn', '모름', null),
    ( '위성민', '남', 'wdh970616', '모름', null),
    ( '박효찬', '남', 'qwes5674', '모름', 2),
    ( '이의정', '남', 'himisterlee', '모름', 2),
    ( '권은혜', '여', 'dmsgpk237', '모름', 2),
    ( '권보현', '여', 'Kwonbohyun', '모름', 2),
    ( '배하은', '여', 'HEun0420', 'INTP??', 2),
    ( '강연진', '여', 'kangyeonjin', '모름', 4),
    ( '강진영', '남', 'weed97', '모름', 2);

select *
from class;


create table if not exists favorite_subject
(
    subject_no int primary key auto_increment,
    subject_name varchar(255) not null unique

);

select *
from favorite_subject;

insert into favorite_subject(subject_no, subject_name)
values
    (1, 'java'),
    (2, 'mysql'),
    (3, 'jdbc'),
    (4, 'mybatis'),
    (5, 'spring'),
    (6, 'react')


# class table
# student_no : [int] primary key, auto increament
# stuent_name : [varchar[255]] not null
# gender : [varchar[5]] notnull check(’남’,’여’)
#     github_id : [varchar[255]]  not null, unique
#     email : [varchar[255]]  not null, unique
#     mbti : [varchar[10]]
#     subject_no : [int] foregin key,
#
#     favorite_subject table
#     subject_no : [int] primary key, auto increament
#     subject_name : [varchar[255]] not null, unique

