use world;
select * from country where Name like '%Korea%';
select count(*) from city where CountryCode = (select Code from country where Name = 'South Korea');
select Name, Population from city 
where Population > (select avg(Population) from city where CountryCode = 'KOR')
order by Population desc;
select * from country where Name = 'China';
select CountryCode, count(*) from city where CountryCode in(select Code from country where Name in ('China', 'South Korea', 'Japan'))
group by CountryCode;
select Name, CountryCode, Population from city where Population > 5000000;
select Name, CountryCode, Population from city
where (Name, CountryCode) in (select Name, CountryCode from city where Population > 5000000);
select Name, CountryCode, Population from city where Population > ALL (select Population from city where CountryCode = 'KOR');

select count(*) from city where CountryCode = 'KOR';
select * from city where CountryCode = 'KOR' union select * from city where CountryCode = 'CHN';
select * from city where CountryCode = 'KOR' union all select * from city where CountryCode = 'CHN';
select count(*) from city where CountryCode = (select Code from country where Name = 'South Korea');
select Name, Population from city where Population > (select avg(Population) from city where CountryCode = 'KOR');
select Name, Population from city where Population > ALL (select Population from city where CountryCode = 'KOR');
select Name, Population from city where Population > ANY (select Population from city where CountryCode = 'KOR');
select CountryCode, count(CountryCode) from city 
where CountryCode in (select Code from country where Name in ('South Korea', 'China', 'Japan')) group by CountryCode;
select Name, CountryCode, Population from city where (Name, CountryCode) in (select Name, CountryCode from city where Population > 5000000);
select count(*) from city;
select count(*) from city where true;
select count(*) from city where false;
-- select count(*) from city where exists (select * from city where CountryCode = 'KOR'); ???
select CountryCode from city where CountryCode = 'KOR' union select CountryCode from city where CountryCode = 'CHN';
select CountryCode from city where CountryCode = 'KOR' union all select CountryCode from city where CountryCode = 'CHN';