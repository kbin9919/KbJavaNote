/*
    <숫자 관련 함수>
    
    1) ABS
        - ABS(NUBER)
        - 절대값을 구하는 함수
*/
SELECT ABS(10.9) FROM DUAL;
SELECT ABS(-10.9) FROM DUAL;

/*
    2) MOD
        - MOD(NUMBER, NUMBER)
        - 두 수를 나눈 나머지를 반환해 주는 함수 (자바의 % 연산과 동일하다.)
*/
-- SELECT 10 % 3 FROM DUAL;

SELECT MOD(-10, 3) FROM DUAL;
SELECT MOD(10, -3) FROM DUAL;
SELECT MOD(10.9, -3) FROM DUAL;
SELECT MOD(-10.9, 3) FROM DUAL;

/*
    3) ROUND
        - ROUND(NUMBER[, 위치])
        - 위치를 지정하여 반올림해주는 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456, 1) FROM DUAL;


SELECT ROUND(123.456, 4) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
SELECT ROUND(123.456, -3) FROM DUAL;
SELECT ROUND(723.456, -3) FROM DUAL;

/*
    4) CEIL
        - CEIL(NUMBER)
        - 소수점 기준으로 올림해주는 함수
*/
--SELECT CEIL(123.456, 2) FROM DUAL;
SELECT CEIL(123.456) FROM DUAL;

/*
    5) FLOOR
        - FLOOR(NUMBER)
        - 소수점 기준으로 버림하는 함수
*/
SELECT FLOOR(123.456) FROM DUAL;

SELECT FLOOR(123.789) FROM DUAL;

/*
    6) TRUNC
        - TRUNC(NUMBER[, 위치])
        - 위치를 지정하여 버림이 가능한 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/
SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.456, 1) FROM DUAL;

SELECT TRUNC(123.456, -1) FROM DUAL;

/*
    <날짜 관련 함수>
    
    1) SYSDATE
        시스템의 현재 날짜와 시간을 반환한다.
*/
SELECT SYSDATE FROM DUAL;

/* 
    2) MONTHS_BETWEEN
        [문법]
            MONTHS_BETWEEN(DATE1, DATE2)
            
        - 입력받은 두 날짜 사이의 개월 수를 반환한다.
        - 결과값은 NUMBER 타입이다.
*/

-- EMPLOYEE 테이블에서 직원명 , 입사일, 근무계월수 조회
SELECT EMP_NAME
, HIRE_DATE
, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 1)AS "근무계월수"
FROM EMPLOYEE
;

/*
    3) ADD_MONTHS
        [문법]
            ADD_MONTHS(DATE, NUMBER)
            
        - 특정 날짜에 입력받는 숫자만큼의 개월 수를 더한 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

/*
    4) NEXT_DAY
        [문법]
            NEXT_DAY(DATE, 요일(문자|숫자))
        
        - 특정 날짜에서 구하려는 요일의 가장 가까운 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/

SELECT SYSDATE, NEXT_DAY(SYSDATE, '목요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '화') FROM DUAL;

SELECT 
SYSDATE
, NEXT_DAY(SYSDATE, 1)
, NEXT_DAY(SYSDATE, '일') 
FROM DUAL;-- 1:일요일, 2:월요일, ..., 7:토요일


SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL; -- 에러(현재 언어가 KOREAN이기 때문에)
ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- 언어 변경
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- 언어 변경

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MON') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '목') FROM DUAL; -- 에러 발생
SELECT SYSDATE, NEXT_DAY(SYSDATE, '목요일') FROM DUAL; -- 에러 발생



/*
    5) LAST_DAY
        [문법]
            LAST_DAY(DATE)
        
        - 해당 월의 마지막 날짜를 반환한다.
        - 결과값은 DATE 타입이다.   
*/
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    6) EXTRACT
        [문법]
            EXTRACT(YEAR|MONTH|DAY FROM DATE);
            
        - 특정 날짜에서 연도, 월, 일 정보를 추출해서 반환한다.
          YEAR : 연도만 추출
          MONTH : 월만 추출
          DAY :  일만 추출
        - 결과값은 NUMBER 타입이다.
*/

SELECT
    SYSDATE
    , EXTRACT (YEAR FROM SYSDATE)
    , EXTRACT (MONTH FROM SYSDATE)
    , EXTRACT (DAY FROM SYSDATE)
FROM DUAL;


-- 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
SELECT SYSDATE FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

