/*고객이 주문한 도서의 판매가격과 고객의 이름*/
select name, saleprice
from Customer, Orders
where Customer.custid=Orders.custid;

/*외부조인으로 도서를 구매하지 않은 고객을 포함 시킴*/
select name, saleprice
from Customer left outer join Orders on Customer.custid=Orders.custid;

/*왼쪽외부조인(+)*/
select Customer.name, saleprice
from Customer, orders
where customer.custid=orders.custid(+);

/*가장 비싼 도서의 가격 표시*/
select max(price)
from book;

/*가장 비싼 도서의 이름*/
select bookname
from book
where price=35000;

/*가장 비싼 도서의 이름*/
select bookname
from book
where price=(select max(price) from book);

/*주문한 고객의 고객번호를 찾기*/
select custid
from orders;

/*고객 아이디에 해당하는 고객 이름 찾기*/
select name
from customer
where custid in (1, 2, 3, 4);

/*도서를 구매한 적이 있는 고객의 이름을 검색하시오.*/
select name
from customer
where custid in (select custid from orders);

/*상관 부속질의 > 출판사별 출판사의 평균보다 비싼도서*/
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                from book b2
                where b2.publisher=b1.publisher);
                
/*도서를 주문하지 않은 고객의 이름을 보이시오*/
select name
from customer;

select name
from customer
where custid in (select custid from orders);

/*도서를 주문하지 않은 고객의 이름을 보이시오*/
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

/*주문이 있는 고객의 이름과 주소를 보이시오.*/
select name, address
from customer cs
where exists (select *
              from orders od
              where cs.custid=od.custid);
              
              