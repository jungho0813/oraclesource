-- scott

DESC emp;
-- emp(employee) 테이블 구성 보기
-- 필드명(열 이름),      제약조건,    데이터타입
--EMPNO(사원번호)    NOT NULL   NUMBER(4)    
--ENAME(사원병, JOB(직책), MGR(직속상관 번호), HITEDATE(입사일), SAL(급여) , COMM(수당), DEPTNO(부서번호)
--NUMBER : 소수점 자릿수를 포함해서 지정 가능
--NUMBER(4) : 4자리 숫자까지 허용, NUMBER(8,2) : 전체 자릿수는 8자리이고 소수점 2자리를 포함한다

--VARCHAR2 : 가변형 문자열 저장
--VARCHAR2(10) : 10byte 문자까지 저장가능

--DATE :  날짜 데이터

DESC dept;
--DEPTNO(부서번호), DNAME(부서명), LOC(부서위치)

DESC salgrade;
--GRADE(급여등급), LOSAL(최소급여액), HISAL(최대급여액)

-- select : 데이터 조회
--조회방식 : 셀렉션(행 단위로 조회), 프로젝션(열 단위로 조회), 조인(두개 이상의 테이블을 사용하여 조회)
--SELECT 열이름1, 열이름2......(조회할 열이 전체라면 * 로 처리)
--FROM 테이블명;

--1. EMP 테이블의 전체 열을 조회
SELECT
    *
FROM
    emp;

--2. EMP 테이블에서 사원번호, 이름, 급여 열을 조회
SELECT
    empno,
    ename,
    sal
FROM
    emp;
    
-- 3. DEPT 테이블 전체 조회
SELECT
    *
FROM
    dept;
-- 4. DEPT 테이블 안에 부서번호, 지역만 조회
SELECT
    deptno,
    loc
FROM
    dept;
-- 5. EMP 테이블 안에 부서번호 조회
SELECT
    deptno
FROM
    emp;
-- 6. EMP 테이블 안에 부서번호 조회(중복된 부서번호는 제거)
-- DISTINCT : 중복제거
-- 열이 여러개인 경우(묶어서 중복이냐 아니냐를 판단)
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- 7. 연산
-- 별칭 : 필드에 별칭을 임의로 부여(as 별칭, 혹은 한칸띄고 별칭, 별칭에 공백이 있다면 " ")
-- 사원들의 1년 연봉 구하기
SELECT
    empno           "사원 번호",
    ename           사원명,
    sal * 12 + comm 연봉
FROM
    emp;
    
-- 8. 정렬 : ORDER BY
--            내림차순(DESC), 오름차순(ASC)
-- ENAME, SAL 열 추출하고 SAL 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- ENAME, SAL 열 추출하고 SAL 오름차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;   --ASC는 생략가능
    
-- 전체내용 출력하고 결과가 사원번호의 오름차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
--전체내용 출력하고 결과가 부서번호의 오름차순, 급여 내림차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
    
    
-- emp 테이블의 모든 열 출력
-- empno => employee_no
-- ename => employee_name
-- mgr => manager
-- sal => salary
-- comm => commission
-- deptno => department_no
-- 부서 번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원이름을 기준으로 오름차순 정렬
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

-- WHERE : 특정 조건을 기준으로 원하는 행을 조회
-- 사원번호가 7782인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30이고 사원직책이 SALESMAN인 데이터 조회
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

--부서번호가 30이거나 사원직책이 CLERK인 행 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'CLERK'
    OR deptno = 30;

-- 연산자
-- 산술연산자 : +,-,*,/,mod(나머지)
-- 비교연산자 : >, >=, <, <=
-- 등가비교연산자 : =, !=, <>, ^=
-- 논리부정연산자 : NOT
-- IN 연산자
-- BETWEEN A AND B 연산자
-- LIKE 연사자와 와일드카드( _ , % )
-- IS NULL 연산자
-- 집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포합), MINUS(차집합), INTERSECT(교집합)

-- EMP 테이블에서 급여 열에 12를 곱한 값이 36000 인 행 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- JOB이 MANAGER, SALESMAN, CLERK 사원 조회
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

-- 급여가 2000 이상 3000 이하인 사원 조회
--select * from emp where sal >= 2000 and sal <= 3000;
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
-- LIKE연산자와 와일드 카드( _ , % )
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미
-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';
-- 사원 이름의 두번째 글자가 L 인 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
-- 사원 이름에 AM 이 포함된 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';
-- 사원 이름에 AM 이 포함되어 있지 않은 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
 
 -- NULL : 데이터 값이 비어있는 상태
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
    
-- 집합연산자
-- union, union all : 합집합
-- INTERSECT : 교집합
-- MINUS : 차집합
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
    
