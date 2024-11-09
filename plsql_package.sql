set serveroutput on;

create or replace package pk1 as
procedure proc1(a int,b int);
procedure proc2(c int);
function f1(d int) return varchar;
function f2(a int,b int,c int) return int;
end pk1;

create or replace package body pk1 as

procedure proc1(a int,b int) is
begin
dbms_output.put_line('sum:'||(a+b));
dbms_output.put_line('average:'||(a+b)/2);
dbms_output.put_line('product:'||(a*b));
end proc1;

procedure proc2(c int) is
begin
dbms_output.put_line('square root is:'||sqrt(c));
end proc2;

function f1(d int) return varchar is
begin
if(mod(d,2)=0) then
return 'even';
else
return 'odd';
end if;
end f1;

function f2(a int,b int,c int) return int is e int;
begin
e:=a+b+c;
return e;
end f2;

end pk1;

declare
p int;
q int;
r int;
s int;
result varchar2(4);
sum1 int;
begin
p:=&p;
q:=&q;
r:=&r;
s:=&s;
pk1.proc1(p,q);
pk1.proc2(r);
result:=pk1.f1(s);
dbms_output.put_line('the given number is:'||result);
sum1:=pk1.f2(p,q,s);
dbms_output.put_line('sum of three nos:'||sum1);
end;
