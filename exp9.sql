create table items(itemid int primary key,itemname varchar(50),category int,price int,instock int check(instock>=0));

create table customers(custid int primary key,custname varchar(30),address varchar(50),state varchar(20));

create table orderss(orderid int primary key,itemid int,custid int,quantity int,orderdate date,foreign key(itemid) references items(itemid),foreign key(custid) references customers(custid));

create table delivery(deliveryid int primary key,custid int,orderid int,foreign key(custid) references customers(custid),foreign key(orderid) references orderss(orderid));

insert into items values(1,'IPad',2,7000,3);
insert into items values(2,'Samsung M 14',5,3000,6);
insert into items values(3,'Motorola',2,2000,4);
insert into items values(4,'Samsung hd tv',4,9000,0);
insert into items values(5,'Whirlpool WAshing Machine',4,8000,3);
insert into items values(6,'Impex stabilizer',7,1000,12);
select * from items;

insert into customers values(11,'Hari','Hari Villa','Kerala');
insert into customers values(12,'Jenny','Jenny Villa','Karnataka');
insert into customers values(13,'Micky','Micky Nivas','Kerala');
insert into customers values(14,'Jordan','Jordan Villa','Kerala');
insert into customers values(15,'Sandra','Sandra Bhavan','Karnataka');
select * from customers;

insert into orderss values(21,3,12,2,'21-01-2013');
insert into orderss values(22,3,14,4,'21-01-2014');
insert into orderss values(23,2,12,3,'16-07-2012');
insert into orderss values(24,4,12,2,'11-12-2010');
insert into orderss values(25,3,13,4,'26-03-2019');
select * from orderss;

insert into delivery values(31,12,23);
insert into delivery values(32,14,22);
insert into delivery values(33,12,21);
select * from delivery;

select distinct c.custid,c.custname,o.orderid,o.quantity,o.orderdate from customers c join orderss o on c.custid=o.custid;
select distinct c.custid,c.custname,c.address,c.state,d.deliveryid from customers c join delivery d on c.custid=d.custid;
select c.custname,o.orderdate from orderss o join customers c  on c.custid=o.custid where custname like 'J%';
select i.itemname, i.price from items i join orderss o on i.itemid = o.itemid join customers c on o.custid = c.custid where c.custname = 'Micky';
select distinct c.* from customers c join orderss o on c.custid = o.custid left join delivery d on o.orderid = d.orderid where o.orderdate > to_date('2013-01-31', 'YYYY-MM-DD') and d.deliveryid is null;
select distinct i.itemid from items i JOIN Orderss o ON i.itemid = o.Itemid union select distinct i.itemid from items i left join orderss o on i.itemid = o.itemid left join delivery d on o.orderid = d.orderid where d.deliveryid is null;
select distinct i.itemid from items i JOIN Orderss o ON i.itemid = o.Itemid union select distinct i.itemid from items i left join orderss o on i.itemid = o.itemid left join delivery d on o.orderid = d.orderid where d.deliveryid is null;
select distinct c.custname from customers c JOIN Orderss o ON c.custid = o.custid minus select distinct c.custname from customers c join orderss o on c.custid = o.custid join delivery d on o.orderid = d.orderid;
select c.custname from customers c join orderss o on c.custid = o.custid group by c.custname ORDER BY COUNT(o.orderid) DESC fetch first 1 row only;
select distinct c.* from customers c join orderss o on c.custid = o.custid JOIN Items i ON o.Itemid = i.itemid where i.price > 5000; 
select distinct c.custname, c.address from customers c left join orderss o on c.custid = o.custid left join items i on o.itemid = i.itemid and i.itemname = 'Samsung Galaxy S4' where i.itemname is null;
/*Left join:*/
select c.*, o.* from customers c left join orderss o on c.custid = o.custid;
/*Right join:-*/
select c.*, o.* from customers c right join orderss o on c.custid = o.custid;
select state, count(*) as NumberOfCustomers from customers group by state;
select category, itemid, itemname, price, instock from items where price > (select avg(price) from items) group by category, itemid, itemname, price, instock;
