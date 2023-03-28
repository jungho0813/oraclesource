-- ����� : scott, hr => �����ͺ��̽� �����Ͽ� �����͸� �����ϴ� ����
--            ���̺�, �ε���, �� �� ���� ��ü�� ����ں��� ������
--            ������ ���� ����ڵ��� ������ ����

-- ��Ű�� : �����Ͱ� ����, ������ ����, �������� �� �����͸� ���� �����ϱ� ���� ������ �����ͺ��̽� ������ ����
-- ��Ű�� == �����(����Ŭ �����ͺ��̽� ���)

-- ����� ���� : ����� ���� ������ �ʿ��� ==> sys, system

-- ��ҹ��� ���� ���� ����(�� ��й�ȣ�� ������)
-- CREATE : ���� / ALTER : ���� /  DROP : ���� / DELETE : ����

-- ����Ŭ ������ ����Ǹ鼭 ����� ���� �� C## ���ڸ� �־ ���鵵�� ���� ��
-- JAVADB => C##JAVADB �̷� ����� C##�� ������� �ʰ���
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- user  ������ sys, system �� ����
-- user ���� (���� �Ҵ�)
-- CREATE USER ������̸� IDENTIFIED BY ��й�ȣ
CREATE USER JAVADB IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
alter user javadb quota 2M on users;

-- GRANT : ���� �ο�(����� ������ �ؼ��� �ƹ��͵� �� �� ����)
GRANT CONNECT, RESOURCE TO JAVADB;

CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO SCOTT;

select * from all_users;

GRANT UNLIMITED TABLESPACE TO SCOTT;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO SCOTT;
GRANT CREATE view to SCOTT;
grant create synonym to scott;
grant create public synonym to scott;

-- test ����� ���� / ��й�ȣ
CREATE USER test IDENTIFIED BY 12345;

-- ���ӱ��� �ο����� ������ �ȵ�

-- ���� �Ǹ�
-- 1) �ý��� ���� 
--     ����� ����(CREATE USER) / ����(ALTER USER) / ����(DROP USER)
--     �����ͺ��̽� ����(CREATE SESSION) / ����(ALTER SESSION)
--     ���� ��ü ����(view, synoym) �� ���� ����

-- 2) ��ü ����
--     ���̺� ����, ����, �ε��� ����, ����, ����, ��ȸ, ����
--     �� ����, ����, ����, ��ȸ, ����
--     ������ ����, ��ȸ
--     ���ν���, �Լ�, ��Ű�� ����

-- ���� �ο�

-- CREATE SESSION �� test ���� �ο�
grant create session to test;
grant resource, create table to test;
ALTER USER test DEFAULT TABLESPACE USERS;
ALTER USER test TEMPORARY TABLESPACE TEMP;
alter user test quota 2M on users;

-- scott ���� test�� ������ member ���̺� ��ȸ ���� �ο�
--grant select on member to scott;

-- ���� ���
--revoke select, insert on member from scott;

-- �� : ���� ���ѵ��� ����
-- connect �� : create session
-- resource �� : create trigger, create sequ

-- ����� ����
drop user test cascade; -- test�� ���õ� ��簴ü ����




-- ����� ���� + ���̺� �����̽� ���� �ο�
CREATE USER test2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
-- ���� �ο�
grant connect, resource to test2;






