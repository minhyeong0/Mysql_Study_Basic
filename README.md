DB 안에 테이블들이 속해 있음

show databases : DB들의 리스트 표시
use world : world DB로 전환
show tables : DB의 테이블 리스트를 보여줌
desc city : city 테이블의 구조 표시

DML (데이터 조작어) : 레코드 수정
SELECT, INSERT, DELETE, UPDATE

DDL (데이터 정의어) : 테이블, DB 수정
CREATE, DROP, ALTER

DCL (데이터 제어어) : 테이블, DB 권한 정의
GRANT, REVOKE

SELECT : 테이블 레코드 검색
SELECT 칼럼명 FROM 테이블명 WHERE 조건절;

INSERT : 테이블 레코드 추가
INSERT INTO 테이블명(칼럼명) VALUES (값);

UPDATE : 테이블 레코드 수정
UPDATE 테이블명 SET 컬럼명=값, ... WHERE 조건절;

DELETE : 테이블 레코드 삭제
DELETE FROM 테이블명 WHERE 조건절;

DISTINCT 연산자 : 특정 칼럼만 출력할 경우 중복된 값 제거해줌
논리연산자 (AND, OR, NOT) : 조건절에서 논리를 적용할 수 있는 연산자

IN 연산자 : OR과 동일
BETWEEN A AND B 연산자 : A이상 B이하 값 검색할 때 쓰임

ORDER BY 컬럼명 ASC/DESC, ... : 오름차순 ASC, 내림차순 DESC

LIMIT : 결과값 일부 조회
SELECT 칼럼명 FROM 테이블명 WHERE 조건절 ORDER BY 칼럼 LIMIT 숫자

집합함수 : 테이블 전체레코드를 대상으로 특정 칼럼을 적용해서 한개의 값을 리턴하는 함수
count(), avg(), sum(), min(), max(), first(), last(), ...
SELECT 집합함수(컬럼명) FROM 테이블명 WHERE 조건절;

유용한 함수
LENGTH() : 레코드의 문자열 칼럼의 글자수를 리턴한다.
MID() : 문자열의 중간부분을 리턴한다.
UPPER()/LOWER() : 문자열을 대문자/소문자로 리턴한다.
ROUND() : 레코드의 숫자 컬럼값을 반올림해서 리턴한다.

조인 : 두 테이블에서 일치하는 칼럼을 기준으로 한 테이블 처럼 합침
SELECT * FROM 테이블1 JOIN 테이블2 ON 테이블1.칼럼명 = 테이블2.칼럼명 WHERE ...
조인시 서로 다른 테이블에 같은 칼럼명이 존재할 수 있으므로 테이블명. 컬럼명으로 표시
조인시 FROM 바로 뒤에 있는 테이블 기준으로 조인됨

조인의 종류
(INNER) JOIN : 조인시 NULL값을 허용하지 않음
LEFT JOIN : 왼쪽을 기준으로 JOIN하는 것이므로 만약 일치하는 칼럼이 없다면 왼쪽 테이블 NULL값 존재이 존재하면 안되고 오른쪽 테이블 NULL값 존재해도 됨
RIGHT JOIN : 오른쪽을 기준으로 JOIN하는 것이므로  만약 일치하는 칼럼이 없다면 오른쪽 테이블 NULL값 존재이 존재하면 안되고 왼쪽 테이블 NULL값 존재해도 됨
FULL JOIN :  만약 일치하는 칼럼이 없다면 조인시 왼쪽과 오른쪽 테이블 둘 다 NULL값이 존재해도 됨 (MYSQL 지원 X)

별칭 : 테이블 칼럼명에 별명을 붙임
SELECT 테이블1.칼럼명1 AS 별명1, 테이블 2.칼럼명2 AS 별명2 FROM ...

VIEW (임시 테이블) : SQL 쿼리의 결과값을 임시테이블로 저장, 사용용도가 끝나면 명시적으로 삭제해야함
CREATE VIEW 뷰명 AS SELECT ...
DROP VIEW 뷰명

SELECT INTO : 쿼리의 결과를 새 테이블로 만든다.
CREATE TABLE 테이블명 SELECT * FROM 테이블명
기존에 존재하지 않는 테이블이 새로 생성 됨 (일종의 뷰와 동일한 효과)

