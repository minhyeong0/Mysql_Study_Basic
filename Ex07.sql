select CountryCode from city where CountryCode like 'k%';
select CountryCode from city where CountryCode like '%k';
select CountryCode from city where CountryCode like '%k%';
select CountryCode from city where CountryCode like 'K__';
select count(*) from country where LifeExpectancy is null;
select count(*) from country where LifeExpectancy is not null;
select avg(LifeExpectancy) from country;
select avg(ifnull(LifeExpectancy, 0)) from country;
select count(LifeExpectancy) from country;
select count(ifnull(LifeExpectancy, 0)) from country;
desc city;
select CountryCode, count(CountryCode) from city group by CountryCode;
select CountryCode, sum(Population) from city group by CountryCode;
-- 각 그룹별 국가코드의 합을 리턴한다.
select CountryCode, count(CountryCode) from city group by CountryCode having count(CountryCode) >= 70;
select count(*) from city where CountryCode like 'K%';
select count(*) from city where CountryCode like '%K';
select count(*) from city where CountryCode like '%K%';
select count(*) from city where CountryCode like 'K_';
select count(*) from city where CountryCode like 'K__';
select count(*) from city where CountryCode like 'K___';
select count(*) from city where CountryCode like '___';
select Name from country where LifeExpectancy is NULL;
select count(Name) from country where LifeExpectancy is not NULL;
select avg(LifeExpectancy) from country;
select avg(ifnull(LifeExpectancy, 0)) from country;
select count(*) from city where CountryCode = 'KOR';
select CountryCode, count(CountryCode) from city group by CountryCode;
select CountryCode, count(CountryCode) from city group by CountryCode having 
