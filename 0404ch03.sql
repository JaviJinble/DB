/*���� �ֹ��� ������ �ǸŰ��ݰ� ���� �̸�*/
select name, saleprice
from Customer, Orders
where Customer.custid=Orders.custid;

/*�ܺ��������� ������ �������� ���� ���� ���� ��Ŵ*/
select name, saleprice
from Customer left outer join Orders on Customer.custid=Orders.custid;

/*���ʿܺ�����(+)*/
select Customer.name, saleprice
from Customer, orders
where customer.custid=orders.custid(+);

/*���� ��� ������ ���� ǥ��*/
select max(price)
from book;

/*���� ��� ������ �̸�*/
select bookname
from book
where price=35000;

/*���� ��� ������ �̸�*/
select bookname
from book
where price=(select max(price) from book);

/*�ֹ��� ���� ����ȣ�� ã��*/
select custid
from orders;

/*�� ���̵� �ش��ϴ� �� �̸� ã��*/
select name
from customer
where custid in (1, 2, 3, 4);

/*������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.*/
select name
from customer
where custid in (select custid from orders);

/*��� �μ����� > ���ǻ纰 ���ǻ��� ��պ��� ��ѵ���*/
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                from book b2
                where b2.publisher=b1.publisher);
                
/*������ �ֹ����� ���� ���� �̸��� ���̽ÿ�*/
select name
from customer;

select name
from customer
where custid in (select custid from orders);

/*������ �ֹ����� ���� ���� �̸��� ���̽ÿ�*/
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

/*�ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.*/
select name, address
from customer cs
where exists (select *
              from orders od
              where cs.custid=od.custid);
              
              