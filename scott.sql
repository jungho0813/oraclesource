scott.sql
-- scott

-- emp(employee) ���̺� ���� ����
-- �ʵ��(���̸�)   ��������     ������Ÿ��
--     EMPNO(�����ȣ)       NOT NULL     NUMBER(4)
--     ENAME(�����), JOB(��å), MGR(���ӻ�� ��ȣ), HIREDATE(�Ի���), SAL(�޿�),COMM(����), DEPTNO(�μ���ȣ)
--  NUMBER : �Ҽ��� �ڸ����� �����ؼ� ���� ����
--  NUMBER(4) : 4�ڸ� ���ڱ��� ���,   NUMBER(8,2) : ��ü �ڸ����� 8 �ڸ��̰� �Ҽ��� 2�ڸ��� �����Ѵ�
--  VARCHAR2 : ������ ���ڿ� ����
--  VARCHAR2(10) : 10byte ���ڱ��� ���� ����
--  DATE : ��¥ ������

DESC emp; 

-- DEPTNO(�μ���ȣ), DNAME(�μ���), LOC(�μ���ġ)
DESC dept; 

-- GRADE(�޿����), LOSAL(�ּ� �޿���), HISAL(�ִ� �޿���)
DESC salgrade; 

-- select : ������ ��ȸ
-- ��ȸ ��� : ������(�� ������ ��ȸ), ��������(�� ������ ��ȸ), ����(�� �� �̻��� ���̺��� ����Ͽ� ��ȸ)
-- SELECT ���̸�1, ���̸�2..... (��ȸ�� ���� ��ü��� * �� ó��)
-- FROM ���̺��;

-- 1. EMP ���̺��� ��ü ���� ��ȸ
SELECT
    *
FROM
    emp;

-- 2. EMP ���̺��� �����ȣ,�̸�,�޿� ���� ��ȸ
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
-- 4. DEPT ���̺�ȿ� �μ���ȣ, ������ ��ȸ
SELECT
    deptno,
    loc
FROM
    dept;
    
-- 5. EMP ���̺�ȿ� �μ���ȣ ��ȸ
SELECT
    deptno
FROM
    emp;

-- 6. EMP ���̺�ȿ� �μ���ȣ ��ȸ(��, �ߺ��� �μ� ��ȣ�� ����) 
-- DISTINCT : �ߺ� ����
SELECT DISTINCT
    deptno
FROM
    emp;
    
-- ���� ���� ���� ���(��� �ߺ��̳� �ƴϳĸ� �Ǵ�)    
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- 7. ����
-- ��Ī : �ʵ忡 ��Ī�� ���Ƿ� �ο�( as ��Ī, Ȥ�� ��ĭ ��� ��Ī, ��Ī�� ������ �ִٸ� ""�� �����ֱ�)
-- ������� 1�� ���� ���ϱ� ( SAL * 12 + COMM )
SELECT
    empno,
    ename,
    sal,
    comm,
    sal * 12 + comm AS annsal
FROM
    emp;

SELECT
    empno,
    ename           �����,
    job             "�� å",
    sal * 12 + comm annsal
FROM
    emp;
    
-- 8. ���� : ORDER BY
--           �������� => DESC, �������� => ASC

-- ENAME, SAL �� �����ϰ�, SAL ������������ ����
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;
    
-- ENAME, SAL �� �����ϰ�, SAL ������������ ����    
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;    -- ASC ���� ����
    
-- ��ü ���� ����ϰ�, ����� �����ȣ�� ������������ ����    
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
    
-- ��ü ���� ����ϰ�, ����� �μ���ȣ�� ���������� �޿� ������������ ����     
SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    

-- [�ǽ�] emp ���̺��� ��� �� ���
-- empno => employee_no
-- ename => employee_name
-- mgr => manager
-- sal => salary
-- comm => commission
-- deptno => department_no
-- �μ� ��ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� 
-- ��� �̸��� �������� �������� ����

SELECT
    empno  AS employee_no,
    ename  employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   commission,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    
-- WHERE : Ư�� ������ �������� ���ϴ� ���� ��ȸ

-- �μ���ȣ�� 30�� �����͸� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;  --  = : ����
    
-- �����ȣ�� 7782�� ��� ��ȸ    
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;   

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN�� �� ��ȸ

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';   

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;  

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK �� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';     


-- ��������� : +, -, *, /, mod(������- ǥ���� �ƴ�(����Ŭ������ ����))
-- �񱳿����� : >, >=, <, <=
-- ��񱳿����� : =,  !=, <>, ^= (!=, <>, ^= : A���� B���� �ٸ� ��� true, ���� ��� false)
-- ������������ : NOT
-- IN ������
-- BETWEEN A AND B ������
-- LIKE�����ڿ� ���ϵ� ī��(_, %)
-- IS NULL ������
-- ���տ����� : UNION(������-�ߺ�����), UNION ALL(������-�ߺ�����), MINUS(������), INTERSECT(������)

-- ������ �켱����
-- 1) ��������� *, /
-- 2) ��������� +, -
-- 3) �񱳿�����
-- 4) IS NULL, IS NOT NULL, LIKE, IN
-- 5) BETWEEN A AND B
-- 6) NOT
-- 7) AND
-- 8) OR
-- �켱������ ��� �Ѵٸ� �Ұ�ȣ ��� ��õ



-- EMP ���̺��� �޿� ���� 12�� ���� ���� 36000 �� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- ename �� F ������ ���ڷ� �����ϴ� ��� ��ȸ
-- ���� ǥ���� '' �� ���
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

SELECT
    *
FROM
    emp
WHERE
    ename <= 'FORZ';

-- JOB�� MANAGER, SALESMAN, CLERK ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';
    
-- sal �� 3000 �� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;    
    
    
-- JOB�� MANAGER, SALESMAN, CLERK ��� ��ȸ ==> IN ������
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );    
    
    
-- JOB�� MANAGER, SALESMAN, CLERK �ƴ� ��� ��ȸ  

SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );


-- �μ���ȣ�� 10, 20 �����ȸ(in ���)


SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- �޿��� 2000 �̻� 3000 ������ ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;


-- BETWEEN �ּҰ� AND �ִ밪;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- �޿��� 2000 �̻� 3000 ���ϰ� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE�����ڿ� ���ϵ� ī��(_, %)
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

-- ��� �̸��� AM �� ���Ե��� ���� ����� ��ȸ

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- NULL : ������ ���� ������ ��� �ִ� ����
-- = �� ����� �� ����

-- COMM �� NULL�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

-- MGR �� NULL�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;
    
-- MGR �� NULL�� �ƴ� ��� ��ȸ    

SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- ���տ�����

-- union(������ ������� ��� �ߺ� ����), union all(�ߺ� ���� ����) : ������

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


-- MINUS(������)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- INTERSECT(������)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- EMP ���̺��� ����̸��� S�� ������ ��� ������ ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

-- EMP ���̺��� 30�� �μ��� �ٹ��ϴ� ��� �߿��� ��å�� SALESMAN�� ����� 
-- �����ȣ, �̸�, �޿� ��ȸ(SAL ��������)
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

