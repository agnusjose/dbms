create table bank(bank_id int primary key,bank_name varchar(20),head_office varchar(20),branch varchar(10),branch_code varchar(10));

insert into bank values(1,'State Bank','Mumbai','SN Street',2314);
insert into bank values(2,'South Indian Bank','Chennai','EK Street',4358);
insert into bank values(3,'Bank of Baroda','Delhi','JN Street',4713);
insert into bank values(4,'Union Bank','Mumbai','SN Street',1387);
insert into bank values(5,'ICIC Bank','Mumbai','MN Street',6498);
select * from bank;

commit;
savepoint A;
delete from bank where bank_id=3;
select * from bank;
rollback to savepoint A;
select * from bank;
