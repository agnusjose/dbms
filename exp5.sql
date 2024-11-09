create table employee(emp_id number(3) primary key,emp_name varchar(50),dept varchar(20),salary number(10));

insert into employee values(1,'David Smith','HR',7000);
insert into employee values(2,'Arif','Marketing',9000);
insert into employee values(3,'Charles Brown','Sales',4000);
insert into employee values(4,'Anita','Production',8000);
insert into employee values(5,'Omar','Marketing',3000);
insert into employee values(7,'Daisy','HR',6000);
insert into employee values(8,'Christina','Production',9500);
select * from employee;

select * from employee where salary>7000;

update employee set salary=8200 where emp_name='David Smith';
select * from employee;

insert into employee values(6,'Daniel Harrris','Production',6700);
select * from employee;

delete from employee where emp_id=3;
select * from employee;

select * from employee where emp_name not like 'D%' and emp_name not like'O%';

select dept,sum(salary) from employee group by dept;

update employee set salary=(salary+(5/100)*(salary)) where dept='Production';
select * from employee;

delete from employee where salary<7000;
select * from employee;

select emp_name,salary from employee where salary=(select min(salary) from employee);

update employee set salary=8200 where dept='Marketing';
select * from employee;

select emp_name from employee where emp_name like 'A%';

select emp_name from employee where emp_name like '%it%';

select distinct (upper(dept)) from employee;

select * from employee where dept like 'M%' and dept like '__r%' and dept like '%ket%';

select distinct reverse((upper(dept))) from employee;