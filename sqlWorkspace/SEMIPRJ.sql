---------------------------------------------------
---------------------- ���� ------------------------
---------------------------------------------------
-- Ż�� ȸ�� ������ 
DROP SEQUENCE SEQ_QUIT_MEMBER;
-- �ȷ��� ������ 
DROP SEQUENCE SEQ_FOLLOWING;
-- �Խ��� ������ 
DROP SEQUENCE SEQ_BOARD;
-- ���� �Խ��� ������ 
DROP SEQUENCE SEQ_DEL_BOARD;
-- ��� ������ 
DROP SEQUENCE SEQ_COMMENTS;
-- ���� ��� ������ 
DROP SEQUENCE SEQ_DEL_COMMENTS;
-- ī�װ� ������
DROP SEQUENCE SEQ_CATEGORY;
-- ���� ī�װ� ������
DROP SEQUENCE SEQ_DEL_CATEGORY;
-- ��� ���� ������
DROP SEQUENCE SEQ_WARNING_LIST;
-- ���� ��� Ƚ�� ������
DROP SEQUENCE SEQ_WARNING_NUM;
-- ��ҵ� ���� ��� Ƚ�� ������
DROP SEQUENCE SEQ_CANCLEED_WARNING_NUM;
-- ������ ������
DROP SEQUENCE SEQ_TO_MESSAGE;
-- ������ ������ ������
DROP SEQUENCE SEQ_DEL_TO_MESSAGE;

-- ȸ�� ���̺�
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- Ż�� ȸ�� ���̺�
DROP TABLE QUIT_MEMBER CASCADE CONSTRAINTS;
-- �ȷ��� ���̺�
DROP TABLE FOLLOWING CASCADE CONSTRAINTS;
-- �Խ��� ���̺�
DROP TABLE BOARD CASCADE CONSTRAINTS;
-- ���� �Խ��� ���̺�
DROP TABLE DEL_BOARD CASCADE CONSTRAINTS;
-- ��� ���̺�
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
-- ���� ��� ���̺�
DROP TABLE DEL_COMMENTS CASCADE CONSTRAINTS;
-- ī�װ� ���̺�
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
-- ���� ī�װ� ���̺�
DROP TABLE DEL_CATEGORY CASCADE CONSTRAINTS;
-- ��� ���� ���̺�
DROP TABLE WARNING_LIST CASCADE CONSTRAINTS;
-- ���� ��� Ƚ�� ���̺�
DROP TABLE WARNING_NUM CASCADE CONSTRAINTS;
-- ��ҵ� ���� ��� Ƚ�� ���̺�
DROP TABLE CANCLEED_WARNING_NUM CASCADE CONSTRAINTS;
-- ������ ���̺�
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
-- ������ ������ ���̺�
DROP TABLE DEL_MESSAGE CASCADE CONSTRAINTS;

---------------------------------------------------
--------------------- ������ -----------------------
---------------------------------------------------
-- Ż�� ȸ�� ������ 
DROP SEQUENCE SEQ_QUIT_MEMBER;
-- �ȷ��� ������ 
DROP SEQUENCE SEQ_FOLLOWING;
-- �Խ��� ������ 
DROP SEQUENCE SEQ_BOARD;
-- ���� �Խ��� ������ 
CREATE SEQUENCE SEQ_DEL_BOARD NOCACHE NOCYCLE;
-- ��� ������ 
CREATE SEQUENCE SEQ_COMMENTS NOCACHE NOCYCLE;
-- ���� ��� ������ 
CREATE SEQUENCE SEQ_DEL_COMMENTS NOCACHE NOCYCLE;
-- ī�װ� ������
CREATE SEQUENCE SEQ_CATEGORY NOCACHE NOCYCLE;
-- ���� ī�װ� ������
CREATE SEQUENCE SEQ_DEL_CATEGORY NOCACHE NOCYCLE;
-- ��� ���� ������
CREATE SEQUENCE SEQ_WARNING_LIST NOCACHE NOCYCLE;
-- ���� ��� Ƚ�� ������
CREATE SEQUENCE SEQ_WARNING_NUM NOCACHE NOCYCLE;
-- ��ҵ� ���� ��� Ƚ�� ������
CREATE SEQUENCE SEQ_CANCLEED_WARNING_NUM NOCACHE NOCYCLE;
-- ������ ������
CREATE SEQUENCE SEQ_TO_MESSAGE NOCACHE NOCYCLE;
-- ������ ������ ������
CREATE SEQUENCE SEQ_DEL_TO_MESSAGE NOCACHE NOCYCLE;



---------------------------------------------------
--------------------- ���̺� -----------------------
---------------------------------------------------
-- ȸ�� ���̺�
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

-- Ż�� ȸ�� ���̺�
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

