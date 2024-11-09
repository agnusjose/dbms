create table author(author_id number(3),name varchar(25),email varchar(15),phone_no number(15),status varchar(15),primary key(author_id));

create table publisher(publisher_id number(3),name varchar(20),address varchar(50),primary key(publisher_id));

create table member(member_id number(5),name varchar(20),branch_code number(10),roll_no number(5),phone_no number(15),email_id varchar(20),date_of_join varchar(10),status varchar(15),primary key(member_id));

create table language(language_id number(5),name varchar(20),primary key(language_id));

create table book(book_id number(5),title varchar(30),language_id number(5),mrp number(8),publisher_id number(3),published_date varchar(10),volume number(3),status varchar(15),primary key(book_id),foreign key(language_id) references language(language_id),foreign key(publisher_id) references publisher(publisher_id));

create table book_author(book_id number(5),author_id number(3),foreign key(book_id) references book(book_id),foreign key(author_id) references author(author_id),primary key(book_id,author_id));

create table book_issue(issue_id number(5),date_of_issue varchar(15),book_id number(5),member_id number(5),expected_date_of_return varchar(15),foreign key(book_id) references book(book_id),foreign key(member_id) references member(member_id));

create table book_return(issue_id number(5),actual_date_of_return varchar(15),late_days number(4),late_fee number(5),primary key(issue_id),foreign key(issue_id) references book_return(issue_id));

create table late_fee_rule(from_days number(2),to_days number(4),amount number(8),primary key(to_days,from_days));

alter table book add(number_of_pages number(3));
alter table member modify (branch_code varchar(6));
desc member;

insert into language values(01,'English');
insert into language values(02,'Malayalam');
insert into language values(03,'Hindi');
select * from language;

insert into publisher values(01,'DC books','Trivandrum');
insert into publisher values(02,'MP books','Kollam');
insert into publisher values(03,'TK books','Kottayam');
SELECT * FROM publisher;

insert into book values(01,'NoteBook',01,120,02,'20-04-2001',1,'active',160);
insert into book values(02,'Aadujeevitham',02,140,03,'11-06-2015',1,'active',180);
insert into book values(03,'Textbook',03,90,01,'01-08-2020',2,'active',90);
select * from book;

insert into member values(1,'Advait','C05',4,9876098346,'advait@gmail.com','21-06-2020','active');
insert into member values(2,'Ria','C11',36,9676808340,'ria@gmail.com','19-07-2019','in-active');
insert into member values(3,'Chris','A05',4,7876058341,'chris@gmail.com','01-11-2021','active');
select * from member;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME ='PUBLISHER';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME ='BOOK';
ALTER TABLE BOOK DISABLE CONSTRAINT SYS_C0059446;
TRUNCATE TABLE PUBLISHER;
Select * from publisher;

insert into author values(1,'Benchamin','benc@gmail.com',7364920451,'active');
insert into author values(2,'Benyamin','beny@gmail.com',9364520453,'active');
insert into author values(3,'Tom','tom@gmail.com',7335920443,'in-active');
select * from author;

insert into book_author values(1,2);
insert into book_author values(2,3);
insert into book_author values(3,1);\
select * from book_author;

drop table author;
select * from author;

insert into late_fee_rule values('0','15',20); 
insert into late_fee_rule values('15','30',50);
insert into late_fee_rule values('30','100',100); 
select * from late_fee_rule;

alter table late_fee_rule rename to fine;
select * from fine;