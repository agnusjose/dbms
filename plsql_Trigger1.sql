create table customer_details(custid int unique,custname varchar(20),address varchar(20));

create trigger Trigger1
after insert on customer_details
for each row 
begin
dbms_output.put_line('The row is inserted');
end;
/

insert into customer_details values(3,'Advait','Arjit villa');