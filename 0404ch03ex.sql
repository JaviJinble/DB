/*1번 문제*/
/*박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

select count(distinct publisher)
from customer, orders, book
where customer.custid=orders.custid and orders.bookid=book.bookid and customer.name like '박지성';


/*박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
SELECT customer.name,book.bookname,book.price,orders.saleprice  ,SUM(book.price-orders.saleprice) AS 차이
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.name LIKE'%박지성%' AND orders.bookid=book.bookid
GROUP BY book.publisher, customer.name, book.bookname, book.price, orders.saleprice;

select bookname, price, price-saleprice
from customer, orders, book
where customer.custid=orders.custid and orders.bookid=book.bookid and customer.name like '박지성';

/*박지성이 구매하지 않은 도서의 이름*/
SELECT DISTINCT book.bookname
FROM customer,orders,book
WHERE customer.custid=orders.custid AND customer.custid !=1 AND orders.bookid=book.bookid
GROUP BY customer.name, book.bookname;

select bookname
from customer, orders
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '박지성';
/*existis*/    
select bookname
from book
where not exists (
        select bookname
        from customer, orders
        where customer.custid=orders.custid 
           and orders.bookid=book.bookid 
           and customer.name like '박지성');
    
/*2번 문제*/
/*주문하지 않은 고객의 이름(부속질의 사용)*/
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
    
/*주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(price) AS 총액, AVG(PRICE) AS 평균
FROM ORDERS,BOOK 
WHERE BOOK.BOOKID = ORDERS.BOOKID;

SELECT sum(orders.SALEPRICE) AS 총액, avg(orders.SALEPRICE)AS 평균
FROM ORDERS;

select sum(saleprice), avg(saleprice)
from orders;

/*고객의 이름과 고객별 구매액*/
SELECT customer.name, sum(orders.SALEPRICE)
FROM ORDERS,customer
WHERE orders.custid=customer.custid 
GROUP BY customer.name
ORDER BY name;

select name, sum(saleprice) as total
from customer, orders
where customer.custid=orders.custid
group by name;

/*고객의 이름과 고객이 구매한 도서 목록*/
SELECT customer.name, book.bookname
FROM ORDERS,customer,book
WHERE orders.custid=customer.custid AND book.bookid=orders.bookid GROUP BY customer.name, book.bookname ORDER BY name;

select name, book.bookname
from orders, customer, book
where customer.custid=orders.custid 
    and book.bookid=orders.bookid;

/*도서의 가격(Book테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
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

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT customer.NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID GROUP BY customer.NAME HAVING avg(orders.SALEPRICE) > (SELECT avg(orders.SALEPRICE) FROM ORDERS);

select name, avg(saleprice)
from customer, orders
where customer.custid=orders.custid 
group by name 
having avg(saleprice) > (select avg(saleprice) from orders); 
