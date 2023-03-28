-- javadb

-- userTBL ���̺� ����
-- no(����4), username(�ѱ�4), birthYear(�⵵-����4), addr(���� �ѱ�,����), mobile(010-1234-1234)
create table userTBL(
    no number(4) CONSTRAINT pk_userTBL PRIMARY KEY,
    username nvarchar2(10) not null,
    birthYear number(4) not null,
    addr nvarchar2(50) not null,
    mobile nvarchar2(13)
    );

-- ������ ����
-- user_seq ����(�⺻)
create sequence user_seq;

-- insert 
insert into userTBL(no,username,birthYear,addr,mobile)
values(user_seq.NEXTVAL,'ȫ�浿',1994,'��⵵������554','010-4022-1520');

commit;

-- paytype : payno(���� 1), info(����- card,cash)
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
-- user : user_id(���� 4), name(�ѱ� 4), pay_no(���� 1 : paytype ���̺� �ִ� pay_no �����ؼ� ���)
create table suser(
    user_id number(4) PRIMARY KEY,
    name nvarchar2(20) not null,
    pay_no number(1) not null references paytype(payno)
    );

-- product
-- product_id(���� 8), pname(����), price(����), content(����)
create table product(
    product_id number(8) PRIMARY KEY,
    pname varchar2(30) not null,
    price number(8) not null,
    content varchar2(50) not null
    );
create sequence product_seq;
-- order
-- order_id(���� 8), user_id, product_id
-- order_seq ����
create table order(
    order_id number(8) PRIMARY KEY,
    user_id number(4) not null references suser(user_id),
    product_id number(8) not null references product(product_id)
    );
 create sequence order_seq;   

select * from suser;




