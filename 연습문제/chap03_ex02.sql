/*마당서점 도서의 총수*/
SELECT COUNT(*) AS "도서 총수"
FROM Book;

/*마당서점에 도서를 출고하는 출판사의 총수*/
SELECT COUNT(distinct publisher) 
FROM Book;

/*모든 고객의 이름, 주소*/
SELECT name,address
FROM Customer;

/*2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호*/
SELECT orderid
FROM Orders
WHERE orderdate between '2020-07-04' and '2020-07-07';

/*2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
SELECT orderid
FROM Orders
WHERE orderdate not between '2020-07-04' and '2020-07-07';

/*성이 ‘김’씨인 고객의 이름과 주소*/
SELECT name,address
from Customer
where name like '김%';

/*성이 ‘김’씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소*/
SELECT name,address
from Customer
where name like '김%아';