-- EMP ���̺��� ����Ͽ� 20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ��� ��ȸ
-- �����ȣ, �̸�, �޿�, �μ���ȣ ��ȸ
-- ���� �����ڸ� ����ϴ� ��İ� ������� �ʴ� ��� �� ������ ����Ѵ�

-- ���տ����� ������� �ʴ� ���
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

-- ���տ����� ����ϴ� ���
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
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
        deptno = 20
    AND sal > 2000
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND sal > 2000;



-- ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ� ��� �� �޿��� 1000~2000 ���̰� �ƴ� ����� �̸�
-- �����ȣ, �޿�, �μ���ȣ�� ��ȸ�ϱ�


SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;


-- �߰� ������ �������� ������, ����ڰ� �ְ� ��å�� MANAGER, CLERK �� ��� �߿��� ��� �̸���
-- �ι�° ���ڰ� L �� �ƴ� ����� ���� ��ȸ

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';


-- ����Ŭ �Լ�
-- ����Ŭ���� �⺻���� �����ϴ� ���� �Լ��� ����ڰ� �ʿ信 ���� ���� ������ ����� ���� �Լ�


-- 1. ���ڿ� �Լ�
-- 1) UPPER, LOWER, INITCAP
-- UPPER : ��� �빮��, LOWER : ��� �ҹ���, INITCAP : ù ���ڸ� �빮��
-- LIKE '%ORACLE%' OR LIKE '%oracle%' OR LIKE '%Oracle%' ==> �˻� �� ���
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    upper(ename) = 'FORD';

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%ford%');    

-- 2) LENGTH : ���ڿ� ����
SELECT
    ename,
    length(ename)
FROM
    emp;

-- ��� �̸��� ���̰� 5 �̻��� ��� ��ȸ

SELECT
    ename,
    length(ename)
FROM
    emp
WHERE
    length(ename) >= 5;
    
-- �ѱ��� ��
-- dual : sys�� �����ϴ� ���̺�(�ӽ� �����̳� �Լ��� ��� �� Ȯ���ϴ� �뵵)
-- length, lengthb(���ڰ� ����ϴ� ����Ʈ ��)
-- ���� : ����1 => 1byte, �ѱ� : ���� 1 => 3 byte
SELECT
    length('�ѱ�'),
    lengthb('�ѱ�'),
    lengthb('ab')
FROM
    dual;
    
-- 3) SUBSTR(���ڿ�������, ������ġ, �������) : ������� ���� ����
--    ���ڿ� �Ϻ� ����

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5),
    substr(job, - 3)
FROM
    emp;
    
-- ENAME, ����° ���ں��� ���
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
    
-- 3) INSTR : ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã��
-- INSTR(����ڿ�, ��ġ�� ã������ ���ڿ�, ����ڿ����� ã�⸦ ������ ��ġ(����), ������ġ���� ã������ ���ڰ� ���°���� ����(����))

-- HELLO, ORACLE! ���ڿ����� L ���ڿ� ã��
SELECT
    instr('HELLO, ORACLE!', 'L')       AS instr_1,
    instr('HELLO, ORACLE!', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM
    dual;
    
-- 4) replace : Ư�� ���ڸ� �ٸ� ���ڷ� ����
-- replace(���ڿ�������, ã�¹���, ���湮��)

-- 010-1234-5678   - �� �� ���ڿ��� ���� / -�� ���ֱ�
SELECT
    '010-1234-5678'                    AS ������,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;

-- '�̰��� Oracle �̴�', '�̰���' => This is ����
SELECT
    '�̰��� Oracle �̴�'                            AS ������,
    replace('�̰��� Oracle �̴�', '�̰���', 'This is') AS replace_1
FROM
    dual;

-- 5) concat : �� ���ڿ� ������ ��ġ��
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno,
           concat(':', ename))
FROM
    emp;
    
-- || : ���ڿ� ���� ������

SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp;

-- 6) TRIM, LTRIM, RTRIM : ���� ���� Ư�� ���� ����
-- ' ORACLE' = 'ORACLE' ==> FALSE

SELECT
    '     �̰���     ',
    TRIM('     �̰���     ')
FROM
    dual;



-- 2. �����Լ�
-- 1) ROUND, TRUNC, CEIL, FLOOR, MOD

-- round : �ݿø�
-- round(����, �ݿø� ��ġ(����))
SELECT
    round(1234.5678)      AS round,           -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 0)   AS round0,          -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 1)   AS round1,          -- �Ҽ��� ��° �ڸ����� �ݿø� 
    round(1234.5678, 2)   AS round2,          -- �Ҽ��� ����° �ڸ����� �ݿø�
    round(1234.5678, - 1) AS round_minus1,    -- �ڿ��� ù° �ڸ����� �ݿø�
    round(1234.5678, - 2) AS round_minus2     -- �ڿ��� ��° �ڸ����� �ݿø�
FROM
    dual;
    
    
-- trunc : Ư�� ��ġ���� ������ �Լ�
-- trunc(����, ���� ��ġ(����))
SELECT
    trunc(1234.5678)      AS trunc,           -- �Ҽ��� ù° �ڸ����� ����
    trunc(1234.5678, 0)   AS trunc0,          -- �Ҽ��� ù° �ڸ����� ����
    trunc(1234.5678, 1)   AS trunc1,          -- �Ҽ��� ��° �ڸ����� ���� 
    trunc(1234.5678, 2)   AS trunc2,          -- �Ҽ��� ����° �ڸ����� ����
    trunc(1234.5678, - 1) AS trunc_minus1,    -- �ڿ��� ù° �ڸ����� ����
    trunc(1234.5678, - 2) AS trunc_minus2     -- �ڿ��� ��° �ڸ����� ����
FROM
    dual;    
    
-- ceil(����), floor(����) : �Էµ� ���ڿ� ����� ū ����, ���� ����   

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;


-- mod(����, ������) : ��������
SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;    
    
    
    
-- ��¥ �Լ�
-- ��¥ ������ + ���� : ��¥ �����ͺ��� ���ڸ�ŭ �ϼ� ������ ��¥
-- ��¥ ������ - ��¥ ������ : �� ��¥ ������ ���� �ϼ� ����

-- ��¥ ������ + ��¥ ������ : ����Ұ�

-- 1) sysdate �Լ� : ����Ŭ �����ͺ��̽� ������ ��ġ�� OS�� ���糯¥�� �ð��� ������
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;
    
-- 2) add_months(��¥, ���� ������) : �� ���� ���� ��¥ ���ϱ�
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;
    
-- �Ի� 50�ֳ��� �Ǵ� ��¥ ���ϱ�
-- empno, ename, hiredate, �Ի�50�ֳ⳯¥ ��ȸ
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600)
FROM
    emp;

-- 3) MONTHS_BETWEEN(ù��°��¥, �ι�° ��¥) : �� ��¥ ������ ���� ��¥ ���̸� �������� ����Ͽ� ���

-- �Ի� 45�� �̸��� ��� ������ ��ȸ
-- empno, ename, hiredate

SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;
 
    
-- ���� ��¥�� 6���� �� ��¥�� ���
SELECT
    sysdate,
    add_months(sysdate, 6)
FROM
    dual;

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;
    
-- 4) next_day(��¥, ����) : Ư�� ��¥�� �������� ���ƿ��� ������ ��¥ ���
--    last_day(��¥) : Ư�� ��¥�� ���� ���� ������ ��¥�� ���
SELECT
    sysdate,
    next_day(sysdate, '�ݿ���'),
    last_day(sysdate)
FROM
    dual;

-- ��¥�� �ݿø�, ���� : ROUND, TRUNC
-- CC : �� �ڸ� ������ �� ���ڸ��� �������� ���
--      2023 ���� ��� 2050 �����̹Ƿ� 2001������ ó��

SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;
    
-- ����ȯ �Լ� : �ڷ����� �� ��ȯ
-- NUMBER, VARCHAR2, DATE

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'FORD';

--ORA-01722: ��ġ�� �������մϴ�
--01722. 00000 -  "invalid number"
--SELECT empno, ename, 'abcd'+empno
--FROM emp
--WHERE ename = 'FORD';

-- TO_CHAR() : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ
-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ

-- ���ϴ� ��� ���·� ��¥ ����ϱ� to_char �ַ� ����
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM
    dual;
    
-- MON, MONTH : �� �̸�
-- DDD : 365�� �߿��� ��ĥ 
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD')    AS ���糯¥,
    to_char(sysdate, 'YYYY')          AS ���翬��,
    to_char(sysdate, 'MM')            AS �����,
    to_char(sysdate, 'MON')           AS �����1,
    to_char(sysdate, 'DD')            AS ��������,
    to_char(sysdate, 'DDD')           AS ��������2,
    to_char(sysdate, 'HH12:MI:SS AM') AS ���糯¥�ð�
FROM
    dual;    
    
-- sal �ʵ忡 , �� ��ȭǥ�ø� �ϰ� �ʹٸ�?
-- L (Locale) ���� ȭ�� ���� ��ȣ �ٿ���
SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;
    


-- to_number(���ڿ�������, �νĵ� ��������)

-- �ڵ�����ȯ
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

-- �ڵ�����ȯ�ȵǴ� ��Ȳ    
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
    dual;
    
    
-- to_date(���ڿ�������, '�νĵ� ��¥ ����')
SELECT
    TO_DATE('2018-07-14', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20230320', 'YYYY-MM-DD')   AS todate2
FROM
    dual;
    
-- ORA-01722: ��ġ�� �������մϴ�    
--SELECT '2023-03-21' - '2023-02-01'
--FROM dual;

SELECT
    TO_DATE('2023-03-21') - TO_DATE('2023-02-01')
FROM
    dual;    
    

-- ��ó�� �Լ�
-- NULL + 300 => NULL

-- NVL(������, ���� ��� ��ȯ�� ������) 
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

-- NVL2(������,���� �ƴҰ�� ��ȯ�� ������,���� ��� ��ȯ�� ������)
SELECT
    empno,
    ename,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12) AS annsal
FROM
    emp;
    
-- DECODE�Լ� / CASE ��

-- DECODE(�˻� ����� �� ������, 
--        ����1, ����1�� ��ġ�Ҷ� ������ ����
--        ����2, ����2�� ��ġ�Ҷ� ������ ����)
    
-- emp ���̺� ��å�� MANAGER �� ����� �޿��� 10% �λ�, 
-- SALESMAN �� ����� 5%, ANALYST �� ����� �״��, �������� 3% �λ�� �޿� ���

SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '�ش���� ����'
        WHEN comm = 0 THEN
            '�������'
        WHEN comm > 0 THEN
            '���� : ' || comm
    END AS comm_text
FROM
    emp;
    
-- EMP ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5���̴�. 
-- �Ϸ� �ٹ� �ð��� 8�ð����� ������ �� ������� 
-- �Ϸ� �޿�(DAY_PAY)�� �ñ�(TIME_PAY)�� ����Ͽ� 
-- ����� ����Ѵ�. ��, �Ϸ� �޿��� �Ҽ��� ��° �ڸ�����
-- ������, �ñ��� �� ��° �Ҽ������� �ݿø��Ͻÿ�.
SELECT
    empno,
    ename                    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;
    
-- EMP ���̺��� ������� �Ի���(HIREDATE)�� �������� 
-- 3������ ���� �� ù �����Ͽ� �������� �ȴ�. ������� 
-- �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD �������� �Ʒ��� 
-- ���� ����Ͻÿ�. ��, �߰�����(COMM)�� ���� ����� �߰� ������ N/A�� ����Ͻÿ�.

SELECT
    comm,
    nvl(to_char(comm),
        'N/A')  -- ORA-01722: ��ġ�� �������մϴ�
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3),
             '������') AS r_job,
    nvl(to_char(comm),
        'N/A')      AS comm
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3),
             '������') AS r_job,
    nvl2(comm,
         to_char(comm),
         'N/A')     AS comm
FROM
    emp;
    
--EMP ���̺��� ��� ����� ������� ���� ����� ��� ��ȣ(MGR)�� 
--������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR ���� ����Ͻÿ�.
--
--���ӻ���� ��� ��ȣ�� �������� ���� ��� : 0000
--���ӻ���� ��� ��ȣ �� ���ڸ��� 75�� ��� : 5555
--���ӻ���� ��� ��ȣ �� ���ڸ��� 76�� ��� : 6666
--���ӻ���� ��� ��ȣ �� ���ڸ��� 77�� ��� : 7777
--���ӻ���� ��� ��ȣ �� ���ڸ��� 78�� ��� : 8888
--�� �� ���� ��� ��� ��ȣ�� ��� : ���� ���� ����� �����ȣ �״�� ���


SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr),
                  1,
                  2),
           NULL,
           '0000',
           '75',
           '5555',
           '76',
           '6666',
           '77',
           '7777',
           '78',
           '8888',
           substr(to_char(mgr),
                  1)) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr),
                    1,
                    2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr),
                    1,
                    2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr),
                    1,
                    2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr),
                    1,
                    2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;
    
-- ������(����) �Լ� : sum, count, max, min, avg

-- ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
--SELECT
--    ename,
--    SUM(sal)
--FROM
--    emp;

SELECT
    SUM(sal)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(ALL sal),
    SUM(sal)
FROM
    emp;

-- sum() : NULL �� �����ϰ� �հ� ������     
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    COUNT(sal)
FROM
    emp;

SELECT
    COUNT(comm)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    MAX(sal)
FROM
    emp;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի���
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի���
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

SELECT
    AVG(sal)
FROM
    emp;

SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 30;

-- group by : ��� ���� ���ϴ� ���� ���� ���

-- �μ��� sal ��� ���ϱ�
SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 10;

SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 20;

SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno;
    
-- �μ��� �߰����� ��� ���ϱ�
SELECT
    deptno,
    AVG(comm)
FROM
    emp
GROUP BY
    deptno;
    
    
