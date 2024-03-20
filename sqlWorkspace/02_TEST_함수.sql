/*
    <���� ���� �Լ�>
    
    1) ABS
        - ABS(NUBER)
        - ���밪�� ���ϴ� �Լ�
*/
SELECT ABS(10.9) FROM DUAL;
SELECT ABS(-10.9) FROM DUAL;

/*
    2) MOD
        - MOD(NUMBER, NUMBER)
        - �� ���� ���� �������� ��ȯ�� �ִ� �Լ� (�ڹ��� % ����� �����ϴ�.)
*/
-- SELECT 10 % 3 FROM DUAL;

SELECT MOD(-10, 3) FROM DUAL;
SELECT MOD(10, -3) FROM DUAL;
SELECT MOD(10.9, -3) FROM DUAL;
SELECT MOD(-10.9, 3) FROM DUAL;

/*
    3) ROUND
        - ROUND(NUMBER[, ��ġ])
        - ��ġ�� �����Ͽ� �ݿø����ִ� �Լ�
        - ��ġ : �⺻�� 0(.), ���(�Ҽ��� �������� ������)�� ����(�Ҽ��� �������� ����)�� �Է°���
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
        - �Ҽ��� �������� �ø����ִ� �Լ�
*/
--SELECT CEIL(123.456, 2) FROM DUAL;
SELECT CEIL(123.456) FROM DUAL;

/*
    5) FLOOR
        - FLOOR(NUMBER)
        - �Ҽ��� �������� �����ϴ� �Լ�
*/
SELECT FLOOR(123.456) FROM DUAL;

SELECT FLOOR(123.789) FROM DUAL;

/*
    6) TRUNC
        - TRUNC(NUMBER[, ��ġ])
        - ��ġ�� �����Ͽ� ������ ������ �Լ�
        - ��ġ : �⺻�� 0(.), ���(�Ҽ��� �������� ������)�� ����(�Ҽ��� �������� ����)�� �Է°���
*/
SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.456, 1) FROM DUAL;

SELECT TRUNC(123.456, -1) FROM DUAL;

/*
    <��¥ ���� �Լ�>
    
    1) SYSDATE
        �ý����� ���� ��¥�� �ð��� ��ȯ�Ѵ�.
*/
SELECT SYSDATE FROM DUAL;

/* 
    2) MONTHS_BETWEEN
        [����]
            MONTHS_BETWEEN(DATE1, DATE2)
            
        - �Է¹��� �� ��¥ ������ ���� ���� ��ȯ�Ѵ�.
        - ������� NUMBER Ÿ���̴�.
*/

-- EMPLOYEE ���̺��� ������ , �Ի���, �ٹ������ ��ȸ
SELECT EMP_NAME
, HIRE_DATE
, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 1)AS "�ٹ������"
FROM EMPLOYEE
;

/*
    3) ADD_MONTHS
        [����]
            ADD_MONTHS(DATE, NUMBER)
            
        - Ư�� ��¥�� �Է¹޴� ���ڸ�ŭ�� ���� ���� ���� ��¥�� �����Ѵ�.
        - ������� DATE Ÿ���̴�.
*/
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

/*
    4) NEXT_DAY
        [����]
            NEXT_DAY(DATE, ����(����|����))
        
        - Ư�� ��¥���� ���Ϸ��� ������ ���� ����� ��¥�� �����Ѵ�.
        - ������� DATE Ÿ���̴�.
*/

SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL;

SELECT 
SYSDATE
, NEXT_DAY(SYSDATE, 1)
, NEXT_DAY(SYSDATE, '��') 
FROM DUAL;-- 1:�Ͽ���, 2:������, ..., 7:�����


SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL; -- ����(���� �� KOREAN�̱� ������)
ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- ��� ����
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- ��� ����

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MON') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL; -- ���� �߻�
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL; -- ���� �߻�



/*
    5) LAST_DAY
        [����]
            LAST_DAY(DATE)
        
        - �ش� ���� ������ ��¥�� ��ȯ�Ѵ�.
        - ������� DATE Ÿ���̴�.   
*/
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    6) EXTRACT
        [����]
            EXTRACT(YEAR|MONTH|DAY FROM DATE);
            
        - Ư�� ��¥���� ����, ��, �� ������ �����ؼ� ��ȯ�Ѵ�.
          YEAR : ������ ����
          MONTH : ���� ����
          DAY :  �ϸ� ����
        - ������� NUMBER Ÿ���̴�.
