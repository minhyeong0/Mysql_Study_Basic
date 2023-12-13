create table city_new select * from city where countryCode = 'KOR';
select * from city_new;
drop table city_new;
show create table city;
CREATE TABLE `city_kor` (
   `ID` int NOT NULL AUTO_INCREMENT,
   `Name` char(35) NOT NULL DEFAULT '',
   `CountryCode` char(3) NOT NULL DEFAULT '',
   `District` char(20) NOT NULL DEFAULT '',
   `Population` int NOT NULL DEFAULT '0',
   PRIMARY KEY (`ID`)
 );
 insert into city_kor select * from city where countryCode = 'KOR';
 select * from city_kor;
 drop table city_kor;
 select 
	case
		when length(Name) > 3 then upper(mid(name, 1, 3))
		when length(Name) <= 3 then upper(Name)
	end,
Population from city;
create table city_new select * from city where CountryCode = 'KOR';
select * from city_new;
desc city;
desc city_new;
show create table city;
insert into city_new select * from city where CountryCode = 'CHN';
select count(*) from city_new;
insert into city_new select * from city where CountryCode = 'JPN';
select count(*) from city_new;
select distinct CountryCode from city_new;
select Name, Population from city limit 10;
select upper(mid(Name, 1, 3)), Population from city limit 10;
select
	case
		when length(Name) > 3 then upper(mid(Name, 1, 3))
        when length(Name) <= 3 then upper(Name)
	end
, population from city limit 10;
select count(*) from city where length(Name) <= 3;
select Name from city where length(Name) <= 3;
desc city;
select
	Name, Population,
	case
		when Population <= 100000 then "Level 0"
		when Population <= 1000000 then "Level 1"
        when Population <= 10000000 then "Level 2"
        else "Level 3"
	end as city_level
from city order by Population desc;
select
	Name, Population,
	case
		when Population <= 100000 then "Level 0"
		when Population <= 1000000 then "Level 1"
        when Population <= 10000000 then "Level 2"
        else "Level 3"
	end as city_level
from city order by Population;