-- GROUP BY ǥ������ �ƴմϴ�.
--SELECT
--    AVG(sal),
--    deptno,
--    ename
--FROM
--    emp
--GROUP BY
--    deptno;
    
-- GROUP BY + HAVING : group by ���� ������ �� ��
-- HAVING : �׷�ȭ�� ����� ��� ���� �ɶ�

-- �� �μ��� ��å�� ��� �޿� ���ϱ�(��, ��� �޿��� 2000 �̻��� �׷츸 ���)
-- deptno, job, ���

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;
    
-- �׷� �Լ��� �㰡���� �ʽ��ϴ�    
--SELECT
--    deptno,
--    job,
--    AVG(sal)
--FROM
--    emp  
--WHERE
--    AVG(sal) >= 2000
--GROUP BY
--    deptno,
--    job   
--ORDER BY
--    deptno,
--    job;    

-- select ���� ����    
-- 1) from ���� ����  2) where ����  3) group by 4) having 5) select 6) order by

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;




-- EMP ���̺��� �̿��Ͽ� �μ���ȣ(DEPTNO), ��ձ޿�(AVG_SAL), 
-- �ְ�޿�(MAX_SAL), �����޿�(MIN_SAL), �����(CNT)�� ����Ѵ�. 
-- ��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ���ȣ���� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT
    deptno,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS cnt
FROM
    emp
GROUP BY
    deptno;


-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ���

SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

-- ������� �Ի翬��(HIRE_YEAR)�� �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

-- ���� : ���� ���̺��� �ϳ��� ���̺�ó�� ���
-- 1) ��������(inner join) : ���� ���� ���̺��� ����� �κи� ����
--    �� ����� : �� ���� ���� ��ġ�� �� �� ����
--    �� ������ : ������ �ش��� �� �� ����

-- 2) �ܺ�����(outer join)
--    �� left outer join
--    �� right outer join
--    �� full outer join

-- dept : 4 ��, emp : 12 �� ==> 4*12 = 48��
-- ũ�ν� ����(���� �� �ִ� ��� ���� ����)
SELECT
    *
FROM
    emp,
    dept
ORDER BY
    empno;


-- ORA-00918: ���� ���ǰ� �ָ��մϴ�( column ambiguously defined )

-- inner join
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;

-- SQL-99 ǥ��
-- join ~ on

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno;

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

-- SQL-99 ǥ��
-- join ~ on

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;


-- emp, dept inner join, �޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ��� ���� ��ȸ
SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal <= 2500
    AND e.empno <= 9999;


-- SQL-99 ǥ��
-- join ~ on
SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.sal <= 2500
    AND e.empno <= 9999;



-- emp�� salgrade ����
-- emp ���̺��� sal �� salgrade ���̺��� losal �� hisal ������ ���� ���·� ����

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;


-- SQL-99 ǥ��
-- join ~ on

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;



-- self join : �ڱ� �ڽ� ���̺�� ����
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;


-- outer join

-- 1) left outer join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);
    

-- SQL-99 ǥ��
-- join ~ on    

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;    
    

-- 2) right outer join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;
    
    
-- SQL-99 ǥ��
-- join ~ on    

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno; 

-- outer-join�� ���̺��� 1���� ������ �� �ֽ��ϴ�
-- 01468. 00000 -  "a predicate may reference only one outer-joi
--SELECT e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
--FROM emp e1, emp e2
--WHERE e1.mgr(+) = e2.empno(+);

-- SQL-99 ǥ��
-- join ~ on    

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno; 


-- �����ؾ� �� ���̺��� �����϶�

--SELECT *
--FROM table1 t1, table2 t2, table3 t3
--WHERE t1.empno = t2.empno AND t2.deptno = t3.deptno;
--
--
--SELECT *
--FROM table1 t1 join table2 t2 on t1.empno = t2.empno join table3 t3 on t2.deptno = t3.deptno;


-- �޿��� 2000�ʰ��� ������� �μ� ����, ��� ������ �Ʒ��� ���� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal > 2000;

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    e.sal > 2000;
    
-- �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ������� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS cnt
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;

SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS cnt
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;

-- ��� �μ������� ��� ������ �Ʒ��� ���� �μ���ȣ, ����̸� ������ �����Ͽ� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    dept d,
    emp  e
WHERE
    d.deptno = e.deptno (+);

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    dept d
    LEFT OUTER JOIN emp  e ON d.deptno = e.deptno;
    
-- ��������
-- sql ���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� sql �� ���ο��� ����ϴ� select ��
-- 1) ������ �������� 2) ������ �������� 3) ���߿� �������� 

--SELECT ��ȸ�� ��
--FROM ���̺��
--WHERE ���ǽ�(SELECT ��ȸ�� �� FROM ���̺� WHERE ���ǽ�)


-- ������ �޿����� ���� �޿��� �޴� ��� ��ȸ
-- JONES �޿� �˾Ƴ��� / �˾Ƴ� JONES �޿��� ������ ���ǽ�

SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES';  -- 2975

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;


-- ������ �������� : �������� ����� �ϳ��� �� ��ȯ
-- =, >, <, >=, <=, <>, ^=, != ������ ���


-- ������ �޿����� ���� �޿��� �޴� ��� ��ȸ(��������)
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );
    
-- ����̸��� ALLEN �� ����� �߰����� ���� ���� �߰������� �޴� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );
    
-- ����̸��� WARD �� ����� �Ի��Ϻ��� ���� �Ի��� ��� ��ȸ     

SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );    
 
-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��
-- �μ����� ��ȸ
-- �����ȣ, �����, ����, �޿�, �μ���ȣ, �μ���, ����

SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );
 
-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� �۰ų� ���� �޿��� �޴� ������� ��
-- �μ����� ��ȸ 

SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND e.sal <= (
        SELECT
            AVG(sal)
        FROM
            emp
    ); 
 
    
-- ������ �������� : �������� ����� �������� �� ��ȯ 
-- IN, ANY(SOME), ALL, EXISTS ������ ���(������ ���������� ���� ������ ��� �Ұ�)

-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������� ��ȸ

-- �� �μ��� �ְ� �޿�
SELECT
    MAX(sal)
FROM
    emp
GROUP BY
    deptno;

-- ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.    
-- SELECT * FROM emp WHERE sal = (SELECT MAX(sal) FROM emp GROUP BY deptno);    

-- IN : �������� ����� �������� ��� �� �ϳ��� ��ġ�ϸ� TRUE    
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );    
    
-- 30�� �μ� ������� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ

-- ANY(SOME) : �������� ����� �������� ����� �ϳ��̻��̸� TRUE    
SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal < SOME (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- �� ����� ������ ������ �ۼ��� ������ ��Ȳ��
SELECT
    *
FROM
    emp
WHERE
    sal < (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );


-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ

-- �� ������ ��������
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            MIN(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );
-- �� ������ ��������
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );


-- ALL : �������� ��� ����� ���ǽĿ� �¾� �������߸� �������� ���ǽ��� TRUE
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
-- EXISTS : ���� ������ ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 50
    );

-- ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT
    e.job,
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job = (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );
    
    
-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, 
-- �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�(��, ����� �� �޿��� 
-- ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)

SELECT
    e.empno,
    e.ename,
    d.dname,
    e.hiredate,
    d.loc,
    e.sal,
    s.grade
FROM
    emp      e,
    dept     d,
    salgrade s
WHERE
        e.deptno = d.deptno
    AND e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    e.sal DESC,
    e.empno ASC;
    
-- ���߿� �������� : ���������� select ���� ���� �����͸� ���� �� ����

SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );    
    
-- FROM ���� ����ϴ� ��������(�ζ��� ��)
-- FROM ���� ���� ���̺��� ����ؼ� ����ϱ⿡�� ���̺� �� ������ �Ը� Ŭ ��, ���ʿ��� ���� ���� ��
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;
    
    
-- SELECT ���� ����ϴ� ��������(��Į�� ��������)
-- SELECT ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ؾ� ��
SELECT
    empno,
    ename,
    job,
    sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade,
    deptno,
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            e.deptno = dept.deptno
    ) AS dname
FROM
    emp e;
    
-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ����
-- ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT
    e.empno,
    e.ename,
    e.job,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    )
    AND e.deptno = 10;
    
    
-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
-- (��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ���    

-- ������ ��������    
SELECT
    e.empno,
    e.ename,
    e.sal,
    s.grade
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;

SELECT
    e.empno,
    e.ename,
    e.sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS grade
FROM
    emp e
WHERE
    e.sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;    
    
    
    
-- ������ �Լ� ����(IN, any, some, all, exists)    
SELECT
    e.empno,
    e.ename,
    e.sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS grade
FROM
    emp e
WHERE
    e.sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;     
    
-- DML(Data Manipulation Language) : ������ �߰�(INSERT), ����(UPDATE), ����(DELETE)�ϴ� ������ ���۾�
-- COMMIT : DML �۾��� �����ͺ��̽��� ���� �ݿ�
-- ROLLBACK : DML �۾��� ���
-- select + DML ==> ���� ����ϴ� sql ��


-- ������ ���̺� ����
-- ���� ���̺� ����
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

DROP TABLE dept_temp;  

-- ���̸��� ���û�����
-- insert into ���̺��̸�(���̸�1, ���̸�2.....)
-- values(������1, ������2......);


-- dept_temp ���ο� �μ� �߰��ϱ�
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

-- �� �̸� ������ ��
INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

-- INSERT �� ����

-- �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
--INSERT INTO dept_temp
--VALUES(600,'NETWORK','BUSAN');

-- ��ġ�� �������մϴ�
--INSERT INTO dept_temp
--VALUES('NO','NETWORK','BUSAN');

-- ���� ���� ������� �ʽ��ϴ�
--INSERT INTO dept_temp(deptno, dname, loc)
--VALUES(70,'DATABASE');

-- NULL����
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    80,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    90,
    'MOBILE',
    ''
);

-- NULL ������ �÷��� �������� �ʾ���
-- ���Խ� ��ü �÷��� �������� �ʴ´ٸ� �ʵ�� �ʼ�
INSERT INTO dept_temp (
    deptno,
    loc
) VALUES (
    91,
    'INCHEON'
);

SELECT
    *
FROM
    dept_temp;

-- emp_temp ����(emp ���̺� ���� - �����ʹ� ���縦 ���� ���� ��)
-- ������ ����
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    'ȫ�浿',
    'PRESIDENT',
    NULL,
    '2001/01/01',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '������',
    'MANAGER',
    9999,
    '2002-01-05',
    4000,
    NULL,
    20
);
  
-- ��¥ �Է� �� ��/��/�� ���� => ��/��/�� ����
-- ��¥ ������ ������ ���ʿ��� �����Ͱ� ����
--INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
--VALUES(2222,'�̼���','MANAGER',9999,'07/01/2001',4000,NULL,20);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2222,
    '�̼���',
    'MANAGER',
    9999,
    TO_DATE('07/01/2001', 'DD/MM/YYYY'),
    4000,
    NULL,
    20
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    3333,
    '�ɺ���',
    'MANAGER',
    9999,
    sysdate,
    4000,
    NULL,
    30
);

-- ���������� INSERT ����
-- emp, salgrade ���̺��� ���� �� �޿� ����� 1�� ����� emp_temp �� �߰�

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        e.deptno
    FROM
        emp      e,
        salgrade s
    WHERE
        e.sal BETWEEN s.losal AND s.hisal
        AND s.grade = 1;

SELECT
    *
FROM
    emp_temp;

COMMIT; 

    
-- UPDATE : ���̺� �ִ� ������ ����

--UPDATE ���̺��
--SET  �����ҿ��̸� = ������, �����ҿ��̸� = ������.....
--WHERE ������ ���� ��� ���� �����ϱ� ���� ����
    


-- dept_temp loc ���� ��� ���� seoul �� ����
UPDATE dept_temp
SET
    loc = 'SEOUL';

ROLLBACK;

-- ������ �Ϻκ� ���� : where ���
-- dept_temp �μ���ȣ�� 40���� loc ���� ���� seoul �� ����
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 40;


-- dept_temp �μ���ȣ�� 80���� dname �� SALES, LOC ��  CHICAGO
UPDATE dept_temp
SET
    dname = 'SALES',
    loc = 'CHICAGO'
WHERE
    deptno = 80;

SELECT
    *
FROM
    dept_temp;
    
-- emp_temp ����� �߿��� �޿��� 2500������ ����� �߰������� 50���� ����

UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 2500;

-- ���������� ����Ͽ� ������ ����
-- dept ���̺��� 40�� �μ��� dname, loc�� dept_temp 40�� �μ��� dname,loc�� ������Ʈ

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    )
WHERE
    deptno = 40;

COMMIT;

-- DELETE : ���̺� �ִ� ������ ����
--DELETE ���̺��
--FROM (����)
--WHERE ���� �����͸� �����ϱ� ���� ���ǽ�


CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

-- job�� MANAGER �� ��� ����

DELETE FROM emp_temp2
WHERE
    job = 'MANAGER';

-- job�� SALESMAN �� ��� ����
DELETE emp_temp2
WHERE
    job = 'SALESMAN';

-- ��ü ������ ����
DELETE emp_temp2;

ROLLBACK;

-- ���������� ����Ͽ� ����
-- �޿� ����� 3����̰�, 30���μ��� ��� ����

DELETE FROM emp_temp2
WHERE
    empno IN (
        SELECT
            e.empno
        FROM
            emp_temp2 e, salgrade  s
        WHERE
            e.sal BETWEEN s.losal AND s.hisal
            AND s.grade = 3
            AND e.deptno = 30
    );

SELECT
    *
FROM
    emp_temp2;

COMMIT;


/*
    �� EMP ���̺��� ������ �̿��Ͽ� EXAM_EMP ����
    �� DEPT ���̺��� ������ �̿��Ͽ� EXAM_DEPT ����
    �� SALGRADE ���̺��� ������ �̿��Ͽ� EXAM_SALGRADE ����
*/
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;

CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;

CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;

SELECT
    *
FROM
    exam_emp;

SELECT
    *
FROM
    exam_dept;

SELECT
    *
FROM
    exam_salgrade;

-- ���� �Է�
INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7202,
    'TEST_USER2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7203,
    'TEST_USER3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7204,
    'TEST_USER4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7205,
    'TEST_USER5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7206,
    'TEST_USER6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7207,
    'TEST_USER7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7208,
    'TEST_USER8',
    'STUDENT',
    7201,
    '2018-03-09',
    1200,
    NULL,
    80
);

COMMIT;

/* ��������
[�ǽ�3] EXAM_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿�����
���� �޿��� �ް� �ִ� ������� 70�� �μ��� �ű�� SQL �� �ۼ��ϱ�
*/

UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

/* ��������
[�ǽ�4] EXAM_EMP�� ���� ��� �� 60�� �μ��� ��� �߿��� �Ի����� ���� ���� �������
�ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �ű�� SQL �� �ۼ��ϱ�
*/
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );


--[�ǽ�5] EXAM_EMP�� ���� ��� ��, �޿� ����� 5�� ����� �����ϴ� SQL���� �ۼ��ϱ�
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
            exam_emp, salgrade
        WHERE
            sal BETWEEN losal AND hisal
            AND grade = 5
    );


-- Ʈ�����(transaction) : �ּ� ���� ���� 
-- Ʈ����� �����ϴ� ���� TCL(Transaction Control Language) : commit, rollback

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;

INSERT INTO dept_tcl VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

UPDATE dept_tcl
SET
    loc = 'BUSAN'
WHERE
    deptno = 40;

DELETE FROM dept_tcl
WHERE
    dname = 'RESEARCH';

SELECT
    *
FROM
    dept_tcl;

-- Ʈ����� ��� 
ROLLBACK;

-- Ʈ����� ���� �ݿ�
COMMIT;


-- ���� : � Ȱ���� ���� �ð��̳� �Ⱓ
-- �����ͺ��̽� ���� : �����ͺ��̽� ������ �������� �����۾� ������ �� ���� ����
-- LOCK : ���(���� ���� ������ ���� ����)
DELETE FROM dept_tcl
WHERE
    deptno = 50;

UPDATE dept_tcl
SET
    loc = 'SEOUL'
WHERE
    deptno = 30;

SELECT
    *
FROM
    dept_temp;
    
    
-- DDL : ������ ���Ǿ�(������ ���̽� ��ü ����, ����, ����)   
-- 1. ���̺� ���� 
-- CREATE TABLE ���̺��(
--    ���̸�1 �ڷ���,
--    ���̸�2 �ڷ���,
--    ���̸�3 �ڷ���,
--    ���̸�4 �ڷ���
-- );

-- ���̺� ���� / ���̸� ���� ��Ģ
-- 1) ���̺� �̸��� ���ڷ� ����
-- 2) ���̺� �̸��� 30BYTE ����
-- 3) ���� ����� ������ ���̺� �̸��� �ߺ��� �� ����
-- 4) ���̺� �� ����� �� �ִ� Ư�����ڴ� $, #, _ ����
-- 5) SQL Ű����(ex SELECT, FROM, WHERE...)�� ���̺�� ����� �� ����

-- �ڷ���

-- 1. ����
-- VARCHAR2(����) : ���� ���� ���ڿ� ������ ����(�ִ� 4000BYTE)
-- CHAR(����) : ���� ���� ���ڿ� ������ ����
-- NVARCHAR2(����) : ���� ����(unicode) ������ ����
--    name varchar2(10) : ����� 10��, �ѱ��� 3�� ���� �Է�
--    name nvarchar2(10) : ���� 10��, �ѱ� 10�� ���� �Է�
-- NCHAR(����) : ���� ����(unicode)
--    name char(10) : ����� 10��, �ѱ��� 3��, + �޸� 10byte ����
--    name nchar(10) : ����� 10��, �ѱ��� 10��, + �޸� 10byte ����

-- 2. ����
-- NUMBER(��ü�ڸ���,�Ҽ��������ڸ���)

-- 3. ��¥
-- DATE : ��¥,�ð� ����
-- TIMESTAMP

-- 4. ��Ÿ
-- BLOB : ��뷮 ���� ������ ����
-- CLOB : ��뷮 �ؽ�Ʈ ������ ����
-- JSON : JSON ������ ����

CREATE TABLE emp_ddl (
    empno    NUMBER(4),     -- ����� �� 4�ڸ� ����
    ename    VARCHAR2(10),  -- ������� �� 10byte �� ����
    job      VARCHAR2(9),     -- ���� �� 9byte ����
    mgr      NUMBER(4),       -- �Ŵ��� ��ȣ
    hiredate DATE,       -- ��¥/�ð� ����
    sal      NUMBER(7, 2),     -- �޿��� ��ü �ڸ��� 7�ڸ� ����(�Ҽ��� 2�ڸ����� ���)
    comm     NUMBER(7, 2),    -- �߰�����
    deptno   NUMBER(2)     -- �μ���ȣ
);

desc emp_ddl;


-- 2. ���̺� ���� : ALTER
-- 1) �� �߰� : ADD
ALTER TABLE emp_temp2 ADD hp VARCHAR2(20);

-- 2) �� �̸� ���� : RENAME
ALTER TABLE emp_temp2 RENAME COLUMN hp TO tel;

-- 3) �� �ڷ���(����) ���� : MODIFY
ALTER TABLE emp_temp2 MODIFY
    empno NUMBER(5);

-- 4) Ư�� ���� ���� : DROP
ALTER TABLE emp_temp2 DROP COLUMN tel;



-- 3. ���̺� ���� : DROP
DROP TABLE emp_rename;



-- ���̺� �� ����
RENAME emp_temp2 TO emp_rename;

-- ���̺� ������ ��ü ����
DELETE FROM emp_rename;

SELECT
    *
FROM
    emp_rename;

ROLLBACK;

--  rollback �ȵ� : DDL �����̱� ����
TRUNCATE TABLE emp_rename;

-- 
CREATE TABLE member (
    id     CHAR(8),
    name   VARCHAR2(10),
    addr   VARCHAR2(50),
    nation NCHAR(4),
    email  VARCHAR2(50),
    age    NUMBER(7, 2)
);

ALTER TABLE member ADD bigo VARCHAR2(20);

ALTER TABLE member MODIFY
    bigo VARCHAR2(30);

ALTER TABLE member RENAME COLUMN bigo TO remark;

DROP TABLE member;


-- "SCOTT"."MEMBER"."NATION" ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 4)
INSERT INTO member VALUES (
    'hong1234',
    'ȫ�浿',
    '����� ���α� ������',
    '���ѹα�',
    'hong123@naver.com',
    25,
    NULL
);


-- ������ ���̽� ��ü
-- ���̺�, �ε���, ��, ������ ����, ������, �ó��, ���ν���, �Լ�, ��Ű��, Ʈ����
-- ���� : create, ���� : alter, ���� : drop

