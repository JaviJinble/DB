/*newbook table ����*/
create table NewBook (
bookid NUMBER primary key,
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 check(price>1000));

select * from newbook;

/*newcustomer table ����*/
create table NewCustomer (
custid NUMBER PRIMARY key,
name varchar2(20),
address varchar2(20),
phone varchar2(30));

/*neworders table ����*/
create table NewOrders (
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
PRIMARY key(orderid),
foreign key(custid) REFERENCES newcustomer(custid) on delete cascade); 

/*�Ӽ� �߰�*/
alter table newbook add isbn varchar2(13);

select * from newbook;

/*������� ����*/
alter table newbook modify isbn number;

select * from newbook;
select * from newcustomer;
select * from neworders;

/*table ����*/
drop table newbook;
select * from book;

/*���� �߰�*/
insert into book(bookid, bookname, publisher, price)
values(11, '������ ����', '�Ѽ����м���', 90000);

insert into book(bookid, bookname, publisher)
values(14, '������ ����', '�Ѽ����м���');

select * from imported_book;

/*�뷮 ����*/
insert into book(bookid, bookname, price, publisher)
        select bookid, bookname, price, publisher
        from imported_book;

/*�ڼ��� �ּ� Ȯ��*/
select * from customer;

/*������Ʈ*/
update customer
set address='���ѹα� �λ�'
where custid=5;

update customer
set address=(select address
             from customer
             where name='�迬��')
where name='�ڼ���';

/*���� ����*/
delete from customer
where custid=5;

rollback;
select * from customer;


