-- employee 테이블 전체내용 조회
SELECT
    *
FROM
    employees;
   
-- employee 테이블 first_name, last_name, job_id 만 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;
   
-- 사원번호가 176인 사람의 LAST_NAME 조회
SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME,SALARAY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- 연봉이 5000 에서 12000 범위가 아닌 사람들의 LAST_NAME, SALARY 조회
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
    
-- 20, 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME, 부서번호를 오름차순으로 조회
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
 

-- 커미션을 받는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회(연봉의 내림차순, 커미션 내림차순)
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

-- 연봉이 2500,3500,7000이 아니며 직업이 SA_REP 나 ST_CLERK 인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );

-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회
-- 고용일자 내림차순 정렬
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

-- 2004년도에 고용된 사원들의 last_name, hire_date 조회
-- 고용일자 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date;

-- 부서가 20,50 이고 연봉이 5000~12000범위인 사람들의 LAST_NAME, SALARY조회 연봉 오름차순 정렬
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

-- 2004년도 입사자 : like사용
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
    
-- last_name 에 u가 포함된 사원들의 사번, last_name조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
-- last_name 에 네번째 글자가 a인 사원들의 last_name조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
-- last_name에 a 혹은 e 글자가 포함된 사원들의 last_name조회
-- last_name 오름차순 정렬
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
-- last_name 에 a와 e 글자가 포함된 사원들의 last_name 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%'
ORDER BY
    last_name;

-- 매니저(manager_id)가 없는 사람들의 last_name, job_id조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;
-- job_id가 ST_CLERK 인 사원의 부서번호 조회(단 부서번호가 null인 사원은 제외한다.)
-- 중복을 제거한 후 부서번호만 조회
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
    department_id IS NOT NULL
    AND job_id = 'ST_CLERK';
-- commission_pct null이 아닌 사원들 중에서 commission = salary * commission_pct를 구하여
-- employee_id, first_name, job_id 출력
SELECT
    employee_id,
    first_name,
    job_id,
    commission_pct * salary commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- 회사 내의 최대 연봉 및 최소 연봉의 차이를 출력
SELECT
    MAX(salary) - MIN(salary) sal_gap
FROM
    employees;
-- 매니저로 근무하는 사원들의 총숫자 출력(매니저 중복 제거)
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;
    
-- join
-- 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기 (self join - employees)

SELECT
    e1.last_name,
    e1.hire_date,
    e1.manager_id   
FROM
    employees e1,
    employees e2
WHERE
        e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;
-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, 부서번호, 도시조회
-- employees, departments, locations inner join

select e.EMPLOYEE_ID,e.last_name,e.DEPARTMENT_ID,l.city
from employees e, departments d  ,locations l where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l. LOCATION_ID and city like 'T%';

-- 위치 id가 1700인 사원들의 사번, last_name, 부서번호, 급여 조회
-- employees, departments inner join
select  e.EMPLOYEE_ID,e.last_name,e.DEPARTMENT_ID,e.SALARY,d.LOCATION_ID
from employees e ,  departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID and  d.LOCATION_ID = 1700;

-- 부서명, 위치id, 각 부서별 사원 총수, 각 부서별 평균 연봉 조회
-- 평균 연봉은 소수점 2자리 까지만
-- employees, departments inner join
select d.DEPARTMENT_NAME,d.DEPARTMENT_ID,trunc(avg(e.SALARY),2),count(*)
from employees e ,  departments d  where e.DEPARTMENT_ID = d.DEPARTMENT_ID group by d.DEPARTMENT_NAME,d.DEPARTMENT_ID;

-- Executive 부서에 근무하는 사원들의 부서번호, last_name,job_id 조회
-- employees, departments inner join
select d.department_id,d.department_name,e.last_name,e.job_id
from employees e ,  departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.department_name = 'Executive';

-- 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의
-- 부서번호, 이름(first_name과 last_name연결하기), salary, hire_date 조회
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

-- 서브쿼리
-- LAST_NAME 에 u가 포함된 사원들과 동일 부서에 근무하는 사번, last_name조회
select DEPARTMENT_ID,last_name from employees where department_id in(select DISTINCT DEPARTMENT_ID from employees where last_name like '%u%');

-- job_id 가 SA_MAN 인 사원들의 최대 연봉보다 높게 받는 사원들의 last_name, job_id, salary 조회
select last_name,job_id,salary from employees where salary > (select max(salary) from employees where job_id = 'SA_MAN');

-- 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 last_name, department_id, salary조회
select last_name, department_id,salary,commission_pct from employees
where (department_id,salary) in (select department_id,salary from employees where commission_pct >0);

-- 회사 전체 평균 연봉보다 더 받는 사원들 중 last_name에 u가 있는 사원들이 근무하는 부서에서
-- 근무하는 사원들의 employee_id, last_name, salary 조회
select employee_id,last_name,salary from (select distinct department_id from employees where salary > (select round(avg(salary),0) from employees) and last_name like '%u%') dept,
employees e where e.department_id = dept.department_id order by employee_id;

-- last_name 이 Davies 인 사람보다 나중에 고용된 사원들의 last_name, hire_date 조회
select last_name,hire_date from employees where hire_date > (select hire_date from employees where last_name = 'Davies') order by hire_date;

-- last_name이 King 인 사원을 매니저로 두고 있는 모든 사원들의 last_name, salary 조회
select last_name,salary from employees where manager_id in (select employee_id from employees where last_name = 'King');

