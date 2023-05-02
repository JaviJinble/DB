/*1장 Summer table*/
DROP TABLE Summer; /*기존 테이블이 있으면 삭제*/

CREATE TABLE Summer(
    sid number,
    class varchar2(20),
    price number
    );
    
insert into Summer values (100, 'FORTRAN', 20000);
insert into Summer values (150, 'PASCAL', 15000);
insert into Summer values (200, 'C', 10000);
insert into Summer values (250, 'FORTRAN', 20000);

/* 생성된 Summer 테이블 확인*/
select *
from Summer;

select sid, class
from Summer;

select price
from summer
where class='C';

select distinct class
from Summer
where price=(select max(price)
            from Summer);
            
select count(*), sum(price)
from Summer;

/*200번 학생의 계절학기 수강신청을 취소하시오.*/
delete from Summer where sid=200;
/*C 강좌 수강료 조회*/
select price "C 수강료"
from Summer
where class='C'; /*삭제이상 */

/*계절학기에 새로운 자바 강좌를 개설 하시오.*/
insert into Summer values (null, 'JAVA', 25000);

select count(*) as "수강인원"
from Summer;

select count(sid) as "수강인원"
from Summer;

select count(*) as "수강인원"
from Summer
where sid IS NOT NULL; /* 삽입이상*/

/*FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오*/
/* FORTRAN 강좌 수강료 수정*/
update Summer
set price=15000
where class='FORTRAN';

select *
from Summer;

select DISTINCT price "FORTRAN 수강료"
from Summer
where class='FORTRAN';

/* 다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20,000원으로 복구 */
update Summer
set price=20000
where class='FORTRAN';

/* 만약 UPDATE문을 다음과 같이 작성하면 데이터 불일치 문제가 발생함*/
update Summer
set price=15000
where class='FORTRAN' and sid=100;

/* Summer 테이블을 조회해 보면 FORTRAN 강좌의 수강료가 한 건만 수정되었음*/
select *
from Summer; /* 수정이상*/

/* FORTRAN 수강료를 조회하면 두 건이 나옴(데이터 불일치 문제 발생)*/
select price "FORTRAN 수강료"
from SUMMER
where class='FORTRAN';

/* 다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20,000원으로 복구*/
update Summer
set price=20000
where class='FORTRAN';

/* 다음 실습을 위해 sid가 NULL인 투플 삭제*/
DELETE
from Summer
where sid IS NULL;


DROP table SummerPice;
drop table SummerEnroll;

/* SummerPrice 테이블 생성*/
create table SummerPrice(
    class varchar(20),
    price integer
    );
    
insert into SummerPrice values ('FORTRAN', 20000);
insert into SummerPrice values ('PASCAL', 15000);
insert into SummerPrice values ('C', 10000);

select *
from SummerPrice;

/* SummerEnroll 테이블 생성*/
create table SummerEnroll(
    sid integer,
    class varchar(20)
    );
    
insert into SummerEnroll values (100, 'FORTRAN');
insert into SummerEnroll values (150, 'PASCAL');
insert into SummerEnroll values (200, 'C');
insert into SummerEnroll values (250, 'FORTRAN');

select *
from SummerEnroll;

/* 계절학기를 듣는 학생의 학번과 수강하는 과목은?*/
select sid, class
from summerenroll;
/* C 강좌의 수강료는?*/
select price
from summerprice
where class='C';
/* 수강료가 가장 비싼 과목은?*/
select distinct class
from summerprice
where price=(select max (price) from summerprice);
/* 계절학기를 듣는 학생 수와 수강료 총액은?*/
select count(*),sum(price)
from summerprice,summerenroll
where summerprice.class=summerenroll.class;

/* 질의 7-4 200번 학생의 계절학기 수강신청을 취소하시오.*/
select price "C 수강료"
from summerprice
where class='C';

delete from summerenroll
where sid=200;

select *
from summerenroll;
/* C 강좌의 수강료가 존재하는지 확인*/
select price "C 수강료"
from summerprice
where class='C'; /* 삭제이상 없음*/

/* 질의 7-5 계절학기에 새로운 자바 강좌를 개설하시오.*/
/* 자바 강좌 삽입, NULL 값을 입력할 필요 없음*/
insert into summerprice values ('JAVA', 25000);

select *
from summerprice;

/* 수강신청 정보 확인*/
select *
from summerenroll; /* 삽입이상 없음*/

/* 질의 7-6 FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.*/
update summerprice
set price=15000
where class='FORTRAN';

select price "FORTRAN 수강료"
from summerprice
where class='FORTRAN'; /*수정이상 없음*/