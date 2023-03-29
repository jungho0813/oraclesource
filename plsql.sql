-- PL/SQL : SQL 만으로는 구현이 어렵거나 구현 불가능한 작업을 수행하기 위해 오랓클에서 제공하는 프로그래밍 언어

-- 실행 결과를 화면에 출력
set serveroutput on;

-- 블록 : DECLEAR ~ BEGIN ~ END
begin
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
end;
/

-- 변수 선언
DECLARE
        V_EMPNO number(4) := 7788;
        V_ENAME varchar2(10);
begin
        v_ename := 'SCOTT';
        dbms_output.put_line('V_ENAME : ' || V_ENAME);
        dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
end;
/

-- 상수 선언
DECLARE
        V_TAX constant number(4) := 7788;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- 변수 + not null
DECLARE
        V_TAX  number(4) not null := 10;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- 변수 + not null + default
DECLARE
        V_TAX  number(4) not null default 10;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- 변수와 상수의 자료형
-- 스칼라 : 오라클이 사용하는 타입(number, char, date.....)
-- 참조형 : 오라클 데이터 베이스에 존재하는 특정 테이블의 열의 자료형이나 하나의 행 구조를 참조하는 자료형
--    1) 변수이름 테이블명.열이름%TYPE : 특정 테이블에 속한 열과 같은 크기의 자료형을 사용
--    2) 변수이름 테이블명%ROWTYPE : 특정 테이블에 속한 행구조 전체 참조

DECLARE
        V_DEPTNO DEPT.DEPTNO%TYPE := 50;
begin
        dbms_output.put_line('V_DEPTNO : ' || V_DEPTNO);
end;
/

DECLARE
        V_DEPT_ROW DEPT%ROWTYPE;
begin
        select deptno, dname, loc into  V_DEPT_ROW
        from dept
        where deptno = 40;
        
        dbms_output.put_line('V_DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        dbms_output.put_line('V_DNAME : ' || V_DEPT_ROW.DNAME);
        dbms_output.put_line('V_LOC : ' || V_DEPT_ROW.LOC);
end;
/

-- 조건문 : if , if~then~end if

DECLARE
        V_NUMBER NUMBER := 15;
begin
        -- V_NUMBER 의 값 홀수, 짝수 구별
        -- mod() : 나머지값 구하는 오라클 함수
        if mod(V_NUMBER, 2) = 1 then 
         dbms_output.put_line('V_NUMBER 는 홀수');
         end if;
end;
/

DECLARE
        V_NUMBER NUMBER := 15;
begin
        -- V_NUMBER 의 값 홀수, 짝수 구별
        -- mod() : 나머지값 구하는 오라클 함수
        if mod(V_NUMBER, 2) = 1 then 
            dbms_output.put_line('V_NUMBER 는 홀수');
        else
            dbms_output.put_line('V_NUMBER 는 짝수');
         end if;
end;
/

-- 학점 출력
DECLARE
        V_NUMBER NUMBER := 87;
begin
    if v_number >= 90 then
        dbms_output.put_line('A 학점');
    elsif v_number >= 80 then
        dbms_output.put_line('B 학점');
    elsif v_number >= 70 then
        dbms_output.put_line('C 학점');
    elsif v_number >= 60 then
        dbms_output.put_line('D 학점');
    else
        dbms_output.put_line('F 학점');
    end if;
end;
/

DECLARE
        V_NUMBER NUMBER := 87;
begin
case trunc (v_number/10)
    when 10 then
        dbms_output.put_line('A 학점');
    when 9 then
        dbms_output.put_line('A 학점');
    when 8 then
        dbms_output.put_line('B 학점');
    when 7 then
        dbms_output.put_line('C 학점');
     when 6 then
        dbms_output.put_line('D 학점');
        else dbms_output.put_line('F 학점');
    end case;
end;
/

DECLARE
        V_NUMBER NUMBER := 87;
begin
case 
    when V_NUMBER >= 90 then
        dbms_output.put_line('A 학점');
    when V_NUMBER >= 80 then
        dbms_output.put_line('B 학점');
    when V_NUMBER >= 70 then
        dbms_output.put_line('C 학점');
     when V_NUMBER >= 60 then
        dbms_output.put_line('D 학점');
        else dbms_output.put_line('F 학점');
    end case;
end;
/

-- 반복문
-- loop ~ end loop, while loop, for loop, cousor for loop

DECLARE
        V_NUM NUMBER := 0;
begin
loop
        dbms_output.put_line('V_NUM : ' || V_NUM);
        V_NUM := V_NUM+1;
        exit when V_NUM > 4;
    end loop;
end;
/

-- for i in 시작..종료값
--  반복수행작업;
-- end loop;

begin
 for i in 0..4 loop
        dbms_output.put_line('i : ' || i);
    end loop;
end;
/

begin
 for i in 0..4 loop
    continue when mod(i,2) =1;
        dbms_output.put_line('i : ' || i);
    end loop;
end;
/

begin
 for i in 1..10 loop
 continue when mod(i,2) !=1;
        dbms_output.put_line('i : ' || i);
    end loop;
end;
/








