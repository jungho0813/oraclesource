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

SELECT
    length('�ѱ�'), -- ����
    lengthb('�ѱ�') --����Ʈ ��
FROM
    dual;

-- SUBSTR(���ڿ�������, ������ġ, �������) : ������̴� ��������
-- ���ڿ� �Ϻ� ����

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

-- INSTR : ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã��
-- INSTR(����ڿ�, ��ġ�� ã������ ���ڿ�, ����ڿ����� ã�⸦ ������ ��ġ(����), ������ġ���� ã������ ���ڰ� ���°���� ����(����))

-- HELLO, ORACLE ���ڿ����� L ���ڿ� ã��
SELECT
    instr('HELLO, ORACLE', 'L')       AS instr_1,
    instr('HELLO, ORACLE', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE', 'L', 2, 2) AS instr_3
FROM
    dual;

-- replace : Ư�� ���ڸ� �ٸ� ���ڷ� ����
-- replace(���ڿ�������, ã�¹���, ���湮��)
SELECT
    '010-1234-5678'                    AS ������,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;

SELECT
    '�̰��� oracle �̴�',
    replace('�̰��� oracle �̴�', '�̰���', 'This is')
FROM
    dual;

-- concat : �� ���ڿ� ������ ��ġ��
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno,
           concat(' : ', ename))
FROM
    emp;

-- || : : ���ڿ� ���� ������
SELECT
    empno || ename,
    empno
    || ' : '
    || ename
FROM
    emp;

-- TRIM, LTRIM, RTRIM : ���� ���� Ư������ ����
SELECT
    '               �̰���            ',
    TRIM('               �̰���            ')
FROM
    dual;

-- �����Լ�
-- ROUND, TRUNC, CEIL, FLOOR, MOD

-- ROUND : �ݿø�
SELECT
    round(1234.5678)      round,                       --�Ҽ��� ù°�ڸ����� �ݿø�
    round(1234.5678, 0)   round0,                      --�Ҽ��� ù°�ڸ����� �ݿø�
    round(1234.5678, 1)   round1,                      --�Ҽ��� ��°�ڸ����� �ݿø�
    round(1234.5678, 2)   round2,                      --�Ҽ��� ��°�ڸ����� �ݿø�
    round(1234.5678, - 1) round_minus1,             --�ڿ��� ù°�ڸ����� �ݿø�
    round(1234.5678, - 2) round_minus2              --�ڿ��� ��°�ڸ����� �ݿø�
FROM
    dual;

-- TRUNC : Ư����ġ���� ������ �Լ�
-- TRUNC : (����, ������ġ(����))
SELECT
    trunc(1234.5678)      trunc,                        --�Ҽ��� ù°�ڸ����� ����
    trunc(1234.5678, 0)   trunc0,                      --�Ҽ��� ù°�ڸ����� ����
    trunc(1234.5678, 1)   trunc1,                      --�Ҽ��� ��°�ڸ����� ����
    trunc(1234.5678, 2)   trunc2,                      --�Ҽ��� ��°�ڸ����� ����
    trunc(1234.5678, - 1) trunc_minus1,             --�ڿ��� ù°�ڸ����� ����
    trunc(1234.5678, - 2) trunc_minus2              --�ڿ��� ��°�ڸ����� ����
FROM
    dual;

-- CEIL(����), FLOOR(����) : �Էµ� ���ڿ� ���� ����� ū ����, ���� ����

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

-- ��¥ ������ + ��¥ ������ : ���� �Ұ�

-- sysdate �Լ� : ����Ŭ �����ͺ��̽� ������ ��ġ�� os�� ���� ��¥�� �ð�
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

-- add_months() : ��� ���� ��¥ ���ϱ�
SELECT
    sysdate,
    add_months(sysdate, 1)
FROM
    dual;

-- �Ի�50�ֳ��� �Ǵ� ��¥ ���ϱ�
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600) AS �Ի�50�ֳ�
FROM
    emp;
    
-- �Ի� 45�� �̸��� ��� ������ ��ȸ
SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;
    
-- ���� ��¥�� 6���� �� ��¥���
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
    months_between(hiredate, sysdate)        AS month1,
    months_between(sysdate, hiredate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;

-- next_day(��¥,����) : Ư�� ��¥�� �������� ���ƿ��� ������ ��¥ ���
-- last_day(��¥) : Ư�� ��¥�� ���� ���� ������ ��¥�� ���
SELECT
    sysdate,
    next_day(sysdate, '�ݿ���'),
    last_day(sysdate)
FROM
    dual;

SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;
    
-- ����ȯ �Լ�: �ڷ����� �� ��ȯ
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
--select empno,ename, 'abcd'+empno
--from emp
--where ename = 'FORD';

-- TO_CHAR() : ���� �Ǵ� ��¥ �����͸� ���ڷ� �����ͷ� ��ȯ
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ
-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ

-- TO_CHAR()
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

-- TO_NUBER(���ڵ�����, �ν��� ��������)
-- �ڵ� ����ȯ
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;
    
-- �ڵ�����ȯ �ȵǴ� ��Ȳ
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
    dual;
    
-- sal �ʵ忡 , �� ��ȭǥ�ø� �ϰ�ʹٸ�
SELECT
    sal,
    to_char(sal, '$999,999')
FROM
    emp;

-- to_date(���ڿ�������,'�νŵ� ��¥ ����')_
SELECT
    TO_DATE('2018-07-14', 'YYYY-MM-DD')
FROM
    dual;

-- NVL(������, ���� ��� ��ȯ�� ������)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0)
FROM
    emp;

