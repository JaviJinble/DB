/*���缭�� ������ �Ѽ�*/
SELECT COUNT(*) AS "���� �Ѽ�"
FROM Book;

/*���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
SELECT COUNT(distinct publisher) 
FROM Book;

/*��� ���� �̸�, �ּ�*/
SELECT name,address
FROM Customer;

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE orderdate between '2020-07-04' and '2020-07-07';

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE orderdate not between '2020-07-04' and '2020-07-07';

/*���� ���衯���� ���� �̸��� �ּ�*/
SELECT name,address
from Customer
where name like '��%';

/*���� ���衯���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�*/
SELECT name,address
from Customer
where name like '��%��';