/*
    <형변환 함수>
    
    1) TO_CHAR
        [문법]
            TO_CHAR(날짜|숫자[, 포멧])
        
        - 날짜 또는 숫자 타입의 데이터를 문자 타입으로 변환해서 반환한다.
        - 결과값은 CHARACTER 타입이다.
*/

-- 숫자 --> 문자
SELECT 
1234 AS 숫자를문자로바꾸기테스트 
    , '1234' AS 숫자를문자로바꾸기테스트
    , TO_CHAR(1234)
FROM DUAL;

SELECT TO_CHAR(1234) FROM DUAL;

SELECT TO_CHAR(1234, '999999') -- 6칸의 공간을 확보, 오른쪽 정렬, 빈칸은 공백으로 채운다.
,TO_CHAR(1234, '000000') -- 6칸의 공간을 확보, 오른쪽 정렬, 빈칸은 0으로 채운다.
,TO_CHAR(1234, 'L999999') -- 현재 설정된 나라(LOCAL)의 화폐단위
FROM DUAL; 


SELECT TO_CHAR(1234, 'L999999') FROM DUAL; -- 현재 설정된 나라(LOCAL)의 화폐단위
SELECT TO_CHAR(1234, '$999999') FROM DUAL;
SELECT TO_CHAR(1234, 'L') FROM DUAL;
SELECT TO_CHAR(1234, 'L999,999') FROM DUAL; -- 자리수 구분 콤마

-- 날짜 --> 문자
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;

SELECT 
TO_CHAR(SYSDATE, 'AM HH:MI:SS') 
,TO_CHAR(SYSDATE, 'YYYY-MM-DD(DY)')
,TO_CHAR(SYSDATE, 'YYYY.MM.DD HH:SS')
FROM DUAL;



SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD(DY)') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD HH:SS') FROM DUAL;

/*
    2) TO_DATE
        [문법]
            TO_DATE(숫자|문자[, 포멧])
        
        - 숫자 또는 문자형 데이터를 날짜 타입으로 변환해서 반환한다.
        - 결과값은 DATE 타입이다.
*/
-- 숫자 --> 날짜
SELECT TO_DATE(20211014) FROM DUAL;

-- 문자 --> 날짜
SELECT TO_DATE('20211014') FROM DUAL;
SELECT TO_DATE(20211014190830,'YYYYMMDD HH24MISS') FROM DUAL;


SELECT TO_DATE('20211014 090830', 'YYYYMMDD HH24MISS') FROM DUAL;


