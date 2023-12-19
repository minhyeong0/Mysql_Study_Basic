create database sampleDB;
use sampleDB;
create table 
	BusinessCard
(
	Name varchar(255), 
	Address varchar(255), 
	Telephone varchar(255),
    CreationTime date
) partition by range(year(CreationTime))
(
	partition p0 values less than (2013),
    partition p1 values less than maxvalue
);
show create table BusinessCard;
insert into BusinessCard values ('Bob', 'Seoul', '123-4567', '2010-01-01');
insert into BusinessCard values ('Sam', 'Busan', '321-4567', '2015-01-01');
select * from BusinessCard;
select * from BusinessCard where CreationTime > '2014-01-01';
-- update BusinessCard set CreationTime = '2016-01-01' where Name = 'Bob';