INERT INTO SELECT : 쿼리의 결과를 기존 테이블에 추가한다.
INSERT INTO 테이블명1 SELECT * FROM 테이블명2 WHERE 조건절 ...

CASE ... WHEN ... END : SQL의 조건문에 해당
조건값에 따른 처리를 할 수 있다.
CASE WHEN 조건값1 THEN ...
	WHEN 조건값2 THEN ...
	ELSE ...
END

SHOW CREATE TABLE 테이블명 : 테이블의 DDL를 알려줌

LIKE 검색 : 정확한 키워드를 모를 경우 일부만으로 검색하는 방법
SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 LIKE 패턴
와일드 카드 : % = 0~N글자, _ = 1글자
LIKE 검색은 DBMS에 부담이 크므로 OR 같은 논리 조건자를 중복해서 사용하지 않는게 좋음
EX) SELECT * FROM 테이블명 WHERE 칼럼명1 LIKE ... OR 칼럼명2 LIKE ... 

NULL값 체크
is NULL : 널값 확인 is not NULL : 널이 아닌 값 확인

NULL 함수 : 숫자컬럼을 연산해야할 때 NULL 처리 해주는 함수
IFNULL/COALESCE (MySQL), ISNULL(SQL Server), NVL(Oracle)

GROUP BY : 반드시 집합함수(avg, sum)와 같이 사용해야하고 결과값을 그룹별로 처리함 
SELECT 칼럼명, 집합함수명(칼럼명) FROM 테이블명 GROUP BY 칼럼명;

HAVING : GROUP BY즉 그룹에 대한 조건 설정하는데 쓰임
반드시 GROUP BY절 같이 사용해야하고 반드시 집합함수(avg, sum)과 같이 사용해함
WHERE은 행을 조건을 설정하고 HAVING은 그룹의 조건을 설정한다.
SELECT 칼럼명, 집합함수명(칼럼명) FROM 테이블명 WHERE 조건절 GROUP BY 칼럼명 HAVING 조건절 ORDER BY 절;

서브쿼리 : 쿼리문 안에 쿼리문이 있는 형태
()를 사용해 감싸는 형태 서브쿼리에는 ORDER BY를 사용하지 못함

서브쿼리 종류
단일행 서브쿼리 (Single Row SubQuery) : 결과가 레코드 하나인 서브쿼리
일반 연산자 (=, >, <, ...) 사용

다중행 서브쿼리 (Multi Row SubQuery) : 결과가 레코드 여러 개인 서브쿼리
다중행 연산자 (IN, ALL, ANY, EXISTS)
ALL : 여러개의 레코드의 AND 효과, 여러 레코드 전부 TRUE여야 함 
ANY : 여러개의 레코드의 OR 효과 여러 레코드 중에서 하나만 TURE여도 TRUE임
IN/EXISTS : 여러 래코드 중의 = 효과
IN은 전체 레코드를 스캔하지만 
EXISTS는 존재여부만 확인하고 스캔하지 않음(상대적으로 속도가 빠름) 존재하면 TRUE/ 존재하지 않으면 FALSE

다중컬럼 서브쿼리 (MultiColumn SubQuery) : 결과가 칼럼 여러 개인 서브쿼리

집합연산 : 합집합 (UNION), 교집합 (INTERSECT), 차집합 (MINUS)
MYSQL에서는 합집합만 지원함

UNION : 두 쿼리의 결과값을 합쳐서 리턴함
SELECT 쿼리1 UNION SELECT 쿼리2 UNION ...
두 쿼리의 결과 형식이 동일해야 함 (기본적으로 중복 제거 됨)
다른 테이블이라도 결과값 형식만 일치하면 됨

UNION ALL : 중복을 허용하는 UNION
SELECT 쿼리1 UNION ALL SELECT 쿼리2 UNION

교집합 (MYSQL 지원 안함)
SELECT 쿼리1 INTERSECT SELECT 쿼리2 UNION ...

차집합 (MYSQL 지원 안함)
SELECT 쿼리1 MINUS SELECT 쿼리2 UNION ...

