/*
    <���� �Լ�>
        �׷캰 ������ ��� ���� �߰� ���踦 ��� ���ִ� �Լ�
*/

-- ���޺� �޿��� �հ踦 ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- ������ �࿡ ��ü �� �޿��� �հ���� ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY JOB_CODE;

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY JOB_CODE;

-- �μ� �ڵ嵵 ���� ���� �ڵ嵵 ���� ������� �׷� ��� �޿��� �հ踦 ��ȸ
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;

-- ROLLUP(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ���� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;

-- CUBE(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ����, �÷� 2�� ������ �߰����踦 ����. ��, ���޵Ǵ� �÷� ��� �����ϴ� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;



/*
    <���� ������>
        ���� ���� �������� ������ �ϳ��� ���������� ����� �������̴�.
        
        UNION       : �� �������� ������ ������� ���� �� �ߺ��Ǵ� ���� �����Ѵ�. (������)
        UNION ALL   : UNION�� �����ϰ� �� �������� ������ ������� ���ϰ� �ߺ��� ����Ѵ�. (������)
        INTERSECT   : �� �������� ������ ������� �ߺ��� ������� �����Ѵ�. (������)
        MINUS       : ���� ������ ��������� ���� ������ ������� �� ������ ������� �����Ѵ�. (������)
*/
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- �μ��ڵ尡 5�� ��� �Ǵ� �޿��� 300���� �ʰ��� ��� 
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
        �� ���� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ����ϴ� �����̴�.
        
        1. � ����(EQUAL JOIN) / ���� ����(INNER JOIN)
            �����Ű�� Į���� ���� ��ġ�ϴ� ��鸸 ���εǼ� ��ȸ�Ѵ�.(��ġ�ϴ� ���� ���� ���� ��ȸ X)
            
            1) ����Ŭ ���� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1, ���̺�2
                    WHERE ���̺�1.Į���� = ���̺�2.Į����;
                
                - FROM ���� ��ȸ�ϰ��� �ϴ� ���̺���� �޸�(,)�� �����Ͽ� �����Ѵ�.
                - WHERE ���� ��Ī ��ų Į���� ���� ������ �����Ѵ�.
            
            2) ANSI ǥ�� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1
                    [INNER] JOIN ���̺�2 ON (���̺�1.Į���� = ���̺�2.Į����);
                
                - FROM ���� ������ �Ǵ� ���̺��� ����Ѵ�.
                - JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺��� ��� �� ��Ī ��ų Į���� ���� ������ ����Ѵ�.
                - ���ῡ ����Ϸ��� Į������ ���� ��� ON ���� ��ſ� USING(Į����) ������ ����Ѵ�.
*/

-- �����, �����ڵ�, ���޸� ��ȸ
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
-- �����, �μ��ڵ�, �μ��� ��ȸ
;
SELECT E.DEPT_CODE,
 SUM(E.SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
WHERE E.DEPT_CODE != 'D5'
GROUP BY E.DEPT_CODE;

-- EMPLOYEE ���̺� , JOB ���̺��� �̿��Ͽ�
-- �����, �����ڵ�, ���޸� ��ȸ
SELECT 
E.EMP_NAME
, E.JOB_CODE
, J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE;


-- EMPLOYEE ���̺� , DEPARTMENT ���̺��� �̿��Ͽ�
-- �����, �μ��ڵ�, �μ��� ��ȸ
SELECT 
E.EMP_NAME
, E.DEPT_CODE
, D.DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID;

-- DEPARTMENT ���̺� , LOCATION ���̺��� �̿��Ͽ�
-- �μ��ڵ�, �μ���, �����ڵ�, ������, �����ڵ� ��ȸ
SELECT 
 D.DEPT_ID
, D.DEPT_TITLE
, L.LOCAL_CODE
, L.LOCAL_NAME
, L.NATIONAL_CODE
FROM DEPARTMENT D
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE;

-- LOCATION ���̺� , NATIONAL ���̺��� �̿��Ͽ�
-- �����ڵ�, ������, �����ڵ�, ������ ��ȸ
SELECT 
 L.LOCAL_CODE
, L.NATIONAL_CODE
, L.LOCAL_NAME
, N.NATIONAL_NAME
FROM LOCATION L
JOIN NATIONAL N
ON L.NATIONAL_CODE = N.NATIONAL_CODE;

-- DEPARTMENT ���̺� , LOCATION ���̺� , NATIONAL ���̺��� �̿��Ͽ�
-- �μ��ڵ�, �μ���, ������, ������ ��ȸ
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
