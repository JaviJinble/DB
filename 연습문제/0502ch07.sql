/*1�� Summer table*/
DROP TABLE Summer; /*���� ���̺��� ������ ����*/

CREATE TABLE Summer(
    sid number,
    class varchar2(20),
    price number
    );
    
insert into Summer values (100, 'FORTRAN', 20000);
insert into Summer values (150, 'PASCAL', 15000);
insert into Summer values (200, 'C', 10000);
insert into Summer values (250, 'FORTRAN', 20000);

/* ������ Summer ���̺� Ȯ��*/
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

/*200�� �л��� �����б� ������û�� ����Ͻÿ�.*/
delete from Summer where sid=200;
/*C ���� ������ ��ȸ*/
select price "C ������"
from Summer
where class='C'; /*�����̻� */

/*�����б⿡ ���ο� �ڹ� ���¸� ���� �Ͻÿ�.*/
insert into Summer values (null, 'JAVA', 25000);

select count(*) as "�����ο�"
from Summer;

select count(sid) as "�����ο�"
from Summer;

select count(*) as "�����ο�"
from Summer
where sid IS NOT NULL; /* �����̻�*/

/*FORTRAN ������ �����Ḧ 20,000������ 15,000������ �����Ͻÿ�*/
/* FORTRAN ���� ������ ����*/
update Summer
set price=15000
where class='FORTRAN';

select *
from Summer;

select DISTINCT price "FORTRAN ������"
from Summer
where class='FORTRAN';

/* ���� �ǽ��� ���� FORTRAN ������ �����Ḧ �ٽ� 20,000������ ���� */
update Summer
set price=20000
where class='FORTRAN';

/* ���� UPDATE���� ������ ���� �ۼ��ϸ� ������ ����ġ ������ �߻���*/
update Summer
set price=15000
where class='FORTRAN' and sid=100;

/* Summer ���̺��� ��ȸ�� ���� FORTRAN ������ �����ᰡ �� �Ǹ� �����Ǿ���*/
select *
from Summer; /* �����̻�*/

/* FORTRAN �����Ḧ ��ȸ�ϸ� �� ���� ����(������ ����ġ ���� �߻�)*/
select price "FORTRAN ������"
from SUMMER
where class='FORTRAN';

/* ���� �ǽ��� ���� FORTRAN ������ �����Ḧ �ٽ� 20,000������ ����*/
update Summer
set price=20000
where class='FORTRAN';

/* ���� �ǽ��� ���� sid�� NULL�� ���� ����*/
DELETE
from Summer
where sid IS NULL;


DROP table SummerPice;
drop table SummerEnroll;

/* SummerPrice ���̺� ����*/
create table SummerPrice(
    class varchar(20),
    price integer
    );
    
insert into SummerPrice values ('FORTRAN', 20000);
insert into SummerPrice values ('PASCAL', 15000);
insert into SummerPrice values ('C', 10000);

select *
from SummerPrice;

/* SummerEnroll ���̺� ����*/
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

/* �����б⸦ ��� �л��� �й��� �����ϴ� ������?*/
select sid, class
from summerenroll;
/* C ������ �������?*/
select price
from summerprice
where class='C';
/* �����ᰡ ���� ��� ������?*/
select distinct class
from summerprice
where price=(select max (price) from summerprice);
/* �����б⸦ ��� �л� ���� ������ �Ѿ���?*/
select count(*),sum(price)
from summerprice,summerenroll
where summerprice.class=summerenroll.class;

/* ���� 7-4 200�� �л��� �����б� ������û�� ����Ͻÿ�.*/
select price "C ������"
from summerprice
where class='C';

delete from summerenroll
where sid=200;

select *
from summerenroll;
/* C ������ �����ᰡ �����ϴ��� Ȯ��*/
select price "C ������"
from summerprice
where class='C'; /* �����̻� ����*/

/* ���� 7-5 �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.*/
/* �ڹ� ���� ����, NULL ���� �Է��� �ʿ� ����*/
insert into summerprice values ('JAVA', 25000);

select *
from summerprice;

/* ������û ���� Ȯ��*/
select *
from summerenroll; /* �����̻� ����*/

/* ���� 7-6 FORTRAN ������ �����Ḧ 20,000������ 15,000������ �����Ͻÿ�.*/
update summerprice
set price=15000
where class='FORTRAN';

select price "FORTRAN ������"
from summerprice
where class='FORTRAN'; /*�����̻� ����*/