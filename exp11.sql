create table bank(bank_id int primary key,bank_name varchar(20),head_office varchar(20),branch varchar(10),branch_code varchar(10));

insert into bank values(1,'State Bank','Mumbai','SN Street',2314);
insert into bank values(2,'South Indian Bank','Chennai','EK Street',4358);
insert into bank values(3,'Bank of Baroda','Delhi','JN Street',4713);
insert into bank values(4,'Union Bank','Mumbai','SN Street',1387);
insert into bank values(5,'ICIC Bank','Mumbai','MN Street',6498);
select * from bank;

grant select on bank to c22csa08;
revoke select on bank from c22csa08;
select * from c22csa08.bank;
update c22csa08.bank set branch='ernakulam' where bankid=30;
select * from c22csa08.bank;
grant update on bank to c22csa08;
select * from bank;
revoke update on bank from c22csa08;
 