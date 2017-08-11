-- CREATE TABLE [테이블이름](
-- [컬럼명][데이터타입](사이즈)
-- [컬럼명][데이터타입](사이즈)
-- );

--멤버
CREATE TABLE members(
  user_id VARCHAR2(50) PRIMARY KEY,
  user_pw VARCHAR2(50) NOT NULL,
  user_rpw VARCHAR2(50) NOT NULL,
  user_name NVARCHAR2(10) NOT NULL,
  email VARCHAR2(60) NOT NULL,
  fownumber VARCHAR2(30) NOT NULL,
  backnumber VARCHAR2(30) NOT NULL,
  gender VARCHAR2(20) NOT NULL,
  birth VARCHAR2(50),
  user_power VARCHAR2(20) NOT NULL,
  user_number VARCHAR2(20) NOT NULL
);

select * from member4;
select * from sjsj2;
delete from member4 where user_id ='admin';
commit;
--//멤버
SELECT user_id FROM member4 WHERE user_name='너너' AND email='sjsj@co.kr';
--예산
CREATE TABLE budget(user_id VARCHAR2(50),
budgetmoney NUMBER(10,0),
budgetstart VARCHAR2(25),budgetend VARCHAR2(25));
INSERT INTO budget(budgetmoney,budgetstart,budgetend) VALUES(1700000,SYSDATE,SYSDATE);
INSERT INTO budget(user_id,budgetmoney,budgetstart,budgetend) VALUES('budget',1850000,sysdate,sysdate+1);
INSERT INTO sksk(user_id,budgetmoney,budgetstart,budgetend) VALUES('sksk',192000,sysdate,sysdate+1);
commit;
select * from sjsj2;
SELECT * FROM budget;
SELECT * FROM budget2;
delete from budget;
delete from sksk;
truncate table budget;
DROP TABLE budget;
FLASHBACK TABLE 테이블명 TO BEFORE DROP;
select * from(select * from budget order by budgetend desc) where rownum = 1;
select * from(select * from sksk order by budgetend desc) where rownum = 1;
select budgetmoney,budgetstart,budgetend from(select * from budget order by budgetend desc)	where rownum = 1 AND user_id ='?' ;
select * from(select * from admin order by budgetend desc) where rownum = 1;
rollback;
--//예산
--가계부
Create table cashtable(idx number(6,0) PRIMARY KEY,user_id VARCHAR2(50), reg_date VARCHAR2(25),part VARCHAR2(25),way VARCHAR2(25),kind VARCHAR2(25),content VARCHAR2(40),money NUMBER(11,0));
Create table sjsj2(idx number(6,0) PRIMARY KEY, reg_date VARCHAR2(25),part VARCHAR2(25),way VARCHAR2(25),kind VARCHAR2(25),content VARCHAR2(40),money NUMBER(11,0));
select * from admin;
select * from admin2;
drop table sjsj2;
commit;
INSERT INTO admin2(idx,reg_date,part,way,kind,content,money) VALUES(admin_seq.NEXTVAL,sysdate+1,'지출','카드','식비','김밥천국',50000);
select * from admin2 ORDER BY reg_date desc;
--시퀀스 추가 (자동증가)
CREATE SEQUENCE admin_seq;


--//가계부
--캘린더
CREATE TABLE calrendar(
  calendarno NUMBER(8,0) PRIMARY KEY,
  title VARCHAR2(50),
  startdate VARCHAR2(25),
  user_id VARCHAR2(50)
);
DROP TABLE calrendar;
select * from calrendar;
CREATE SEQUENCE seq_calrendarno;
SELECT calendarno,title,startdate FROM calrendar WHERE user_id='sjsj';

--//캘린더



-------------------------------------------과거
CREATE TABLE bbs(
  idx NUMBER(6,0) PRIMARY KEY,
  user_name VARCHAR(6) NOT NULL,
  subject VARCHAR2(50) NOT NULL,
  content VARCHAR2(400),
  reg_date DATE DEFAULT SYSDATE,
  bHit NUMBER(9,0) DEFAULT 0 
  );
select * from bbs;
CREATE TABLE moneyclip(
  idx NUMBER(6,0) PRIMARY KEY,
  reg_date DATE DEFAULT SYSDATE,
  wlcnf VARCHAR2(20),
  tneks VARCHAR2(20),
  content VARCHAR2(60),
  money NUMBER(10,0) NOT NULL
);

--시퀀스 추가 (자동증가)
CREATE SEQUENCE bbs_seq;
  
  --데이터 추가 (DEFAULT 들은 제외)
  INSERT INTO bbs(idx,user_name,subject,content)
  VALUES(bbs_seq.NEXTVAL,'admin','테스트과목2','내용없음2');
  
  --선택문
SELECT * FROM bbs;
SELECT user_name,subject,content FROM bbs;

-- 일정시간이 지나면 자동으로 commit이 됨. commit은 확정짓는 의미.
commit;

DELETE FROM bbs WHERE idx=3;
-- 내용없음3 들을 '변경된 내용' 으로 바꾸시오.
UPDATE bbs SET content ='변경된 내용' WHERE content ='내용없음3';

CREATE TABLE member(
  user_id VARCHAR2(40) PRIMARY KEY,
  user_pw VARCHAR2(100) NOT NULL,
  user_name VARCHAR(6) NOT NULL,
  email VARCHAR2(100)  
  );
  alter table member modify(user_name VARCHAR(10));
  commit;
---------------------------------------
CREATE TABLE tb_schedule(
  schedule_id int not null,
  schedule_date_time DATE DEFAULT SYSDATE,
  schedule_subject varchar2(100),
  schedule_content varchar2(600)
);
SELECT schedule_id, schedule_date_time,schedule_subject, schedule_content 
	FROM tb_schedule ORDER BY 	schedule_date_time;
insert into tb_schedule(schedule_id,schedule_subject,schedule_content) values (1,'난','널');  
drop table tb_schedule;
-----------------------------
INSERT INTO member VALUES('mvc3','mvc3','고기빈','admin@email.com');
SELECT * FROM member;
DELETE FROM member;
rollback;

