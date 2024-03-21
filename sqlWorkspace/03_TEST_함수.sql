/*
    <집계 함수>
        그룹별 산출한 결과 값의 중간 집계를 계산 해주는 함수
*/

-- 직급별 급여의 합계를 조회
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 마지막 행에 전체 총 급여의 합계까지 조회
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY JOB_CODE;

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY JOB_CODE;

-- 부서 코드도 같고 직급 코드도 같은 사원들을 그룹 지어서 급여의 합계를 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;

-- ROLLUP(컬럼 1, 컬럼 2, ...) -> 컬럼 1을 가지고 중간집계를 내는 함수
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;

-- CUBE(컬럼 1, 컬럼 2, ...) -> 컬럼 1을 가지고 중간집계를 내고, 컬럼 2를 가지고 중간집계를 낸다. 즉, 전달되는 컬럼 모두 집계하는 함수
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;



/*
    <집합 연산자>
        여러 개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자이다.
        
        UNION       : 두 쿼리문을 수행한 결과값을 더한 후 중복되는 행은 제거한다. (합집합)
        UNION ALL   : UNION과 동일하게 두 쿼리문을 수행한 결과값을 더하고 중복은 허용한다. (합집합)
        INTERSECT   : 두 쿼리문을 수행한 결과값에 중복된 결과값만 추출한다. (교집합)
        MINUS       : 선행 쿼리의 결과값에서 후행 쿼리의 결과값을 뺀 나머지 결과값만 추출한다. (차집합)
*/
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- 부서코드가 5인 사원 또는 급여가 300만원 초과인 사원 
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000 OR DEPT_CODE = 'D5';

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS 
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

--JOIN

/*
    <JOIN>
        두 개의 이상의 테이블에서 데이터를 조회하고자 할 때 사용하는 구문이다.
        
        1. 등가 조인(EQUAL JOIN) / 내부 조인(INNER JOIN)
            연결시키는 칼럼의 값이 일치하는 행들만 조인되서 조회한다.(일치하는 값이 없는 행은 조회 X)
            
            1) 오라클 전용 구문
                [문법]
                    SELECT 칼럼, 칼럼, ...
                    FROM 테이블1, 테이블2
                    WHERE 테이블1.칼럼명 = 테이블2.칼럼명;
                
                - FROM 절에 조회하고자 하는 테이블들을 콤마(,)로 구분하여 나열한다.
                - WHERE 절에 매칭 시킬 칼럼명에 대한 조건을 제시한다.
            
            2) ANSI 표준 구문
                [문법]
                    SELECT 칼럼, 칼럼, ...
                    FROM 테이블1
                    [INNER] JOIN 테이블2 ON (테이블1.칼럼명 = 테이블2.칼럼명);
                
                - FROM 절에 기준이 되는 테이블을 기술한다.
                - JOIN 절에 같이 조회하고자 하는 테이블을 기술 후 매칭 시킬 칼럼에 대한 조건을 기술한다.
                - 연결에 사용하려는 칼럼명이 같은 경우 ON 구문 대신에 USING(칼럼명) 구문을 사용한다.
*/

-- 사원명, 직급코드, 직급명 조회
SELECT
EMP_NAME
, E.JOB_CODE
, JOB_NAME
FROM EMPLOYEE E JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE 
;
SELECT
EMP_NAME
, J.JOB_CODE
, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
-- 사원명, 부서코드, 부서명 조회
;
SELECT E.DEPT_CODE,
 SUM(E.SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
WHERE E.DEPT_CODE != 'D5'
GROUP BY E.DEPT_CODE;

-- EMPLOYEE 테이블 , JOB 테이블을 이용하여
-- 사원명, 직급코드, 직급명 조회
SELECT 
E.EMP_NAME
, E.JOB_CODE
, J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE;


-- EMPLOYEE 테이블 , DEPARTMENT 테이블을 이용하여
-- 사원명, 부서코드, 부서명 조회
SELECT 
E.EMP_NAME
, E.DEPT_CODE
, D.DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID;

-- DEPARTMENT 테이블 , LOCATION 테이블을 이용하여
-- 부서코드, 부서명, 지역코드, 지역명, 국가코드 조회
SELECT 
 D.DEPT_ID
, D.DEPT_TITLE
, L.LOCAL_CODE
, L.LOCAL_NAME
, L.NATIONAL_CODE
FROM DEPARTMENT D
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE;

-- LOCATION 테이블 , NATIONAL 테이블을 이용하여
-- 지역코드, 지역명, 국가코드, 국가명 조회
SELECT 
 L.LOCAL_CODE
, L.NATIONAL_CODE
, L.LOCAL_NAME
, N.NATIONAL_NAME
FROM LOCATION L
JOIN NATIONAL N
ON L.NATIONAL_CODE = N.NATIONAL_CODE;

-- DEPARTMENT 테이블 , LOCATION 테이블 , NATIONAL 테이블을 이용하여
-- 부서코드, 부서명, 지역명, 국가명 조회
SELECT 
 D.DEPT_ID
, D.DEPT_TITLE
, L.LOCAL_NAME
, N.NATIONAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE 
JOIN NATIONAL N
USING(NATIONAL_CODE);
