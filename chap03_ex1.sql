/*������ȣ�� 1�� ������ �̸�*/
SELECT bookname
FROM book
WHERE bookid = 1;

/*������ 20000�� �̻��� ������ �̸�*/
SELECT   bookname
FROM     book
WHERE    price >= 20000;

/*"�������� �ѱ��ž�1"*/
SELECT SUM(saleprice)
FROM Otders
WHERE custid=1;

/*"�������� �ѱ��ž�2"*/
SELECT SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ������ ��*/
SELECT COUNT(*)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ���ǻ��� ��*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';


