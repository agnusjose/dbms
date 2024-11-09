declare
a number:=1;
b number:=1;
c number;
limit number:=&limit;
begin
dbms_output.put_line(a);
dbms_output.put_line(b);
while limit>0
loop
c:=a+b;
dbms_output.put_line(c);
a:=b;
b:=c;
limit:=limit-1;
end loop;
end;