-- �ε��� : �� ���� �˻��� ������
-- �ε��� : ����ڰ� ���� Ư�� ���̺� ���� ���� ����
--          �⺻Ű(Ȥ�� unique key) �� �����ϸ� �ε����� ����

-- CREATE INDEX �ε����̸� ON ���̺��(�ε����� ����� ���̸�)

-- emp ���̺��� sal ���� �ε����� ����
CREATE INDEX idx_emp_sal ON
    emp (
        sal
    );

-- select : �˻����
-- FULL Scan
-- Index Scan

SELECT
    *
FROM
    emp
WHERE
    empno = 7900;


-- �ε��� ����
DROP INDEX idx_emp_sal;

-- View : ���� ���̺�
-- ���� : SELECT ���� ���⵵�� ��ȭ�ϱ� ����
-- ���ȼ� : ���̺��� Ư�� ���� �����ϰ� ���� ���� ��

-- CREATE[OR REPLACE]  [FORCE | NOFORCE] VIEW ���̸�(���̸�1,���̸�2...)
-- AS (������ SELECT ����) 
-- [WITH CHECK OPTION]
-- [WITH READ ONLY]

-- SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20 ��� ����
CREATE VIEW vm_emp20 AS
    (
        SELECT
            empno,
            ename,
            job,
            deptno
        FROM
            emp
        WHERE
            deptno = 20
    );


-- ���������� ���
SELECT
    *
FROM
    (
        SELECT
            empno,
            ename,
            job,
            deptno
        FROM
            emp
        WHERE
            deptno = 20
    );

-- �� ���
SELECT
    *
FROM
    vm_emp20;


-- �� ���� 
DROP VIEW vm_emp20;

-- �� ���� �� �б⸸ ����
CREATE VIEW vm_emp_read AS
    SELECT
        empno,
        ename,
        job
    FROM
        emp
WITH READ ONLY;

-- VIEW �� INSERT �۾�?
INSERT INTO vm_emp20 VALUES (
    8888,
    'KIM',
    'SALES',
    20
);
-- ���� ������ �Ͼ
SELECT
    *
FROM
    emp;

-- �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.
INSERT INTO vm_emp_read VALUES (
    9999,
    'KIM',
    'SALES'
);

-- �ζ��� �� : ��ȸ������ ���� ����ϴ� ��
-- rownum : ��ȸ�� ������� �Ϸù�ȣ �ű�

SELECT
    ROWNUM,
    e.*
FROM
    emp e;

SELECT
    ROWNUM,
    e.*
FROM
    (
        SELECT
            *
        FROM
            emp e
        ORDER BY
            sal DESC
    ) e;

-- �޿� ���� ���� �� ��� ��ȸ
SELECT
    ROWNUM,
    e.*
FROM
    (
        SELECT
            *
        FROM
            emp e
        ORDER BY
            sal DESC
    ) e
WHERE
    ROWNUM <= 3;


-- ������ : ��Ģ�� ���� ���� ����
-- CREATE SEQUENCE �������̸�; (�������ϴ� �͵��� �� �⺻������ ����)

--CREATE SEQUENCE ��������
--[INCREMENT BY ����]  �⺻�� 1
--[START WITH ����]    �⺻�� 1
--[MAXVALUE ���� | NOMAXVALUE ]
--[MINVALUE ���� | NOMINVALUE]
--[CYCLE | NOCYCLE ]   CYCLE �� ��� MAXVALUE�� ���� �ٴٸ��� ���۰����� �ٽ� ����
--[CACHE ���� | NOCACHE ]  �������� ������ ��ȣ�� �̸� �޸𸮿� �Ҵ��� ����(�⺻ CACHE 20)

CREATE TABLE dept_sequence
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

CREATE SEQUENCE seq_dept_sequence INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0 NOCYCLE CACHE 2;

-- ������ ��� : �������̸�.CURRVAL(���������� ������ ������ ��ȸ), �������̸�.NEXTVAL(������ ����)

-- �μ���ȣ �Է½� ������ ���
INSERT INTO dept_sequence (
    deptno,
    dname,
    loc
) VALUES (
    seq_dept_sequence.NEXTVAL,
    'DATABASE',
    'SEOUL'
);

SELECT
    *
FROM
    dept_sequence;

-- �ִ밪 90 ���� ����
-- ������ SEQ_DEPT_SEQUENCE.NEXTVAL exceeds MAXVALUE : NOCYCLE �ɼ����� �����߱� ������ ��ȣ�� ��ȯ���� ����

-- ������ ����
DROP SEQUENCE seq_dept_sequence;

CREATE SEQUENCE seq_dept_sequence INCREMENT BY 3 START WITH 10 MAXVALUE 99 MINVALUE 0 CYCLE CACHE 2;

SELECT
    seq_dept_sequence.CURRVAL
FROM
    dual;
    
-- synonym(���Ǿ�) : ���̺�, ��, ������ �� ��ü �̸� ��� ����� �� �ִ� �ٸ� �̸��� �ο��ϴ� ��ü  

-- EMP ���̺��� ��Ī�� E �� ����    
CREATE SYNONYM e FOR emp; 

-- PUBLIC : ���Ǿ �����ͺ��̽� �� ��� ����ڰ� ����� �� �ֵ��� ���� 
-- CREATE [PUBLIC] SYNONYM E FOR EMP;  

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    e;

DROP SYNONYM e;
 
 
--[�ǽ�1] ���� SQL���� �ۼ��� ������
--�� EMP���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� �����Ͻÿ�.

CREATE TABLE empidx
    AS
        SELECT
            *
        FROM
            emp;

--�� ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�.
CREATE INDEX idx_empidx_empno ON
    empidx (
        empno
    );

--������ ���� �並 ���� �ε��� Ȯ��
SELECT
    *
FROM
    user_indexes;


--[�ǽ�2] �ǽ�1���� ������ EMPIDX ���̺��� ������ �� �޿��� 1500 �ʰ��� 
--����鸸 ����ϴ� EMPIDX_OVER15K �並 �����Ͻÿ�. 
--(�����ȣ, ����̸�, ��å,�μ���ȣ,�޿�,�߰����� ���� ������ �ִ�)
CREATE VIEW empidx_over15k AS
    (
        SELECT
            empno,
            ename,
            job,
            deptno,
            sal,
            comm
        FROM
            empidx
        WHERE
            sal > 1500
    );



--[�ǽ�3] ���� SQL���� �ۼ��� ������
--�� DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��Ͻÿ�.


CREATE TABLE deptseq
    AS
        SELECT
            *
        FROM
            dept;

--�� ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� �Ʒ��� ���õ� Ư���� ���� ������ ���ÿ�.
--�μ� ��ȣ�� ���۰� : 1
--�μ� ��ȣ�� ���� : 1
--�μ� ��ȣ�� �ִ� : 99
--�μ� ��ȣ�� �ּҰ� : 1
--�μ� ��ȣ �ִ񰪿��� ���� �ߴ�
--ĳ�� ����

