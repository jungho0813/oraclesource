javadb.sql
-- javadb

-- userTBL ���̺� ����
-- no(��ȣ-����(4)), username(�̸�-�ѱ�(4)), birthYear(�⵵-����(4)), addr(�ּ�-����(�ѱ�,����)), mobile(010-1234-1234)
-- no pk �������� ����(�������Ǹ� pk_userTBL)

create table userTBL(
    no number(4) CONSTRAINT pk_userTBL PRIMARY KEY,
    username NVARCHAR2(10) not null,  -- varchar2(20)
    birthYear number(4) not null,
    addr nvarchar2(50) not null,      -- varchar2(50)
    mobile nvarchar2(20));            -- varchar2(20)

drop table userTBL;

-- ������ ����
-- user_seq ����(�⺻)

create sequence user_seq;


-- insert
-- no : user_seq �� �ֱ�
INSERT INTO userTBL(no, username, birthYear, addr, mobile)
VALUES(user_seq.NEXTVAL, 'ȫ�浿', 2010, '����� ���α� 123', '010-1234-5678');

commit;

-- ��� �÷� not null

-- paytype : pay_no(����-1 pk), info(����-card, cash)
-- paytype_seq ����

CREATE TABLE paytype(
    pay_no number(1) PRIMARY KEY,
    info varchar2(20) not null);

CREATE SEQUENCE paytype_seq;

INSERT INTO paytype values(paytype_seq.NEXTVAL, 'card');
INSERT INTO paytype values(paytype_seq.NEXTVAL, 'cash');

SELECT * FROM paytype; -- 1 : card, 2 : cash

-- suser : user_id(����-4 pk) , name(����-�ѱ�), pay_no(����-1 : paytype ���̺� �ִ� pay_no ���� �ؼ� ���)
CREATE TABLE suser(
    user_id number(4) PRIMARY KEY,
    name varchar2(20) NOT NULL,
    pay_no number(1) NOT NULL references paytype(pay_no));
    
select * from suser;

-- product
-- product_id(����-8 pk), pname(����), price(����), content(����)
CREATE TABLE product(
    product_id number(8) PRIMARY KEY,
    pname varchar2(30) NOT NULL,
    price number(8) NOT NULL,
    content varchar2(50) NOT NULL);
    
CREATE SEQUENCE product_seq;

-- sorder
-- order_id(����-8 pk), user_id(user ���̺��� user_id ����), product_id(product ���̺��� product_id ����)
-- order_seq ����

CREATE TABLE sorder(
    order_id number(8) PRIMARY KEY,
    user_id number(4) NOT NULL REFERENCES suser(user_id),
    product_id number(8) NOT NULL REFERENCES product(product_id)
);

CREATE SEQUENCE order_seq;

-- user_id, name, pay_no, info ��ȸ
-- suser�� paytype join

SELECT u.user_id, u.name, u.pay_no, p.info
FROM suser u, paytype p
WHERE u.pay_no = p.pay_no AND u.user_id=1000;

-- �ֹ����� ��ü ��ȸ
SELECT * FROM sorder;

-- �ֹ���� ��ȸ
-- user_id, name, card/cash, product_id, pname, price, content

-- ���� : sorder
-- suser ���̺� : name,
-- paytype ���̺� : card/cash
-- product ���̺� : product_id, pname, price, content

-- ��ü �ֹ����
SELECT s.user_id, u.name, t.info, s.product_id, p.pname, p.price, p.content, s.order_date
FROM sorder s, suser u, paytype t, product p
WHERE s.user_id = u.user_id AND u.pay_no = t.pay_no AND s.product_id = p.product_id;


-- ȫ�浿 �ֹ���� ��ȸ
SELECT s.user_id, u.name, t.info, s.product_id, p.pname, p.price, p.content, s.order_date
FROM sorder s, suser u, paytype t, product p
WHERE s.user_id = u.user_id AND u.pay_no = t.pay_no AND s.product_id = p.product_id AND s.user_id = 1000;





