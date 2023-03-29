-- PL/SQL : SQL �����δ� ������ ��ưų� ���� �Ұ����� �۾��� �����ϱ� ���� ����Ŭ���� �����ϴ� ���α׷��� ���

-- ���� ����� ȭ�鿡 ���
set serveroutput on;

-- ��� : DECLEAR ~ BEGIN ~ END
begin
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
end;
/

-- ���� ����
DECLARE
        V_EMPNO number(4) := 7788;
        V_ENAME varchar2(10);
begin
        v_ename := 'SCOTT';
        dbms_output.put_line('V_ENAME : ' || V_ENAME);
        dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
end;
/

-- ��� ����
DECLARE
        V_TAX constant number(4) := 7788;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- ���� + not null
DECLARE
        V_TAX  number(4) not null := 10;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- ���� + not null + default
DECLARE
        V_TAX  number(4) not null default 10;
begin
        dbms_output.put_line('V_tax : ' || V_tax);
end;
/

-- ������ ����� �ڷ���
-- ��Į�� : ����Ŭ�� ����ϴ� Ÿ��(number, char, date.....)
-- ������ : ����Ŭ ������ ���̽��� �����ϴ� Ư�� ���̺��� ���� �ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ���
--    1) �����̸� ���̺��.���̸�%TYPE : Ư�� ���̺� ���� ���� ���� ũ���� �ڷ����� ���
--    2) �����̸� ���̺��%ROWTYPE : Ư�� ���̺� ���� �౸�� ��ü ����

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

-- ���ǹ� : if , if~then~end if

DECLARE
        V_NUMBER NUMBER := 15;
begin
        -- V_NUMBER �� �� Ȧ��, ¦�� ����
        -- mod() : �������� ���ϴ� ����Ŭ �Լ�
        if mod(V_NUMBER, 2) = 1 then 
         dbms_output.put_line('V_NUMBER �� Ȧ��');
         end if;
end;
/

DECLARE
        V_NUMBER NUMBER := 15;
begin
        -- V_NUMBER �� �� Ȧ��, ¦�� ����
        -- mod() : �������� ���ϴ� ����Ŭ �Լ�
        if mod(V_NUMBER, 2) = 1 then 
            dbms_output.put_line('V_NUMBER �� Ȧ��');
        else
            dbms_output.put_line('V_NUMBER �� ¦��');
         end if;
end;
/

-- ���� ���
DECLARE
        V_NUMBER NUMBER := 87;
begin
    if v_number >= 90 then
        dbms_output.put_line('A ����');
    elsif v_number >= 80 then
        dbms_output.put_line('B ����');
    elsif v_number >= 70 then
        dbms_output.put_line('C ����');
    elsif v_number >= 60 then
        dbms_output.put_line('D ����');
    else
        dbms_output.put_line('F ����');
    end if;
end;
/

DECLARE
        V_NUMBER NUMBER := 87;
begin
case trunc (v_number/10)
    when 10 then
        dbms_output.put_line('A ����');
    when 9 then
        dbms_output.put_line('A ����');
    when 8 then
        dbms_output.put_line('B ����');
    when 7 then
        dbms_output.put_line('C ����');
     when 6 then
        dbms_output.put_line('D ����');
        else dbms_output.put_line('F ����');
    end case;
end;
/

DECLARE
        V_NUMBER NUMBER := 87;
begin
case 
    when V_NUMBER >= 90 then
        dbms_output.put_line('A ����');
    when V_NUMBER >= 80 then
        dbms_output.put_line('B ����');
    when V_NUMBER >= 70 then
        dbms_output.put_line('C ����');
     when V_NUMBER >= 60 then
        dbms_output.put_line('D ����');
        else dbms_output.put_line('F ����');
    end case;
end;
/

-- �ݺ���
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

-- for i in ����..���ᰪ
--  �ݺ������۾�;
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








