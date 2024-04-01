/*
    <PL/SQL>
        ����Ŭ ��ü�� ����Ǿ� �ִ� ������ ���� SQL ���� ������ ������ ����, ���� ó��(IF), �ݺ� ó��(LOOP, FOR, WHILE) ���� �����Ѵ�.
        (�ټ��� SQL ���� �� ���� ������ �����ϴ�.)
        
        [PL/SQL�� ����]
            1) �����(DECLAER SECTION) : DECLARE�� ����, ������ ����� ���� �� �ʱ�ȭ�ϴ� �κ��̴�.
            2) �����(EXECUTABLE SECTION) : BEGIN�� ����, SQL ��, ���(����, �ݺ���) ���� ������ ����ϴ� �κ��̴�.
            3) ���� ó����(EXCEPTION SECTION) : EXCEPTION�� ����, ���� �߻� �� �ذ��ϱ� ���� ������ ����ϴ� �κ��̴�.
            
        
    <PL/SQL �����(DECLAER SECTION)>
        ���� �� ����� ������ ���� �����̴�.(����� ���ÿ� �ʱ�ȭ�� ����)
        ���� �� ����� �Ϲ� Ÿ�� ����, ���۷��� Ÿ�� ����, ROW Ÿ�� ������ �����ؼ� ����� �� �ִ�.
        
        1) �Ϲ� Ÿ�� ������ ���� �� �ʱ�ȭ
            [����]
                ������ [CONSTANT] �ڷ���(ũ��) [:= ��];
*/





/*
        2) ���۷��� Ÿ�� ���� ���� �� �ʱ�ȭ
            [����]
                ������ ���̺��.Į����%TYPE;
            
            - �ش��ϴ� ���̺��� Į���� ������ Ÿ���� �����ؼ� �� Ÿ������ ������ �����Ѵ�.
*/




/*
        3) ROW Ÿ�� ���� ���� �� �ʱ�ȭ
            [����]
                ������ ���̺��%ROWTYPE;
                
            - �ϳ��� ���̺��� ���� Į���� ���� �Ѳ����� ������ �� �ִ� ������ �ǹ��Ѵ�.
            - ��� Į���� ��ȸ�ϴ� ��쿡 ����ϱ� ���ϴ�.
*/



/*
    <PL/SQL �����(EXECUTABLE SECTION)>
        1) ���ù�
          1-1) ���� IF ����
            [����]
                IF ���ǽ� THEN
                    ���� ����
                END IF;
*/



/*
        1-2) IF ~ ELSE ����
          [����]
            IF ���ǽ� THEN
                ���� ����
            ELSE 
                ���� ����
            END IF;
*/


/*
        1-3) IF ~ ELSIF ~ ELSE ����
          [����]
            IF ���ǽ� THEN
                ���� ����
            ELSIF ���ǽ� THEN
                ���� ����
            ...
            [ELSE
                ���� ����]
            END IF;
*/


/*
        1-4) CASE ����
          [����]
            CASE �� ���
                 WHEN �񱳰�1 THEN �����1
                 WHEN �񱳰�2 THEN �����2
                 ...
                 [ELSE �����]
            END;
*/



/*
        2) �ݺ���
          2-1) BASIC LOOP
            [����]
                LOOP
                    �ݺ������� �����ų ����
                    
                    [�ݺ����� �������� ���ǹ� �ۼ�]
                        1) IF ���ǽ� THEN 
                              EXIT;
                           END IF
                           
                        2) EXIT WHEN ���ǽ�;
                END LOOP;
*/


/*
        2-2) WHILE LOOP
          [����]
            WHILE ���ǽ�
            LOOP
                �ݺ������� ������ ����;
            END LOOP;
*/


/*
        3) FOR LOOP
          [����]
            FOR ���� IN [REVERSE] �ʱⰪ..������
            LOOP
                �ݺ������� ������ ����;
            END LOOP;
*/
-- ��±�� Ȱ��ȭ
SET SERVEROUTPUT ON;
-- ������(2 ~ 9��) ��� (��, ¦���ܸ� ����Ѵ�.)
BEGIN
    FOR DAN IN 2..9
    LOOP
        IF (MOD(DAN, 2) = 0) THEN
            FOR SU IN 1..9
            LOOP        
                DBMS_OUTPUT.PUT_LINE(DAN || ' X ' || SU || ' = ' || DAN * SU );
            END LOOP;
            
            DBMS_OUTPUT.PUT_LINE('');
        END IF;
    END LOOP;
END;
/

-- �ݺ���(FOR ����)�� �̿��� ������ ����
CREATE TABLE TEST (
    NUM NUMBER,
    CREATE_DATE DATE
);

