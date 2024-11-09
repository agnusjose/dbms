Create Table Insert_Deleted_Row(Empid Varchar(5) Unique,Empname Varchar(30),Salary Int);

create table insert_updated_row(Empid Varchar(5) Unique,Empname Varchar(30),Salary Int);

Create Or Replace Trigger Trigger4
After Delete or update On Emp_Details
For Each Row
Begin
If Deleting Then Insert Into Insert_Deleted_Row Values(:old.Empid,:old.Empname,:old.Salary);
else  insert into insert_updated_row values (:old.empid,:new.empname,:old.salary);
end if;
End;
/

Select * From Emp_Details;
 
delete from Emp_Details where empid=1;

Select * From Insert_Deleted_Row;
 
update Emp_Details set empname='Leyla M' where Empid=2;
 
Select * From insert_updated_row;