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
    hire_date LIKE '04%'
ORDER BY
    hire_date;
    
-- last_name �� u�� ���Ե� ������� ���, last_name��ȸ
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
-- last_name �� �׹�° ���ڰ� a�� ������� last_name��ȸ
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
-- last_name�� a Ȥ�� e ���ڰ� ���Ե� ������� last_name��ȸ
-- last_name �������� ����
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
-- last_name �� a�� e ���ڰ� ���Ե� ������� last_name ��ȸ
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%'
ORDER BY
    last_name;

-- �Ŵ���(manager_id)�� ���� ������� last_name, job_id��ȸ
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;
-- job_id�� ST_CLERK �� ����� �μ���ȣ ��ȸ(�� �μ���ȣ�� null�� ����� �����Ѵ�.)
-- �ߺ��� ������ �� �μ���ȣ�� ��ȸ
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
    department_id IS NOT NULL
    AND job_id = 'ST_CLERK';
-- commission_pct null�� �ƴ� ����� �߿��� commission = salary * commission_pct�� ���Ͽ�
-- employee_id, first_name, job_id ���
SELECT
    employee_id,
    first_name,
    job_id,
    commission_pct * salary commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- ȸ�� ���� �ִ� ���� �� �ּ� ������ ���̸� ���
SELECT
    MAX(salary) - MIN(salary) sal_gap
FROM
    employees;
-- �Ŵ����� �ٹ��ϴ� ������� �Ѽ��� ���(�Ŵ��� �ߺ� ����)
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;
    
-- join
-- �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��� ã�� (self join - employees)

SELECT
    e1.last_name,
    e1.hire_date,
    e1.manager_id   
FROM
    employees e1,
    employees e2
WHERE
        e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;
-- ���� �̸��� T�� �����ϴ� ������ ��� ������� ���, last_name, �μ���ȣ, ������ȸ
-- employees, departments, locations inner join

select e.EMPLOYEE_ID,e.last_name,e.DEPARTMENT_ID,l.city
from employees e, departments d  ,locations l where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l. LOCATION_ID and city like 'T%';

-- ��ġ id�� 1700�� ������� ���, last_name, �μ���ȣ, �޿� ��ȸ
-- employees, departments inner join
select  e.EMPLOYEE_ID,e.last_name,e.DEPARTMENT_ID,e.SALARY,d.LOCATION_ID
from employees e ,  departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID and  d.LOCATION_ID = 1700;

-- �μ���, ��ġid, �� �μ��� ��� �Ѽ�, �� �μ��� ��� ���� ��ȸ
-- ��� ������ �Ҽ��� 2�ڸ� ������
-- employees, departments inner join
select d.DEPARTMENT_NAME,d.DEPARTMENT_ID,trunc(avg(e.SALARY),2),count(*)
from employees e ,  departments d  where e.DEPARTMENT_ID = d.DEPARTMENT_ID group by d.DEPARTMENT_NAME,d.DEPARTMENT_ID;

-- Executive �μ��� �ٹ��ϴ� ������� �μ���ȣ, last_name,job_id ��ȸ
-- employees, departments inner join
select d.department_id,d.department_name,e.last_name,e.job_id
from employees e ,  departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.department_name = 'Executive';

-- �� ����� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� �������
-- �μ���ȣ, �̸�(first_name�� last_name�����ϱ�), salary, hire_date ��ȸ
SELECT
    distinct e1.department_id,
    e1.first_name || ' ' || e1.last_name name,
    e1.hire_date,
    e1.manager_id,
    e1.salary
FROM
    employees e1,
    employees e2
WHERE
        e1.department_id = e2.department_id and e1.hire_date < e2.hire_date and e1.salary < e2.salary;

-- ��������
-- LAST_NAME �� u�� ���Ե� ������ ���� �μ��� �ٹ��ϴ� ���, last_name��ȸ
select DEPARTMENT_ID,last_name from employees where department_id in(select DISTINCT DEPARTMENT_ID from employees where last_name like '%u%');

-- job_id �� SA_MAN �� ������� �ִ� �������� ���� �޴� ������� last_name, job_id, salary ��ȸ
select last_name,job_id,salary from employees where salary > (select max(salary) from employees where job_id = 'SA_MAN');

-- Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� last_name, department_id, salary��ȸ
select last_name, department_id,salary,commission_pct from employees
where (department_id,salary) in (select department_id,salary from employees where commission_pct >0);

-- ȸ�� ��ü ��� �������� �� �޴� ����� �� last_name�� u�� �ִ� ������� �ٹ��ϴ� �μ�����
-- �ٹ��ϴ� ������� employee_id, last_name, salary ��ȸ
select employee_id,last_name,salary from (select distinct department_id from employees where salary > (select round(avg(salary),0) from employees) and last_name like '%u%') dept,
employees e where e.department_id = dept.department_id order by employee_id;

-- last_name �� Davies �� ������� ���߿� ���� ������� last_name, hire_date ��ȸ
select last_name,hire_date from employees where hire_date > (select hire_date from employees where last_name = 'Davies') order by hire_date;

-- last_name�� King �� ����� �Ŵ����� �ΰ� �ִ� ��� ������� last_name, salary ��ȸ
select last_name,salary from employees where manager_id in (select employee_id from employees where last_name = 'King');

