/*1�� ����*/
/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';

select count(distinct publisher)
from customer, orders, book
where customer.custid=orders.custid and orders.bookid=book.bookid and customer.name like '������';


/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT customer.name,book.bookname,book.price,orders.saleprice  ,SUM(book.price-orders.saleprice) AS ����
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.name LIKE'%������%' AND orders.bookid=book.bookid
GROUP BY book.publisher, customer.name, book.bookname, book.price, orders.saleprice;

select bookname, price, price-saleprice
from customer, orders, book
where customer.custid=orders.custid and orders.bookid=book.bookid and customer.name like '������';

/*�������� �������� ���� ������ �̸�*/
SELECT DISTINCT book.bookname
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.custid !=1 AND orders.bookid=book.bookid
GROUP BY customer.name, book.bookname;

select bookname
from customer, orders
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '������';
/*existis*/    
select bookname
from book
where not exists (
        select bookname
        from customer, orders
        where customer.custid=orders.custid 
           and orders.bookid=book.bookid 
           and customer.name like '������');
    
/*2�� ����*/
/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT  name
FROM customer
WHERE name NOT IN(
    SELECT customer.name
    FROM customer,orders
    WHERE orders.custid=customer.custid); 
    
select name
from customer
where name not in(
        select name
        from customer, orders
        where customer.custid=orders.custid);
    
/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT SUM(price) AS �Ѿ�, AVG(PRICE) AS ���
FROM ORDERS,BOOK 
WHERE BOOK.BOOKID = ORDERS.BOOKID;

SELECT sum(orders.SALEPRICE) AS �Ѿ�, avg(orders.SALEPRICE)AS ���
FROM ORDERS;

select sum(saleprice), avg(saleprice)
from orders;

/*���� �̸��� ���� ���ž�*/
SELECT customer.name, sum(orders.SALEPRICE)
FROM ORDERS,customer
WHERE orders.custid=customer.custid 
GROUP BY customer.name
ORDER BY name;

select name, sum(saleprice) as total
from customer, orders
where customer.custid=orders.custid
group by name;

/*���� �̸��� ���� ������ ���� ���*/
SELECT customer.name, book.bookname
FROM ORDERS,customer,book
WHERE orders.custid=customer.custid AND book.bookid=orders.bookid GROUP BY customer.name, book.bookname ORDER BY name;

select name, book.bookname
from orders, customer, book
where customer.custid=orders.custid 
    and book.bookid=orders.bookid;

/*������ ����(Book���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
SELECT *
FROM book, ORDERS
WHERE book.BOOKID = orders.BOOKID AND book.PRICE-orders.SALEPRICE = (SELECT max(book.PRICE-orders.SALEPRICE)
                                    FROM book, ORDERS
                                    WHERE book.BOOKID = orders.BOOKID);
                                    
select *
from book, orders
where book.bookid=orders.bookid
    and price-saleprice=(
                    select max(price-saleprice)
                    from book, orders
                    where book.bookid=orders.bookid);

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT customer.NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID GROUP BY customer.NAME HAVING avg(orders.SALEPRICE) > (SELECT avg(orders.SALEPRICE) FROM ORDERS);

select name, avg(saleprice)
from customer, orders
where customer.custid=orders.custid 
group by name 
having avg(saleprice) > (select avg(saleprice) from orders); 
