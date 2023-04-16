/*[극장 데이터베이스] 다은은 네 개의 지점을 둔 극장 데이터베이스이다. 밑줄 친 속성은 기본키이다.
테이블의 구조를 만들고 데이터를 입력한 후 다음 질의에 대한 SQL문을 작성하시오. 테이블의 구조를
만들  다음 제약조건을 반영하여 작성한다.*/

/*제약조건
영화 가격은 20,000원을 넘지 않아야 한다.
상영관번호는 1부터 10사이이다.
같은 사람이 같은 좌석번호를 두 번 예약하지 않아야 한다*/

/*극장 테이블 생성*/
rollback;
CREATE TABLE Theater (
 theaterid INTEGER PRIMARY KEY,
 Theatername VARCHAR(20),
 location VARCHAR(20)
);

/*고객 테이블 생성*/
CREATE TABLE client (
 clientid INTEGER PRIMARY KEY,
 clientname VARCHAR(20),
 address VARCHAR(20)
);

/*상영관 테이블 생성*/
CREATE TABLE cinema (
 theaterid INTEGER NOT NULL,
 cinemaid INTEGER PRIMARY KEY check(cinemaid<=10 and cinemaid>=1),
 cinemaname VARCHAR(20),
 price INTEGER check(price<=20000),
 seat INTEGER,
 FOREIGN KEY (theaterid)
 REFERENCES theater (theaterid)
);

/*예약 테이블 생성*/
CREATE TABLE Reservation (
 theaterid INTEGER NOT NULL,
 cinemaid INTEGER NOT NULL check(cinemaid<=10 and cinemaid>=1),
 clientid INTEGER NOT NULL,
 seatnum INTEGER,
 date DATE,
 FOREIGN KEY (theaterid)
 REFERENCES theater (theaterid),
 FOREIGN KEY (cinemaid)
 REFERENCES cinema (cinemaid),
 FOREIGN KEY (clientid)
 REFERENCES client (clientid)
);

/*극장 데이터*/
insert into theater(theaterid, theatername, location) 
	values(1,"롯데", "잠실");
insert into theater(theaterid, theatername, location)
	values(2,"메가", "강남");
insert into theater(theaterid, theatername, location)
	values(3,"대한", "잠실");
 
/*상영관 테이블 데이터*/
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(1, 1, "어려운 영화", 15000, 48);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 3, "멋진 영화", 7500, 120);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 2, "재밌는 영화", 8000, 110);
 
/*고객 테이블 데이터 생성*/
insert into client(clientid, clientname, address)
	values(3,"홍길동","강남");
insert into client(clientid, clientname, address)
	values(4,"김철수","잠실");
insert into client(clientid, clientname, address)
	values(9,"박영희","강남");
 
/*예약 테이블 데이터 생성*/
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,2,3,15,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,3,4,16,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(1,1,9,48,"2020-09-01");
 
---(1) 단순질의
/*1. 모든 극장의 이름과 위치를 보이시오.*/
SELECT Theatername, location 
FROM Theater;

/*2. '잠실'에 있는 극장을 보이시오.*/
SELECT * 
FROM Theater 
WHERE location = '잠실';

/*3. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
SELECT clientname 
FROM client 
WHERE address = '잠실';

/*4. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
SELECT theaterid, cinemaid, cinemaname 
FROM cinema
WHERE price <= 8000;

/*5. 극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
SELECT DISTINCT Theater.location, client .clientname
FROM Theater, client  
WHERE theater.location = client.address;

---(2) 집계질의
/*1. 극장의 수는 몇 개인가?*/
SELECT COUNT(*) FROM theater;

/*2. 상영되는 영화의 평균 가격은 얼마인가?*/
SELECT ROUND(AVG(price)) FROM cinema;

/*3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
SELECT COUNT(*) FROM Reservation, client 
WHERE Reservation.clientid = client.clientid AND date = '2020-09-01';

---(3) 부속질의와 조인
/*1. '대한' 극장에서 상영된 영화제목을 보이시오.*/
SELECT cinemaname FROM theater, cinema WHERE theater.theaterName = '대한' AND theater.theaterid = cinema.theaterid;

/*2. '대한' 극장에서 영화를 본 고객의 이름을 보이시오.*/
SELECT clientname FROM client WHERE clientid IN (SELECT clientid FROM reservation WHERE theaterid = (SELECT theaterid FROM theater WHERE theaterName = '대한'));
 
/*3. 대한 극장의 전체 수입을 보이시오.*/
SELECT SUM(price) FROM cinema WHERE cinemaid IN (SELECT cinemaid FROM reservation WHERE theaterid = (SELECT theaterid FROM theater WHERE theaterName = '대한'));
 
---(4) 그룹질의 
/*1. 극장별 상영관 수를 보이시오.*/
SELECT theater.theatername, COUNT(cinemaid) FROM theater,cinema where theater.theaterid = cinema.theaterid group by theatername;

/*2. '잠실'에 있는 극장의 상영관을 보이시오.*/
SELECT * FROM cinema WHERE theaterid IN (SELECT theaterid FROM theater WHERE Location = '잠실');

/*3. 2020년09월01일의 극장별 평균 관람 고객 수를 보이시오.*/
SELECT theater.theatername, COUNT(*) FROM reservation JOIN theater ON reservation.theaterid = theater.theaterid WHERE reservation.date = '2020-09-01' GROUP BY reservation.theaterid;

/*4. 2020년09월01일에 가장 많은 고객이 관람한 영화를 보이시오.*/
SELECT cinemaName FROM cinema, reservation WHERE cinema.theaterid = reservation.theaterid AND cinema.cinemaid = reservation.cinemaid AND date LIKE '2020-09-01' GROUP BY reservation.theaterid , reservation.cinemaid; 

---(5)DML
/*각 테이블에 데이터를 삽입하는 INSERT 문을 하나씩 실행시켜 보시오.*/
/*극장 데이터*/
insert into theater(theaterid, theatername, location) 
	values(1,"롯데", "잠실");
insert into theater(theaterid, theatername, location)
	values(2,"메가", "강남");
insert into theater(theaterid, theatername, location)
	values(3,"대한", "잠실");
 
/*상영관 테이블 데이터*/
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(1, 1, "어려운 영화", 15000, 48);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 3, "멋진 영화", 7500, 120);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 2, "재밌는 영화", 8000, 110);
 
/*고객 테이블 데이터 생성*/
insert into client(clientid, clientname, address)
	values(3,"홍길동","강남");
insert into client(clientid, clientname, address)
	values(4,"김철수","잠실");
insert into client(clientid, clientname, address)
	values(9,"박영희","강남");
 
/*예약 테이블 데이터 생성*/
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,2,3,15,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,3,4,16,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(1,1,9,48,"2020-09-01");

/*영화의 가격을 10%씩 인상하시오.*/
UPDATE cinema SET price = price + (price * 0.1);