스키마 : 테이블, DB의 구조와 데이터 타입을 정의 한 것
DDL(Data Definition Language) :데이터베이스와 테이블을 CRUD함, 테이블에 대한 정보는 메타 데이터로 데이터 사전에 저장, 관리 된다

데이터 베이스 생성
CREATE DATABASE 데이터베이스명

테이블 생성
CREATE TABLE 테이블명 (칼럼명1 테이터타입(크기), 컬럼명2 ...);

자료형 :정수형, 실수형, 문자열
정수형 (부호 있음/ 부호 없음)
TINYINT (-128 ~ 127 / 255), INT (-21억 ~ 21억 / 43억), BIGINT (-9경 ~ 9경 / 18경)

실수형 (길이, 소수점 이하 자리 수)
FLOAT(4byte), DOUBLE (8byte), DECIMAL(진법 저장할 때 사용)

문자열
CHAR : 고정 문자길이 문자열 (최대 255자)
VARCHAR : 가변길이 문자열 (최대 65,535자)

TEXT 문자열
TEXT (최대 65,535자), MEDIUMTEXT (최대 16,777,215자), LONGTEXT (최대 4,294,967,295자)

BLOB (Binary Large Object)
BLOB (최대 65,535), MEDIUMBLOB (최대 16,777,215자), LONGBLOB (최대 4,294,967,295자) 

시간 관련
DATE (YYYY-MM-DD)
TIME (HH:MI:SS)
DATETIME (YYYY-MM-DD HH:MI:SS)
TIMESTAMP (YYYY-MM-DD HH:MI:SS)

제약조건
NOT NULL : 데이터가 NULL 값을 받아들이지 않음
UNIQUE : 테이블에 동일한 값이 입력되었을 경우 받아들이지 않음
PRIMARY KEY : 기본키 제약조건 (UNIQUE, NOT NULL 조건)
FOREIGN KEY  : 외래키 제약조건
ex) FOREIGN KEY 새로 만든 외래키 칼럼명 REFERENCES 기본키테이블명(참조할 기본키)
CHECK : 입력값 체크 (예: Age >= 0)
DEFAULT : 칼럼값이 입력되지 않으면 기본값을 입력
AUTO_INCREMENT : 자동증가, 반드시 기본키여야함

DB 스키마 중복제거
테이블 간의 정보는 중복되지 않아야 함, 중복제거 후 필요한 정보는 외래키를 통한 조인(JOIN)을 통해 필요한 정보를 구한다
이를 위해 정규화를 통해 중복성 제거
제 1정규형, 제 2정규형 제 3정규형, ...

정규형
제 1정규형 : 나눌 수 있을 만큼 쪼개라
제 2 정규형 : 테이블의 칼럼들이 기본키와 직접 연관되는 칼럼만으로 구성해라
제 3 정규형 : 칼럼들 간의 종속관계가 있으면 안 됨

참조 무결성
외래키에 적용되는 규칙, 원래 테이블의 키와 관계를 명시함
외래키를 참조하면 원래 테이블에 레코드값이 반드시 존재해야함
만약 원래 레코드를 삭제하려면 참조되는 외래키값을 먼저 NULL로 만들어야함

스키마 수정 (DDL)
이미 생성된 스키마에 대해 수정할 경우 사용한다

테이블 컬럼 추가
ALTER TABLE 테이블명 ADD 칼럼명 테이터타입

테이블 컬럼 삭제
ALTER TABLE 테이블명 DROP COLUMN 칼럼명

테이블 컬럼 수정
ALTER TABLE 테이블명 CHANGE 칼럼명 새로운칼럼명 테이터타입 (컬럼명 수정)

ALTER TABLE 테이블명 MODIFY 컬럼명 테이터타입 (컬럼타입 수정)

기본키 제약조건 추가
ALTER TABLE 테이블명 ADD PRIMARY KEY (컬럼명)

기본키 제약조건 삭제
ALTER TABLE 테이블명 DROP PRIMARY KEY

UNIQUE 제약조건 추가
ALTER TABLE 테이블명 ADD UNIQUE (컬럼명)
ALTER TABLE 테이블명 ADD CONSTRAINT 제약명 UNIQUE (칼럼명1, 칼럼명2)

UNIQUE 제약조건 삭제
ALTER TABLE 테이블명 DROP UNIQUE 제약명

