/*
    3. �ܺ� ���� (OUTTER JOIN)
        ���̺� ���� JOIN �� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ�� �����ϴ�.
        ��, �ݵ�� �����̵Ǵ� ���̺�(�÷�)�� �����ؾ� �Ѵ�. (LEFT/RIGHT/(+))
        +FULL 
*/
SELECT 
E.EMP_NAME,D.DEPT_ID, D.DEPT_TITLE
FROM EMPLOYEE E
FULL OUTER JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID;

/*
    4. ī�׽þȰ�(CARTESIAN PRODUCT) / ���� ����(CROSS JOIN)
        ���εǴ� ��� ���̺��� �� ����� ���μ��� ��� ���ε� �����Ͱ� �˻��ȴ�.
        ���̺��� ����� ��� ������ ����� ������ ��� -> ����ȭ�� ����
*/

SELECT *
FROM LOCATION
CROSS JOIN NATIONAL
;
/*
    5. �� ����(NON EQUAL JOIN)
        ���� ���ǿ� ��ȣ(=)�� ������� �ʴ� ���ι��� �� �����̶�� �Ѵ�.
        ������ Į�� ���� ��ġ�ϴ� ��찡 �ƴ�, ���� ������ ���ԵǴ� ����� �����ϴ� ����̴�.
        ( = �̿ܿ� �� ������ >, <, >=, <=, BETWEEN AND, IN, NOT IN ���� ����Ѵ�.)
        ANSI �������δ� JOIN ON �������θ� ����� �����ϴ�. (USING ��� �Ұ�)
*/

SELECT EMP_NAME, SALARY ,S.*
FROM EMPLOYEE E
JOIN SAL_GRADE S 
ON E.SALARY >= S.MIN_SAL and E.SALARY < S.MAX_SAL;

/*
    6. ��ü ����(SELF JOIN)
        ���� ���̺��� �ٽ� �ѹ� �����ϴ� ��쿡 ����Ѵ�.
*/

-- ���� ��ȣ, ���� �̸�, ��� ��ȣ
SELECT 
    E1.EMP_ID
    , E1.EMP_NAME
    , E1.MANAGER_ID
    , E2.EMP_NAME
FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON
E1.MANAGER_ID = E2.EMP_ID
;

--�������� (SUBQUERY)

/*
    <SUBQUERY>
        �ϳ��� SQL �� �ȿ� ���Ե� �� �ٸ� SQL ���� ���Ѵ�. 
        ���� ����(���� ����)�� �����ϴ� ������ �ϴ� �������̴�.
*/



-- ��ȫö ����� ���� �μ��� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (
    SELECT DEPT_CODE
    FROM EMPLOYEE E
    WHERE EMP_NAME = '���ö'
)
;
/*
    <���� ���� ����>
        ���� ������ ���� ������ ������ ������� ��� ���� ������ ���� �з��� �� �ִ�.
        
        1) ������ ���Ͽ� ���� ����  : ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� ��
        2) ������ ���� ����        : ���� ������ ��ȸ ��� ���� ���� ������ ���� �� �� ��
        3) ���߿� ���� ����        : ���� ������ ��ȸ ��� ���� �� �������� Į���� ������ �϶�
        4) ������, ���߿� ���� ���� : ���� ������ ��ȸ ��� ���� ������, ������ �� ��
        
        * ���� ������ ������ ���� ���� ���� �տ� �ٴ� �����ڰ� �޶�����.
        
    <������ ���� ����>
        ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� �� (������, ���Ͽ�)
        �� ������(������ ������) ��� ���� (=, !=, <>, ^=, >, <, >=, <=, ...)
*/

-- 1) �� ������ ��� �޿����� �޿��� ���� �޴� �������� �̸�

SELECT SALARY
FROM EMPLOYEE;

SELECT EMP_NAME
FROM EMPLOYEE
WHERE SALARY < 
(
    SELECT AVG(SALARY)
    FROM EMPLOYEE //��� �޿��� ��ȯ;
)
;

SELECT AVG(SALARY)
    FROM EMPLOYEE;
-- 2) ���� �޿��� �޴� ������ ���, �̸�, ���� �ڵ�, �޿�, �Ի��� ��ȸ


SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_CODE
    , SALARY
    , HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = 
(
SELECT MIN(SALARY)
FROM EMPLOYEE
)
;
-- 3) ���ö ����� �޿����� �� ���� �޿��޴� ������� ���, �����, �μ���, ���� �ڵ�, �޿� ��ȸ
SELECT 
    E.EMP_ID
    , E.EMP_NAME
    , D.DEPT_TITLE
    , E.JOB_CODE
    , E.SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
