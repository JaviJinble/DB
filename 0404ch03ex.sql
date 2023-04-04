/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT customer.name,book.bookname,book.price,orders.saleprice  ,SUM(book.price-orders.saleprice) AS ����
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.name LIKE'%������%' AND orders.bookid=book.bookid
GROUP BY book.publisher, customer.name, book.bookname, book.price, orders.saleprice;

/*�������� �������� ���� ������ �̸�*/
SELECT DISTINCT book.bookname
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.custid !=1 AND orders.bookid=book.bookid
GROUP BY customer.name, book.bookname;

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT  name
FROM customer
WHERE name NOT IN(
    SELECT customer.name
    FROM customer,orders
    WHERE orders.custid=customer.custid); 
    
/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT SUM(price) AS �Ѿ�, AVG(PRICE) AS ���
FROM ORDERS,BOOK 
WHERE BOOK.BOOKID = ORDERS.BOOKID;

SELECT sum(orders.SALEPRICE) AS �Ѿ�, avg(orders.SALEPRICE)AS ���
FROM ORDERS;

/*���� �̸��� ���� ���ž�*/
SELECT customer.name, sum(orders.SALEPRICE)
FROM ORDERS,customer
WHERE orders.custid=customer.custid 
GROUP BY customer.name
ORDER BY name;

/*���� �̸��� ���� ������ ���� ���*/
SELECT customer.name, book.bookname
FROM ORDERS,customer,book
WHERE orders.custid=customer.custid AND book.bookid=orders.bookid GROUP BY customer.name, book.bookname ORDER BY name;

/*������ ����(Book���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
SELECT *
FROM book, ORDERS
WHERE book.BOOKID = orders.BOOKID AND book.PRICE-orders.SALEPRICE = (SELECT max(book.PRICE-orders.SALEPRICE)
                                    FROM book, ORDERS
                                    WHERE book.BOOKID = orders.BOOKID);
/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT customer.NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID GROUP BY customer.NAME HAVING avg(orders.SALEPRICE) > (SELECT avg(orders.SALEPRICE) FROM ORDERS);