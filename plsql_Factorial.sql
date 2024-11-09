declare
f number:=1;
n number:=&n;
begin
while n>0
loop
f:=f*n;
n:=n-1;
end loop;
dbms_output.put_line('Factorial is'||f);
end;