SELECT TO_DATE('20211014', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20211014 190830' , 'YYYYMMDD HH24MISS') FROM DUAL;

/*
    3) TO_NUMBER
        [문법]
            TO_NUMBER('문자값'[, 포멧])
        
        - 문자 타입의 데이터를 숫자 타입의 데이터로 변환해서 반환한다.
        - 결과값은 NUMBER 타입이다.
*/
SELECT TO_NUMBER('0123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL; -- 자동으로 숫자 타입으로 형변환 뒤 연산처리를 해준다.
SELECT '123' + '456A' FROM DUAL; -- 에러 발생(숫자 형태의 문자들만 자동형변환 된다.)
SELECT '10,000,000' + '500,000' FROM DUAL; -- 에러 발생


SELECT TO_NUMBER('10000,000', '99999,999') + TO_NUMBER('500,000', '999,999') FROM DUAL;

/*
    <NULL 처리 함수>
    
    1) NVL
        [문법]
            NVL(컬럼, 컬럼값이 NULL일 경우 반환할 값)
        
        - NULL로 되어있는 컬럼의 값을 인자로 지정한 값으로 변경하여 반환한다.

    2) NVL2
        [문법]
            NVL2(컬럼, 변경할 값 1, 변경할 값 2)
            
        - 컬럼 값이 NULL이 아니면 변경할 값 1, 컬럼 값이 NULL이면 변경할 값 2로 변경하여 반환한다.  
    
    3) NULLIF
        [문법]
            NULLIF(비교대상 1, 비교대상 2)
            
        - 두 개의 값이 동일하면 NULL 반환, 두 개의 값이 동일하지 않으면 비교대상 1을 반환한다.
*/
SELECT EMP_NAME
    , NVL2(BONUS , '1', '0')
FROM EMPLOYEE;

SELECT EMP_NAME
    , BONUS
FROM EMPLOYEE;

SELECT EMP_NAME
    , NVL(BONUS , 00)
FROM EMPLOYEE;

SELECT 
    'HELLO'
    , 'WORLD'
    , NULLIF('HELLO', 'HELLO')
FROM DUAL;

/*
    <선택함수>
        여러 가지 경우에 선택을 할 수 있는 기능을 제공하는 함수이다.
    
    1) DECODE
        [문법]
            DECODE(칼럼|계산식, 조건값 1, 결과값 1, 조건값 2, 결과값 2, ..., 결과값)
        
        - 비교하고자 하는 값이 조건값과 일치할 경우 그에 해당하는 결과값을 반환해 주는 함수이다.
*/

SELECT EMP_NAME, DEPT_CODE
,DECODE(DEPT_CODE, 'D1','개발 1팀','D2', '개발 2팀')AS "부서명"
FROM EMPLOYEE;

-- 사원명, 직급코드, 직급명 조회 
SELECT EMP_NAME, DECODE( JOB_CODE , 'J1', '대표', 'J2', '부사장', 'J3', '부장', 'J4', '차장', 'J5', '과장', 'J6', '대리', 'J7', '사원')
FROM EMPLOYEE;

/*
    2) CASE
        [문법]
            CASE WHEN 조건식 1 THEN 결과값 1
                 WHEN 조건식 2 THEN 결과값 2
                 ...
                 ELSE 결과값 N
            END
*/

SELECT 
    EMP_NAME
    , JOB_CODE
    , CASE
        WHEN JOB_CODE = 'J1' THEN '사장'
        WHEN JOB_CODE = 'J2' THEN '오장'
        WHEN JOB_CODE = 'J3' THEN '육장'
        ELSE '해당사항없음'
    END AS 직급명
FROM EMPLOYEE
;

SELECT 
    EMP_NAME
    , SALARY
    , CASE
        WHEN SALARY <= 3000000 THEN '초급'
        WHEN SALARY <= 5000000 THEN '중급'
        WHEN SALARY <= 7000000 THEN '상급'
        ELSE '특급'
    END AS 구분
FROM EMPLOYEE
ORDER BY SALARY DESC
;
-- 사원명 주민번호 성별 조회
SELECT 
EMP_NAME
, EMP_NO
, CASE 
    WHEN SUBSTR (EMP_NO, 8,1) = 2 THEN '여성'
    WHEN SUBSTR (EMP_NO, 8,1) = 1 THEN '남성'
    END AS 성별
FROM EMPLOYEE;

/*
    <그룹 함수>
        대량의 데이터들로 집계나 통계 같은 작업을 처리해야 하는 경우 사용되는 함수들이다.
        모든 그룹 함수는 NULL 값을 자동으로 제외하고 값이 있는 것들만 계산을 한다.
        따라서 AVG 함수를 사용할 때는 반드시 NVL() 함수와 함께 사용하는 것을 권장한다.
        
        1) SUM
            [문법]
                SUM(NUMBER)
                
            - 해당 칼럼 값들의 총 합계를 반환한다.
       
/*
        2) AVG
            [문법]
                AVG(NUMBER)
            
            - 해당 컬럼 값들의 평균을 구해서 반환한다.
*/

/*
        3) MIN / MAX
            [문법]
                MIN/MAX(모든 타입 컬럼)
            
            - MIN : 해당 컬럼 값들 중에 가장 작은 값을 반환한다.
            - MAX : 해당 컬럼 값들 중에 가장 큰 값을 반환한다.
*/

/*
        4) COUNT
            [문법]
                COUNT(*|컬럼명|DISTINCT 컬럼명)
            
            - 컬럼 또는 행의 개수를 세서 반환하는 함수이다.
            - COUNT(*) : 조회 결과에 해당하는 모든 행의 개수를 반환한다.
            - COUNT(컬럼명) : 제시한 컬럼 값이 NULL이 아닌 행의 개수를 반환한다.
            - COUNT(DISTINCT 컬럼명) 해당 컬럼 값의 중복을 제거한 행의 개수를 반환한다. 

*/

SELECT SUM(SALARY), ROUND(AVG(SALARY), 1),  COUNT(BONUS)
FROM EMPLOYEE
;

SELECT SUM(SALARY)
FROM EMPLOYEE
;

SELECT ROUND(AVG(SALARY), 1)
FROM EMPLOYEE
;

SELECT COUNT(BONUS)
FROM EMPLOYEE
;

SELECT MAX (SALARY)
FROM EMPLOYEE
;