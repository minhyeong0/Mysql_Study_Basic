create database sampleDB;
use sampleDB;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
insert into BusinessCard values ('Bob', 'Seocho-dong 123', '123-4567');
insert into BusinessCard values ('Sam', 'Sindang-dong 321', '321-4321');
create index BusinessCard_Telephone_index on BusinessCard(Telephone);
drop database sampleDB;
create database sampleDB;
use sampleDB;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
truncate table BusinessCard;
insert into BusinessCard values ('Bob', 'Seoul', '123-4567');
insert into BusinessCard values ('Sam', 'Busan', '321-4567');
select * from BusinessCard;
show create table BusinessCard;
create index BusinessCard_Name_index on BusinessCard(Name);
alter table BusinessCard drop index BusinessCard_Name_index;
show create table BusinessCard;
drop database sampleDB;
show databases;
use employees;
show tables;
desc employees;
select * from employees limit 10;
select count(*) from employees;
select * from employees where emp_no = 20000;
select * from employees where last_name = 'Matzke' and first_name = 'Jenwei';
create index employees_index on employees(last_name, first_name);
select * from employees where last_name = 'Matzke' and first_name = 'Jenwei';
alter table employees drop index employees_index;
select * from employees where last_name = 'Matzke' and first_name = 'Jenwei';