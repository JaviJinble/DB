/*���� IDȮ��*/
select SYS_CONTEXT('USERENV','SESSIONID') from dual;

/*t1Ʈ����� ����  bookid=1 ���� Ȯ��*/
set TRANSACTION name 'T1';

select * from book where bookid=1;

update Book set price=7100 where bookid=1;

select * from book where bookid=1;
commit;

