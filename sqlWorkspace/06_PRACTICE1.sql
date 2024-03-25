--1. BOARD ���̺� ���� (����, ����, �ۼ��Ͻ�)
DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE TABLE BOARD(
    TITLE           VARCHAR2(100)       NOT NULL
    , CONTENT       VARCHAR2(4000)      NOT NULL
    , ENROLL_DATE   TIMESTAMP           DEFAULT SYSDATE
);

--2. �Խñ� ��� ��ȸ
SELECT * FROM BOARD;

--3. �Խñ� �˻� (�������� �˻�)
SELECT * FROM BOARD WHERE TITLE LIKE '%?%';

--4. �Խñ� �˻� (�������� �˻�)
SELECT * FROM BOARD WHERE CONTENT LIKE '%?%';

--5. �Խñ� �ۼ�
INSERT INTO BOARD(TITLE, CONTENT) VALUES(?, ?);

--6. �Խñ� ���� (���� ����)
UPDATE BOARD SET CONTENT = ? WHERE TITLE = ?;

--7. �Խñ� ����
DELETE BOARD WHERE TITLE = ?;