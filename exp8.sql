create table customer(customer_id int primary key,customer_name varchar(20),contact_number int,address varchar(20),city varchar(10),postal_code int,country varchar(10));

create table Employe(employee_id int primary key,last_name varchar(10),first_name varchar(10),birth_date date);

create table orders(order_id int primary key,customer_id int,employee_id int,order_date date,shipper_id int,foreign key(customer_id) references customer(customer_id),foreign key(employee_id) references employe(employee_id));

insert into customer values(1,'Edward',87690645,'Edward Villa','Chicago',1423,'USA');
insert into customer values(2,'Dumbledore',96690647,'Dumble Villa','London',6429,'Europe');
insert into customer values(3,'Harmione',77090644,'Harward Villa','Prague',6420,'Europe');
insert into customer values(4,'Elena',97690674,'Mystic House','Chicago',6929,'USA');
insert into customer values(5,'Matt',65690665,'Donovan Villa','Chicago',1826,'USA');

insert into employe values(11,'Jenner','Kendall','25-06-1984');
insert into employe values(12,'Francis','Mia','14-11-1976');
insert into employe values(13,'Mendes','Shawn','05-09-1974');
insert into employe values(14,'Rodrigo','Olivia','30-03-1994');
insert into employe values(15,'Styles','Harry','17-08-1989');

insert into orders values(6,2,13,'12-06-2005',32);
insert into orders values(7,5,11,'04-09-2010',53);
insert into orders values(8,2,11,'03-01-2006',34);
insert into orders values(9,3,12,'16-05-2005',31);
insert into orders values(10,1,15,'25-11-2007',42);

select * from customer;
select * from orders;
select * from employe;

select * from customer order by customer_name;
select * from orders order by order_date;
select * from employe where birth_date>'31-12-1980' order by birth_date desc;
select * from orders where customer_id in (select customer_id from customer where country='USA') order by order_date desc;
select customer_id,count(order_id) from orders group by customer_id;
select city,count(customer_id) from customer group by city;
select customer_id,count(*) from orders group by customer_id having count(*)>=2;
select country,count(*)from customer group by country having count(*)>=3;