-- DECODE�Լ�/ CASE��

-- DECODE(�˻� ����� �� ������,
--             ����1, ����1�� ��ġ�Ҷ� ������ ����
--             ����2, ����2�� ��ġ�Ҷ� ������ ����)

-- emp ���̺��� ��å�� MANAGER �� ����� �޿��� 10%�λ�, SALESMAN�� ����� 5% �λ�, ANALYST �� ����� �״��, �������� 3%�λ�
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

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    nvl(to_char(comm),
        'N/A')      AS comm,
    next_day((add_months(hiredate, 3)),
             '������') AS r_job
FROM
    emp;

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
    
-- ������ �Լ� : sum, count, max, min, avg
--select ename, sum(sal) from emp;

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

-- sum() : null �� �����ϰ� �հ� ������

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
    MAX(sal)
FROM
    emp;

SELECT
    MAX(hiredate)
FROM
    emp;

-- �μ���ȣ�� 20�� ����� �Ի����� ����  ������ �Ի���
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

-- group by : ��� ���� ���ϴ� ���� ���� ���
-- �μ��� sal ���
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno;

-- group by + having : group by ���� ������ �ٶ�
-- having : �׷�ȭ�� ����� ������Ѱɶ�

-- �� �μ��� ��å�� ��� �޿�(��, ��� �޿��� 2000 �̻��� �׷츸 ���)
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

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
WHERE
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal),
    MIN(sal),
    COUNT(deptno)
FROM
    emp
GROUP BY
    deptno;

SELECT
    to_char(hiredate, 'YYYY'),
    deptno,
    COUNT(*)
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

-- ���� : ���� ���̺��� �ϳ��� ���̺�ó�� ���
-- 1) �������� (inner join)
--                1. ����� : �ΰ��� ���� ��ġ�� �� �� ����
--                2. ������ : ������ �ش��� �� �� ����

-- 2) �ܺ����� (outer join)
--                1. left outer join
--                2. right outer join
--                3. full outer join

SELECT
    *
FROM
    emp,
    dept
ORDER BY
    empno;


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
    
-- SQL-99
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

-- emp, dept inner join, �޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ������� ��ȸ
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

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

-- self join : �ڱ� �ڽ� ���̺�� ����
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.ename mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

-- outer join

-- 1) left outher join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.ename mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);
    
--SQL-99 ǥ��
--join~on
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.ename mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

-- 2) right outher join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.ename mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

-- 3) full outher join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.ename mgr_ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;
    
-- �����ؾ��� ���̺��� �����϶�
--select *
--from table1 t1, table2 t2, table3 t3
--where t1.empno = t2.empno and t2.deptno = t3.deptno;
--    
--select *
--from table1 t1 join table2 t2 on t1.empno = t2.empno join table3 t3 on t2.deptno = t3.deptno;

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
    AND sal >= 2000;

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
    e.sal >= 2000;

SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)) avg_sal,
    MAX(sal) max_sal,
    MIN(sal) min_sal,
    count(*) cnt
FROM
    emp  e,
    dept d
    where e.deptno = d.deptno
GROUP BY
    d.deptno, d.dname;
    
select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from emp e , dept d where e.deptno = d.deptno
order by deptno,ename;
    
 -- ��������
 -- sql ���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� sql �� ���ο��� ����ϴ� select ��
 -- 1. ������ �������� 2. ������ �������� 3. ���߿� �������� 4. 
 
 -- select ��ȸ�� ��
 -- from ���̺��
 -- where ���ǽ�(select ��ȸ�� �� from ���̺� where ���Ǽ�)
 
 
 -- ������ �������� : �������� ����� �ϳ��� �� ��ȯ
 
 -- ������ �޿����� ���� �޿��� �޴� ��� ��ȸ
 -- JONES �޿� �˾Ƴ��� / �˾Ƴ� JONES �� �޿��� ������ ���ǽ�
 
 select sal from emp where ename = 'JONES';
 
 select * from emp where sal > (select sal from emp where ename = 'JONES');
    
-- ����̸��� ALLEN �� ����� �߰����纸�� ���� �߰������� �޴� ��� ��ȸ

select * from emp where comm > (select comm from emp where ename = 'ALLEN');
    