-- TEST ���̺� 10���� ���� INSERT�ϴ� PL/SQL �ۼ�
BEGIN
    FOR NUM IN 1..10
    LOOP
        INSERT INTO TEST VALUES(NUM, SYSDATE);
        
        IF (MOD(NUM, 2) = 0) THEN
            COMMIT;
        ELSE
            ROLLBACK;
        END IF;    
    END LOOP;
END;
/


/*
    <PL/SQL ����ó����(EXCEPTION SECTION)>
        ���ܶ� ���� �� �߻��ϴ� ������ ���ϰ� PL/SQL ������ �߻��� ���ܸ� ����ó���ο��� �ڵ�� ó���� �����ϴ�.

        [����]
            DECLARE
                ...
            BEGIN
                ...
            EXCEPTION
                WHEN ���ܸ� 1 THEN ����ó������ 1;
                WHEN ���ܸ� 2 THEN ����ó������ 2;
                ...
                WHEN OTHERS THEN ����ó������;
                
        * ����Ŭ���� �̸� ���ǵǾ� �ִ� ����
          - NO_DATA_FOUND : SELECT ���� ���� ����� �� �൵ ���� ��쿡 �߻��Ѵ�.
          - TOO_MANY_ROWS : �� ���� ���ϵǾ�� �ϴµ� SELECT ������ ���� ���� ���� ������ �� �߻��Ѵ�. 
          - ZERO_DIVIDE   : ���ڸ� 0���� ���� �� �߻��Ѵ�.
          - DUP_VAL_ON_INDEX : UNIQUE ���� ������ ���� �÷��� �ߺ��� �����Ͱ� INSERT �� �� �߻��Ѵ�.
*/


-- �׽�Ʈ�� ���̺� ����
CREATE TABLE EMP_DUP
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP_DUP;

-- �׽�Ʈ ���̺��� �����͸� ��� �����ϴ� ���ν��� ����
CREATE PROCEDURE DEL_ALL_EMP
IS
BEGIN
    DELETE FROM EMP_DUP;
    
    COMMIT;
END;
/

-- ���ν����� �����ϴ� ������ ��ųʸ�
SELECT * FROM USER_SOURCE;

-- DEL_ALL_EMP ���ν��� ȣ��
EXECUTE DEL_ALL_EMP;

SELECT * FROM EMP_DUP;

DROP PROCEDURE DEL_ALL_EMP;
DROP TABLE EMP_DUP;



-------------------------------------------
/*
    1) �Ű������� �ִ� ���ν���
      ���ν��� ���� �� �Ű������� ���ڰ��� �����ؾ� �Ѵ�.
*/
CREATE OR REPLACE PROCEDURE DEL_EMP_ID
(
    P_EMP_ID EMPLOYEE.EMP_ID%TYPE
)
IS
BEGIN
    DELETE FROM EMPLOYEE
    WHERE EMP_ID = P_EMP_ID;
END;
/

-- ���ν��� ����(��, �Ű� ���� �����ؾ� �Ѵ�.)
--EXEC DEL_EMP_ID; -- ���� �߻�
EXEC DEL_EMP_ID('204');

SELECT * FROM EMPLOYEE;

-- ����ڰ� �Է��� ���� ������ �����ϴ�.
EXEC DEL_EMP_ID('&���');

ROLLBACK;

SELECT * FROM EMPLOYEE;

/*
    2) IN/OUT �Ű������� �ִ� ���ν���
      IN �Ű����� : ���ν��� ���ο��� ���� ����
      OUT �Ű����� : ���ν��� ȣ���(�ܺ�)���� ���� ���� ����� ����
*/

CREATE OR REPLACE PROCEDURE SELECT_EMP_ID
(
    V_EMP_ID IN EMPLOYEE.EMP_ID%TYPE,
    V_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
    V_SALARY OUT EMPLOYEE.SALARY%TYPE,
    V_BONUS OUT EMPLOYEE.BONUS%TYPE
)
IS
BEGIN
    SELECT EMP_NAME, SALARY, BONUS
    INTO V_EMP_NAME, V_SALARY, V_BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;
END;
/

-- ���ε� ����(VARIABLE, VAR)
VARIABLE VAR_EMP_NAME VARCHAR2(30);
VAR VAR_SALARY NUMBER;
VAR VAR_BONUS NUMBER;

SET AUTOPRINT ON;

-- ���ε� ������ ':������' ���·� ���� ����
EXEC SELECT_EMP_ID('200', :VAR_EMP_NAME, :VAR_SALARY, :VAR_BONUS);

PRINT VAR_EMP_NAME;
PRINT VAR_SALARY;
PRINT VAR_BONUS;

