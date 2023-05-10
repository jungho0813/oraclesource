-- javadb

-- userTBL 테이블 생성
-- no(번호-숫자(4)), username(이름-한글(4)), birthYear(년도-숫자(4)), addr(주소-문자(한글,숫자)), mobile(010-1234-1234)
-- no pk 제약조건 지정(제약조건명 pk_userTBL)

create table userTBL(
    no number(4) CONSTRAINT pk_userTBL PRIMARY KEY,
    username NVARCHAR2(10) not null,  -- varchar2(20)
    birthYear number(4) not null,
    addr nvarchar2(50) not null,      -- varchar2(50)
    mobile nvarchar2(20));            -- varchar2(20)

drop table userTBL;

-- select(+서브쿼리,조인) + DML(insert,delete,update)



-- 시퀀스 생성
-- user_seq 생성(기본)

create sequence user_seq;


-- insert
-- no : user_seq 값 넣기
INSERT INTO userTBL(no, username, birthYear, addr, mobile)
VALUES(user_seq.NEXTVAL, '홍길동', 2010, '서울시 종로구 123', '010-1234-5678');

commit;

-- 모든 컬럼 not null

-- paytype : pay_no(숫자-1 pk), info(문자-card, cash)
-- paytype_seq 생성

CREATE TABLE paytype(
    pay_no number(1) PRIMARY KEY,
    info varchar2(20) not null);

CREATE SEQUENCE paytype_seq;

INSERT INTO paytype values(paytype_seq.NEXTVAL, 'card');
INSERT INTO paytype values(paytype_seq.NEXTVAL, 'cash');

SELECT * FROM paytype; -- 1 : card, 2 : cash

-- suser : user_id(숫자-4 pk) , name(문자-한글), pay_no(숫자-1 : paytype 테이블에 있는 pay_no 참조 해서 사용)
CREATE TABLE suser(
    user_id number(4) PRIMARY KEY,
    name varchar2(20) NOT NULL,
    pay_no number(1) NOT NULL references paytype(pay_no));
    
select * from suser;

-- product
-- product_id(숫자-8 pk), pname(문자), price(숫자), content(문자)
CREATE TABLE product(
    product_id number(8) PRIMARY KEY,
    pname varchar2(30) NOT NULL,
    price number(8) NOT NULL,
    content varchar2(50) NOT NULL);
    
CREATE SEQUENCE product_seq;

-- sorder
-- order_id(숫자-8 pk), user_id(user 테이블의 user_id 참조), product_id(product 테이블의 product_id 참조)
-- order_seq 생성

CREATE TABLE sorder(
    order_id number(8) PRIMARY KEY,
    user_id number(4) NOT NULL REFERENCES suser(user_id),
    product_id number(8) NOT NULL REFERENCES product(product_id)
);

CREATE SEQUENCE order_seq;

-- user_id, name, pay_no, info 조회
-- suser와 paytype join

SELECT u.user_id, u.name, u.pay_no, p.info
FROM suser u, paytype p
WHERE u.pay_no = p.pay_no AND u.user_id=1000;

-- 주문정보 전체 조회
SELECT * FROM sorder;

-- 주문목록 조회
-- user_id, name, card/cash, product_id, pname, price, content

-- 기준 : sorder
-- suser 테이블 : name,
-- paytype 테이블 : card/cash
-- product 테이블 : product_id, pname, price, content

-- 전체 주문목록
SELECT s.user_id, u.name, t.info, s.product_id, p.pname, p.price, p.content, s.order_date
FROM sorder s, suser u, paytype t, product p
WHERE s.user_id = u.user_id AND u.pay_no = t.pay_no AND s.product_id = p.product_id;


-- 홍길동 주문목록 조회
SELECT s.user_id, u.name, t.info, s.product_id, p.pname, p.price, p.content, s.order_date
FROM sorder s, suser u, paytype t, product p
WHERE s.user_id = u.user_id AND u.pay_no = t.pay_no AND s.product_id = p.product_id AND s.user_id = 1000;


-- 도서 테이블
-- code, title, writer, price
-- code : number(4)(pk)
-- title : nvarchar(30)
-- writer : nvarchar(20)
-- price : number(5)

CREATE TABLE bookTBL (
  code NUMBER(4) PRIMARY KEY,
  title NVARCHAR2(50) NOT NULL,
  writer NVARCHAR2(20) NOT NULL,
  price NUMBER(8) NOT NULL
);

insert into booktbl (code,title,writer,price) values(1001,'이것이 자바다','신용균',25000);
insert into booktbl (code,title,writer,price) values(1002,'자바의 신','강신용',26000);
insert into booktbl (code,title,writer,price) values(1003,'오라클로 배우는 데이터베이스','이지훈',28000);
insert into booktbl (code,title,writer,price) values(1004,'자바 1000제','김용만',29000);
insert into booktbl (code,title,writer,price) values(1005,'자바 프로그래밍 입문','박은종',30000);


commit;

select * from booktbl;

alter table booktbl add description nvarchar2(100);


create table membertbl(
    userid varchar2(15) primary key,
    password varchar2(20) not null,
    name nvarchar2(10) not null,
    gender nvarchar2(2) not null,
    email varchar2(50) not null
);

insert into membertbl values('hong123','hong123@','홍길동','남','hong123@gmail.com');

select count(*) from membertbl where userid='hong123';



CREATE TABLE board (
  bno NUMBER(8) constraint pk_board primary key,
  name NVARCHAR2(10) NOT NULL,
  password VARCHAR2(20) NOT NULL,
  title NVARCHAR2(50) NOT NULL,
  content NVARCHAR2(1000) NOT NULL,
  attach nVARCHAR2(100),
  re_ref NUMBER(8) NOT NULL,
  re_lev NUMBER(8) NOT NULL,
  re_seq NUMBER(8) NOT NULL,
  cnt NUMBER(8) DEFAULT 0,
  regdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE board_seq;


-- 페이지 나누기
-- rownum : 조회된 결과에 번호를 매겨줌
--               order by 구문에 index 가 들어가지 않는다면 제대로 된 결과를 보장하지 않음

select rownum, bno, title from board
order by bno desc;

select rownum, bno, title, re_ref, re_lev, re_seq
from board order by re_ref desc, re_seq asc;

-- 한페이지에 30개의 목록을 보여준다 할 때 페이지요청


select *
from ( select rownum rum, bno, title, re_ref, re_lev, re_seq
        from (select bno, title, re_ref, re_lev, re_seq
                from board order by re_ref desc, re_seq asc)
                where rownum <= ?)
                where rum > ?;

-- 1page : rnum > 0 , rownum <= 30
-- 2page : rnum > 30 , rownum <= 60
-- 3page : rnum > 60 , rownum <= 90

-- 1, 2, 3
-- rownum 값 : 페이지번호 * 한페이지에 보여줄 목록 개수
-- rnum 값 : (페이지번호-1) * 한페이지에 보여줄 목록 개수


---- spring_board
-- bno 숫자(10) 제약조건 pk 제약조건명 pk_spring_board , title varchar2(200) not null,
-- content varchar2(2000) not null, writer varchar2(50) not null, regdate date dafault 현재시스템날짜
-- updatedate date default

CREATE TABLE spring_board (
  bno NUMBER(10) constraint pk_spring_board primary key,
  title VARCHAR2(200) NOT NULL,
  content VARCHAR2(2000) NOT NULL,
  writer varchar2(50) not null,
  regdate DATE DEFAULT SYSDATE,
  updatedate date default sysdate
);

CREATE SEQUENCE seq_board;