외래키 제약조건 추가
ALTER TABLE 테이블명 ADD FOREIGN KEY(컬럼명) REFERENCES 원테이블명 (원컬럼명)

외래키 제약조건 삭제
ALTER TABLE 테이블명 DROP FOREIGN KEY 칼럼명

테이블명 변경
ALTER TABLE 테이블명 RENAME 새로운테이블명

CHECK 제약조건 추가
ALTER TABLE 테이블명 ADD CHECK 조건
ALTER TABLE 테이블명 ADD CONSTRAINT 조건명 CHECK (조건절)

CHECK 제약조건 삭제
ALTER TABLE 테이블명 DROP CHECK 조건명

DEFAULT 제약조건 추가
ALTER TABLE 테이블명 ALTER 컬럼명 SET DEFAULT 기본값

DEFAULT 제약조건 삭제
ALTER TABLE 테이블명 ALTER 컬럼명 DROP DEFAULT

스키마 (DDL) 삭제
데이터베이스 삭제
DROP DATABASE 테이터베이스명

테이블 삭제
DROP TABLE 테이블명

테이블 내용만 전체삭제
TRUNCATE TABLE 테이블명

접근 설정 (DCL)
사용자 접근 권한 설정하기 위해서는 mysql 데이터베이스로 이동해서 user 테이블 권한을 설정해야함
GRANT, REVOKE


사용자 생성
create user '사용자이름'@'호스트' identified by '비밀번호';

사용자 삭제
drop user 사용자명@호스트;

반영하기
flush privileges;

사용자 권한 확인
show grants for 사용자@호스트;

로컬호스트에서 특정 DB에 접근할 수 있는 모든 권한 부여
grant all on DB명.* to 사용자@localhost identified by '비밀번호'

192.167.0을 포함하는 주소에서 모든 DB의 접근 가능한 모든 권한 부여 (% 와일드카드)
grant all on *.* to 사용자@'192.168.0.%' identified by '비밀번호'

인터넷 전체에서 특정DB에 접근할 수 있는 모든 권한 부여 (% 와일드카드)
grant all on DB명.* to 사용자@% identified by '비밀번호'

특정 사용자에게 특정 DB에 select, insert 할 수 있는 권한 부여
grant select, insert on DB명.* to 사용자@호스트 identified by '비밀번호';

특정 사용자에게 특정 DB의 테이블의 컬럼을 수정할 권한 부여
grant update(Name) on DB명.테이블명 to 사용자@호스트 identifid by '비밀번호';

특정 사용자 모든 권한 삭제
revoke all on *.* from 사용자@호스트;


역할 설정 : 사용자별로 권한을 부여해야하는 grant의 문제점을 역할별로 부여하는 방법으로 개선한 방식 (My SQL 지원안함)
역할 생성 
create role 역할명;

역할에 대해 권한 설정
grant crud on 테이블명 to 역할명

사용자에게 역할 부여
grant 역할 to 사용자명

MySQL 원격접속 설정
1. 사용자를 원격사용자로 등록
GRANT ALL PRIVILEGES ON DB명.테이블명 TO 사용자명@% IDENTIFIED BY '비밀번호';

2. my.ini 수정 (bind-address 부분 주석처리)
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure
# bind-address = 127.0.0.1

3. Mysql 재시작

4. 방화벽 3306포트 열기

인덱스
검색을 빠르게 하기 위한 자료구조 (주로 B트리 계열)
기본키는 자동으로 인덱스 설정됨
조인시에도 영향을 줌

인덱스 추가
CREATE INDEX 인덱스명 ON 테이블명(컬럼명)
CREATE INDEX 인덱스명 ON 테이블명(칼럼명1, 칼럼명2, ...) //결합 인덱스
CREATE UNIQUE INDEX 인덱스명 ON 테이블명(칼럼명) //중복이 허용되지 않는 인덱스

인덱스 삭제
ALTER TABLE 테이블명 DROP INDEX 인덱스명

메타데이터 : 데이터를 위한 테이터
DB, 테이블의 스키마에 대한 정보를 저장하는 테이블
DB명 테이블명, 컬럼명, 사용자명, SHOW 명령어의 결과값

