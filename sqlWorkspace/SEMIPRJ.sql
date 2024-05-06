---------------------------------------------------
---------------------- 삭제 ------------------------
---------------------------------------------------
-- 탈퇴 회원 시퀀스 
DROP SEQUENCE SEQ_QUIT_MEMBER;
-- 팔로잉 시퀀스 
DROP SEQUENCE SEQ_FOLLOWING;
-- 게시판 시퀀스 
DROP SEQUENCE SEQ_BOARD;
-- 삭제 게시판 시퀀스 
DROP SEQUENCE SEQ_DEL_BOARD;
-- 댓글 시퀀스 
DROP SEQUENCE SEQ_COMMENTS;
-- 삭제 댓글 시퀀스 
DROP SEQUENCE SEQ_DEL_COMMENTS;
-- 카테고리 시퀀스
DROP SEQUENCE SEQ_CATEGORY;
-- 삭제 카테고리 시퀀스
DROP SEQUENCE SEQ_DEL_CATEGORY;
-- 경고 규정 시퀀스
DROP SEQUENCE SEQ_WARNING_LIST;
-- 누적 경고 횟수 시퀀스
DROP SEQUENCE SEQ_WARNING_NUM;
-- 취소된 누적 경고 횟수 시퀀스
DROP SEQUENCE SEQ_CANCLEED_WARNING_NUM;
-- 쪽지함 시퀀스
DROP SEQUENCE SEQ_TO_MESSAGE;
-- 삭제된 쪽지함 시퀀스
DROP SEQUENCE SEQ_DEL_TO_MESSAGE;

-- 회원 테이블
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- 탈퇴 회원 테이블
DROP TABLE QUIT_MEMBER CASCADE CONSTRAINTS;
-- 팔로잉 테이블
DROP TABLE FOLLOWING CASCADE CONSTRAINTS;
-- 게시판 테이블
DROP TABLE BOARD CASCADE CONSTRAINTS;
-- 삭제 게시판 테이블
DROP TABLE DEL_BOARD CASCADE CONSTRAINTS;
-- 댓글 테이블
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
-- 삭제 댓글 테이블
DROP TABLE DEL_COMMENTS CASCADE CONSTRAINTS;
-- 카테고리 테이블
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
-- 삭제 카테고리 테이블
DROP TABLE DEL_CATEGORY CASCADE CONSTRAINTS;
-- 경고 규정 테이블
DROP TABLE WARNING_LIST CASCADE CONSTRAINTS;
-- 누적 경고 횟수 테이블
DROP TABLE WARNING_NUM CASCADE CONSTRAINTS;
-- 취소된 누적 경고 횟수 테이블
DROP TABLE CANCLEED_WARNING_NUM CASCADE CONSTRAINTS;
-- 쪽지함 테이블
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
-- 삭제된 쪽지함 테이블
DROP TABLE DEL_MESSAGE CASCADE CONSTRAINTS;

---------------------------------------------------
--------------------- 시퀀스 -----------------------
---------------------------------------------------
-- 탈퇴 회원 시퀀스 
DROP SEQUENCE SEQ_QUIT_MEMBER;
-- 팔로잉 시퀀스 
DROP SEQUENCE SEQ_FOLLOWING;
-- 게시판 시퀀스 
DROP SEQUENCE SEQ_BOARD;
-- 삭제 게시판 시퀀스 
CREATE SEQUENCE SEQ_DEL_BOARD NOCACHE NOCYCLE;
-- 댓글 시퀀스 
CREATE SEQUENCE SEQ_COMMENTS NOCACHE NOCYCLE;
-- 삭제 댓글 시퀀스 
CREATE SEQUENCE SEQ_DEL_COMMENTS NOCACHE NOCYCLE;
-- 카테고리 시퀀스
CREATE SEQUENCE SEQ_CATEGORY NOCACHE NOCYCLE;
-- 삭제 카테고리 시퀀스
CREATE SEQUENCE SEQ_DEL_CATEGORY NOCACHE NOCYCLE;
-- 경고 규정 시퀀스
CREATE SEQUENCE SEQ_WARNING_LIST NOCACHE NOCYCLE;
-- 누적 경고 횟수 시퀀스
CREATE SEQUENCE SEQ_WARNING_NUM NOCACHE NOCYCLE;
-- 취소된 누적 경고 횟수 시퀀스
CREATE SEQUENCE SEQ_CANCLEED_WARNING_NUM NOCACHE NOCYCLE;
-- 쪽지함 시퀀스
CREATE SEQUENCE SEQ_TO_MESSAGE NOCACHE NOCYCLE;
-- 삭제된 쪽지함 시퀀스
CREATE SEQUENCE SEQ_DEL_TO_MESSAGE NOCACHE NOCYCLE;



