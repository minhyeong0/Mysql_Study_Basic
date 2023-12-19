-- 데이터 베이스 백업 콘솔창에서 실행
-- mysqldump -uroot -p --all-databases > dump_all.sql;
-- mysqldump -uroot -p --databases world > world.sql;
-- mysqldump -uroot -p world city > city.sql;
-- mysqldump -uroot -p --no-data world country > country_schema.sql;
-- mysqldump -uroot -p --no-create-info world country > country_data.sql;
-- 데이터베이스 백업 콘솔창에서 실행

-- 데이터베이스 복원 콘솔창에서 실행
-- drop table city;
-- mysql -uroot -p world city < city.sql;
-- truncate table country;
-- mysql -uroot -p world country < country_data.sql;
-- drop database world;
-- mysql -uroot -p world < world.sql;
-- 데이터베이스 복원 콘솔창에서 실행

show variables like '%dir';