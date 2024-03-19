-- �Լ� (FUNTION)

/*
    <�Լ�>
        Į������ �о ��� ����� ��ȯ�Ѵ�.
          - ������ �Լ� : N���� ���� �о N���� ����� �����Ѵ�. 
          (�� �� �Լ� ���� -> ��� ��ȯ)
          - �׷� �Լ�   : N���� ���� �о 1���� ����� �����Ѵ�. 
          (�ϳ��� �׷캰�� �Լ� ���� -> ��� ��ȯ)
        SELECT ���� ������ �Լ��� �׷� �Լ��� �Բ� ������� ���Ѵ�. 
        (��� ���� ������ �ٸ��� ������)
        �Լ��� ����� �� �ִ� ��ġ�� SELECT, WHERE, ORDER BY, GROUP BY, HAVING 
        ���� ����� �� �ִ�.
*/
--------------------- ������ �Լ� ---------------------
/*
    <���� ���� �Լ�>
    1) LENGTH / LENGTHB
      - LENGTH(Į��|'���ڰ�') : ���� �� ��ȯ
      - LENGTHB(Į��|'���ڰ�') : ������ ����Ʈ �� ��ȯ
        �ѱ� �� ���� -> 3BYTE
        ������, ����, Ư������ �� ���� -> 1BYTE
        
    * DUAL ���̺�
      - SYS ����ڰ� �����ϴ� ���̺�
      - SYS ����ڰ� ���������� ��� ����ڰ� ������ �����ϴ�.
      - �� ��, �� Į���� ������ �ִ� ����(DUMMY) ���̺��̴�.
      - ����ڰ� �Լ�(���)�� ����� �� �ӽ÷� ����ϴ� ���̺��̴�.
*/
SELECT ('HELLO')
FROM DUAL;

SELECT LENGTH ('HELLO')
FROM DUAL;

SELECT LENGTHB ('HELLO')
FROM DUAL;

SELECT LENGTHB ('�ȳ�')
FROM DUAL;

/*
    2) INSTR
        - INSTR(Į��|'���ڰ�', '����'[, POSITION[, OCCURRENCE]])
        - ������ ��ġ���� ������ ���� ��°�� ��Ÿ���� ������ ���� ��ġ�� ��ȯ�Ѵ�.
*/

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', 4) FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', 2, 3) FROM DUAL; -- 9��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 10��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���

/* 
    3) LPAD / RPAD
        - LPAD/RPAD(Į��|'���ڰ�', ����(����Ʈ)[, '�����̷��� �ϴ� ����'])
        - ���õ� Į��|'���ڰ�'�� ������ ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ� ����
          N ���� ��ŭ�� ���ڿ��� ��ȯ�Ѵ�.
        - ���ڿ� ���� ���ϰ� �ְ� ǥ���ϰ��� �� �� ����Ѵ�.
*/

-- 20��ŭ�� ���� �� EMAIL ���� ���������� �����ϰ� ������ �������� ä���.
-- 20��ŭ�� ���� �� EMAIL ���� �������� �����ϰ� ������ ���������� ä���.
SELECT 
    EMAIL
    ,LPAD(EMAIL , 20, 'X')
    ,RPAD(EMAIL , 20, 'X')
FROM EMPLOYEE;


UPDATE EMPLOYEE
    SET
        EMAIL = REPLACE(EMAIL , 'C##KH', 'kh')
;
COMMIT;

UPDATE EMPLOYEE
    SET 
        EMAIL = REPLACE(EMAIL , 'C##KH' , 'kh')
;

/*
    4) LTRIM / RTRIM
        - LTRIM/RTRIM(Į��|'���ڰ�'[, '�����ϰ��� �ϴ� ����'])
        - ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ��� �ϴ� ���ڵ��� ã�Ƽ� ������ ����� ��ȯ�Ѵ�.
        - �����ϰ��� �ϴ� ���ڰ��� ���� �� �⺻������ ������ �����Ѵ�.
*/
SELECT LTRIM('   KH') FROM DUAL;
SELECT LTRIM('0001234560', '0') FROM DUAL;
SELECT LTRIM(' 123123KH', '321 ') FROM DUAL;

SELECT RTRIM('KH  ') FROM DUAL;
SELECT RTRIM('00012300004560000', '0' ) FROM DUAL;

SELECT RTRIM(LTRIM('   KH   ')) FROM DUAL;