WHERE SALARY > 
(
SELECT SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME = '���ö'
)
;

-- 4) �μ��� �޿��� ���� ���� ū �μ��� �μ� �ڵ�, �޿��� �� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 
(
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
)
;
-- 5) ������ ����� �����ִ� �μ����� ��ȸ (��, ������ ����� ����)
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 
(
SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE EMP_NAME = '������'
) 
AND EMP_NAME != '������'
;
/*
    <������ ���� ����>
        ���� ������ ��ȸ ��� ���� ���� ������ ���� �� �� ��
        
        IN / NOT IN (���� ����) : ���� ���� ����� �߿��� �� ���� ��ġ�ϴ� ���� �ִٸ� Ȥ�� ���ٸ� TRUE�� �����Ѵ�.
        ANY : ���� ���� ���� �߿��� �� ���� �����ϸ� TRUE, IN�� �ٸ� ���� �� �����ڸ� �Բ� ����Ѵٴ� ���̴�. 
            ANY(100, 200, 300)
            SALARY = ANY(...)  : IN�� ���� ���
            SALARY != ANY(...) : NOT IN�� ���� ���
            SALARY > ANY(...)  : �ּҰ� ���� ũ�� TRUE
            SALARY < ANY(...)  : �ִ밪 ���� ������ TRUE
        ALL : ���� ���� ���� ��ο� ���Ͽ� �����ؾ� TRUE, IN�� �ٸ� ���� �� �����ڸ� �Բ� ����Ѵٴ� ���̴�.
            ALL(100, 200, 300)
            SALARY > ALL(...)  : �ִ밪 ���� ũ�� TRUE
            SALARY < ALL(...)  : �ּҰ� ���� ������ TRUE
*/

-- 1) �� �μ��� �ְ� �޿��� �޴� ������ �̸�, ���� �ڵ�, �μ� �ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN 
(
SELECT MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
);



-- 2) �� �����鿡 ���� ���, �̸�, �μ� �ڵ�, ����(���/���)

SELECT MANAGER_ID
FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING MANAGER_ID IS NOT NULL;

SELECT
EMP_ID
, EMP_NAME
, DEPT_CODE
,CASE 
WHEN MANAGER_ID  IN 
    (
    SELECT MANAGER_ID
    FROM EMPLOYEE
    GROUP BY MANAGER_ID
    HAVING MANAGER_ID IS NOT NULL
    )
THEN '���'
ELSE '���'
END AS ����
FROM EMPLOYEE;

-- 3) �븮 �����ӿ��� ���� ���޵��� �ּ� �޿����� ���� �޴� ������ ���, �̸�, ���޸�, �޿� ��ȸ
SELECT MIN(SALARY)
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����'
;

SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '�븮' AND SALARY >
(
SELECT MIN(SALARY)
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����'
)
;

--ANY ���
SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '�븮'
AND SALARY > ANY
(
SELECT MIN(SALARY)
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����'
)
;

-- 4) ���� �����ӿ��� ���� ������ �ִ� �޿����� �� ���� �޴� �������� ���, �̸�, ���޸�, �޿� ��ȸ 
SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����'
AND SALARY > ALL
(
SELECT MIN(SALARY)
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����'
)
;
/*
    <���߿� ���� ����>
        ��ȸ ��� ���� �� �������� ������ Į�� ���� ���� ���� ��
*/
--1.������ ����� �μ� �ڵ�, ���� �ڵ尡 ���� ����� ��� ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (
                                    SELECT DEPT_CODE, JOB_CODE
                                    FROM EMPLOYEE
                                    WHERE EMP_NAME ='������'
                                )
;

-- 2) �ڳ��� ����� ���� �ڵ尡 ��ġ�ϸ鼭 ���� ����� ������ �ִ� ����� ���, �̸�, ���� �ڵ�, ��� ���, ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) IN (
    SELECT JOB_CODE, MANAGER_ID
    FROM EMPLOYEE
    WHERE EMP_NAME = '�ڳ���'
);

/*
    <������ ���߿� ���� ����>
        ���� ������ ��ȸ ������� ���� ��, ���� ���� ���
*/

-- 1. �� ���޺��� �ּ� �޿��� �޴� ������� ���, �̸�, ���� �ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (
    SELECT JOB_CODE, MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY JOB_CODE
);

/*
    <�ζ��� ��>
        FROM ���� ���� ������ �����ϰ�, ���� ������ ������ ����� ���̺� ��� ����Ѵ�.
*/

SELECT EMP_NAME, SALARY, ROWNUM
FROM
(
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC
)
WHERE ROWNUM BETWEEN 1 AND 20
;
