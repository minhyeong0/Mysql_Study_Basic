show variables like 'secure%';
use world;
select name, code from country;
SELECT name, code INTO OUTFILE 'F:\\Programs\\MySQL\\uploads\\country.csv' FIELDS TERMINATED BY ',' FROM country;
-- sql문을 csv로 추출
create table sample_country (name varchar(255), code varchar(255));
desc sample_country;
LOAD DATA INFILE 'F:\\Programs\\MySQL\\uploads\\country.csv' INTO TABLE sample_country FIELDS TERMINATED BY ',';
-- csv파일 임포트
select * from sample_country limit 10;
show tables;
drop table sample_country;
drop table city_new;