*/

SELECT
    SYSDATE
    , EXTRACT (YEAR FROM SYSDATE)
    , EXTRACT (MONTH FROM SYSDATE)
    , EXTRACT (DAY FROM SYSDATE)
FROM DUAL;


-- ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
SELECT SYSDATE FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

/*
    <����ȯ �Լ�>
    
    1) TO_CHAR
        [����]
            TO_CHAR(��¥|����[, ����])
        
        - ��¥ �Ǵ� ���� Ÿ���� �����͸� ���� Ÿ������ ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� CHARACTER Ÿ���̴�.
*/

-- ���� --> ����
SELECT 
1234 AS ���ڸ����ڷιٲٱ��׽�Ʈ 
    , '1234' AS ���ڸ����ڷιٲٱ��׽�Ʈ
    , TO_CHAR(1234)
FROM DUAL;

SELECT TO_CHAR(1234) FROM DUAL;

SELECT TO_CHAR(1234, '999999') -- 6ĭ�� ������ Ȯ��, ������ ����, ��ĭ�� �������� ä���.
,TO_CHAR(1234, '000000') -- 6ĭ�� ������ Ȯ��, ������ ����, ��ĭ�� 0���� ä���.
,TO_CHAR(1234, 'L999999') -- ���� ������ ����(LOCAL)�� ȭ�����
FROM DUAL; 


SELECT TO_CHAR(1234, 'L999999') FROM DUAL; -- ���� ������ ����(LOCAL)�� ȭ�����
SELECT TO_CHAR(1234, '$999999') FROM DUAL;
SELECT TO_CHAR(1234, 'L') FROM DUAL;
SELECT TO_CHAR(1234, 'L999,999') FROM DUAL; -- �ڸ��� ���� �޸�

-- ��¥ --> ����
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
        [����]
            TO_DATE(����|����[, ����])
        
        - ���� �Ǵ� ������ �����͸� ��¥ Ÿ������ ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� DATE Ÿ���̴�.
*/
-- ���� --> ��¥
SELECT TO_DATE(20211014) FROM DUAL;

-- ���� --> ��¥
SELECT TO_DATE('20211014') FROM DUAL;
SELECT TO_DATE(20211014190830,'YYYYMMDD HH24MISS') FROM DUAL;


SELECT TO_DATE('20211014 090830', 'YYYYMMDD HH24MISS') FROM DUAL;