-- �ȷ��� ���̺�
CREATE TABLE FOLLOWING (
	NO	                NUMBER		                        PRIMARY KEY
	, EMAIL	            VARCHAR2(20)	                	NOT NULL
	, FOLLOWER	        VARCHAR2(30)	                	NOT NULL
	, FOLLOWING	        VARCHAR2(30)		                NOT NULL
    , ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
);

-- �Խ��� ���̺�
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

-- ���� �Խ��� ���̺�
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

-- ��� ���̺�
CREATE TABLE COMMENTS (
	NO	                NUMBER		                        PRIMARY KEY
	, BOARD_NO        	NUMBER	                        	NOT NULL
	, WRITER          	VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(100)                		NOT NULL
	, ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, EDIT_YN           CHAR(1)		    DEFAULT 'N'         NOT NULL
);

-- ���� ��� ���̺�
CREATE TABLE DEL_COMMENTS (
	NO	                NUMBER		                        PRIMARY KEY
	, BOARD_NO        	NUMBER	                        	NOT NULL
	, WRITER          	VARCHAR2(30)		                NOT NULL
	, CONTENT	        VARCHAR2(20)                		NOT NULL
	, ENROLL_DATE    	TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, EDIT_YN           CHAR(1)		    DEFAULT 'N'         NOT NULL
    , DEL_DATE          TIMESTAMP       
);

-- ī�װ� ���̺�
CREATE TABLE CATEGORY (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(50)	                	NOT NULL
);

-- ���� ī�װ� ���̺�
CREATE TABLE DEL_CATEGORY (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(50)		                NOT NULL
);

-- ��� ���� ���̺�
CREATE TABLE WARNING_LIST (
	NO	                NUMBER		                        PRIMARY KEY
	, TITLE	            VARCHAR2(100)		                NOT NULL
	, POINT	            NUMBER		                        NOT NULL
);

-- ���� ��� Ƚ�� ���̺�
CREATE TABLE WARNING_NUM (
	NO	                NUMBER		                        PRIMARY KEY
	, EMAIL	            VARCHAR2(30)		                NOT NULL
	, WARNING_NO	    NUMBER  		                    NOT NULL
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, WARNING_NUM	    NUMBER	    	DEFAULT 0       	NOT NULL
);

-- ��ҵ� ���� ��� Ƚ�� ���̺�
CREATE TABLE CANCLEED_WARNING_NUM (
	NO	                NUMBER	                        	PRIMARY KEY
	, EMAIL	            VARCHAR2(30)		                NOT NULL
	, WARNING_NO	    NUMBER	                         	NOT NULL
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE 	NOT NULL
	, WARNING_NUM	    NUMBER		    DEFAULT 0           NOT NULL
);
-- ������ ���̺�
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
-- ������ ������ ���̺�
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
--------------------- �ܷ�Ű -----------------------
---------------------------------------------------
--ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
-- �Խ��� �ܷ�Ű
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);
-- ������ �Խ��� �ܷ�Ű
ALTER TABLE DEL_BOARD ADD CONSTRAINT FK_DEL_BOARD_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);

-- ��� �ܷ�Ű
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);
-- ������ ��� �ܷ�Ű
ALTER TABLE DEL_COMMENTS ADD CONSTRAINT FK_COMMENTS_DEL_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE DEL_COMMENTS ADD CONSTRAINT FK_COMMENTS_DEL_MEMBER FOREIGN KEY (WRITER) REFERENCES MEMBER(EMAIL);

-- �ȷ��� �ܷ�Ű
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLWOING_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);

-- ������ �ܷ�Ű
ALTER TABLE TO_MESSAGE ADD CONSTRAINT FK_TO_MESSAGE_MEMBER FOREIGN KEY (SENDER) REFERENCES MEMBER(EMAIL);
-- ������ ������ �ܷ�Ű
ALTER TABLE DEL_MESSAGE ADD CONSTRAINT FK_DEL_MESSAGE_MEMBER FOREIGN KEY (SENDER) REFERENCES MEMBER(EMAIL);

-- ���� ��� Ƚ�� �ܷ�Ű 
ALTER TABLE WARNING_NUM ADD CONSTRAINT FK_WARNING_NUM_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);
ALTER TABLE WARNING_NUM ADD CONSTRAINT FK_WARNING_NUM_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);
-- ��ҵ� ���� ��� Ƚ�� �ܷ�Ű 
ALTER TABLE CANCLEED_WARNING_NUM ADD CONSTRAINT FK_CANCLEED_WARNING_NUM_MEMBER FOREIGN KEY (EMAIL) REFERENCES MEMBER(EMAIL);
ALTER TABLE CANCLEED_WARNING_NUM ADD CONSTRAINT FK_CANCLEED_WARNING_NUM_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);

---------------------------------------------------
--------------------- ������ -----------------------
---------------------------------------------------
COMMIT;