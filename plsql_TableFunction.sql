select * from customers;

create or replace function totalcustomers
return number is
   total number(2) := 0;
begin
   select count(*) into total
   from customers;
   return total;
end;
/

declare 
   c number(2); 
begin 
   c := totalcustomers(); 
   dbms_output.put_line('total no. of customers: ' || c); 
end; 
/