데이터사전 : 데이터베이스의 정보저장, 시스템 카탈로그라고도 함,
일반적으로 읽기전용정보
데이터 디렉토리 : DBMS 모든 데이터가 저장되는 디렉토리(폴더), DB저장, 상태 및 로그 저장

SHOW TABLE와 비슷함
SHOW TABLE STATUS;

테이블 컬럼명 검색 desc와 비슷
SHOW COLUMNS FROM 테이블명;

테이블 인덱스 검색
SHOW INDEX FROM 테이블명;

INFORMATION_SCHEMA 테이블 리스트 보여줌
SHOW TABLES IN INFORMATION_SCHEMA;

INFORMATION_SHEMA.CHARACTER_SET 지정함
DESCRIBE INFORMATION_SHEMA.CHARACTER_SET

케릭터셋
문자인코딩 정보/ 메타데이터의 일종, DB, 테이블별로 별도 설정 가능
ASCII/IOS-8859-1 아스키계열
EUC-KR/KSC_5601 한글 완성형 계열
UTF-8/UNICODE 유니코드계열
UTF8(기본)

콜레이션
데이터를 정렬할때 사용하는 정보, 정렬시에 대소문자를 구분/비구분 여부 설정, 한글 데이터는 무의미
utf8-general-ci (기본값/추천)
utf8-unicode-ci

MySQL 기본 캐릭터셋 확인
show variables like 'character_set_system'

DB 캐릭터셋 utf8, 콜레이션 utf8_general_ci로 설정
alter database DB명 character set utf8 collate utf8_general_ci;

테이블 캐릭터셋 utf8, 콜레이션 utf8_general_ci로 설정
alter table 테이블명 character set utf8 collate utf8_general_ci;

DB 생성시 캐릭터셋 utf8, 콜레이션 utf8_general_ci로 설정
create database  DB명 default character set utf8 collate utf8_general_ci;

스토리지 엔진
CRUD 할 때 사용하는 기본 컴포넌트
대표적으로 MyISAM과 InnoDB등이 있음
데이터 접근속도/안정성/트랜잭션의 지원 여부등의 차이가 있음
기본값은 InnoDB임
InnoDB : 트랜잭션지원/업데이트 위주/줄단위락/ 동시처리성능높음
MySAM : 상대적으로 높은 성능/읽기위주/테이블단위락

MySQL 기본 스토리지 엔진 확인
SELECT engine, support FROM information_schema.engines 
where support='DEFAULT';
show engines;

기본 스트리엔진 변경
SET default_storage_engine = MyISAM; (리부팅시 리셋)
my.ini 변경 defualt-storage-engine=MySAM
윈도우경우 시스템 트레이의 MYSQL Notifier에서 Restart 선택

데이터베이스 백업 (콘솔창에서)
전체 데이터베이스 백업
mysqldump -u아이디 -p --all-databases > 덤프파일명.sql

특정 데이터베이스(DB) 백업
mysqldump -u아이디 -p --databases DB명 > 텀프파일명.sql

특정 테이블 백업(데이터 포함)
mysqldump -u아이디 -p DB명 테이블명 > 덤프파일명.sql

스키마만 백업
mysqldump -u아이디 -p --no-data ...

데이터만 백업
mysqldump -u아이디 -p --no-create-info ...

데이터베이스 백업(워크벤치)
1. DataExport -> Export Options -> Export to Self-Contained File
2. Tables to Export
3. 테이블 선택
4. Dump Structure and Data/Structure Only/Data Only
5. Export 버튼

데이터베이스 복원 (콘솔)
mysql -u아이디 -p DB명 < 파일명
mysql -u아이디 -p < 파일명
mysql -u아이디 -p DB명 테이블명 < 파일명

데이터베이스 복원 (프롬프트)
SQL > source 파일명

데이터베이스 복원 (워크벤치)
1. Data Import -> Import from Self-Contained File
2. Default Schema to be imported to DB명
3. Data Stucture and Data/Dump Data only/Dump Structure only
4. Import 버튼

데이터베이스 로그 : 데이터베이스 운영 상황을 별로의 파일에 저장
에러로그(Error Log)
Mysql 구동과 모니터링, Query 에러에 관련된 메시지를 포함

