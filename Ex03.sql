use world;
select * from city where CountryCode = 'KOR' and Population >= 1000000;
select * from city where CountryCode = 'KOR' or CountryCode = 'CHN' or CountryCode = 'JPN';
select * from city where CountryCode != 'KOR' and Population >= 1000000;
select * from city where CountryCode in ('KOR', 'CHN', 'JPN');
select * from city where CountryCode = 'KOR' and Population between 1000000 and 5000000;
select * from city where CountryCode = 'KOR' order by Population desc;
select CountryCode, Population from city order by CountryCode, Population desc;
select distinct Name from city where CountryCode = 'KOR';
select distinct CountryCode from city where CountryCode = 'KOR';
select * from city where CountryCode = 'KOR' and Population >= 5000000;
select * from city where CountryCode = 'KOR' or CountryCode = 'CHN' or CountryCode = 'JPN';
select * from city where CountryCode in ('KOR', 'CHN', 'JPN');
select * from city where CountryCode = 'KOR' and Population >= 1000000 and Population <= 5000000;
select * from city where CountryCode = 'KOR' and Population between 1000000 and 5000000;
select * from city where CountryCode in ('KOR', 'CHN', 'JPN') and
Population between 1000000 and 5000000 order by CountryCode, Population desc;