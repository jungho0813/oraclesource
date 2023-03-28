-- javadb

-- userTBL 테이블 생성
-- no(숫자4), username(한글4), birthYear(년도-숫자4), addr(문자 한글,숫자), mobile(010-1234-1234)
create table userTBL(
    no number(4) CONSTRAINT pk_userTBL PRIMARY KEY,
    username nvarchar2(10) not null,
    birthYear number(4) not null,
    addr nvarchar2(50) not null,
    mobile nvarchar2(13)
    );

-- 시퀀스 생성
-- user_seq 생성(기본)
create sequence user_seq;

-- insert 
insert into userTBL(no,username,birthYear,addr,mobile)
values(user_seq.NEXTVAL,'홍길동',1994,'경기도남양주554','010-4022-1520');

commit;

-- paytype : payno(숫자 1), info(문자- card,cash)
create table paytype(
    payno number(1) PRIMARY KEY,
    info varchar2(10) not null
    );
-- paytype_seq
create sequence paytype_seq;

insert into paytype values(paytype_seq.nextval,'card');
insert into paytype values(paytype_seq.nextval,'cash');
select * from paytype;
-- shop
-- user : user_id(숫자 4), name(한글 4), pay_no(숫자 1 : paytype 테이블에 있는 pay_no 참조해서 사용)
create table suser(
    user_id number(4) PRIMARY KEY,
    name nvarchar2(20) not null,
    pay_no number(1) not null references paytype(payno)
    );

-- product
-- product_id(숫자 8), pname(문자), price(숫자), content(문자)
create table product(
    product_id number(8) PRIMARY KEY,
    pname varchar2(30) not null,
    price number(8) not null,
    content varchar2(50) not null
    );
create sequence product_seq;
-- order
-- order_id(숫자 8), user_id, product_id
-- order_seq 생성
create table order(
    order_id number(8) PRIMARY KEY,
    user_id number(4) not null references suser(user_id),
    product_id number(8) not null references product(product_id)
    );
 create sequence order_seq;   

select * from suser;




