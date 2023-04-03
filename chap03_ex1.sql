/*도서번호가 1인 도서의 이름*/
SELECT bookname
FROM book
WHERE bookid = 1;

/*가격이 20000원 이상인 도서의 이름*/
SELECT   bookname
FROM     book
WHERE    price >= 20000;

/*"박지성의 총구매액1"*/
SELECT SUM(saleprice)
FROM Otders
WHERE custid=1;

/*"박지성의 총구매액2"*/
SELECT SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*박지성이 구매한 도서의 수*/
SELECT COUNT(*)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*박지성이 구매한 출판사의 수*/
SELECT COUNT(publisher)
FROM Book, Customer, Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';


