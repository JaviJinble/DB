/*세션 ID확인*/
select SYS_CONTEXT('USERENV','SESSIONID') from dual;

/*t1트랜잭션 생성  bookid=1 가격 확인*/
set TRANSACTION name 'T1';

select * from book where bookid=1;

update Book set price=7100 where bookid=1;

select * from book where bookid=1;
commit;