일반로그(General Log)
전체 쿼리에 대하여 General log를 활성화 시켜서 저장 가능

슬로우 쿼리 로그(Slow Query Log)
long_query_time에 설정된 시간 이상을 소요한 쿼리 기록

이진 로그(Binary Log) /릴레이 로그(Relay Log)
Mysql 쿼리를 수행하면서 쌓는 로그, 시점 복구등을 수행하는 역할
Replication(두개의 DB를 동일하게 맞춤)에서 사용
바이너리 로그(마스터)/릴레이 로그(슬레이브)에서 사용, 내용 동일

my.ini 설정
# MyISAM 로그
log-isam
# 쿼리 로그
log=c:/mysql/data/mysql.log
# 수정 로그
log-update=c:/mysql/data/mysql-update.log
# 바이너리 로그
log-bin=c:/mysql/data/mysql-bins.sql
# 슬로우 쿼리 로그
log-slow-queries=c:/mysql/data/mysql-slow.log
long_query_time = 5

데이터베이스 파티셔닝
VLDB(Very Large DBMS)
전체 DB가 하나의 DBMS 시스템에 다 들어가기 힘들어지는 경우
테이블들을 여러개의 군으로 나뉘 분산 저장 하나의 테이블이 방대한 경우에는 사전방식(a-m, n-r, s-z)와 같이 나눠 저장

파티셔닝 (Partitioning) : DBMS 레벨 분할 (DB 차원에서 지원가능)
샤딩 (Sharding) : DBMS 외부에서 분할, 응용레벨에서 구별해야함 (시스템 단위로 쪼개서 관리)

제약사항(Constraints)
테이블 단위 연산이 힘들어짐(비용문제)
조인연산 어려움 -> 정규화(Normalization)문제
역정규화(Denormalization) -> 중복허용으로 해결
외래키(FK)의 효용문제
레코드 추가 시 참조무결성 조건 체크 -> 시스템 부담증가로 수동전환
CRUD 위치를 인식해야함 (파티셔닝/샤딩이 다름)

이점(Benefits)
데이터 전체 검색시 필요한 부분만 탐색해 성능 증가
전체 데이터를 손실할 가능성이 줄어듦 -> 가용성 향상
파티션별 백업/복구 가능
파티션 단위로 I/O 분산가능 -> 업데이트 성능 증가

파티셔닝 방식
범위(range) a-m/n-r/s-z
해쉬(hash) 해시함수 파티션별로 크기를 비슷하게 나눔
리스트(list) 특정한 칼럼을 기준
컴포지트(composite) - range-hash/range-list

테이블 생성과 동시에 파티션 추가
CREATE TABLE 테이블명(칼럼명 데이터타입)
PARTITION BY 파티셔닝방식 (타입(칼럼명))
(
	PARTITION 파티션조각명1 VALUES LESS THAN(범위1),
	PARTITION 파티션조각명2 VALUES LESS THAN(범위2),
	PARTITION 파티션조각명3 VALUES LESS THAN MAXVALUE
)

파티션 추가
ALTER TABLE 테이블명 ADD PARTITION (PARTITION 파티션조각명 VALUES LESS THAN (범위));

파티션 삭제
ALTER TABLE 테이블명 DROP PARTITION 파티션 조각명;

파티션 분할
ALTER TABLE 테이블명 REORGANIZE PARTITION 파티션조각명 INTO (PARTITION 파티션조각명1 VALUES LESS THAN (범위), PARTION 파티션조각명2 VALUES LESS THAN (범위), ...);

파티션 병합
ALTER TABLE 테이블명 REORGANZIE PARTITON 파티션조각명1, 파티션조각명2 INTO (PARTITION 파티션조각명 VALUES LESS THAN (범위));

데이터베이스 복제
DBMS의 내용을 복제해 동일한 DB내용을 유지
두개 이상의 DBMS 시스템을 마스터/슬레이브로 나눠 
마스터 DBMS -> 슬레이브 DBMS로 SQL 쿼리 복제(SELECT 제외)
데이터 CUD는 마스터에서 RSMS 슬레이브에서 함
읽기 성능 향상, 웹서버 시스템 성능확장에 적합함

