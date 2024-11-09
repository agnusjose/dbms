declare
n1 number:=&n1;
n2 number:=&n2;
cal varchar2(1):='&cal';
cc number;
begin
if cal='+' then
cc:=n1+n2;
dbms_output.put_line(n1||cal||n2||'='||cc);
elsif cal='-' then
cc:=n1-n2;
dbms_output.put_line(n1||cal||n2||'='||cc);
elsif cal='*' then
cc:=n1*n2;
dbms_output.put_line(n1||cal||n2||'='||cc);
elsif cal='/' then
if n2=0 then
dbms_output.put_line('ERROR:Divisor is zero');
else
cc:=n1/n2;
dbms_output.put_line(n1||cal||n2||'='||cc);
end if;
else 
dbms_output.put_line('ERROR');
end if;
end;