---------------------------------------------------
--------------------- 테이블 -----------------------
---------------------------------------------------
-- 회원 테이블
CREATE TABLE MEMBER (
	EMAIL	            VARCHAR2(30)	                    PRIMARY KEY
	, PASSWORD	        VARCHAR2(20)	                    NOT NULL
	, NICK	            VARCHAR2(20)	                    UNIQUE NOT NULL
	, ENROLL_DATE	    TIMESTAMP		DEFAULT SYSDATE     NOT NULL
	, MODIFY_DATE	    TIMESTAMP		
	, QUIT_DATE	        TIMESTAMP		
	, INTRODUCTION	    VARCHAR2(50)	
	, FOLLOWERS	        NUMBER		    DEFAULT 0           NOT NULL
	, FOLLOWING	        NUMBER		    DEFAULT 0           NOT NULL
	, WARNIG_POINT	    NUMBER		    DEFAULT 0           NOT NULL
	, AUTHORITY	        CHAR(1)		    DEFAULT 'N'         NOT NULL
);

-- 탈퇴 회원 테이블
CREATE TABLE DEL_MEMBER (
	EMAIL	            VARCHAR2(30)	                    PRIMARY KEY
	, PASSWORD	        VARCHAR2(20)	                    NOT NULL
	, NICK	            VARCHAR2(20)	                    UNIQUE NOT NULL
	, ENROLL_DATE	    TIMESTAMP		DEFAULT SYSDATE     NOT NULL
	, MODIFY_DATE	    TIMESTAMP		
	, QUIT_DATE	        TIMESTAMP		
	, INTRODUCTION	    VARCHAR2(50)	
	, FOLLOWERS	        NUMBER		    DEFAULT 0           NOT NULL
	, FOLLOWING	        NUMBER		    DEFAULT 0           NOT NULL
	, WARNIG_POINT	    NUMBER		    DEFAULT 0           NOT NULL
	, AUTHORITY	        CHAR(1)		    DEFAULT 'N'         NOT NULL
    , DEL_DATE          TIMESTAMP       
);

-- 팔로잉 테이블
CREATE TABLE FOLLOWING (
	NO	                NUMBER		                        PRIMARY KEY
	, EMAIL	            VARCHAR2(20)	                	NOT NULL
	, FOLLOWER	        VARCHAR2(30)	                	NOT NULL
	, FOLLOWING	        VARCHAR2(30)		                NOT NULL
    , ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
);

-- 게시판 테이블
CREATE TABLE BOARD (
	NO	                NUMBER		                        PRIMARY KEY    
	, WRITER	        VARCHAR2(30)		                NOT NULL
	, CATEGORY_NO	    VARCHAR2(20)		                NOT NULL
	, TITLE	            VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(30)		                NOT NULL
	, CREATE_DATE	    TIMESTAMP       DEFAULT SYSDATE     NOT NULL
	, SECRET_YN	        CHAR(1)		    DEFAULT 'N'         NOT NULL
	, HITS	            NUMBER		    DEFAULT 0           NOT NULL
	, RECOMMEND	        NUMBER		    DEFAULT 0           NOT NULL
	, NOTICE_YN	        CHAR(1)		    DEFAULT 'N'         NOT NULL
);

-- 삭제 게시판 테이블
CREATE TABLE  DEL_BOARD (
	NO	                NUMBER		                        PRIMARY KEY    
	, WRITER	        VARCHAR2(30)		                NOT NULL
	, CATEGORY_NO	    VARCHAR2(20)		                NOT NULL
	, TITLE	            VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(30)		                NOT NULL
	, CREATE_DATE	    TIMESTAMP       DEFAULT SYSDATE     NOT NULL
	, SECRET_YN	        CHAR(1)		    DEFAULT 'N'         NOT NULL
	, HITS	            NUMBER		    DEFAULT 0           NOT NULL
	, RECOMMEND	        NUMBER		    DEFAULT 0           NOT NULL
	, NOTICE_YN	        CHAR(1)		    DEFAULT 'N'         NOT NULL
    , DEL_DATE          TIMESTAMP       
);

-- 댓글 테이블
CREATE TABLE COMMENTS (
	NO	                NUMBER		                        PRIMARY KEY
	, BOARD_NO        	NUMBER	                        	NOT NULL
	, WRITER          	VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(100)                		NOT NULL
	, ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, EDIT_YN           CHAR(1)		    DEFAULT 'N'         NOT NULL
);

