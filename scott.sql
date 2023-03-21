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
where
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;
    
select deptno,floor(avg(sal)) as avg_sal,max(sal),min(sal),count(deptno) from emp group by deptno;

select to_char(hiredate,'YYYY'), deptno, count(*) from emp group by to_char(hiredate,'YYYY'), deptno;