Create Table Bank_Details(Accno Int Primary Key,Cname Varchar(30),Balance Int,Adate Date);
Insert Into Bank_Details Values(1001,'aby',3005,'10-oct-15'); 
Insert Into Bank_Details Values(1002,'alan',4000,'05-may-95'); 
Insert Into Bank_Details Values(1003,'amal',5000,'16-mar-92');
Insert Into Bank_Details Values(1004,'jeffin',3500,'01-apr-50'); 
Select * From Bank_Details;

Create Table Bank_New(Accno Int,Interest Int);

Declare Cursor Temp Is 
Select Accno,CName,Balance,Adate From Bank_Details; 
tempvar temp %rowtype;
intr int;
BEGIN
open temp;
loop
Fetch Temp Into Tempvar;
exit when temp%notfound;
Intr:=.08*Tempvar.Balance;
Insert Into Bank_New Values(Tempvar.Accno,Intr); 
End Loop; 
Close Temp; 
End;

Select * From Bank_New;

Create Table Student_Exp16(Sid Int Primary Key,Sname Varchar(30),M1 Int,M2 Int,M3 Int,Grade Varchar(5));
desc student_Exp16;

Insert Into Student_Exp16 (Sid,Sname,M1,M2,M3) values(1,'Bob',49,42,45);
Insert Into Student_Exp16 (Sid,Sname,M1,M2,M3) values(2,'Aby',34,28,30);
Insert Into Student_Exp16 (Sid,Sname,M1,M2,M3) values(3,'Maria',19,7,30);
Insert Into Student_Exp16 (Sid,Sname,M1,M2,M3) values(4,'Miya',40,49,45);
Insert Into Student_Exp16 (Sid,Sname,M1,M2,M3) values(5,'Neeraj',49,39,40);
Select * From Student_Exp16;

Declare Cursor Temp Is
Select Sid,SName,M1,M2,M3,Grade From Student_Exp16;
Tempvar Temp %Rowtype;
total int;
grades varchar(5);
Begin
OPEN temp;
LOOP
Fetch Temp Into Tempvar;
Exit When Temp%Notfound;
Total:=tempvar.M1 + tempvar.M2 + tempvar.M3;
if total>130 then
grades:='A';
elsif total>125 then
grades:='B';
elsif total>115 then
grades:='C';
elsif total>90 then
grades:='D';
elsif total>70 then
grades:='E';
else
grades:='F';
END if;
update Student_Exp16 set grade=grades where Sid=tempvar.Sid;
END LOOP;
CLOSE temp;
END;

select * from student_exp16;

Create table people_list (id varchar(5) primary key,name varchar(30),dt_joining date,place varchar(30));
desc people_list;

insert into people_list values('P01','Aravind Swami','01-oct-2010','Mumbai');
insert into people_list values('P54','Anamika K','01-may-2022','Chennai');
insert into people_list values('P43','Charlie William','12-Dec-2000','New York');
insert into people_list values('P55','Rose Mary','01-oct-2016','Sydney');
insert into people_list values('P21','Anu M','01-oct-2008','Bengaluru');
select * from people_list;

Create table exp_list(id varchar(5) primary key,name varchar(30),experience int);
desc Exp_list;

Declare Cursor Temp Is
Select id,name,dt_joining,place from people_list;
Tempvar Temp %Rowtype;
year_of_experience int;
Begin
OPEN temp;
LOOP
Fetch Temp Into Tempvar;
Exit When Temp%Notfound;
year_of_experience:=(SYSDATE-tempvar.dt_joining)/365;
if year_of_experience >10 THEN
insert into exp_list values(tempvar.id,tempvar.name,year_of_experience);
END if;
END LOOP;
END;

select * from exp_list;

Create table Employee_list(id varchar(5) primary key,name varchar(30),monthly_salary number(10));
desc Employee_list;

insert into Employee_list values('EM12','David Smith',4600);
insert into Employee_list values('EM45','Olivia Woods',10000);
insert into Employee_list values('EM16','Arohi Varma',25000);
insert into Employee_list values('EM34','Charles Brown',50000);
insert into Employee_list values('EM02','Divina Miller',100000);
select * from Employee_list;

Declare Cursor Temp Is
Select id,name,monthly_salary from Employee_list;
tempvar temp %rowtype;
annual_salary int;
BEGIN
OPEN temp;
LOOP
Fetch Temp Into Tempvar;
exit when temp%notfound;
annual_salary:=tempvar.monthly_salary*12;
if annual_salary < 60000 THEN 
    UPDATE Employee_list SET monthly_salary=tempvar.monthly_salary+tempvar.monthly_salary*0.25 where id=tempvar.id;
elsif annual_salary > 60000 AND annual_salary < 200000 THEN 
    UPDATE Employee_list SET monthly_salary=tempvar.monthly_salary+tempvar.monthly_salary*0.20 where id=tempvar.id;
elsif annual_salary > 200000 AND annual_salary < 500000 THEN 
    UPDATE Employee_list SET monthly_salary=tempvar.monthly_salary+tempvar.monthly_salary*0.15 where id=tempvar.id;
elsif annual_salary > 500000 THEN 
    UPDATE Employee_list SET monthly_salary=tempvar.monthly_salary+tempvar.monthly_salary*0.10 where id=tempvar.id;
END if;
END LOOP;
CLOSE Temp;
END;

select * from Employee_list;

