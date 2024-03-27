-- MEMBER SEQUNSE
DROP SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;
-- BOARD SEQUNSE
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE NOCYCLE;
-- MEMBER ���̺� ���� (NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN)
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    NO              NUMBER
    , ID            VARCHAR2(100)
    , PWD           VARCHAR2(100)
    , NICK          VARCHAR2(100)
    , ENROLL_DATE   TIMESTAMP
    , QUIT_YN       CHAR(1)
)
;

-- ȸ������
INSERT INTO MEMBER(NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN) 
VALUES(1, 'USER01' , '1234', 'NICK01' , SYSDATE, 'N')
;
COMMIT;

INSERT INTO MEMBER(NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN) 
VALUES(SEQ_MEMBER_NO.NEXTVAL, ? , ?, ? , SYSDATE, 'N')
; -- �����Ͻ�, Ż�𿩺δ� �׻� �����̹Ƿ� ��������� ���� �ʿ� ����
COMMIT;


-- �α���
SELECT *
FROM MEMBER
WHERE ID = 'USER01'
AND PWD = '1234'
;

SELECT *
FROM MEMBER
WHERE ID = ?
AND PWD = ?
;

-- ȸ�� ���� ���� (��� ����)
DROP TABLE MEMBER;
UPDATE MEMBER
    SET
        PWD = '0000'
    WHERE NO = 1
;
COMMIT;

UPDATE MEMBER
    SET
        PWD = ?
    WHERE NO = ?
;
COMMIT;
        


-- ȸ�� ���� ���� (�г��� ����)
UPDATE MEMBER
    SET
        NICK = '�����'
    WHERE NO = 1
;
COMMIT;

UPDATE MEMBER
    SET
        NICK = ?
    WHERE NO = ?
;
COMMIT;

-- ȸ�� Ż��
DELETE MEMBER
WHERE NO = 1;
COMMIT;

DELETE MEMBER
WHERE NO = ?;
COMMIT;

UPDATE MEMBER 
    SET QUIT_YN = 'Y'
WHERE NO = 1;
COMMIT;

UPDATE MEMBER 
    SET QUIT_YN = 'Y'
WHERE NO = ?;
COMMIT;

------------------------------------------------------

-- BOARD ���̺� ���� (NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN)
DROP TABLE BOARD;
CREATE TABLE BOARD(
    NO              NUMBER
    , TITLE         VARCHAR2(100)
    , CONTENT       VARCHAR2(4000)
    , WRITER        NUMBER
    , ENROLL_DATE   TIMESTAMP
    , DEL_YN        CHAR(1)
);

-- �Խñ� �ۼ�
INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN)
VALUES(1 , '����01' , '����01' , 1 , SYSDATE, 'N');
COMMIT;

INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN)
VALUES(SEQ_BOARD_NO.NEXTVAL , ? , ? , ? , SYSDATE, 'N');
COMMIT;

-- �Խñ� ��� ��ȸ (�ֽż�)
SELECT *
FROM BOARD
ORDER BY NO DESC
;

-- �Խñ� �� ��ȸ (�Խñ� ��ȣ �̿��ؼ�)
SELECT *
FROM BOARD
WHERE NO = 1
;

SELECT *
FROM BOARD
WHERE NO = ?
;

-- �Խñ� �˻� (���� �˻�)
SELECT *
FROM BOARD
WHERE TITLE LIKE '%�ȳ�%'
;


SELECT *
FROM BOARD
WHERE TITLE LIKE '%?%';
;

-- �Խñ� �˻� (���� �˻�)
SELECT *
FROM BOARD
WHERE CONTENT LIKE '%������%';
;

SELECT *
FROM BOARD
WHERE CONTENT LIKE '%?%';
;

-- �Խñ� ���� (���� ���� - �Խñ� ��ȣ �̿��ؼ�)
UPDATE BOARD
    SET
        TITLE = '���������񤻤�'
WHERE NO = 1
;
COMMIT;

UPDATE BOARD
    SET
        TITLE = ?
WHERE NO = ?
;
COMMIT;

-- �Խñ� ���� (���� ���� - �Խñ� ��ȣ �̿��ؼ�)
UPDATE BOARD
    SET
        CONTENT = '�����ȳ��뤻��'
WHERE NO = 1
;
COMMIT;

UPDATE BOARD
    SET
        CONTENT = ?
WHERE NO = ?
;
COMMIT;



-- �Խñ� ���� (��ȣ �̿��ؼ�)
DELETE BOARD
WHERE NO = 1
;
COMMIT;

DELETE BOARD
WHERE NO = ?
;
COMMIT;