-- ����� ���� WARD�� ����� �Ի��Ϻ��� ���� �Ի��� ��� ��ȸ  
select * from emp where hiredate < (select hiredate from emp where ename = 'WARD');


-- ������ �������� : �������� ����� �������� �� ��ȯ
-- In, ANY(SMOME), ALL, EXISTS ������ ���

--�� �μ��� �ְ� �޿�
select max(sal) from emp group by deptno;

select * from emp where sal in (select max(sal) from emp group by deptno);

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ������ȸ
-- ������ ��������
select * from emp where sal > (select min(sal) from emp where deptno =30);
-- ������ ��������
select * from emp where sal > any (select sal from emp where deptno =30);

-- ALL : �������� ��� ����� ���ǽĿ� �¾� �������߸� �������� �������� TRUE
select * from emp where sal > all (select sal from emp where deptno =30);

-- EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
select * from emp where exists (select dname from dept where deptno=10);

select * from emp where exists (select dname from dept where deptno=50);

select * from emp where job = (select job from emp where ename = 'ALLEN');

select e.empno,e.ename,d.dname,e.hiredate,d.loc,e.sal,s.grade
from emp e,dept d,salgrade s where e.deptno = d.deptno and e.sal BETWEEN s.losal AND s.hisal and sal > (select avg(sal) from emp);

-- ���߿� �������� : ���������� select ������ ���� �����͸� ��� ����
select * from emp where sal in (select deptno,max(sal) from emp group by deptno);

-- FROM ���� ����ϴ� ��������(�ζ��� ��)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) e10,
        (select * from dept) d
where e10.deptno = d.deptno;

-- SELECT ���� ����ϴ� ��������(��Į�� ��������)
-- SELECT ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ؾ� ��
select empno, ename, job,sal,(select grade from salgrade where e.sal between losal and hisal) slagarde,deptno,(select dname from dept where e.deptno = dept.deptno) dname
from emp e;

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d where e.deptno = d.deptno and e.job not in(select job from emp where deptno=30) and e.deptno = 10;

-- ������ ��������
select e.empno, e.ename, e.job, e.sal,s.grade
from emp e, salgrade s where e.sal between s.losal and s.hisal and e.sal > (select max(sal) from emp where job = 'SALESMAN')
order by e.empno;

-- ������ ��������
select e.empno, e.ename, e.job, e.sal,s.grade
from emp e, salgrade s where e.sal between s.losal and s.hisal and e.sal > all (select sal from emp where job = 'SALESMAN')
order by e.empno;

-- DML (Data Mainpulation Language) : ������ �߰� (INSERT), ����(UPDATE), ����(DELETE)�ϴ� ������ ���۾�
-- select + DML ==> ���� ����ϴ� sql

-- ������ ���̺� ����
-- ���� ���̺� ����
create table dept_temp as select * from dept;

-- ���̺� ����
drop table dept_temp;

-- insert into ���̺��̸�(���̸�1,���̸�2.....)  : ���̸��� ���û���
-- values(������1, ������2....);

-- dept_temp ���ο� �μ� �߰��ϱ�
insert into dept_temp(deptno, dname, loc)
values(50,'DATABASE','SEOUL');

-- �� �̸� ������ ��
insert into dept_temp
values(60,'NETWORK','BUSAN');

-- insert �� ����

-- �� ���� ���� ������ ��ü �ڸ������� ū���� ���˴ϴ�.
--insert into dept_temp
--values(600,'NETWORK','BUSAN');

-- ��ġ�� �������մϴ�
--insert into dept_temp
--values('NO','NETWORK','BUSAN');

-- ���� ���� ������� �ʽ��ϴ�
--insert into dept_temp(deptno, dname, loc)
--values(50,'DATABASE');

insert into dept_temp(deptno, dname, loc)
values(80,'WEB',NULL);

insert into dept_temp(deptno, dname, loc)
values(90,'MOBILE','');

insert into dept_temp(deptno, loc)
values(91,'INCHEON');

select * from dept_temp;

-- emp_temp ����(emp ���̺� ���� - �����ʹ� ���縦 ���� ������)
-- ������ ����
create table emp_temp as select * from emp where 1 <> 1;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (1111,'������','MANAGER',9999,'2002/01/05',4000,NULL,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (2222,'�̼���','MANAGER',9999,to_date('07/01/2001','DD/MM/YYYY'),4000,NULL,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3333,'�ɺ���','MANAGER',9999,sysdate,4000,NULL,20);

-- ���������� insert ����
-- emp, slagrade ���̺��� ���� �� �޿� ����� 1�λ���� emp_tmep�� �߰�
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno from emp e, salgrade s where e.sal between s.losal and s.hisal and s.grade =1;

select * from emp_temp;

-- UPDATE : ���̺� �ִ� ������ ����

--update ���̺�� set �����ҿ��̸� = ������, �����ѿ��̸� = ������.... where ���������� ��� ���� �����ϱ� ���� ����


















