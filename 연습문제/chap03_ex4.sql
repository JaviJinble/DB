/*���ο� ����('����������', ���ѹ̵��', 1000��)�� ���缭���� �԰�Ǿ���. 
������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�. (���Ἲ ��������)*/
select * from book;

insert into book(bookid, bookname, publisher, price)
values(11, '����������', '���ѹ̵��', 1000);

/*'�Ｚ��'���� ������ ������ �����Ͻÿ�.*/
delete from book
where bookid=9;

/*'�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.((����)�ܷ�Ű ������������)*/

/*���ǻ�'���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�*/
update book
set publisher=(select publisher
             from book
             where publisher='�������ǻ�')
where publisher='���ѹ̵��';

rollback;
/*(���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺� Bookcompany(name, address, begin)�� �����ϰ��� �Ѵ�.
name�� �⺻Ű�̸� varchar(20), address�� varchar(20), begin�� DATE Ÿ������ �����Ͽ� �����Ͻÿ�.*/
create table Bookcompany (
name varchar(20) PRIMARY key,
address varchar(20),
begin DATE);

select * from bookcompany;
/*(���̺� ����) Bookcompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ��� varchar(30)���� �߰��Ͻÿ�.*/
alter table bookcompany add webaddress varchar(30);

/*Bookcompany ���̺� ������ ���� name=�Ѻ���ī����, address=����� ������, 
begin=1993-01-01, webaddress=http://hanbit.co.kr�� �����Ͻÿ�.*/
insert into Bookcompany(name, address, begin, webaddress)
values('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');

