/*newbook table 생성*/
create table NewBook (
bookid NUMBER primary key,
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 check(price>1000));

select * from newbook;

/*newcustomer table 생성*/
create table NewCustomer (
custid NUMBER PRIMARY key,
name varchar2(20),
address varchar2(20),
phone varchar2(30));

/*neworders table 생성*/
create table NewOrders (
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
PRIMARY key(orderid),
foreign key(custid) REFERENCES newcustomer(custid) on delete cascade); 

/*속성 추가*/
alter table newbook add isbn varchar2(13);

select * from newbook;

/*제약사항 변경*/
alter table newbook modify isbn number;

select * from newbook;
select * from newcustomer;
select * from neworders;

/*table 삭제*/
drop table newbook;
select * from book;

/*투플 추가*/
insert into book(bookid, bookname, publisher, price)
values(11, '스포츠 의학', '한솔의학서적', 90000);

insert into book(bookid, bookname, publisher)
values(14, '스포츠 의학', '한솔의학서적');

select * from imported_book;

/*대량 삽입*/
insert into book(bookid, bookname, price, publisher)
        select bookid, bookname, price, publisher
        from imported_book;

/*박세리 주소 확인*/
select * from customer;

/*업데이트*/
update customer
set address='대한민국 부산'
where custid=5;

update customer
set address=(select address
             from customer
             where name='김연아')
where name='박세리';

/*투플 삭제*/
delete from customer
where custid=5;

rollback;
select * from customer;