로그기반 복제
Statement Based
SQL문장복제, SQL에 따라 결과가 달라지는 경우(시간, UUID, ...)
데이터가 마스터와 달라질 수 있음

Row Based
SQL에 따라 변경된 라인만 기록하는 방식,데이터가 마스터와 무조건 일치함 단 데이터가 많이 변경된 경우 데이터 커짐

Mixed
두 방식 복합

Full Text Search (전문검색)
기존 SQL의 LIKE 검색은 여러개의 검색 필터를 동시에 매칭시키는 방식임 여러개의 조건문을 AND/OR시킬 경우 심각한 성능 저하 발생

LIKE 검색의 단점을 보완하기 위해 나옴

하지만 네이버, 다음 같은 포털 검색에서 '검색어' 란 단어를 통합검색하면 카페, 블로그, 이미지, 지도, 쇼핑 등을 검색
cafe like '%검색어%' or blog like '%검색어%' or image like '%검색어%' or map like '%검색어%' or shopping like '%검색어%' ...
결과는 동일하지만 DB서버에 부담을 주지 않는 방식

전문검색은 일반적인 SQL, DB 스키마, 컬럼 형태로 검색하는 것이 아닌 전체 테이블, 데이터베이스를 하나의 텍스트라고 생각하고 검색하는 방식 (데이터 베이스 스키마 무시함)

MySQL의 Full Text Search 방식
1. 자연어 검색
2. 불린 검색
3. 쿼리 확장 검색

Full Text Search 인덱스 생성
ALTER TABLE 테이블명 ADD FULLTEXT(컬럼명);

설정파일 수정
my.ini파일에서 ft_min_word_len = 2
2자 이상의 단어에 대해서 적용하도록 제한 (기본값은 4)

기존의 full text index가 있었으면 인덱스 재구성
REPAIR TABLE 테이블명 QUICK;

자연어 검색
WHERE MATCH(칼럼명) AGAINST('검색어/검색문장')
검색의 정확도 확인 AS SCORE
결과는 검색의 정확도에 대한 내림차순 정렬

불린 검색
WHERE MATCH(컬럼명) AGAINST("단어*" - '-제외단어 IN BOOLEAN MODE')
검색의 정확도에 따른 정렬이 안되고 연산자 사용한 구문 검색가능
필수단어(+), 예외단어(-), 부분단어(*)

Bulk Insert
INSERT의 경우 레코드를 추가한 후 내부적으로 인덱스 재구성(정렬 등)이 필요함
여러개의 레코드를 넣어야 하는 경우 하나의 레코드를 입력할 때마다 이 작업이 연속적으로 발생
이 문제점을 해결해 줌

인덱스 작업 정지
ALTER TABLE 테이블명 DISABLE KEYS;

인덱스 작업 재설정
ALTER TABLE 테이블명 ENABLE KEYS;

기존의 INSERT문에 VALUES를 여러번 나열한 방식
INSERT INTO 테이블명 VALUES (...) VALUES (...);

파일로 덤프
SQL을 사용한 방식, 기존의 SOURCE 명령어와 유사(백업/복원 참조)
CSV 파일을 사용한 방식
LOAD DATA INFILE 'C:\\PATH\FILE_NAME' INTO TABLE 테이블명
FIELDS TERMINATER BY '\t' ENCLOSER BY '"' ESCAPED BY '\\' LINES STARTING BY " TERMINATER BY '\n'
경로, 구분자 등을 설정

주의할 점
LOAD DATA/SELECT INTO OUTFILE의 경우 보안 문제로 특정 디렉토리에만 가능하도록 설정해야함 (secure-file-priv=path 옵션)
my.ini 설정
[mysqld]
secure-file-priv='c:\\mysql\data'

트랜잭션
복수의 SQL문을 수행하는 도중 장애가 발생했을 때 장애에 대응할 수 있도록 하는 기능

전체수행(커밋:Commit)과 전체 취소(롤백:Rollback) 두가지의 결과값만 가져야함

기본적으로 SQL의 수행모드는 AutoCommit모드 (줄단위 커밋모드)

트랜잭션을 지원하기 위해서는 AutoCommit모드를 오프시켜야함

InnoDB 스토리지 엔진만 가능함

