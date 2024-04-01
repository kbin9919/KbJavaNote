/*
    <PL/SQL>
        오라클 자체에 내장되어 있는 절차적 언어로 SQL 문장 내에서 변수의 정의, 조건 처리(IF), 반복 처리(LOOP, FOR, WHILE) 등을 지원한다.
        (다수의 SQL 문을 한 번에 실행이 가능하다.)
        
        [PL/SQL의 구조]
            1) 선언부(DECLAER SECTION) : DECLARE로 시작, 변수나 상수를 선언 및 초기화하는 부분이다.
            2) 실행부(EXECUTABLE SECTION) : BEGIN로 시작, SQL 문, 제어문(조건, 반복문) 등의 로직을 기술하는 부분이다.
            3) 예외 처리부(EXCEPTION SECTION) : EXCEPTION로 시작, 예외 발생 시 해결하기 위한 구문을 기술하는 부분이다.
            
        
    <PL/SQL 선언부(DECLAER SECTION)>
        변수 및 상수를 선언해 놓는 공간이다.(선언과 동시에 초기화도 가능)
        변수 및 상수는 일반 타입 변수, 레퍼런스 타입 변수, ROW 타입 변수로 선언해서 사용할 수 있다.
        
        1) 일반 타입 변수의 선언 및 초기화
            [문법]
                변수명 [CONSTANT] 자료형(크기) [:= 값];
*/





/*
        2) 레퍼런스 타입 변수 선언 및 초기화
            [문법]
                변수명 테이블명.칼럼명%TYPE;
            
            - 해당하는 테이블의 칼럼에 데이터 타입을 참조해서 그 타입으로 변수를 지정한다.
*/




/*
        3) ROW 타입 변수 선언 및 초기화
            [문법]
                변수명 테이블명%ROWTYPE;
                
            - 하나의 테이블의 여러 칼럼의 값을 한꺼번에 저장할 수 있는 변수를 의미한다.
            - 모든 칼럼을 조회하는 경우에 사용하기 편리하다.
*/



/*
    <PL/SQL 실행부(EXECUTABLE SECTION)>
        1) 선택문
          1-1) 단일 IF 구문
            [문법]
                IF 조건식 THEN
                    실행 문장
                END IF;
*/



/*
        1-2) IF ~ ELSE 구문
          [문법]
            IF 조건식 THEN
                실행 문장
            ELSE 
                실행 문장
            END IF;
*/


/*
        1-3) IF ~ ELSIF ~ ELSE 구문
          [문법]
            IF 조건식 THEN
                실행 문장
            ELSIF 조건식 THEN
                실행 문장
            ...
            [ELSE
                실행 문장]
            END IF;
*/


/*
        1-4) CASE 구문
          [문법]
            CASE 비교 대상
                 WHEN 비교값1 THEN 결과값1
                 WHEN 비교값2 THEN 결과값2
                 ...
                 [ELSE 결과값]
            END;
*/



/*
        2) 반복문
          2-1) BASIC LOOP
            [문법]
                LOOP
                    반복적으로 실행시킬 구문
                    
                    [반복문을 빠져나갈 조건문 작성]
                        1) IF 조건식 THEN 
                              EXIT;
                           END IF
                           
                        2) EXIT WHEN 조건식;
                END LOOP;
*/


/*
        2-2) WHILE LOOP
          [문법]
            WHILE 조건식
            LOOP
                반복적으로 실행할 구문;
            END LOOP;
*/


/*
        3) FOR LOOP
          [문법]
            FOR 변수 IN [REVERSE] 초기값..최종값
            LOOP
                반복적으로 실행할 구문;
            END LOOP;
*/
-- 출력기능 활성화
SET SERVEROUTPUT ON;
-- 구구단(2 ~ 9단) 출력 (단, 짝수단만 출력한다.)
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

-- 반복문(FOR 구문)을 이용한 데이터 삽입
CREATE TABLE TEST (
    NUM NUMBER,
    CREATE_DATE DATE
);

-- TEST 테이블에 10개의 행을 INSERT하는 PL/SQL 작성
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
    <PL/SQL 예외처리부(EXCEPTION SECTION)>
        예외란 실행 중 발생하는 오류를 뜻하고 PL/SQL 문에서 발생한 예외를 예외처리부에서 코드로 처리가 가능하다.

        [문법]
            DECLARE
                ...
            BEGIN
                ...
            EXCEPTION
                WHEN 예외명 1 THEN 예외처리구문 1;
                WHEN 예외명 2 THEN 예외처리구문 2;
                ...
                WHEN OTHERS THEN 예외처리구문;
                
        * 오라클에서 미리 정의되어 있는 예외
          - NO_DATA_FOUND : SELECT 문의 수행 결과가 한 행도 없을 경우에 발생한다.
          - TOO_MANY_ROWS : 한 행이 리턴되어야 하는데 SELECT 문에서 여러 개의 행을 리턴할 때 발생한다. 
          - ZERO_DIVIDE   : 숫자를 0으로 나눌 때 발생한다.
          - DUP_VAL_ON_INDEX : UNIQUE 제약 조건을 가진 컬럼에 중복된 데이터가 INSERT 될 때 발생한다.
