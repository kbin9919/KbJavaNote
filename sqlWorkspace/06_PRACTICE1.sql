--1. BOARD 테이블 생성 (제목, 내용, 작성일시)
DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE TABLE BOARD(
    TITLE           VARCHAR2(100)       NOT NULL
    , CONTENT       VARCHAR2(4000)      NOT NULL
    , ENROLL_DATE   TIMESTAMP           DEFAULT SYSDATE
);

--2. 게시글 목록 조회
SELECT * FROM BOARD;

--3. 게시글 검색 (제목으로 검색)
SELECT * FROM BOARD WHERE TITLE LIKE '%?%';

--4. 게시글 검색 (내용으로 검색)
SELECT * FROM BOARD WHERE CONTENT LIKE '%?%';

--5. 게시글 작성
INSERT INTO BOARD(TITLE, CONTENT) VALUES(?, ?);

--6. 게시글 수정 (내용 수정)
UPDATE BOARD SET CONTENT = ? WHERE TITLE = ?;

--7. 게시글 삭제
DELETE BOARD WHERE TITLE = ?;