-- 삭제 댓글 테이블
CREATE TABLE DEL_COMMENTS (
	NO	                NUMBER		                        PRIMARY KEY
	, BOARD_NO        	NUMBER	                        	NOT NULL
	, WRITER          	VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(20)                		NOT NULL
	, ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, EDIT_YN           CHAR(1)		    DEFAULT 'N'         NOT NULL
    , DEL_DATE          TIMESTAMP       
);

-- 카테고리 테이블
CREATE TABLE CATEGORY (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(50)	                	NOT NULL
);

-- 삭제 카테고리 테이블
CREATE TABLE DEL_CATEGORY (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(50)		                NOT NULL
);

-- 경고 규정 테이블
CREATE TABLE WARNING_LIST (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(100)		                NOT NULL
	, POINT	            NUMBER		                        NOT NULL
);

-- 누적 경고 횟수 테이블
CREATE TABLE WARNING_NUM (
	NO	                NUMBER		                        PRIMARY KEY
	, EMAIL	            VARCHAR2(30)		                NOT NULL
	, WARNING_NO	    NUMBER  		                    NOT NULL
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, WARNING_NUM	    NUMBER	    	DEFAULT 0       	NOT NULL
);

-- 취소된 누적 경고 횟수 테이블
CREATE TABLE CANCLEED_WARNING_NUM (
	NO	                NUMBER	                        	PRIMARY KEY
	, EMAIL	            VARCHAR2(30)		                NOT NULL
	, WARNING_NO	    NUMBER	                         	NOT NULL
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, WARNING_NUM	    NUMBER		    DEFAULT 0           NOT NULL
);
-- 쪽지함 테이블
CREATE TABLE TO_MESSAGE (
	NO	                NUMBER	        	                PRIMARY KEY
	, SENDER	        VARCHAR2(30)	                	NOT NULL
	, RECEIVER	        VARCHAR2(30)	                	NOT NULL
	, SEND_TIME	        TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, RECEIVE_TIME	    TIMESTAMP	    
	, TITLE	            VARCHAR2(50)	                	NOT NULL
	, CONTENT	        VARCHAR2(2000)		                NOT NULL
	, RECEIVE_YN	    CHAR(1)	        DEFAULT 'N'     	NOT NULL
);
-- 삭제된 쪽지함 테이블
CREATE TABLE DEL_MESSAGE (
	NO                	NUMBER		                        PRIMARY KEY
	, SENDER	        VARCHAR2(30)		                NOT NULL
	, RECEIVER	        VARCHAR2(30)		                NOT NULL
	, SEND_TIME	        TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL    
	, RECEIVE_TIME	    TIMESTAMP		
	, TITLE         	VARCHAR2(50)	                	NOT NULL
	, CONTENT	        VARCHAR2(2000)		                NOT NULL
	, RECEIVE_YN	    CHAR(1)		    DEFAULT 'N'         NOT NULL
	, DEL_TIME	        TIMESTAMP	    
);

---------------------------------------------------
--------------------- 외래키 -----------------------
---------------------------------------------------
--ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
-- 게시판 외래키
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);
-- 삭제된 게시판 외래키
ALTER TABLE DEL_BOARD ADD CONSTRAINT FK_DEL_BOARD_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);

-- 댓글 외래키
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);
-- 삭제된 댓글 외래키
ALTER TABLE DEL_COMMENTS ADD CONSTRAINT FK_COMMENTS_DEL_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE DEL_COMMENTS ADD CONSTRAINT FK_COMMENTS_DEL_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);

-- 팔로잉 외래키
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLWOING_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);

-- 쪽지함 외래키
ALTER TABLE TO_MESSAGE ADD CONSTRAINT FK_TO_MESSAGE_MEMBER FOREIGN KEY (SENDER) REFERENCES MEMBER(EMAIL);
-- 삭제된 쪽지함 외래키
ALTER TABLE DEL_MESSAGE ADD CONSTRAINT FK_DEL_MESSAGE_MEMBER FOREIGN KEY (SENDER) REFERENCES MEMBER(EMAIL);

-- 누적 경고 횟수 외래키 
ALTER TABLE WARNING_NUM ADD CONSTRAINT FK_WARNING_NUM_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);
ALTER TABLE WARNING_NUM ADD CONSTRAINT FK_WARNING_NUM_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);
-- 취소된 누적 경고 횟수 외래키 
ALTER TABLE CANCLEED_WARNING_NUM ADD CONSTRAINT FK_CANCLEED_WARNING_NUM_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);
ALTER TABLE CANCLEED_WARNING_NUM ADD CONSTRAINT FK_CANCLEED_WARNING_NUM_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);

---------------------------------------------------
--------------------- 데이터 -----------------------
---------------------------------------------------
COMMIT;