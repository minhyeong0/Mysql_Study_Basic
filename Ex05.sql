use world;
show tables;
desc city;
desc country;
select * from city join country on city.CountryCode = country.Code;
select count(*) from city where CountryCode is null;
select count(*) from city right join country on city.CountryCode = country.Code;
select count(*) from city left join country on city.CountryCode = country.Code;
select city.CountryCode as Abbr, country.Name as FullName from city join country on city.CountryCode = country.Code
where CountryCode = 'KOR';
create view sampleView as select city.CountryCode as Abbr, country.Name as FullName from city join country 
on city.CountryCode = country.Code where city.CountryCode = 'KOR';
select * from sampleView;
drop view sampleView;
select count(*) from city join country on city.CountryCode = country.Code;
select count(*) from city inner join country on city.CountryCode = country.Code;
select count(*) from city left join country on city.CountryCode = country.Code;
select count(*) from city right join country on city.CountryCode = country.Code;
select country.Name from city right join country on city.CountryCode = country.Code
where city.CountryCode is NULL;
select country.Name as Dosi from city right join country on city.CountryCode = country.Code
where city.CountryCode is NULL;
create view sampleView as select country.Name as Dosi from city right join country on city.CountryCode = country.Code
where city.CountryCode is NULL;
select count(*) from sampleView;
drop view sampleView;