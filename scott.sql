-- scott

DESC emp;
-- emp(employee) ���̺� ���� ����
-- �ʵ��(�� �̸�),      ��������,    ������Ÿ��
--EMPNO(�����ȣ)    NOT NULL   NUMBER(4)    
--ENAME(�����, JOB(��å), MGR(���ӻ�� ��ȣ), HITEDATE(�Ի���), SAL(�޿�) , COMM(����), DEPTNO(�μ���ȣ)
--NUMBER : �Ҽ��� �ڸ����� �����ؼ� ���� ����
--NUMBER(4) : 4�ڸ� ���ڱ��� ���, NUMBER(8,2) : ��ü �ڸ����� 8�ڸ��̰� �Ҽ��� 2�ڸ��� �����Ѵ�

--VARCHAR2 : ������ ���ڿ� ����
--VARCHAR2(10) : 10byte ���ڱ��� ���尡��

--DATE :  ��¥ ������

DESC dept;
--DEPTNO(�μ���ȣ), DNAME(�μ���), LOC(�μ���ġ)

DESC salgrade;
--GRADE(�޿����), LOSAL(�ּұ޿���), HISAL(�ִ�޿���)

-- select : ������ ��ȸ
--��ȸ��� : ������(�� ������ ��ȸ), ��������(�� ������ ��ȸ), ����(�ΰ� �̻��� ���̺��� ����Ͽ� ��ȸ)
--SELECT ���̸�1, ���̸�2......(��ȸ�� ���� ��ü��� * �� ó��)
--FROM ���̺��;

--1. EMP ���̺��� ��ü ���� ��ȸ
SELECT
    *
FROM
    emp;

--2. EMP ���̺��� �����ȣ, �̸�, �޿� ���� ��ȸ
SELECT
    empno,
    ename,
    sal
FROM
    emp;
    
-- 3. DEPT ���̺� ��ü ��ȸ
SELECT
    *
FROM
    dept;
-- 4. DEPT ���̺� �ȿ� �μ���ȣ, ������ ��ȸ
SELECT
    deptno,
    loc
FROM
    dept;
-- 5. EMP ���̺� �ȿ� �μ���ȣ ��ȸ
SELECT
    deptno
FROM
    emp;
-- 6. EMP ���̺� �ȿ� �μ���ȣ ��ȸ(�ߺ��� �μ���ȣ�� ����)
-- DISTINCT : �ߺ�����
-- ���� �������� ���(��� �ߺ��̳� �ƴϳĸ� �Ǵ�)
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- 7. ����
-- ��Ī : �ʵ忡 ��Ī�� ���Ƿ� �ο�(as ��Ī, Ȥ�� ��ĭ��� ��Ī, ��Ī�� ������ �ִٸ� " ")
-- ������� 1�� ���� ���ϱ�
SELECT
    empno "��� ��ȣ",
    ename �����,
    sal * 12 + comm ����
FROM
    emp;