-- emp 테이블에서 사원이름이 S로 끝나는 사원 데이터 조회
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%S';
-- emp 테이블에서 30번 부서에 근무하는 사원 중에서 직책이 salesman인 사원의 사원번호 이름 급여 조회 sal 내림차순
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
-- emp 테이블을 사용하여 20,30번 부서에 근무하고 잇는 사원중 급여가 2000 초과인 사원 조회, 사원번호,이름,급여,부서번호 조회
-- 집합 연산자를 사용하는 방식과 사용하지 않는 방식 두 가지를 사용한다
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
-- 사원 이름에 E가 포함되어 있는 30번 부서 사원중 급여가 1000~2000 사이가 아닌 사원의 이름
-- 사원번호, 급여, 부서번호 조회하기
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

-- 추가수당이 존재하지 않으며, 상급자가 있고 직책이 MANAGER, CLERK 인 사원중에서 사원 이름의 두번째글자가 L이 아닌 사원의 정보 조회
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
    
-- 오라클 함수
-- 오라클에서 기본으로 제공하는 내장 함수와 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

-- 1. UPPER, LOWER, INITCAP
-- UPPER : 모두 대문자, LOWER : 모두소문자, INITCAP : 첫 글자만 대문자
-- LIKE '%ORACLE%' OR LIKE '%oracal%' OR LIKE '%Oracle%' ==> 검색 시 사용

SELECT
    length('한글'), -- 길이
    lengthb('한글') --바이트 수
FROM
    dual;

-- SUBSTR(문자열데이터, 시작위치, 추출길이) : 추출길이는 생략가능
-- 문자열 일부 추출

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5),
    substr(job, - 3)
FROM
    emp;

-- ENAME, 세번째 글자부터 출력
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

-- INSTR : 문자열 데이터 안에서 특정 문자 위치 찾기
-- INSTR(대상문자열, 위치를 찾으려는 문자열, 대상문자열에서 찾기를 시작할 위치(선택), 시작위치에서 찾으려는 문자가 몇번째인지 지정(선택))

-- HELLO, ORACLE 문자열에서 L 문자열 찾기
SELECT
    instr('HELLO, ORACLE', 'L')       AS instr_1,
    instr('HELLO, ORACLE', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE', 'L', 2, 2) AS instr_3
FROM
    dual;

-- replace : 특정 문자를 다른 문자로 변경
-- replace(문자열데이터, 찾는문자, 변경문자)
SELECT
    '010-1234-5678'                    AS 변경전,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;

SELECT
    '이것이 oracle 이다',
    replace('이것이 oracle 이다', '이것이', 'This is')
FROM
    dual;

-- concat : 두 문자열 데이터 합치기
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno,
           concat(' : ', ename))
FROM
    emp;

-- || : : 문자열 연결 연산자
SELECT
    empno || ename,
    empno
    || ' : '
    || ename
FROM
    emp;

-- TRIM, LTRIM, RTRIM : 공백 포함 특정문자 제거
SELECT
    '               이것이            ',
    TRIM('               이것이            ')
FROM
    dual;

-- 숫자함수
-- ROUND, TRUNC, CEIL, FLOOR, MOD

-- ROUND : 반올림
SELECT
    round(1234.5678)      round,                       --소수점 첫째자리에서 반올림
    round(1234.5678, 0)   round0,                      --소수점 첫째자리에서 반올림
    round(1234.5678, 1)   round1,                      --소수점 둘째자리에서 반올림
    round(1234.5678, 2)   round2,                      --소수점 셋째자리에서 반올림
    round(1234.5678, - 1) round_minus1,             --자연수 첫째자리에서 반올림
    round(1234.5678, - 2) round_minus2              --자연수 둘째자리에서 반올림
FROM
    dual;

-- TRUNC : 특정위치에서 버리는 함수
-- TRUNC : (숫자, 버림위치(선택))
SELECT
    trunc(1234.5678)      trunc,                        --소수점 첫째자리에서 버림
    trunc(1234.5678, 0)   trunc0,                      --소수점 첫째자리에서 버림
    trunc(1234.5678, 1)   trunc1,                      --소수점 둘째자리에서 버림
    trunc(1234.5678, 2)   trunc2,                      --소수점 셋째자리에서 버림
    trunc(1234.5678, - 1) trunc_minus1,             --자연수 첫째자리에서 버림
    trunc(1234.5678, - 2) trunc_minus2              --자연수 둘째자리에서 버림
FROM
    dual;

-- CEIL(숫자), FLOOR(숫자) : 입력된 숫자와 가장 가까운 큰 정수, 작은 정수

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

