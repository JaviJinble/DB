/*���� IDȮ��*/
select SYS_CONTEXT('USERENV','SESSIONID') from dual;

/*t2Ʈ����� ����  bookid=1 ���� Ȯ��*/
set TRANSACTION name 'T2';

select * from book where bookid=1;

update book set price=price+100 where bookid=1;

select * from book where bookid=1;
commit;