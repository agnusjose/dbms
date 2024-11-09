create table student_exp7_csa_05(roll_no number(2) primary key,name varchar(10),physics number(2),chemistry number(2),mathematics number(2));

insert into student_exp7_csa_05 values(1,'Adithyan',19,13,50);
insert into student_exp7_csa_05 values(2,'Alan',21,23,48);
insert into student_exp7_csa_05 values(3,'Akhil',10,15,39);
insert into student_exp7_csa_05 values(4,'Aparna',16,9,46);
insert into student_exp7_csa_05 values(5,'Biniya',23,21,36);
insert into student_exp7_csa_05 values(6,'Charlie',8,6,34);
insert into student_exp7_csa_05 values(7,'Dayana',14,21,43);
insert into student_exp7_csa_05 values(8,'Ginny',24,25,49);
insert into student_exp7_csa_05 values(9,'Helen',10,13,40);
insert into student_exp7_csa_05 values(10,'Salvatore',21,23,41);
select * from student_exp7_csa_05;

select avg(physics) from student_exp7_csa_05;
select max(mathematics) as highest_marks_maths from student_exp7_csa_05;
select min(chemistry) as lowest_marks_chemistry from student_exp7_csa_05;
select count(physics) from student_exp7_csa_05 where physics>=12;
select count(name) from student_exp7_csa_05 where physics>=12 and chemistry>=12 and mathematics>=25;

alter table student_exp7_csa_05 add total_marks int;
update student_exp7_csa_05 set total_marks=chemistry+mathematics+physics;
alter table student_exp7_csa_05 add result varchar(1);
update student_exp7_csa_05 set result='p' where physics>=12 and chemistry>=12 and mathematics>=25;
update student_exp7_csa_05 set result='f' where physics<12 or chemistry<12 or mathematics<25;
select * from student_exp7_csa_05;

select count(name)*10 as pass_percent_maths from student_exp7_csa_05 where mathematics>=25;
select count(name)*10 as pass_percent from student_exp7_csa_05 where result='p';
select avg(total_marks) as class_average from student_exp7_csa_05;
select count(name) as passed_students from student_exp7_csa_05 where result='p';