---------------------------------------------------
/*
    <FUNCTION>
        ���ν����� ��� �뵵�� ���������
        ���ν����� �ٸ��� OUT ������ ������� �ʾƵ� ���� ����� �ǵ��� ���� �� �ִ�.(RETURN )
        
        [����]
            CREATE FUNCTION �Լ���
            (
                �Ű����� 1 Ÿ��,
                �Ű����� 2 Ÿ��,
                ...
            )
            RETURN ������Ÿ��
            IS
                �����
            BEGIN
                �����
                
                RETRUN ��ȯ��; -- ���ν����� �ٸ��� RETURN ������ �߰��ȴ�.
            EXCEPTION
                ����ó����
            END [�Լ���];
            /
*/

-- ����� �Է¹޾� �ش� ����� ���ʽ��� �����ϴ� ������ ����ϰ� �����ϴ� �Լ� ����
CREATE OR REPLACE FUNCTION BONUS_CALC
(
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE
)
RETURN NUMBER
IS
    V_SAL EMPLOYEE.SALARY%TYPE;
    V_BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT SALARY, NVL(BONUS, 0)
    INTO V_SAL, V_BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;
    
    RETURN (V_SAL + (V_SAL * V_BONUS)) * 12;
END;
/

SELECT * FROM USER_SOURCE;

SELECT BONUS_CALC(203) FROM DUAL;

SELECT EMP_ID, 
       EMP_NAME, 
       SALARY, 
       NVL(BONUS, 0), 
       BONUS_CALC(EMP_ID)
FROM EMPLOYEE;

---------------------------------------------------
/*
    <CURSOR>
        SQL ���� ó�� ���(ó�� ����� ���� ��(ROW))�� ��� �ִ� ��ü�̴�.
        Ŀ�� ��� �� ���� ������ ��Ÿ�� ó�� ����� ���������� ������ �����ϴ�.
        
        [Ŀ�� �Ӽ�]
            Ŀ����%NOTFOUND : Ŀ�� ������ �����ִ� ROW ���� ���ٸ� TURE, �ƴϸ� FALSE
            Ŀ����%FOUND    : Ŀ�� ������ �����ִ� ROW ���� �� �� �̻��� ��� TRUE, �ƴϸ� FALSE
            Ŀ����%ISOPEN   : Ŀ���� OPEN ������ ��� TRUE, �ƴϸ� FALSE
            Ŀ����%ROWCOUNT : SQL ó�� ����� ���� ��(ROW)�� ��
        
        [��� ���]
            1) CURSOR Ŀ���� IS ..     : Ŀ�� ����
            2) OPEN Ŀ����;            : Ŀ�� ����
            3) FETCH Ŀ���� INTO ����, ...   : Ŀ������ ������ ����(�� �྿ �����͸� �����´�.)
            4) CLOSE Ŀ����            : Ŀ�� �ݱ�
        
        [����]
            CURSOR Ŀ���� IS [SELECT ��]
            
            OPEN Ŀ����;
            FETCH Ŀ���� INTO ����;
            ...
            
            CLOSE Ŀ����;
*/
SET SERVEROUTPUT ON;

-- �޿��� 3000000 �̻��� ����� ���, �̸�, �޿� ���(PL/SQL)
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    
    -- Ŀ�� ����
    CURSOR C1 IS 
        SELECT EMP_ID, EMP_NAME, SALARY
        FROM EMPLOYEE
        WHERE SALARY > 3000000;
BEGIN
    -- Ŀ�� ����
    OPEN C1;
    
    LOOP
        FETCH C1 INTO EID, ENAME, SAL;
        
        EXIT WHEN C1%NOTFOUND;
                
        DBMS_OUTPUT.PUT_LINE(EID || ' ' || ENAME || ' ' || SAL);
    END LOOP;  
    
    CLOSE C1;
END;
/

-- ��ü �μ��� ���� �μ� �ڵ�, �μ���, ���� ��ȸ(PROCEDURE)
CREATE OR REPLACE PROCEDURE CURSOR_DEPT
IS
    V_DEPT DEPARTMENT%ROWTYPE;
    
    CURSOR C1 IS
        SELECT * FROM DEPARTMENT;
BEGIN
    OPEN C1;
    
    LOOP
        FETCH C1 INTO V_DEPT.DEPT_ID, V_DEPT.DEPT_TITLE, V_DEPT.LOCATION_ID;
        
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPT_ID || ' ' || V_DEPT.DEPT_TITLE || ' ' || V_DEPT.LOCATION_ID);
    END LOOP;
    
    CLOSE C1;
END;
/

EXEC CURSOR_DEPT;

-- FOR IN LOOP�� �̿��� Ŀ�� ���
CREATE OR REPLACE PROCEDURE CURSOR_DEPT
IS
    V_DEPT DEPARTMENT%ROWTYPE;
BEGIN
    FOR V_DEPT IN (SELECT * FROM DEPARTMENT)
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPT_ID || ' ' || V_DEPT.DEPT_TITLE || ' ' || V_DEPT.LOCATION_ID);
    END LOOP;
END;
/

EXEC CURSOR_DEPT;
