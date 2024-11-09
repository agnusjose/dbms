create table emp_details(empid int unique,empname varchar(20),salary int);

create or replace trigger Trigger2
after insert or update on emp_details
for each row 
when (new.salary>20000)
begin
dbms_output.put_line('Salary is greater 20000');
end;
/

insert into emp_details values(1,'Maneesha',300);

insert into emp_details values(2,'Kridhna',24000);

select * from emp_details;
