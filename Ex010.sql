use world;
show create table city;
show create table country;
insert into country (Name, Code) values ('ZZZ', 'ZZZ');
insert into city (Name, CountryCode) values ('YYY', 'ZZZ');
insert into city (Name, CountryCode) values ('MMM', 'TTT');
delete from city where CountryCode = 'ZZZ';
delete from country where Code = 'ZZZ';