CREATE SEQUENCE seq_dept START WITH 1 INCREMENT BY 1 MAXVALUE 99 MINVALUE 1 NOCYCLE NOCACHE;


--������ ���� �並 ���� ������ Ȯ��
SELECT
    *
FROM
    user_sequences;


-- �������� : ���̺��� Ư�� ���� ����
--            NULL ��� / �����, ������ ��, ���ǽ��� �����ϴ� �����͸� �Է� ����...
--            ������ ���Ἲ(������ ��Ȯ��, �ϰ��� ����) ���� ==> DML �۾� �� ���Ѿ� ��
--            ���� ���Ἲ, ��ü ���Ἲ, ���� ���Ἲ
--            ���̺� ���� �� �������� ����, OR ���� �Ŀ� ALTER �� ���� �߰�, ���� ����

-- 1) NOT NULL : �� ��� �Ұ�
-- ����ڷκ��� �Է°��� �ʼ��� �ԷµǾ�� �� ��
CREATE TABLE table_notnull (
    login_id  VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

INSERT INTO table_notnull (
    login_id,
    login_pwd
) VALUES (
    'hong123',
    'hong123'
);

-- ORA-01400: NULL�� ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") �ȿ� ������ �� �����ϴ�
INSERT INTO table_notnull (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    NULL,
    '010-1234-1234'
);

SELECT
    *
FROM
    table_notnull;
    
-- ��ü �������� ��ȸ  
SELECT
    *
FROM
    user_constraints;
    
    
-- �������� + �������� �� ����    
CREATE TABLE table_notnull2 (
    login_id  VARCHAR2(20)
        CONSTRAINT tblnn2_login_nn NOT NULL,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblnn2_lgpwd_nn NOT NULL,
    tel       VARCHAR2(20)
);    
 
-- ������ ���̺� �������� �߰�
-- (SCOTT.) ������� ���� �Ұ� - �� ���� �߰ߵǾ����ϴ�.
-- �̹� ���Ե� �����͵� üũ ����� �Ǳ� ��
ALTER TABLE table_notnull MODIFY (
    tel NOT NULL
);

ALTER TABLE table_notnull2 MODIFY (
    tel
        CONSTRAINT tblnn2_tel_nn NOT NULL
);

UPDATE table_notnull
SET
    tel = '010-1234-5678'
WHERE
    login_id = 'hong123';
    
-- �������� �� ����
ALTER TABLE table_notnull2 RENAME CONSTRAINT tblnn2_tel_nn TO tblnn3_tel_nn;
    
-- �������� �� ����    
ALTER TABLE table_notnull2 DROP CONSTRAINT tblnn3_tel_nn;
 
 
-- 2) UNIQUE : �ߺ����� �ʴ� ��(null ���� ����)
--             ���̵�, ��ȭ��ȣ

CREATE TABLE table_unique (
    login_id  VARCHAR2(20) UNIQUE,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    'hong123',
    '010-1234-1234'
);

-- login_id �� �ߺ��� ��Ȳ�� �� : unique ����
-- ���Ἲ ���� ����(SCOTT.SYS_C008364)�� ����˴ϴ�
INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    NULL,
    'hong123',
    '010-1234-1234'
);

SELECT
    *
FROM
    table_unique;

-- ���̺� ���� �������� ����, ����, ���� not null ���¿� ������


--3) PRIMARY KEY(PK) : UNIQUE + NOT NULL
CREATE TABLE table_primary (
    login_id  VARCHAR2(20) PRIMARY KEY,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

-- PRIMARY KEY ==> INDEX �ڵ� ���� ��

-- NULL�� ("SCOTT"."TABLE_PRIMARY"."LOGIN_ID") �ȿ� ������ �� �����ϴ�
INSERT INTO table_primary (
    login_id,
    login_pwd,
    tel
) VALUES (
    NULL,
    'hong123',
    '010-1234-1234'
);

INSERT INTO table_primary (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    'hong123',
    '010-1234-1234'
);

-- 4) �ܷ�Ű : Foreign key(FK) : �ٸ� ���̺� �� ���踦 �����ϴµ� ���
--             Ư�� ���̺��� primary key ���������� ������ ���� �ٸ� ���̺��� Ư�� ������ ����

-- ��� �߰� �� �μ� ��ȣ �Է��� �ؾ� �� => dept ���̺��� deptno �� ����

-- �θ� ���̺�
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

-- �ڽ� ���̺�
-- REFERENCES ���������̺��(������ ��) : �ܷ�Ű ����
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));
    
-- ���Ἲ ��������(SCOTT.EMPFK_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
INSERT INTO EMP_FK VALUES(1000, 'TEST', 'SALES', 10);

-- �ܷ�Ű ���� ����
-- �θ� ���̺� �����Ͱ� ������ ���� �Է�

INSERT INTO DEPT_FK VALUES(10, 'DATABASE', 'SEOUL');

-- ���� �� 
-- �ڽ� ���̺� ������ ���� ����
-- �θ� ���̺� ������ ����

-- ���Ἲ ��������(SCOTT.EMPFK_DEPTNO_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- DELETE FROM DEPT_FK WHERE DEPTNO=10;


-- �ܷ� Ű �������� �ɼ�
-- ON DELETE CASCADE : �θ� �����Ǹ� �θ� �����ϴ� �ڽ� ���ڵ嵵 ���� ����
-- ON DELETE SET NULL : �θ� �����Ǹ� �θ� �����ϴ� �ڽ� ���ڵ��� ���� NULL ����

CREATE TABLE DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK2 PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK2 PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK2(DEPTNO) ON DELETE CASCADE);
    
INSERT INTO DEPT_FK2 VALUES(10, 'DATABASE', 'SEOUL');
INSERT INTO EMP_FK2 VALUES(1000, 'TEST', 'SALES', 10);

DELETE FROM DEPT_FK2 WHERE DEPTNO=10;

-- 5) CHECK : ���� ������ �� �ִ� ���� ���� �Ǵ� ���� ����
-- ��й�ȣ�� 3 �ڸ����� Ŀ�� �Ѵ�

CREATE TABLE table_CHECK (
    login_id  VARCHAR2(20) PRIMARY KEY,
    login_pwd VARCHAR2(20) CHECK (LENGTH(LOGIN_PWD) > 3),
    tel       VARCHAR2(20)
);
-- üũ ��������(SCOTT.SYS_C008373)�� ����
INSERT INTO TABLE_CHECK VALUES('TEST','123','010-1234-5678');

INSERT INTO TABLE_CHECK VALUES('TEST','1234','010-1234-5678');


-- 6) DEFAULT : �⺻�� ����
CREATE TABLE table_default (
    login_id  VARCHAR2(20) PRIMARY KEY,
    login_pwd VARCHAR2(20) DEFAULT '1234',
    tel       VARCHAR2(20)
);

INSERT INTO TABLE_DEFAULT VALUES('TEST',NULL,'010-1234-5678');
INSERT INTO TABLE_DEFAULT(login_id, tel) VALUES('TEST1','010-1234-5678');

SELECT * FROM TABLE_DEFAULT;

commit;