*/


-- 테스트용 테이블 생성
CREATE TABLE EMP_DUP
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP_DUP;

-- 테스트 테이블의 데이터를 모두 삭제하는 프로시저 생성
CREATE PROCEDURE DEL_ALL_EMP
IS
BEGIN
    DELETE FROM EMP_DUP;
    
    COMMIT;
END;
/

-- 프로시저를 관리하는 데이터 딕셔너리
SELECT * FROM USER_SOURCE;

-- DEL_ALL_EMP 프로시저 호출
EXECUTE DEL_ALL_EMP;

SELECT * FROM EMP_DUP;

DROP PROCEDURE DEL_ALL_EMP;
DROP TABLE EMP_DUP;



-------------------------------------------
/*
    1) 매개변수가 있는 프로시저
      프로시저 실행 시 매개변수로 인자값을 전달해야 한다.
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

-- 프로시저 실행(단, 매개 값을 전달해야 한다.)
--EXEC DEL_EMP_ID; -- 에러 발생
EXEC DEL_EMP_ID('204');

SELECT * FROM EMPLOYEE;

-- 사용자가 입력한 값도 전달이 가능하다.
EXEC DEL_EMP_ID('&사번');

ROLLBACK;

SELECT * FROM EMPLOYEE;

/*
    2) IN/OUT 매개변수가 있는 프로시저
      IN 매개변수 : 프로시저 내부에서 사용될 변수
      OUT 매개변수 : 프로시저 호출부(외부)에서 사용될 값을 담아줄 변수
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

-- 바인드 변수(VARIABLE, VAR)
VARIABLE VAR_EMP_NAME VARCHAR2(30);
VAR VAR_SALARY NUMBER;
VAR VAR_BONUS NUMBER;

SET AUTOPRINT ON;

-- 바인드 변수는 ':변수명' 형태로 참조 가능
EXEC SELECT_EMP_ID('200', :VAR_EMP_NAME, :VAR_SALARY, :VAR_BONUS);

PRINT VAR_EMP_NAME;
PRINT VAR_SALARY;
PRINT VAR_BONUS;

---------------------------------------------------
/*
    <FUNCTION>
        프로시저와 사용 용도가 비슷하지만
        프로시저와 다르게 OUT 변수를 사용하지 않아도 실행 결과를 되돌려 받을 수 있다.(RETURN )
        
        [문법]
            CREATE FUNCTION 함수명
            (
                매개변수 1 타입,
                매개변수 2 타입,
                ...
            )
            RETURN 데이터타입
            IS
                선언부
            BEGIN
                실행부
                
                RETRUN 반환값; -- 프로시저랑 다르게 RETURN 구문이 추가된다.
            EXCEPTION
                예외처리부
            END [함수명];
            /
*/

-- 사번을 입력받아 해당 사원의 보너스를 포함하는 연봉을 계산하고 리턴하는 함수 생성
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
        SQL 문의 처리 결과(처리 결과가 여러 행(ROW))를 담고 있는 객체이다.
        커서 사용 시 여러 행으로 나타난 처리 결과에 순차적으로 접근이 가능하다.
        
        [커서 속성]
            커서명%NOTFOUND : 커서 영역에 남아있는 ROW 수가 없다면 TURE, 아니면 FALSE
            커서명%FOUND    : 커서 영역에 남아있는 ROW 수가 한 개 이상일 경우 TRUE, 아니면 FALSE
            커서명%ISOPEN   : 커서가 OPEN 상태인 경우 TRUE, 아니면 FALSE
            커서명%ROWCOUNT : SQL 처리 결과로 얻어온 행(ROW)의 수
        
        [사용 방법]
            1) CURSOR 커서명 IS ..     : 커서 선언
            2) OPEN 커서명;            : 커서 오픈
            3) FETCH 커서명 INTO 변수, ...   : 커서에서 데이터 추출(한 행씩 데이터를 가져온다.)
            4) CLOSE 커서명            : 커서 닫기
        
        [문법]
            CURSOR 커서명 IS [SELECT 문]
            
            OPEN 커서명;
            FETCH 커서명 INTO 변수;
            ...
            
            CLOSE 커서명;
*/
SET SERVEROUTPUT ON;

-- 급여가 3000000 이상인 사원의 사번, 이름, 급여 출력(PL/SQL)
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    
    -- 커서 선언
    CURSOR C1 IS 
        SELECT EMP_ID, EMP_NAME, SALARY
        FROM EMPLOYEE
        WHERE SALARY > 3000000;
BEGIN
    -- 커서 오픈
    OPEN C1;
    
    LOOP
        FETCH C1 INTO EID, ENAME, SAL;
        
        EXIT WHEN C1%NOTFOUND;
                
        DBMS_OUTPUT.PUT_LINE(EID || ' ' || ENAME || ' ' || SAL);
    END LOOP;  
    
    CLOSE C1;
END;
/

-- 전체 부서에 대해 부서 코드, 부서명, 지역 조회(PROCEDURE)
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

-- FOR IN LOOP를 이용한 커서 사용
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
