/*[���� �����ͺ��̽�] ������ �� ���� ������ �� ���� �����ͺ��̽��̴�. ���� ģ �Ӽ��� �⺻Ű�̴�.
���̺��� ������ ����� �����͸� �Է��� �� ���� ���ǿ� ���� SQL���� �ۼ��Ͻÿ�. ���̺��� ������
���� �� ���� ���������� �ݿ��Ͽ� �ۼ��Ѵ�.*/

/*��������
��ȭ ������ 20,000���� ���� �ʾƾ� �Ѵ�.
�󿵰���ȣ�� 1���� 10�����̴�.
���� ����� ���� �¼���ȣ�� �� �� �������� �ʾƾ� �Ѵ�*/

/*���� ���̺� ����*/
rollback;
CREATE TABLE Theater (
 theaterid INTEGER PRIMARY KEY,
 Theatername VARCHAR(20),
 location VARCHAR(20)
);

/*�� ���̺� ����*/
CREATE TABLE client (
 clientid INTEGER PRIMARY KEY,
 clientname VARCHAR(20),
 address VARCHAR(20)
);

/*�󿵰� ���̺� ����*/
CREATE TABLE cinema (
 theaterid INTEGER NOT NULL,
 cinemaid INTEGER PRIMARY KEY check(cinemaid<=10 and cinemaid>=1),
 cinemaname VARCHAR(20),
 price INTEGER check(price<=20000),
 seat INTEGER,
 FOREIGN KEY (theaterid)
 REFERENCES theater (theaterid)
);

/*���� ���̺� ����*/
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

/*���� ������*/
insert into theater(theaterid, theatername, location) 
	values(1,"�Ե�", "���");
insert into theater(theaterid, theatername, location)
	values(2,"�ް�", "����");
insert into theater(theaterid, theatername, location)
	values(3,"����", "���");
 
/*�󿵰� ���̺� ������*/
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(1, 1, "����� ��ȭ", 15000, 48);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 3, "���� ��ȭ", 7500, 120);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 2, "��մ� ��ȭ", 8000, 110);
 
/*�� ���̺� ������ ����*/
insert into client(clientid, clientname, address)
	values(3,"ȫ�浿","����");
insert into client(clientid, clientname, address)
	values(4,"��ö��","���");
insert into client(clientid, clientname, address)
	values(9,"�ڿ���","����");
 
/*���� ���̺� ������ ����*/
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,2,3,15,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,3,4,16,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(1,1,9,48,"2020-09-01");
 
---(1) �ܼ�����
/*1. ��� ������ �̸��� ��ġ�� ���̽ÿ�.*/
SELECT Theatername, location 
FROM Theater;

/*2. '���'�� �ִ� ������ ���̽ÿ�.*/
SELECT * 
FROM Theater 
WHERE location = '���';

/*3. '���'�� ��� ���� �̸��� ������������ ���̽ÿ�.*/
SELECT clientname 
FROM client 
WHERE address = '���';

/*4. ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.*/
SELECT theaterid, cinemaid, cinemaname 
FROM cinema
WHERE price <= 8000;

/*5. ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.*/
SELECT DISTINCT Theater.location, client .clientname
FROM Theater, client  
WHERE theater.location = client.address;

---(2) ��������
/*1. ������ ���� �� ���ΰ�?*/
SELECT COUNT(*) FROM theater;

/*2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?*/
SELECT ROUND(AVG(price)) FROM cinema;

/*3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?*/
SELECT COUNT(*) FROM Reservation, client 
WHERE Reservation.clientid = client.clientid AND date = '2020-09-01';

---(3) �μ����ǿ� ����
/*1. '����' ���忡�� �󿵵� ��ȭ������ ���̽ÿ�.*/
SELECT cinemaname FROM theater, cinema WHERE theater.theaterName = '����' AND theater.theaterid = cinema.theaterid;

/*2. '����' ���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.*/
SELECT clientname FROM client WHERE clientid IN (SELECT clientid FROM reservation WHERE theaterid = (SELECT theaterid FROM theater WHERE theaterName = '����'));
 
/*3. ���� ������ ��ü ������ ���̽ÿ�.*/
SELECT SUM(price) FROM cinema WHERE cinemaid IN (SELECT cinemaid FROM reservation WHERE theaterid = (SELECT theaterid FROM theater WHERE theaterName = '����'));
 
---(4) �׷����� 
/*1. ���庰 �󿵰� ���� ���̽ÿ�.*/
SELECT theater.theatername, COUNT(cinemaid) FROM theater,cinema where theater.theaterid = cinema.theaterid group by theatername;

/*2. '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
SELECT * FROM cinema WHERE theaterid IN (SELECT theaterid FROM theater WHERE Location = '���');

/*3. 2020��09��01���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/
SELECT theater.theatername, COUNT(*) FROM reservation JOIN theater ON reservation.theaterid = theater.theaterid WHERE reservation.date = '2020-09-01' GROUP BY reservation.theaterid;

/*4. 2020��09��01�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.*/
SELECT cinemaName FROM cinema, reservation WHERE cinema.theaterid = reservation.theaterid AND cinema.cinemaid = reservation.cinemaid AND date LIKE '2020-09-01' GROUP BY reservation.theaterid , reservation.cinemaid; 

---(5)DML
/*�� ���̺� �����͸� �����ϴ� INSERT ���� �ϳ��� ������� ���ÿ�.*/
/*���� ������*/
insert into theater(theaterid, theatername, location) 
	values(1,"�Ե�", "���");
insert into theater(theaterid, theatername, location)
	values(2,"�ް�", "����");
insert into theater(theaterid, theatername, location)
	values(3,"����", "���");
 
/*�󿵰� ���̺� ������*/
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(1, 1, "����� ��ȭ", 15000, 48);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 3, "���� ��ȭ", 7500, 120);
insert into cinema(theaterid, cinemaid, cinemaname, price, seat)
	values(3, 2, "��մ� ��ȭ", 8000, 110);
 
/*�� ���̺� ������ ����*/
insert into client(clientid, clientname, address)
	values(3,"ȫ�浿","����");
insert into client(clientid, clientname, address)
	values(4,"��ö��","���");
insert into client(clientid, clientname, address)
	values(9,"�ڿ���","����");
 
/*���� ���̺� ������ ����*/
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,2,3,15,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(3,3,4,16,"2020-09-01");
insert into Reservation(theaterid, cinemaid, clientid, seatnum, date)
	values(1,1,9,48,"2020-09-01");

/*��ȭ�� ������ 10%�� �λ��Ͻÿ�.*/
UPDATE cinema SET price = price + (price * 0.1);