-- mod(숫자, 나눌수) : 나머지값
SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;


-- 날짜 함수
-- 날짜 데이터 + 숫자 : 날짜 데이터보다 숫자만큼 일수 이후의 날짜
-- 날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이

-- 날짜 데이터 + 날짜 데이터 : 연산 불가

-- sysdate 함수 : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

-- add_months() : 몇개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 1)
FROM
    dual;

-- 입사50주년이 되는 날짜 구하기
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600) AS 입사50주년
FROM
    emp;
    
-- 입사 45년 미만인 사원 데이터 조회
SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;
    
-- 현재 날짜와 6개월 후 날짜출력
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

-- next_day(날짜,요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- last_day(날짜) : 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT
    sysdate,
    next_day(sysdate, '금요일'),
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
    
-- 형변환 함수: 자료형을 형 변환
-- NUMBER, VARCHAR2, DATE

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'FORD';

--ORA-01722: 수치가 부적합합니다
--select empno,ename, 'abcd'+empno
--from emp
--where ename = 'FORD';

-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자로 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

-- TO_CHAR()
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

-- TO_NUBER(문자데이터, 인식할 숫자형태)
-- 자동 형변환
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;
    
-- 자동형변환 안되는 상황
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
    dual;
    
-- sal 필드에 , 나 통화표시를 하고싶다면
SELECT
    sal,
    to_char(sal, '$999,999')
FROM
    emp;

-- to_date(문자열데이터,'인신될 날짜 형태')_
SELECT
    TO_DATE('2018-07-14', 'YYYY-MM-DD')
FROM
    dual;

-- NVL(데이터, 널일 경우 반환할 데이터)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0)
FROM
    emp;

-- DECODE함수/ CASE문

-- DECODE(검사 대상이 될 데이터,
--             조건1, 조건1이 일치할때 실행할 구문
--             조건2, 조건2이 일치할때 실행할 구문)

-- emp 테이블에서 직책이 MANAGER 인 사람은 급여의 10%인상, SALESMAN인 사람은 5% 인상, ANALYST 인 사람은 그대로, 나머지는 3%인상
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
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
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
             '월요일') AS r_job
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
    
-- 다중행 함수 : sum, count, max, min, avg
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

-- sum() : null 은 제외하고 합계 구해줌

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

-- 부서번호가 20인 사원의 입사일중 제일  오래된 입사일
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

-- group by : 결과 값을 원하는 열로 묶어 출력
-- 부서별 sal 평균
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno;

-- group by + having : group by 절에 조건을 줄때
-- having : 그룹화된 대상을 출력제한걸때

-- 각 부서의 직책별 평균 급여(단, 평균 급여가 2000 이상인 그룹만 출력)
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

-- 조인 : 여러 테이블을 하나의 테이블처럼 사용
-- 1) 내부조인 (inner join)
--                1. 등가조인 : 두개의 열이 일치할 때 값 추출
--                2. 비등가조인 : 범위에 해당할 때 값 추출

-- 2) 외부조인 (outer join)
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

-- emp, dept inner join, 급여가 2500 이하이고, 사원번호가 9999 이하인 사원정보 조회
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

-- self join : 자기 자신 테이블과 조인
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
    
--SQL-99 표준
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
    
-- 연결해야할 테이블이 세개일때
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
    
 -- 서브쿼리
 -- sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문 내부에서 사용하는 select 문
 -- 1. 단일행 서브쿼리 2. 다중행 서브쿼리 3. 다중열 서브쿼리 4. 
 
 -- select 조회할 열
 -- from 테이블명
 -- where 조건식(select 조회할 열 from 테이블 where 조건수)
 
 
 -- 단일행 서브쿼리 : 서브쿼리 결과로 하나의 행 반환
 
 -- 존스의 급여보다 높은 급여를 받는 사원 조회
 -- JONES 급여 알아내기 / 알아낸 JONES 의 급여를 가지고 조건식
 
 select sal from emp where ename = 'JONES';
 
 select * from emp where sal > (select sal from emp where ename = 'JONES');
    
-- 사원이름이 ALLEN 인 사원의 추가수당보다 많은 추가수당을 받는 사원 조회

select * from emp where comm > (select comm from emp where ename = 'ALLEN');
    
-- 사원이 름이 WARD인 사원의 입사일보다 빨리 입사한 사원 조회  
select * from emp where hiredate < (select hiredate from emp where ename = 'WARD');


-- 다중행 서브쿼리 : 서브쿼리 결과로 여러개의 행 반환
-- In, ANY(SMOME), ALL, EXISTS 연산자 허용

--각 부서별 최고 급여
select max(sal) from emp group by deptno;

