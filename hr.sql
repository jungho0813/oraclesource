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
    hire_date like '04%'
ORDER BY
    hire_date;
    
-- last_name 에 u가 포함된 사원들의 사번, last_name조회
select last_name from employees where last_name like '%u%';
-- last_name 에 네번째 글자가 a인 사원들의 last_name조회
select last_name from employees where last_name like '___a%';
-- last_name에 a 혹은 e 글자가 포함된 사원들의 last_name조회
-- last_name 오름차순 정렬
select last_name from employees where last_name like '%a%' or last_name like '%e%' order by last_name;
-- last_name 에 a와 e 글자가 포함된 사원들의 last_name 조회
select last_name from employees where last_name like '%a%' and last_name like '%e%' order by last_name;

-- 매니저(manager_id)가 없는 사람들의 last_name, job_id조회
select last_name,job_id from employees where manager_id is null;
-- job_id가 ST_CLERK 인 사원의 부서번호 조회(단 부서번호가 null인 사원은 제외한다.)
-- 중복을 제거한 후 부서번호만 조회
select distinct department_id from employees where department_id is not null and job_id = 'ST_CLERK';
-- commission_pct null이 아닌 사원들 중에서 commission = salary * commission_pct를 구하여
-- employee_id, first_name, job_id 출력
select employee_id,first_name,job_id,commission_pct * salary commission from employees where commission_pct is not null;

-- 회사 내의 최대 연봉 및 최소 연봉의 차이를 출력
select max(salary)-min(salary) sal_gap from employees;
-- 매니저로 근무하는 사원들의 총숫자 출력(매니저 중복 제거)
select count(distinct manager_id) from employees;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    