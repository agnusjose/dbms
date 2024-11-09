create table bankk(bankcode varchar(3) primary key,bankname 
varchar(30) not null,headoffice varchar(20),branches int check(branches>0));
table BANKK created.
insert into bankk values('SBI',null,'Ernakulam',46);
/*Error report:
SQL Error: ORA-01400: cannot insert NULL into ("C22CSA05"."BANKK"."BANKNAME")
01400. 00000 -  "cannot insert NULL into (%s)"*/
insert into bankk values('SBI','State Bank Of India','Ernakulam',46);
insert into bankk values('SBT','State Bank Of Travancore','Trivandrum',-2);
/*Error report:
SQL Error: ORA-02290: check constraint (C22CSA05.SYS_C0067008) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check           
*Action:   do not insert values that violate the constraint.*/
insert into bankk values('SBT','State Bank Of Travancore','Trivandrum',29);
insert into bankk values('YES','Youth Enterprise Scheme Bank','Kottayam',53);
insert into bankk values('BOB','Bank Of Baroda','Trivandrum',17);
insert into bankk values('ABL','Axis Bank Limited','Ernakulam',39);
select * from bankk;
create table branch(branchid int primary key,branchname 
varchar(20) default 'New Delhi',bankid varchar(3),foreign key(bankid) 
references bankk(bankcode) on delete cascade);
insert into branch values(1,'Kottayam','SBT');
insert into branch (branchid,bankid) values(2,'YES');
insert into branch values(3,'Pala','SBI');
insert into branch values(4,'Ranni','BOB');
insert into branch values(5,'Mukkam','YES');
delete from bankk where bankcode='SBT';
select * from bankk;
select * from branch;
alter table branch drop primary key;
desc branch;
create view Bank_Headoffice as (select * from bankk where headoffice='Ernakulam');
select * from Bank_Headoffice;
insert into branch values(6,'Kottayam','YES');
select * from branch;
create view bank_branch as(select b.* from bankk b join branch c on b.bankcode
=c.bankid where branchname='Kottayam');
select * from bank_branch;