select * from emp where sal in (select max(sal) from emp group by deptno);

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보조회
-- 단일행 서브쿼리
select * from emp where sal > (select min(sal) from emp where deptno =30);
-- 다중행 서브쿼리
select * from emp where sal > any (select sal from emp where deptno =30);

-- ALL : 서브쿼리 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리 조선익이 TRUE
select * from emp where sal > all (select sal from emp where deptno =30);

-- EXISTS : 서브쿼리에 결과 값이 하나 이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 FALSE
select * from emp where exists (select dname from dept where deptno=10);

select * from emp where exists (select dname from dept where deptno=50);

select * from emp where job = (select job from emp where ename = 'ALLEN');

select e.empno,e.ename,d.dname,e.hiredate,d.loc,e.sal,s.grade
from emp e,dept d,salgrade s where e.deptno = d.deptno and e.sal BETWEEN s.losal AND s.hisal and sal > (select avg(sal) from emp);

-- 다중열 서브쿼리 : 서브쿼리의 select 절에서 비교할 데이터를 어러개 지정
select * from emp where sal in (select deptno,max(sal) from emp group by deptno);

-- FROM 절에 사용하는 서브쿼리(인라인 뷰)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) e10,
        (select * from dept) d
where e10.deptno = d.deptno;

-- SELECT 절에 사용하는 서브쿼리(스칼라 서브쿼리)
-- SELECT 절에 사용하는 서브쿼리는 반드시 하나의 결과만 반환해야 함
select empno, ename, job,sal,(select grade from salgrade where e.sal between losal and hisal) slagarde,deptno,(select dname from dept where e.deptno = dept.deptno) dname
from emp e;

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d where e.deptno = d.deptno and e.job not in(select job from emp where deptno=30) and e.deptno = 10;

-- 단일행 서브쿼리
select e.empno, e.ename, e.job, e.sal,s.grade
from emp e, salgrade s where e.sal between s.losal and s.hisal and e.sal > (select max(sal) from emp where job = 'SALESMAN')
order by e.empno;

-- 다중행 서브쿼리
select e.empno, e.ename, e.job, e.sal,s.grade
from emp e, salgrade s where e.sal between s.losal and s.hisal and e.sal > all (select sal from emp where job = 'SALESMAN')
order by e.empno;

-- DML (Data Mainpulation Language) : 데이터 추가 (INSERT), 수정(UPDATE), 삭제(DELETE)하는 데이터 조작어
-- select + DML ==> 자주 사용하는 sql

-- 연습용 테이블 생성
-- 기존 테이블 복사
create table dept_temp as select * from dept;

-- 테이블 삭제
drop table dept_temp;

-- insert into 테이블이름(열이름1,열이름2.....)  : 열이름은 선택사항
-- values(데이터1, 데이터2....);

-- dept_temp 새로운 부서 추가하기
insert into dept_temp(deptno, dname, loc)
values(50,'DATABASE','SEOUL');

-- 열 이름 제거할 때
insert into dept_temp
values(60,'NETWORK','BUSAN');

-- insert 시 오류

-- 이 열에 대해 지정된 전체 자릿수보다 큰값이 허용됩니다.
--insert into dept_temp
--values(600,'NETWORK','BUSAN');

-- 수치가 부적합합니다
--insert into dept_temp
--values('NO','NETWORK','BUSAN');

-- 값의 수가 충분하지 않습니다
--insert into dept_temp(deptno, dname, loc)
--values(50,'DATABASE');

insert into dept_temp(deptno, dname, loc)
values(80,'WEB',NULL);

insert into dept_temp(deptno, dname, loc)
values(90,'MOBILE','');

insert into dept_temp(deptno, loc)
values(91,'INCHEON');

select * from dept_temp;

-- emp_temp 생성(emp 테이블 복사 - 데이터는 복사를 하지 않을때)
-- 구조만 복사
create table emp_temp as select * from emp where 1 <> 1;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (1111,'성춘향','MANAGER',9999,'2002/01/05',4000,NULL,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (2222,'이순신','MANAGER',9999,to_date('07/01/2001','DD/MM/YYYY'),4000,NULL,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3333,'심봉사','MANAGER',9999,sysdate,4000,NULL,20);

-- 서브쿼리로 insert 구현
-- emp, slagrade 테이블을 조인 후 급여 등급이 1인사원만 emp_tmep에 추가
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno from emp e, salgrade s where e.sal between s.losal and s.hisal and s.grade =1;

select * from emp_temp;

-- UPDATE : 테이블에 있는 데이터 수정

--update 테이블명 set 변경할열이름 = 데이터, 변경한열이름 = 데이터.... where 변경을위한 대상 행을 선별하기 위한 조건


















