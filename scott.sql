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
    empno           "��� ��ȣ",
    ename           �����,
    sal * 12 + comm ����
FROM
    emp;
    
-- 8. ���� : ORDER BY
--            ��������(DESC), ��������(ASC)
-- ENAME, SAL �� �����ϰ� SAL ������������ ����
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- ENAME, SAL �� �����ϰ� SAL ������������ ����
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;   --ASC�� ��������
    
-- ��ü���� ����ϰ� ����� �����ȣ�� ������������ ����
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
--��ü���� ����ϰ� ����� �μ���ȣ�� ��������, �޿� ������������ ����
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
    
    
-- emp ���̺��� ��� �� ���
-- empno => employee_no
-- ename => employee_name
-- mgr => manager
-- sal => salary
-- comm => commission
-- deptno => department_no
-- �μ� ��ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ����̸��� �������� �������� ����
SELECT
    empno  employee_no,
    ename  employee_name,
    mgr    manager,
    sal    salary,
    comm   commission,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename;

-- WHERE : Ư�� ������ �������� ���ϴ� ���� ��ȸ
-- �����ȣ�� 7782�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- �μ���ȣ�� 30�̰� �����å�� SALESMAN�� ������ ��ȸ
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

--�μ���ȣ�� 30�̰ų� �����å�� CLERK�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    job = 'CLERK'
    OR deptno = 30;

-- ������
-- ��������� : +,-,*,/,mod(������)
-- �񱳿����� : >, >=, <, <=
-- ��񱳿����� : =, !=, <>, ^=
-- ������������ : NOT
-- IN ������
-- BETWEEN A AND B ������
-- LIKE �����ڿ� ���ϵ�ī��( _ , % )
-- IS NULL ������
-- ���տ����� : UNION(������-�ߺ�����), UNION ALL(������-�ߺ�����), MINUS(������), INTERSECT(������)

-- EMP ���̺��� �޿� ���� 12�� ���� ���� 36000 �� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- JOB�� MANAGER, SALESMAN, CLERK ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 )
ORDER BY
    deptno;

-- �޿��� 2000 �̻� 3000 ������ ��� ��ȸ
--select * from emp where sal >= 2000 and sal <= 3000;
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
-- LIKE�����ڿ� ���ϵ� ī��( _ , % )
-- _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
-- % : ���̿� �������(���� ���� ��쵵 ����) ��� ���� �����͸� �ǹ�
-- ��� �̸��� S�� �����ϴ� ��� ���� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';
-- ��� �̸��� �ι�° ���ڰ� L �� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
-- ��� �̸��� AM �� ���Ե� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';
-- ��� �̸��� AM �� ���ԵǾ� ���� ���� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
 
 -- NULL : ������ ���� ����ִ� ����
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
    
-- ���տ�����
-- union, union all : ������
-- INTERSECT : ������
-- MINUS : ������
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;    
    
-- emp ���̺��� ����̸��� S�� ������ ��� ������ ��ȸ
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%S';
-- emp ���̺��� 30�� �μ��� �ٹ��ϴ� ��� �߿��� ��å�� salesman�� ����� �����ȣ �̸� �޿� ��ȸ sal ��������
SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'
ORDER BY
    sal DESC;
-- emp ���̺��� ����Ͽ� 20,30�� �μ��� �ٹ��ϰ� �մ� ����� �޿��� 2000 �ʰ��� ��� ��ȸ, �����ȣ,�̸�,�޿�,�μ���ȣ ��ȸ
-- ���� �����ڸ� ����ϴ� ��İ� ������� �ʴ� ��� �� ������ ����Ѵ�
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno NOT IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno NOT IN ( 20, 30 )
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000;
-- ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ� ����� �޿��� 1000~2000 ���̰� �ƴ� ����� �̸�
-- �����ȣ, �޿�, �μ���ȣ ��ȸ�ϱ�
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

-- �߰������� �������� ������, ����ڰ� �ְ� ��å�� MANAGER, CLERK �� ����߿��� ��� �̸��� �ι�°���ڰ� L�� �ƴ� ����� ���� ��ȸ
SELECT
    ename
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND ( job = 'MANAGER'
          OR job = 'CLERK' )
    AND ename NOT LIKE '_L%';

SELECT
    *
FROM
    emp;
    
-- ����Ŭ �Լ�
-- ����Ŭ���� �⺻���� �����ϴ� ���� �Լ��� ����ڰ� �ʿ信 ���� ���� ������ ����� ���� �Լ�

-- 1. UPPER, LOWER, INITCAP
-- UPPER : ��� �빮��, LOWER : ��μҹ���, INITCAP : ù ���ڸ� �빮��
-- LIKE '%ORACLE%' OR LIKE '%oracal%' OR LIKE '%Oracle%' ==> �˻� �� ���

select length('�ѱ�'), -- ����
        lengthb('�ѱ�') --����Ʈ ��
from dual;

-- SUBSTR(���ڿ�������, ������ġ, �������) : ������̴� ��������
-- ���ڿ� �Ϻ� ����

select job, substr(job,1,2), substr(job,3,2), substr(job,5),substr (job,-3) from emp;

-- ENAME, ����° ���ں��� ���
select ename, substr(ename,3) from emp;

-- INSTR : ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã��
-- INSTR(����ڿ�, ��ġ�� ã������ ���ڿ�, ����ڿ����� ã�⸦ ������ ��ġ(����), ������ġ���� ã������ ���ڰ� ���°���� ����(����))

-- HELLO, ORACLE ���ڿ����� L ���ڿ� ã��
select INSTR('HELLO, ORACLE','L') as instr_1,INSTR('HELLO, ORACLE','L',5) as INSTR_2,INSTR('HELLO, ORACLE','L',2,2) as instr_3 from dual;

-- replace : Ư�� ���ڸ� �ٸ� ���ڷ� ����
-- replace(���ڿ�������, ã�¹���, ���湮��)
select '010-1234-5678' as ������, replace('010-1234-5678','-',' ') as replace_1 , replace('010-1234-5678','-') as replace_2 from dual;

select '�̰��� oracle �̴�' , replace('�̰��� oracle �̴�','�̰���','This is') from dual;

-- concat : �� ���ڿ� ������ ��ġ��
select concat(empno,ename) from emp;

select concat(empno,concat(' : ',ename)) from emp;

-- || : : ���ڿ� ���� ������
select empno || ename, empno || ' : ' || ename from emp;

-- TRIM, LTRIM, RTRIM : ���� ���� Ư������ ����
select '               �̰���            ',trim('               �̰���            ') from dual;

