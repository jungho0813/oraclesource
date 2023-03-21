-- employee ���̺� ��ü���� ��ȸ
SELECT
    *
FROM
    employees;
   
-- employee ���̺� first_name, last_name, job_id �� ��ȸ
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;
   
-- �����ȣ�� 176�� ����� LAST_NAME ��ȸ
SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

-- ������ 12000 �̻� �Ǵ� �������� LAST_NAME,SALARAY ��ȸ
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- ������ 5000 ���� 12000 ������ �ƴ� ������� LAST_NAME, SALARY ��ȸ
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000
    OR salary <= 5000
ORDER BY
    salary;
    
-- 20, 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME, �μ���ȣ�� ������������ ��ȸ
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name,
    department_id;
 

-- Ŀ�̼��� �޴� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ(������ ��������, Ŀ�̼� ��������)
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;

-- ������ 2500,3500,7000�� �ƴϸ� ������ SA_REP �� ST_CLERK �� ��� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� last_name, ���, ������� ��ȸ
-- ������� �������� ����
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date <= '2008-05-01'
ORDER BY
    hire_date DESC;

-- 2004�⵵�� ���� ������� last_name, hire_date ��ȸ
-- ������� �������� ����
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date;

-- �μ��� 20,50 �̰� ������ 5000~12000������ ������� LAST_NAME, SALARY��ȸ ���� �������� ����
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000
ORDER BY
    salary;

-- 2004�⵵ �Ի��� : like���
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date like '04%'
ORDER BY
    hire_date;
    
-- last_name �� u�� ���Ե� ������� ���, last_name��ȸ
select last_name from employees where last_name like '%u%';
-- last_name �� �׹�° ���ڰ� a�� ������� last_name��ȸ
select last_name from employees where last_name like '___a%';
-- last_name�� a Ȥ�� e ���ڰ� ���Ե� ������� last_name��ȸ
-- last_name �������� ����
select last_name from employees where last_name like '%a%' or last_name like '%e%' order by last_name;
-- last_name �� a�� e ���ڰ� ���Ե� ������� last_name ��ȸ
select last_name from employees where last_name like '%a%' and last_name like '%e%' order by last_name;

-- �Ŵ���(manager_id)�� ���� ������� last_name, job_id��ȸ
select last_name,job_id from employees where manager_id is null;
-- job_id�� ST_CLERK �� ����� �μ���ȣ ��ȸ(�� �μ���ȣ�� null�� ����� �����Ѵ�.)
-- �ߺ��� ������ �� �μ���ȣ�� ��ȸ
select distinct department_id from employees where department_id is not null and job_id = 'ST_CLERK';
-- commission_pct null�� �ƴ� ����� �߿��� commission = salary * commission_pct�� ���Ͽ�
-- employee_id, first_name, job_id ���
select employee_id,first_name,job_id,commission_pct * salary commission from employees where commission_pct is not null;

-- ȸ�� ���� �ִ� ���� �� �ּ� ������ ���̸� ���
select max(salary)-min(salary) sal_gap from employees;
-- �Ŵ����� �ٹ��ϴ� ������� �Ѽ��� ���(�Ŵ��� �ߺ� ����)
select count(distinct manager_id) from employees;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    