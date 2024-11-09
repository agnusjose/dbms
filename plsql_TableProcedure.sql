create table student_details(rollno int primary key,marks int,phone int);
insert into student_details values(1,36,7485634097);
insert into student_details values(2,42,9485634098);
insert into student_details values(3,23,8485634090);
insert into student_details values(4,35,6485634099);
insert into student_details values(5,19,7485634095);
select * from student_details;

create or replace procedure pro1 as
begin
update student_details set marks=marks+(marks*0.05);
end;
/

begin
pro1;
end;
/

select * from student_details;