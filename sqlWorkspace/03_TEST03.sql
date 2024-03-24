--�� ���б� ��ũ�� ����
--SQL03_SELECT(Option)

-- 1��
-- �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�, ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
ORDER BY STUDENT_NAME;



-- 2��
-- �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN;

-- 3��
-- �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸��� �й�, �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�.
-- ��, ���������� "�л��̸�", "�й�", "������ �ּ�"�� ��µǵ��� �Ѵ�.
SELECT STUDENT_NAME, STUDENT_NO, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '���%' OR STUDENT_ADDRESS LIKE '����%'
ORDER BY STUDENT_NAME;
-- 4��
-- ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
-- (���а��� '�а� �ڵ�'�� �а� ���̺��� ��ȸ�ؼ� ã�� ������ ����)

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = '005'
ORDER BY PROFESSOR_SSN;

-- 5��
-- 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�. 
-- ������ ���� �л����� ǥ���ϰ�,
-- ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��� ���ÿ�.
-- ��ũ�� ����� �����ϰ� �Ҽ��� �Ʒ� 2�ڸ����� 0���� ǥ���ϱ� ���ؼ� TO_CHAR(NUMBER, 'FM9.00') ���� ���
SELECT TO_CHAR(POINT, 'FM9.00')
FROM TB_GRADE
WHERE CLASS_NO = 'C3118100' AND TERM_NO = '200402'
ORDER BY POINT, STUDENT_NO;

-- 6��
-- �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT T.STUDENT_NO ,T.STUDENT_NAME, D.DEPARTMENT_NAME
FROM TB_STUDENT T
JOIN TB_DEPARTMENT D ON T.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY T.STUDENT_NAME;


-- 7��
-- �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO;

-- 8��
-- ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME,PROFESSOR_NAME
FROM TB_PROFESSOR P
JOIN TB_DEPARTMENT D ON D.DEPARTMENT_NO = P.DEPARTMENT_NO
JOIN TB_CLASS N ON D.DEPARTMENT_NO =N.DEPARTMENT_NO;

-- 9��
-- 8���� ��� �� '�ι� ��ȸ' �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�.
-- �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME,PROFESSOR_NAME
FROM TB_PROFESSOR P
JOIN TB_DEPARTMENT D ON D.DEPARTMENT_NO = P.DEPARTMENT_NO
JOIN TB_CLASS N ON D.DEPARTMENT_NO =N.DEPARTMENT_NO
WHERE CATEGORY LIKE '�ι���ȸ';
                        
-- 10��
-- '�����а�' �л����� ������ ���Ϸ��� �Ѵ�. 
-- �����а� �л����� "�й�", "�л� �̸�", "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT S.STUDENT_NO, S.STUDENT_NAME, ROUND(AVG(POINT),1)
FROM TB_DEPARTMENT D
JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
JOIN TB_GRADE G ON G.STUDENT_NO = S.STUDENT_NO
GROUP BY D.DEPARTMENT_NAME, S.STUDENT_NO, S.STUDENT_NAME
HAVING DEPARTMENT_NAME = '�����а�';


-- 11��
-- �й��� A313047�� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� ���� 
-- �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�.
-- �̶� ����� SQL���� �ۼ��Ͻÿ�.
SELECT S.STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
FROM TB_DEPARTMENT D
JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
JOIN TB_PROFESSOR P ON P.PROFESSOR_NO = S.COACH_PROFESSOR_NO
WHERE S.STUDENT_NO = 'A313047';



-- 12��
-- 2007�⵵�� '�ΰ������' ������ ������ �л��� ã�� 
-- �л��̸��� �����б⸦ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT S.STUDENT_NAME, TERM_NO
FROM TB_CLASS C
JOIN TB_STUDENT S ON S.DEPARTMENT_NO = C.DEPARTMENT_NO
JOIN TB_GRADE G ON G.STUDENT_NO = S.STUDENT_NO
WHERE C.CLASS_NAME IN ('�ΰ������') AND G.TERM_NO LIKE '2007%';



-- 13��
-- ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� 
-- �� ���� �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- ��� ���� ���� �����ϳ� ���� ������ ���� �ٸ� ������ ����

SELECT CLASS_NAME, DEPARTMENT_NAME 
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
LEFT JOIN TB_CLASS_PROFESSOR P ON P.CLASS_NO = C.CLASS_NO
WHERE CATEGORY = '��ü��' AND P.PROFESSOR_NO IS NULL;
-- 14��
-- �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�. 
-- �л��̸��� �������� �̸��� ã�� ���� ���� ������ ���� �л��� ���
-- "�������� ������"���� ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. 
-- �� �������� "�л��̸�", "��������"�� ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.
SELECT S.STUDENT_NAME �л��̸�, NVL2(P.PROFESSOR_NAME, PROFESSOR_NAME, '�������� ������') ��������
FROM TB_STUDENT S
LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE DEPARTMENT_NAME ='���ݾƾ��а�'
ORDER BY STUDENT_NO;



-- 15��
-- ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� 
-- �� �л��� �й�, �̸�, �а�, �̸�, ������ ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT 
S.STUDENT_NO,
S.STUDENT_NAME,
D.DEPARTMENT_NAME,
ROUND(AVG(G.POINT),8)
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_GRADE G ON G.STUDENT_NO = S.STUDENT_NO
WHERE ABSENCE_YN = 'N'
GROUP BY S.STUDENT_NO,
S.STUDENT_NAME,
D.DEPARTMENT_NAME
HAVING ROUND(AVG(G.POINT),8) >= 4.0;



-- 16��
-- ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.
SELECT ROUND(AVG(POINT),8)
FROM TB_GRADE G
JOIN TB_CLASS C ON C.CLASS_NO = G.CLASS_NO
JOIN TB_DEPARTMENT D ON D.DEPARTMENT_NO = C.DEPARTMENT_NO
WHERE DEPARTMENT_NAME = 'ȯ�������а�' AND CLASS_TYPE LIKE '����%'
GROUP BY G.CLASS_NO;

-- 17��
-- �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.


SELECT 
STUDENT_NAME
, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE  DEPARTMENT_NO = 
(
SELECT 
DEPARTMENT_NO
FROM TB_STUDENT
WHERE STUDENT_NAME = '�ְ���'
);
                       
-- 18��
-- ������а����� �������� ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL���� �ۼ��Ͻÿ�
SELECT STUDENT_NO, STUDENT_NAME, ROWNUM FROM (
    SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    JOIN TB_GRADE USING(STUDENT_NO)
    WHERE DEPARTMENT_NAME = '������а�' 
    GROUP BY STUDENT_NO, STUDENT_NAME 
    ORDER BY AVG(POINT) DESC)
WHERE ROWNUM = 1;


-- 19��
-- �� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� 
-- �а� �� �������� ������ �ľ��ϱ� ���� ������ SQL���� ã�Ƴ��ÿ�.
-- ��, �������� "�迭 �а���", "��������"���� ǥ�õǵ��� �ϰ�, 
-- ������ �Ҽ��� ���ڸ������� �ݿø��Ͽ� ǥ�õǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME "�迭 �а���", ROUND(AVG(POINT),1)"���� ����"
FROM TB_DEPARTMENT
JOIN TB_CLASS USING(DEPARTMENT_NO)
JOIN TB_GRADE USING(CLASS_NO)
JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
WHERE CLASS_TYPE LIKE '����%' AND CATEGORY = 
(
SELECT CATEGORY
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = 'ȯ�������а�'
)
GROUP BY DEPARTMENT_NAME
;


