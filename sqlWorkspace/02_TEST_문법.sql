/*
    <GROUP BY>
        그룹 기준을 제시할 수 있는 구문
        여러 개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용한다.
*/
SELECT EMP_NAME
,LOCAL_CODE
FROM EMPLOYEE, LOCATION;

-- 전체 급여 총합 조회
SELECT SALARY
FROM EMPLOYEE;
-- 각 부서별 급여 총합 조회
SELECT SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
-- 전체 사원 수 조회
SELECT SALARY
FROM EMPLOYEE;
-- 각 부서별 사원 수 조회
SELECT COUNT(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
-- 각 부서별 보너스를 받는 사원수
SELECT COUNT(SALARY)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;

-- 각 직급별 급여 평균 조회
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE
GROUP BY JOB_CODE;
-- 부서별 사원수, 보너스를 받는 사원수, 급여의 합, 평균 급여, 최고 급여, 최저 급여 조회
SELECT COUNT(DEPT_CODE), COUNT(BONUS), SUM(SALARY),  FLOOR(AVG(SALARY)), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT JOB_CODE , SUM(BONUS)
FROM EMPLOYEE
GROUP BY JOB_CODE
;



SELECT SUBSTR(EMP_NO, 8, 1) AS "성별코드", COUNT(SALARY)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1)
ORDER BY "성별코드";

-- 부서별 사원수, 보너스를 받는 사원수, 급여의 합, 평균 급여, 최고 급여, 최저 급여 조회
SELECT DEPT_CODE AS "부서 코드",
       COUNT(*) AS "사원수",
       COUNT(BONUS) AS "보너스를 받는 사원수",
       TO_CHAR(SUM(SALARY), '99,999,999') AS "급여의 합",
       TO_CHAR(FLOOR(AVG(NVL(SALARY, 0))), '99,999,999') AS "평균 급여",
       TO_CHAR(MAX(SALARY), '99,999,999') AS "최고 급여",
       TO_CHAR(MIN(SALARY), '99,999,999') AS "최저 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE DESC NULLS LAST;

/*
    <HAVING>
        그룹에 대한 조건을 제시할 때 사용하는 구문(주로 그룹 함수의 결과를 가지고 비교 수행)
    
    * 실행 순서
        5: SELECT      조회하고자 하는 칼럼명 AS "별칭" | 계산식 | 함수식
        1: FROM        조회하고자 하는 테이블명
        2: WHERE       조건식
        3: GROUP BY    그룹 기준에 해당하는 칼럼명 | 계산식 | 함수식
        4: HAVING      그룹에 대한 조건식
        6: ORDER BY    정렬 기준에 해당하는 칼럼명 | 별칭 | 칼럼 순번
*/


--부서별 평균 급여가 300만원 이상 500만원 이하인 경우만 조회
SELECT 
    DEPT_CODE
    , FLOOR(AVG(SALARY)) || '원' "평균 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING (AVG(SALARY)) >=  3000000 AND (AVG(SALARY)) <=  5000000;

-- 직급별 총 급여의 합이 10000000 이상인 직급들만 조회
SELECT JOB_CODE
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000;
-- 부서별 보너스를 받는 사원이 없는 부서들만 조회
SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0; 


