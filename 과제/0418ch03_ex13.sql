CREATE TABLE department(
 depno INTEGER PRIMARY KEY NOT NULL,
 deptname VARCHAR(20),
 manager VARCHAR(20)
);

insert into department values(1,'IT', '고남순');
insert into department values(2,'Marketing', '홍길동');

select * from department;

CREATE TABLE employee(
 empno INTEGER PRIMARY KEY NOT NULL,
 name VARCHAR(20),
 phoneno INTEGER,
 address VARCHAR(20),
 sex VARCHAR(20),
 position VARCHAR(20),
 deptno INTEGER,
 FOREIGN KEY (deptno)
 REFERENCES department(deptno)
);

insert into employee values(1, '김덕성', 01012341232, '서울','여','Programmer',1);
insert into employee values(2, '이서울', 01012323122, '서울','남','Programmer',1);
insert into employee values(3, '박연세', 01076851231, '대전','여','Salesperson',2);
insert into employee values(4, '홍길동', 01012341546, '서울','남','Manager',2);
insert into employee values(5, '고남순', 01012311112, '서울','여','Manager',1);

select * from employee;

CREATE TABLE project(
 projno INTEGER PRIMARY KEY NOT NULL,
 projname VARCHAR(20),
 deptno INTEGER,
 FOREIGN KEY (deptno)
 REFERENCES department(deptno)
);

insert into project values(1,'데이터베이스',1);
insert into project values(2,'시장조사',2);

select * from project;

CREATE TABLE works(
 projno INTEGER PRIMARY KEY NOT NULL,
 empno INTEGER PRIMARY KEY NOT NULL,
 hoursworked VARCHAR(20),
 FOREIGN KEY (projno)
 REFERENCES Project(projno),
 FOREIGN KEY (empno)
 REFERENCES Employee(empno)
);

insert into project values(1, 1, 3);
insert into project values(1, 2, 1);
insert into project values(2, 3, 1);
insert into project values(2, 4, 5);
insert into project values(1, 5, 1);

select * from works;

