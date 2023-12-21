use world;
DELIMITER //
create procedure insertLines()
begin
	insert into city values (10000, 'Sample', 'KOR', 'Test', 1000000);
	insert into city values (20000, 'SampleTest', 'KOR', 'Test', 2000000);
end
//
DELIMITER ;
call insertLines;
select * from city where id in (10000, 20000);
delete from city where id in (10000, 20000);
create database sampleDB;
use sampleDB;
create table BusinessCard(Name varchar(255), Address varchar(255), Telephone varchar(255));
DELIMITER //
create procedure insertBusinessCard()
begin
	insert into BusinessCard values ('Bob','Seoul','123-4567');
	insert into BusinessCard values ('Sam','Busan','321-4567');
end
//
DELIMITER ;
call insertBusinessCard;
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
create function countLines() returns integer
begin
	declare line_count integer;
    select count(*) into line_count from BusinessCard;
    return line_count;
end
//
DELIMITER ;
select countLines() from BusinessCard;
create table BusinessCard2 (Name varchar(255), Address varchar(255), Telephone varchar(255));
DELIMITER $
create trigger insertBusinessCard2 after insert on BusinessCard
	for each row
begin
	insert into BusinessCard2 values ('zzz', 'zzzz', '000-0000');
end
$
DELIMITER ;
insert into BusinessCard values ('Sam', 'Sindang-dong 456','321-4321');
select * from BusinessCard;
select * from BusinessCard2;
drop database SampleDB;
create database SampleDB;
use world;
delimiter //
create procedure insert_lines()
begin
	insert into city values (10000, 'Sample', 'KOR', 'Test', 1000000);
	insert into city values (20000, 'SampleTest', 'KOR', 'Test', 2000000);
end
//
delimiter ;
call insert_lines();
select * from city where id in (10000, 20000);
delete from city where id in (10000, 20000);
use sampleDB;
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
insert into BusinessCard values ('Bob','Seoul','123-4567');
insert into BusinessCard values ('Sam','Busan','321-4567');
delimiter //
create function CountLines() returns integer
begin
	declare line_count integer;
    select count(*) into line_count from BusinessCard;
    return line_count;
end
//
delimiter ;
select CountLines() from dual;
truncate table BusinessCard;
select CountLines() from dual;
create table BusinessCard2 (Name varchar(255), Address varchar(255), Telephone varchar(255));
delimiter $
create trigger insertBusinessCard2 after insert on BusinessCard
	for each row
begin
	insert into BusinessCard2 values('zzz','zzzz','00000');
end$
delimiter ;
insert into BusinessCard values ('Bob','Seoul','123-4567');
insert into BusinessCard values ('Bob2','Seoul','123-4567');
select * from BusinessCard2;