/*
    5) TRIM
        - TRIM([[LEADING|TRAILING|BOTH] '�����ϰ��� �ϴ� ���ڰ�' FROM] Į��|'���ڰ�')
        - ���ڰ� ��/��/���ʿ� �ִ� ������ ���ڸ� ������ �������� ��ȯ�Ѵ�. 
        - �����ϰ��� �ϴ� ���ڰ��� ���� �� �⺻������ ���ʿ� �ִ� ������ �����Ѵ�. 
*/
SELECT TRIM('   KH   ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;

/*
    6) SUBSTR
        - SUBSTR(Į��|'���ڰ�', POSITION[, LENGTH])
        - ���ڵ����Ϳ��� ������ ��ġ���� ������ ������ŭ�� ���ڿ��� �����ؼ� ��ȯ�Ѵ�.
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -10, 3) FROM DUAL;
SELECT SUBSTR('����ѹ��ź��̿͵η�̻�õ���ڵ����', 2, 5) FROM DUAL;

-- EMPLOYEE ���̺��� �ֹι�ȣ�� ������ ��Ÿ���� �κи� �߶� ��ȸ (�����, �����ڵ�)
SELECT EMP_NAME, SUBSTR (EMP_NO, -7,1)  
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ���� ����� ��ȸ (�����, �����ڵ�)
SELECT EMP_NAME, SUBSTR (EMP_NO, -7,1)  
FROM EMPLOYEE
WHERE SUBSTR (EMP_NO, -7,1)  = 2;
-- EMPLOYEE ���̺��� �ֹε�Ϲ�ȣ ù ��° �ڸ����� ���������� ������ ����� �����ʿ� * ���ڸ� ä���� ��ȸ
-- (991212-2****** ���·� ���)
SELECT EMP_NAME, RPAD(SUBSTR (EMP_NO, 1,8) , 14, '*')  
FROM EMPLOYEE;
-- EMPLOYEE ���̺��� �����, �̸���, ���̵�(�̸��Ͽ��� '@' ���� ���� ���� ���)�� ��ȸ
SELECT EMP_NAME, EMAIL, SUBSTR (EMAIL, 1, INSTR(EMAIL, '@', 1)-1) 
FROM EMPLOYEE;

/*
    7) LOWER / UPPER / INITCAP
        - LOWER/UPPER/INITCAP(�÷�|'���ڰ�')
          LOWER : ��� �ҹ��ڷ� �����Ѵ�.
          UPPER : ��� �빮�ڷ� �����Ѵ�.
          INITCAP : �ܾ� �� ���ڸ��� �빮�ڷ� �����Ѵ�.
*/

SELECT LOWER('Welcome To My World!') FROM DUAL;
SELECT UPPER('Welcome To My World!') FROM DUAL;
SELECT INITCAP('welcome to my world!') FROM DUAL;

/*
    8) CONCAT
        - CONCAT(Į��|'���ڰ�', Į��|'���ڰ�')
        - ���ڵ����� �� ���� ���޹޾Ƽ� �ϳ��� ��ģ �� ����� ��ȯ�Ѵ�.
*/
SELECT CONCAT('�����ٶ�', 'ABCD') FROM DUAL;
SELECT '�����ٶ�' || 'ABCD' FROM DUAL;

SELECT CONCAT('�����ٶ�', 'ABCD', '1234') FROM DUAL; -- ���� �߻�(CONCAT�� �� ���� ���ڵ����͸� ���޹��� �� �ִ�. )
SELECT CONCAT(CONCAT('�����ٶ�', 'ABCD'), '1234') FROM DUAL;
SELECT '�����ٶ�' || 'ABCD' || '1234' FROM DUAL;

SELECT CONCAT(EMP_ID, EMP_NAME)
FROM EMPLOYEE;
SELECT (EMP_ID|| EMP_NAME||EMAIL)
FROM EMPLOYEE;

/*
    9) REPLACE
      - REPLACE(Į��|'���ڰ�', �����Ϸ��� �ϴ� ����, �����ϰ��� �ϴ� ����)
      - Į�� �Ǵ� ���ڰ����� "�����Ϸ��� �ϴ� ����"�� "�����ϰ��� �ϴ� ����"�� �����ؼ� ��ȯ�Ѵ�.
*/
SELECT REPLACE('����� ������ ���ﵿ', '���ﵿ', '�Ｚ��') FROM DUAL;

-- EMPLOYEE ���̺��� �̸����� kh.or.kr�� gmail.com �����ؼ� ��ȸ
SELECT EMP_NAME, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
FROM EMPLOYEE;
