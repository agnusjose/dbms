declare
n1 number:=&n1;
n2 number:=&n2;
n3 number:=&n3;
begin
if n1>n2 and n1>n3 then
dbms_output.put_line('Greatest number is'||n1);
elsif n2>n1 and n2>n3 then
dbms_output.put_line('Greatest number is'||n2);
else
dbms_output.put_line('Greatest number is'||n3);
end if;
 end; 
