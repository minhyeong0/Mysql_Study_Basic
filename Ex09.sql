use world;
create database sampleDB;
use sampleDB;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
insert into BusinessCard values	('Bob', 'Seocho-dong 123', '123-4567');
insert into BusinessCard values ('Sam', 'Sindang-dong 456', '321-4321');
select * from BusinessCard;
drop table BusinessCard;
drop database sampleDB;
use world;
create table BusinessCard (Name varchar(255) not null, Address varchar(255), Telephone varchar(255));
insert into BusinessCard values ('Bob', 'Seocho-dong 123', '123-4567');
insert into BusinessCard values (NULL, 'Seocho-dong 123', '123-4567');
select * from BusinessCard;
drop table BusinessCard;
create table BusinessCard (Name varchar(255) unique, Address varchar(255), Telephone varchar(255));
insert into BusinessCard values ('Bob', 'Seocho-dong 123', '123-4567');
insert into BusinessCard values ('Bob', 'Sinsa-dong 345', '321-4231');
drop table BusinessCard;
create table BusinessCard (id int not null, Name varchar(255), Address varchar(255), Telephone varchar(255), primary key(id));
insert into BusinessCard values (1, 'Bob', 'Seocho-dong 123', '123-4567');
insert into BusinessCard values (2, 'Bob', 'Sinsa-dong 345', '321-4231');
drop table BusinessCard;
create table salary
(
	id int not null,
    salary_amount_int int,
    business_card_id int not null,
    primary key(id),
    foreign key(business_card_id) references BusinessCard(id)
);
insert into BusinessCard values (1, 'Bob', 'Seocho-dong 123', '123-4567');
insert into Salary values (1, 5000, 1);
select * from BusinessCard;
select * from Salary;
drop table Salary;
drop table BusinessCard;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255), Age int, check(Age > 0));
-- insert into BusinessCard values ('Bob', 'Sinsa-dong 345', '321-4321', 0);
drop table BusinessCard;
create table BusinessCard (Name varchar(255), Address varchar(255) default 'SEOUL', Telephone varchar(255));
insert into BusinessCard (Name, Telephone) values ('Bob', '123-4567');
select * from BusinessCard;
drop table BusinessCard;
create table BusinessCard
(
	id int auto_increment, 
    Name varchar(255), 
    Address varchar(255), 
    Telephone varchar(255), 
    primary key(id)
);
insert into BusinessCard (Name, Address, Telephone) values ('Bob', 'SEOUL', '123-4567');
select * from BusinessCard;
drop table BusinessCard;
create database sampleDB;
use sampleDB;
show databases;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
insert into BusinessCard values ('Bob', 'Seoul', '123-4567');
insert into BusinessCard values ('Sample', 'Busan', '321-4567');
select * from BusinessCard;
show tables;
desc BusinessCard;
show create table BusinessCard;
drop table BusinessCard;
drop database sampleDB;
drop table BusinessCard;
create table BusinessCard (Name varchar(255) not null, Address varchar(255), Telephone varchar(255));
desc BusinessCard;
insert into BusinessCard values ('Bob', null, null);
insert into BusinessCard values (null, null, null);
drop table BusinessCard;
create table BusinessCard (Name varchar(255) unique, Address varchar(255), Telephone varchar(255));
desc BusinessCard;
insert into BusinessCard values ('Bob', null, null);
insert into BusinessCard values ('Bob', null, null);
drop table BusinessCard;
create table BusinessCard
(
	id int,
    Name varchar(255),
    Address varchar(255),
    Telephone varchar(255),
    primary key(id)
);
desc BusinessCard;
insert into BusinessCard values (1, null, null, null);
insert into BusinessCard values (null, null, null, null);
insert into BusinessCard values (1, null, null, null);
insert into BusinessCard values (2, null, null, null);
drop table BusinessCard;
create table salary
(
	id int not null,
    salary_amount int,
    business_card_id int not null,
    foreign key(business_card_id) references BusinessCard(id)
);
desc salary;
show create table salary;
insert into salary values (1, 1000, 1);
insert into salary values (2, 2000, 2);
insert into salary values (3, 3000, 3);
delete from salary where business_card_id = 2;
delete from BusinessCard where id = 2;
drop table salary;
drop table BusinessCard;
create table sample (Name varchar(255), Age int check(Age > 0));
desc sample;
show create table sample;
drop table sample;
create table BusinessCard
(
	Name varchar(255),
    Address varchar(255) default 'SEOUL'
);
desc BusinessCard;
insert into BusinessCard (Name) values ('TEST');
select * from BusinessCard;
drop table BusinessCard;
create table BusinessCard
(
	id int auto_increment,
    Name varchar(255),
    primary key(id)
);
desc BusinessCard;
insert into BusinessCard (Name) values ('Bob');
insert into BusinessCard (Name) values ('Sam');
select * from BusinessCard;
drop table BusinessCard;