SELECT TO_DATE('20211014', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20211014 190830' , 'YYYYMMDD HH24MISS') FROM DUAL;

/*
    3) TO_NUMBER
        [����]
            TO_NUMBER('���ڰ�'[, ����])
        
        - ���� Ÿ���� �����͸� ���� Ÿ���� �����ͷ� ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� NUMBER Ÿ���̴�.
*/
SELECT TO_NUMBER('0123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL; -- �ڵ����� ���� Ÿ������ ����ȯ �� ����ó���� ���ش�.
SELECT '123' + '456A' FROM DUAL; -- ���� �߻�(���� ������ ���ڵ鸸 �ڵ�����ȯ �ȴ�.)
SELECT '10,000,000' + '500,000' FROM DUAL; -- ���� �߻�


SELECT TO_NUMBER('10000,000', '99999,999') + TO_NUMBER('500,000', '999,999') FROM DUAL;

/*
    <NULL ó�� �Լ�>
    
    1) NVL
        [����]
            NVL(�÷�, �÷����� NULL�� ��� ��ȯ�� ��)
        
        - NULL�� �Ǿ��ִ� �÷��� ���� ���ڷ� ������ ������ �����Ͽ� ��ȯ�Ѵ�.

    2) NVL2
        [����]
            NVL2(�÷�, ������ �� 1, ������ �� 2)
            
        - �÷� ���� NULL�� �ƴϸ� ������ �� 1, �÷� ���� NULL�̸� ������ �� 2�� �����Ͽ� ��ȯ�Ѵ�.  
    
    3) NULLIF
        [����]
            NULLIF(�񱳴�� 1, �񱳴�� 2)
            
        - �� ���� ���� �����ϸ� NULL ��ȯ, �� ���� ���� �������� ������ �񱳴�� 1�� ��ȯ�Ѵ�.
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
    <�����Լ�>
        ���� ���� ��쿡 ������ �� �� �ִ� ����� �����ϴ� �Լ��̴�.
    
    1) DECODE
        [����]
            DECODE(Į��|����, ���ǰ� 1, ����� 1, ���ǰ� 2, ����� 2, ..., �����)
        
        - ���ϰ��� �ϴ� ���� ���ǰ��� ��ġ�� ��� �׿� �ش��ϴ� ������� ��ȯ�� �ִ� �Լ��̴�.
*/

SELECT EMP_NAME, DEPT_CODE
,DECODE(DEPT_CODE, 'D1','���� 1��','D2', '���� 2��')AS "�μ���"
FROM EMPLOYEE;

-- �����, �����ڵ�, ���޸� ��ȸ 
SELECT EMP_NAME, DECODE( JOB_CODE , 'J1', '��ǥ', 'J2', '�λ���', 'J3', '����', 'J4', '����', 'J5', '����', 'J6', '�븮', 'J7', '���')
FROM EMPLOYEE;

/*
    2) CASE
        [����]
            CASE WHEN ���ǽ� 1 THEN ����� 1
                 WHEN ���ǽ� 2 THEN ����� 2
                 ...
                 ELSE ����� N
            END
*/

SELECT 
    EMP_NAME
    , JOB_CODE
    , CASE
        WHEN JOB_CODE = 'J1' THEN '����'
        WHEN JOB_CODE = 'J2' THEN '����'
        WHEN JOB_CODE = 'J3' THEN '����'
        ELSE '�ش���׾���'
    END AS ���޸�
FROM EMPLOYEE
;

SELECT 
    EMP_NAME
    , SALARY
    , CASE
        WHEN SALARY <= 3000000 THEN '�ʱ�'
        WHEN SALARY <= 5000000 THEN '�߱�'
        WHEN SALARY <= 7000000 THEN '���'
        ELSE 'Ư��'
    END AS ����
FROM EMPLOYEE
ORDER BY SALARY DESC
;
-- ����� �ֹι�ȣ ���� ��ȸ
SELECT 
EMP_NAME
, EMP_NO
, CASE 
    WHEN SUBSTR (EMP_NO, 8,1) = 2 THEN '����'
    WHEN SUBSTR (EMP_NO, 8,1) = 1 THEN '����'
    END AS ����
FROM EMPLOYEE;

/*
    <�׷� �Լ�>
        �뷮�� �����͵�� ���質 ��� ���� �۾��� ó���ؾ� �ϴ� ��� ���Ǵ� �Լ����̴�.
        ��� �׷� �Լ��� NULL ���� �ڵ����� �����ϰ� ���� �ִ� �͵鸸 ����� �Ѵ�.
        ���� AVG �Լ��� ����� ���� �ݵ�� NVL() �Լ��� �Բ� ����ϴ� ���� �����Ѵ�.
        
        1) SUM
            [����]
                SUM(NUMBER)
                
            - �ش� Į�� ������ �� �հ踦 ��ȯ�Ѵ�.
       
/*
        2) AVG
            [����]
                AVG(NUMBER)
            
            - �ش� �÷� ������ ����� ���ؼ� ��ȯ�Ѵ�.
*/

/*
        3) MIN / MAX
            [����]
                MIN/MAX(��� Ÿ�� �÷�)
            
            - MIN : �ش� �÷� ���� �߿� ���� ���� ���� ��ȯ�Ѵ�.
            - MAX : �ش� �÷� ���� �߿� ���� ū ���� ��ȯ�Ѵ�.
*/

/*
        4) COUNT
            [����]
                COUNT(*|�÷���|DISTINCT �÷���)
            
            - �÷� �Ǵ� ���� ������ ���� ��ȯ�ϴ� �Լ��̴�.
            - COUNT(*) : ��ȸ ����� �ش��ϴ� ��� ���� ������ ��ȯ�Ѵ�.
            - COUNT(�÷���) : ������ �÷� ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
            - COUNT(DISTINCT �÷���) �ش� �÷� ���� �ߺ��� ������ ���� ������ ��ȯ�Ѵ�. 

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