ACID 특성
원자성 (Atomicity)
All-or-Nothing, Commit/Rollback

일관성 (Consistency)
트랜잭션 전후에 데이터가 손상을 받으면 안됨
같은 데이터가 다른 값을 가지면 안됨

고립성/격리수준 (Isolation)
여러개의 트랜잭션이 수행될 때 성능과 데이터 안정성 간의 trade-off

지속성 (Durability)
트랜잭션이 종료된 이후에도 데이터에 문제가 없어야 됨 (장시간)

트랜잭션 기본설정 확인
select @@autocommit; (1 = true, 0 false)

AutoCommit 설정 끄기 (줄단위 커밋모드 취소)
set autocommit = false;

트랜잭션 커밋/롤백하기
commit; or rollback;

락 (Lock)
공유자원(리소스)에 대해 여러개의 트랜잭션이 접근하려고 경쟁하려고 할 때 제어하는 방법

동시성제어(Concurrency Control)라고 하고 보통 Lock으로 해결

프로그래밍에서는 동기화(Synchronization)이라고 함

일관성(Consistency)과 무결성(Integrity)을 지키기 위해서 적용

Lock Granularity
테이블 단위 락(Table Lock)
동일한 테이블을 다른 트랜잭션이 사용하고 있다면 접근 금지 (MyISAM)

줄단위 락(Row Lock)
동일한 줄(Row)만 접근금지 (테이블 락에 비해 높은 성능 InnoDB)

기본 스토리지엔진 확인
select engine, support from information_schema.engines where support='DEFAULT'

기본 스토리지 엔진 변경하기
set default_storage_engine=InnoDB;
set default_storage_engine=MyISAM;

city 테이블 스토리지엔진 확인
select engine from information_schema.TABLES where table_name = 'city' and table_schema = 'world';

city 테이블 스토리지 엔진 변경하기
alter table 'city' engine = InnoDB; (주의)

격리 (Isolation)
트랜잭션 격리 수준
1. Read Uncommitted
트랜잭션이 처리되는 도중에 다른 트랜잭션이 해당 데이터를 읽기를 허용 (uncommitted data)
성능은 높지만 데이터의 안정성이 떨어짐

2. Read Committed
트랜잭션이 끝난 이후에만 접근하도록 허용 (committed data)

3. Repeatable Read
다른 트랜잭션이 업데이트하는 것은 금지하지만 레코드 추가하는 것은 허용하는 방식

4. Serializable
트랜잭션이 동시에 수행되는 것이 금지되고 순차적으로 수행됨

기본 트랙잭션 격리수준 확인
select @@tx_isolation;

기본 트랜잭션 격리 수준 변경
set tx_isolation = 'READ-COMMITED';

저장 프로시저 (Static SQL)
SQL을 함수 형태로 저장하고 사용하는 방법 (리턴값 없음)

저장 프로시저 정의
DELIMITER //
CREATE PROCEDURE 프로지저명(인자 인자형, ...)
BEGIN
	SQL 문장들
END
//
DELIMITER ; <= DELIMITER은 구분기호를 바꾸는 함수다
저장 프로시저 호출
CALL 프로시저명;

저장 프로시저 삭제
DROP PROCECURE 프로시저명;

저장 함수 (Stored Function)
SQL을 함수 형태로 저장하고 사용하는 방법 (리턴값 있음)

함수 정의
DELIMITER //
CREATE FUNCTION 함수명(인자 인자형, ...) RETURNS 타입
BEGIN
	SQL문장들
END
//
DELIMITER ; <= DELIMITER은 구분기호를 바꾸는 함수다
함수 호출
함수명(인자);

함수 삭제
DROP FUNCTION 함수명;

트리거 (Trigger)
특정한 조건이 되면 자동으로 호출(Callback)되는 저장 프로시저
ex) 레코드가 삭제되면 자동으로 참조무결성을 체크하는 트리거

트리거 정의
CREATE TRIGGER 트리거명 BEFORE(또는 AFTER) CRUD ON 테이블명  FOR EACH ROW
BEGIN
	변경전(OLD.칼럼명) 또는 변경 후 (NEW.칼럼명)을 이용한 처리
END

저장 프로시저 삭제
DROP PROCEDURE 트리거명
