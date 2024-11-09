create table cust_count(count_row int);

insert into cust_count values(0);

create or replace trigger Trigger3
before insert or delete on customer_details
for each row 
begin
if deleting then update cust_count set count_row=count_row-1;
else update cust_count set count_row=count_row+1;
end if;
end;
/

insert into customer_details values(4,'Suneesh','Suneesh villa');
select * from cust_count;
 
insert into customer_details values(5,'Alan','Alan villa');
select * from cust_count;
 
select * from customer_details;
 
delete from customer_details where custid=4;
 
select * from cust_count;