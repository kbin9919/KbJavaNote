DROP USER C##ORCA;
CREATE USER C##ORCA IDENTIFIED BY 1234;
GRANT RESOURCE, CONNECT TO C##ORCA;
ALTER USER C##ORCA DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;



---------------------------------------------------
---------------------- ���� ------------------------
---------------------------------------------------
DROP TABLE CANCLEED_WARNING_NUM CASCADE CONSTRAINTS;
DROP TABLE COPYOFFAQ CASCADE CONSTRAINTS;
DROP TABLE DEL_BOARD CASCADE CONSTRAINTS;
DROP TABLE DEL_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE DEL_COMMENTS CASCADE CONSTRAINTS;
DROP TABLE DEL_MEMBER CASCADE CONSTRAINTS;
DROP TABLE DEL_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE RECOMMENT CASCADE CONSTRAINTS;
DROP TABLE RECOMMEND CASCADE CONSTRAINTS;
DROP TABLE TO_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE WARNING_NUM CASCADE CONSTRAINTS;

-- ��� ������
DROP SEQUENCE SEQ_MEMBER;
-- ���� �̷� ������ 
DROP SEQUENCE SEQ_WARNING;
-- ��� ���� ������ 
DROP SEQUENCE SEQ_WARNING_LIST;
-- �ȷο� ������ 
DROP SEQUENCE SEQ_FOLLOW;
-- �ȷ��� ������ 
DROP SEQUENCE SEQ_FOLLOWING;
-- ������ ȸ�� ������ 
DROP SEQUENCE SEQ_BLOCK_MEMBER;
-- ��� ������ 
DROP SEQUENCE SEQ_COMMENTS;
-- ���� ������ 
DROP SEQUENCE SEQ_RECOMMENT;
-- ���� ������ 
DROP SEQUENCE SEQ_CATEGORY;
-- FAQ ������ 
DROP SEQUENCE SEQ_FAQ;
-- ������ ������ 
DROP SEQUENCE SEQ_MESSAGE;
-- �Խ��� ������ 
DROP SEQUENCE SEQ_BOARD;
-- �������� ������
DROP SEQUENCE SEQ_NOTICE;
-- QNA ������
DROP SEQUENCE SEQ_QNA;
-- �Խñ� �̹��� ������
DROP SEQUENCE SEQ_BOARD_ATTACHMENT;

-- ȸ�� ���̺�
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- ���� �̷� ���̺� 
DROP TABLE WARNING CASCADE CONSTRAINTS;
-- ��� ���� ���̺� 
DROP TABLE WARNING_LIST CASCADE CONSTRAINTS;
-- �ȷο� ���̺� 
DROP TABLE FOLLOW CASCADE CONSTRAINTS;
-- �ȷ��� ���̺� 
DROP TABLE FOLLOWING CASCADE CONSTRAINTS;
-- ������ ȸ�� ���̺� 
DROP TABLE BLOCK_MEMBER CASCADE CONSTRAINTS;
-- ��� ���̺� 
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
-- ��� ��õ ���̺� 
DROP TABLE COMMENTRECOMMEND CASCADE CONSTRAINTS;
-- ���� ���̺� 
DROP TABLE RECOMMENT CASCADE CONSTRAINTS;
-- ���� ���̺� 
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
-- FAQ ���̺� 
DROP TABLE FAQ CASCADE CONSTRAINTS;
-- ������ ���̺� 
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
-- �Խ��� ���̺� 
DROP TABLE BOARD CASCADE CONSTRAINTS;
-- �������� ���̺�
DROP TABLE NOTICE CASCADE CONSTRAINTS;
-- QNA ���̺�
DROP TABLE QNA CASCADE CONSTRAINTS;
-- �湮�� ���̺�
DROP TABLE VISITOR CASCADE CONSTRAINTS;
-- ��õ�� ���̺�
DROP TABLE RECOMMEND CASCADE CONSTRAINTS;
-- �Խñ� �̹��� ���̺�
DROP SEQUENCE SEQ_BOARD_ATTACHMENT;
-- �������� �̹��� ���̺�
DROP SEQUENCE SEQ_NOTICE_ATTACHMENT;
-- ��� �̹��� ���̺�
DROP SEQUENCE SEQ_MEMBER_ATTACHMENT;

---------------------------------------------------
--------------------- ������ -----------------------
---------------------------------------------------
-- ��� ������ 
CREATE SEQUENCE SEQ_MEMBER;
-- ���� �̷� ������ 
CREATE SEQUENCE SEQ_WARNING;
-- ��� ���� ������ 
CREATE SEQUENCE SEQ_WARNING_LIST;
-- �ȷο� ������ 
CREATE SEQUENCE SEQ_FOLLOW;
-- �ȷ��� ������ 
CREATE SEQUENCE SEQ_FOLLOWING;
-- ������ ȸ�� ������ 
CREATE SEQUENCE SEQ_BLOCK_MEMBER;
-- ��� ������ 
CREATE SEQUENCE SEQ_COMMENTS;
-- ���� ������ 
CREATE SEQUENCE SEQ_RECOMMENT;
-- ���� ������ 
CREATE SEQUENCE SEQ_CATEGORY;
-- FAQ ������ 
CREATE SEQUENCE SEQ_FAQ;
-- ������ ������ 
CREATE SEQUENCE SEQ_MESSAGE;
-- �Խ��� ������ 
CREATE SEQUENCE SEQ_BOARD;
-- �������� ������
CREATE SEQUENCE SEQ_NOTICE;
-- QNA ������
CREATE SEQUENCE SEQ_QNA;
-- �Խñ� �̹��� ������
CREATE SEQUENCE SEQ_BOARD_ATTACHMENT;
-- �������� �̹��� ������
CREATE SEQUENCE SEQ_NOTICE_ATTACHMENT;
-- ��� �̹��� ������
CREATE SEQUENCE SEQ_MEMBER_ATTACHMENT;


CREATE TABLE MEMBER (
   NO                   NUMBER              
   , EMAIL               VARCHAR2(30)                          NOT NULL
   , PASSWORD           VARCHAR2(20)                         NOT NULL
   , NICK               VARCHAR2(20)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP           DEFAULT SYSDATE    NOT NULL
   , INTRODUCTION       VARCHAR2(50)       
   , DEL_DATE           TIMESTAMP                             
   , ADMIN_YN           CHAR(1)              DEFAULT 'N'        NOT NULL
);

CREATE TABLE BOARD (
   NO                   NUMBER      
   , CATEGORY_NO       NUMBER                                 NOT NULL
   , WRITER_NO           NUMBER                                 NOT NULL
   , TITLE               VARCHAR2(100)                         NOT NULL
   , CONTENT           VARCHAR2(2000)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , SECRET_YN           CHAR(1)              DEFAULT 'N'        NOT NULL
   , MODIFY_DATE       TIMESTAMP          
   , DEL_DATE           TIMESTAMP          
);

CREATE TABLE MESSAGE (
   NO                   NUMBER      
   , RECEIVER_NO       NUMBER                                 NOT NULL
   , SENDER_NO           NUMBER                                 NOT NULL
   , SEND_TIME           TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , READ_TIME           TIMESTAMP          
   , TITLE               VARCHAR2(50)                         NOT NULL
   , CONTENT           VARCHAR2(2000)                          NOT NULL
);

CREATE TABLE WARNING_LIST (
   NO                   NUMBER      
   , TITLE               VARCHAR2(50)                         NOT NULL
   , POINT               NUMBER                                 NOT NULL
);

CREATE TABLE WARNING (
   NO                   NUMBER      
   , WARNING_NO       NUMBER                                 NOT NULL
   , MEMBER_NO           NUMBER                                 NOT NULL
   , ENROLL_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
);

CREATE TABLE CATEGORY (
   NO                   NUMBER      
   , TITLE               VARCHAR2(20)                         NOT NULL
);

CREATE TABLE COMMENTS (
   NO                   NUMBER      
   , BOARD_NO           NUMBER                                 NOT NULL
   , WRITER_NO           NUMBER                                 NOT NULL
   , CONTENT           VARCHAR2(100)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , MODIFY_DATE       TIMESTAMP      
   , DEL_DATE           TIMESTAMP      
);

CREATE TABLE FOLLOW (
   NO                   NUMBER      
   , FOLLOWER_NO       NUMBER                                 NOT NULL
   , MEMBER_NO           NUMBER                                 NOT NULL
);

CREATE TABLE NOTICE (
   NO                   NUMBER      
   , CATEGORY_NO       NUMBER                                 NOT NULL
   , WRITER_NO           NUMBER                                 NOT NULL
   , TITLE               VARCHAR2(100)                         NOT NULL
    , CONTENT           VARCHAR2(2000)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
    , MODIFY_DATE       TIMESTAMP          
   , HITS               NUMBER              DEFAULT 0          NOT NULL
);

CREATE TABLE RECOMMEND (
   BOARD_NO           NUMBER                                 NOT NULL
   , REFERENCE_NO       NUMBER                                 NOT NULL
);

CREATE TABLE VISITOR (
   BOARD_NO           NUMBER                                 NOT NULL
   , VISITOR_NUM       NUMBER                                 NOT NULL
);

CREATE TABLE QnA (
   NO                   NUMBER      
    , WRITER_NO           NUMBER                                 NOT NULL
   , TITLE               VARCHAR2(100)                         NOT NULL
   , CONTENT           VARCHAR2(1000)                         NOT NULL
   , CREATED_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
    , SECRET_YN         CHAR(1)             DEFAULT 'N'        NOT NULL
   , ADMIN_NO           NUMBER                                 
   , ANSWER_TITLE       VARCHAR2(100)                         
   , ANSWER_CONTENT   VARCHAR2(1000)      
   , ANSWER_DATE       TIMESTAMP      
   , DEL_DATE           TIMESTAMP      
);

CREATE TABLE FOLLOWING (
   NO                   NUMBER      
   , MEMBER_NO           NUMBER                                 NOT NULL      
   , FOLLOWING_NO       NUMBER                                 NOT NULL
);

CREATE TABLE COMMENTRECOMMEND (
   REFERENCE_NO       NUMBER                                 NOT NULL
   , COMMENT_NO       NUMBER                                 NOT NULL
);

CREATE TABLE BLOCK_MEMBER (
   NO                   NUMBER      
   , BLOCKER_NO       NUMBER                                 NOT NULL
   , BLOCKED_NO       NUMBER                                 NOT NULL
);

CREATE TABLE FAQ (
   NO                   NUMBER      
   , TITLE               VARCHAR2(100)                         NOT NULL
   , CONTENT           VARCHAR2(4000)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
    , MODIFY_DATE       TIMESTAMP          
   , DEL_DATE           TIMESTAMP                              
);

CREATE TABLE RECOMMENT (
   NO                   NUMBER      
   , COMMENT_NO       NUMBER                                 NOT NULL
   , WRITER_NO           NUMBER                                 NOT NULL
   , CONTENT           VARCHAR2(100)                         NOT NULL
   , ENROLL_DATE       TIMESTAMP            DEFAULT SYSDATE    NOT NULL
   , MODIFY_DATE       TIMESTAMP      
   , DEL_DATE           TIMESTAMP      
);

CREATE TABLE BOARD_ATTACHMENT (
   NO                   NUMBER      
   , BOARD_NO           NUMBER                                 NOT NULL
   , ORIGIN_NAME       VARCHAR2(255)                         NOT NULL
   , CHANGE_NAME       VARCHAR2(255)                         NOT NULL
   , UPLOAD_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , DEL_YN           CHAR(1)              DEFAULT 'N'        NOT NULL
);

CREATE TABLE NOTICE_ATTACHMENT (
   NO                   NUMBER      
   , NOTICE_NO           NUMBER                                 NOT NULL
   , ORIGIN_NAME       VARCHAR2(255)                         NOT NULL
   , CHANGE_NAME       VARCHAR2(255)                         NOT NULL
   , UPLOAD_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , DEL_YN           CHAR(1)              DEFAULT 'N'        NOT NULL
);

CREATE TABLE MEMBER_ATTACHMENT (
   NO                   NUMBER      
   , MEMBER_NO           NUMBER                                 NOT NULL
   , ORIGIN_NAME       VARCHAR2(255)                         NOT NULL
   , CHANGE_NAME       VARCHAR2(255)                         NOT NULL
   , UPLOAD_DATE       TIMESTAMP          DEFAULT SYSDATE    NOT NULL
   , DEL_YN           CHAR(1)              DEFAULT 'N'        NOT NULL
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   NO
);

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
   NO
);

ALTER TABLE MESSAGE ADD CONSTRAINT PK_MESSAGE PRIMARY KEY (
   NO
);

ALTER TABLE WARNING_LIST ADD CONSTRAINT PK_WARNING_LIST PRIMARY KEY (
   NO
);

ALTER TABLE WARNING ADD CONSTRAINT PK_WARNING PRIMARY KEY (
   NO
);

ALTER TABLE CATEGORY ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
   NO
);

ALTER TABLE COMMENTS ADD CONSTRAINT PK_COMMENTS PRIMARY KEY (
   NO
);

ALTER TABLE FOLLOW ADD CONSTRAINT PK_FOLLOW PRIMARY KEY (
   NO
);

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
   NO
);

ALTER TABLE QnA ADD CONSTRAINT PK_QNA PRIMARY KEY (
   NO
);

ALTER TABLE FOLLOWING ADD CONSTRAINT PK_FOLLOWING PRIMARY KEY (
   NO
);

ALTER TABLE BLOCK_MEMBER ADD CONSTRAINT PK_BLOCK_MEMBER PRIMARY KEY (
   NO
);

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
   NO
);

ALTER TABLE RECOMMENT ADD CONSTRAINT PK_RECOMMENT PRIMARY KEY (
   NO
);

ALTER TABLE BOARD_ATTACHMENT ADD CONSTRAINT PK_BOARD_ATTACHMENT PRIMARY KEY (
   NO
);

ALTER TABLE NOTICE_ATTACHMENT ADD CONSTRAINT PK_NOTICE_ATTACHMENT PRIMARY KEY (
   NO
);

ALTER TABLE MEMBER_ATTACHMENT ADD CONSTRAINT PK_MEMBER_ATTACHMENT PRIMARY KEY (
   NO
);
---------------------------------------------------
--------------------- �ܷ�Ű -----------------------
---------------------------------------------------

-- ���� �̷� �ܷ�Ű
ALTER TABLE WARNING ADD CONSTRAINT FK_WARNING_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);
ALTER TABLE WARNING ADD CONSTRAINT FK_WARNING_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);

-- �ȷο� �ܷ�Ű
ALTER TABLE FOLLOW ADD CONSTRAINT FK_FOLLOW_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);
ALTER TABLE FOLLOW ADD CONSTRAINT FK_FOLLOW_MEMBER_FOLLOWER FOREIGN KEY (FOLLOWER_NO) REFERENCES MEMBER(NO);

-- �ȷ��� �ܷ�Ű
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLOWING_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLOWING_MEMBER_FOLLOWING FOREIGN KEY (FOLLOWING_NO) REFERENCES MEMBER(NO);

-- ������ ȸ�� �ܷ�Ű
ALTER TABLE BLOCK_MEMBER ADD CONSTRAINT FK_BLOCK_MEMBER_BLOCKER FOREIGN KEY (BLOCKER_NO) REFERENCES MEMBER(NO);
ALTER TABLE BLOCK_MEMBER ADD CONSTRAINT FK_BLOCK_MEMBER_BLOCKED FOREIGN KEY (BLOCKED_NO) REFERENCES MEMBER(NO);

-- ��� �ܷ�Ű
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- ���� �ܷ�Ű
ALTER TABLE RECOMMENT ADD CONSTRAINT FK_RECOMMENT_COMMENT FOREIGN KEY (COMMENT_NO) REFERENCES COMMENTS(NO);
ALTER TABLE RECOMMENT ADD CONSTRAINT FK_RECOMMENT_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- ��� ��õ �ܷ�Ű
ALTER TABLE COMMENTRECOMMEND ADD CONSTRAINT FK_COMMENTRECOMMEND_COMMENT FOREIGN KEY (COMMENT_NO) REFERENCES COMMENTS(NO);
ALTER TABLE COMMENTRECOMMEND ADD CONSTRAINT FK_COMMENTRECOMMEND_MEMBER FOREIGN KEY (REFERENCE_NO) REFERENCES MEMBER(NO);

-- ������ �ܷ�Ű
ALTER TABLE MESSAGE ADD CONSTRAINT FK_MESSAGE_MEMBER_RECEIVER FOREIGN KEY (RECEIVER_NO) REFERENCES MEMBER(NO);
ALTER TABLE MESSAGE ADD CONSTRAINT FK_MESSAGE_MEMBER_SENDER FOREIGN KEY (SENDER_NO) REFERENCES MEMBER(NO);

-- �Խ��� �ܷ�Ű
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_CATEGORY FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(NO);

-- �������� �ܷ�Ű
ALTER TABLE NOTICE ADD CONSTRAINT FK_NOTICE_CATEGORY FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(NO);
ALTER TABLE NOTICE ADD CONSTRAINT FK_NOTICE_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- QNA �ܷ�Ű
ALTER TABLE QNA ADD CONSTRAINT FK_QNA_MEMBER_WRITER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
ALTER TABLE QNA ADD CONSTRAINT FK_QNA_MEMBER_ADMIN FOREIGN KEY (ADMIN_NO) REFERENCES MEMBER(NO);

-- ��õ�� �ܷ�Ű
ALTER TABLE RECOMMEND ADD CONSTRAINT FK_RECOMMEND_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE RECOMMEND ADD CONSTRAINT FK_RECOMMEND_MEMBER FOREIGN KEY (REFERENCE_NO) REFERENCES MEMBER(NO);

-- �湮�� �ܷ�Ű
ALTER TABLE VISITOR ADD CONSTRAINT FK_VISITOR_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE VISITOR ADD CONSTRAINT FK_VISITOR_MEMBER FOREIGN KEY (VISITOR_NUM) REFERENCES MEMBER(NO);

-- �Խñ� �̹���
ALTER TABLE BOARD_ATTACHMENT ADD CONSTRAINT FK_BOARD_ATTACHMENT_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);

-- �������� �̹���
ALTER TABLE NOTICE_ATTACHMENT ADD CONSTRAINT FK_NOTICE_ATTACHMENT_NOTICE FOREIGN KEY (NOTICE_NO) REFERENCES NOTICE(NO);

-- ��� �̹���
ALTER TABLE MEMBER_ATTACHMENT ADD CONSTRAINT FK_MEMBER_ATTACHMENT_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);

---------------------------------------------------
--------------------- ������ -----------------------
---------------------------------------------------
-- ������ ��� --
INSERT INTO MEMBER(NO, EMAIL, PASSWORD, NICK, ADMIN_YN) VALUES(SEQ_MEMBER.NEXTVAL, 'ADMIN01', 1234, 'NICK01', 'Y');
INSERT INTO MEMBER(NO, EMAIL, PASSWORD, NICK, ADMIN_YN) VALUES(SEQ_MEMBER.NEXTVAL, 'ADMIN02', 1234, 'NICK02', 'Y');
-- ī�װ� �ۼ� --
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '��ü');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '����');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '����');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '�');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '��');
INSERT INTO CATEGORY(NO, TITLE) VALUES(99, '�α���');
INSERT INTO CATEGORY(NO, TITLE) VALUES(98, '�Խñ�');
INSERT INTO CATEGORY(NO, TITLE) VALUES(97, '����');
INSERT INTO CATEGORY(NO, TITLE) VALUES(96, '����');
INSERT INTO CATEGORY(NO, TITLE) VALUES(95, '��Ÿ');
INSERT INTO CATEGORY(NO, TITLE) VALUES(94, '������Ʈ');
-- �Խñ� �ۼ� --
INSERT INTO BOARD(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_BOARD.NEXTVAL, 99, 1, 'S', '1');
-- ��� ���� �ۼ� --
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '�弳', 50);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '�������� ������', 100);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '����', 75);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '����', 80);
-- ȸ�� ��� --
INSERT INTO WARNING(NO, WARNING_NO, MEMBER_NO) VALUES(SEQ_WARNING.NEXTVAL, 2, 2);

-- �������� �ۼ� --
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� ���� ���� ��������','���� 06�� ~ 07�ñ��� ������Ʈ�� ���� �α����� ���ѵ˴ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 98, 1, '�Խñ� �弳 ���� ����','�Խñ� �ۼ� ���� �� �弳 ���߽� ��� 1ȸ ��� ���� 3ȸ�� ���� �̿��� ���ѵ˴ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 97, 1, '���� Ż�� ����','�ѹ� Ż���� ������ ������ �Ұ����մϴ�. ���� Ż��� �ٽ� Ȯ�� �ٶ��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 96, 1, '���� ��ġ �ȳ�','2023�� 12�� 23�Ͽ� ����Ʈ���� JavaScript�� �۵��Ǵ� XSS ������� �����Ǿ� 2023�� 12�� 29�Ͽ� ���ϵǾ����ϴ�. �� ������� ���� ����ڿ��� ��ġ�ʴ� URL Redirection�� �Ͼ �� �־�����, ����� ���������� httpOnly ��Ű�� ����ϱ⿡ JavaScript�� ���� Ż��� ���ɼ��� �������ϴ�. �����մϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '���̷α� v3 ������Ʈ �ҽ�','�ȳ��ϼ���, ������! ���̷αװ� �������� ���� 5��(2018�� ����)�� �Ѿ����ϴ�. �� ������ �� ������Ʈ�� ǮŸ���� �ƴ� ���̵�� ��ϰ� �Ǹ鼭 ���� ������ �ӵ��� �� ���� �� �߾��µ���, 2023�� 6�� ���ʹ� ���� �۳⿡ â���� ȸ�� (��)ü������ �� ������Ʈ�� �����ϰ� �Ǿ��� ���� ǮŸ������ �� ������Ʈ�� ���� �� ��ϴ� ����ڰ� �շ��Ͽ����ϴ�. ���� ���Žð� ���Ҿ ���� ������Ʈ�� ����ؼ� ����� ���ϴ� �� ���ٴ� ������Ʈ�� ���� �����Ͽ� ���������� ���������� ������Ʈ �ϴ� ���� ��ȹ���Դϴ�. ���� ���� �켱�� �����Ϸ��� ����� �ȷο� �� �ǵ� ����ε���, �� ����� �����ϱ� ���� Ȩ ȭ���� ���� �������, Ʈ���� �˰����� �����Ͽ����ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 2, '[��Ȱ��ȭ] ��ȸ�� ��� ��� ���� �ȳ�','�ش� ����� 2023.11.22�� �ӽ������� ��Ȱ��ȭ �Ǿ����ϴ�. ������ ����� �����Ͱ� �׿����� ���� ������ ���� ���ؼ� �����ͺ��̽� ������ ������ ����� ������ �߻����׽��ϴ�. �� ����� ������ �ٽ� �����Ͽ� �����ϰڽ��ϴ�. �߰�������, �Խù� ��ü�� ��踦 �Ѳ����� �� �� �ִ� ���� ��� ��ɵ� �غ� �غ��ڽ��ϴ�. �̿뿡 ������ ��� �˼��մϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, 'Ʈ���� �Ⱓ ���� �� ���� ���� �ȳ�','�� ���� Ʈ���� �������� 45�ϰ� ���� �ۼ��� ����Ʈ�鿡 ���Ͽ� 14���� ����� ������ �����Ͽ� Ʈ���� �������� �����߾����ϴ�. ����, �� �Ⱓ�� �����Ͽ� Ʈ���� ����Ʈ ����� Ȯ�� �� �� �ֽ��ϴ�. �⺻ �ɼ����δ� �̹� �ְ� ���� �˴ϴ�. ���α׿��� �Ϸ翡 �ۼ��Ǵ� ����Ʈ ���� ���ݺ��� �������� �⺻ �ɼ��� ���÷� �����ϰڽ��ϴ�. �� ����� ��� ���α� ��â�� ������ ��ȹ�� ����̿�����, ���α��� ����Ʈ ���� ��� ���� �� �� �����µ���, �����е��� ������ ����� ���� ���п� �� ����� ���� ���� �� �� �ְ� �Ǿ� ���� ��޴ϴ�. �ִ� 1������� Ʈ���� ����Ʈ�� Ȯ�� �� �� �ִµ���, �� ���� ������ �� �ô� ������ ����Ʈ�� �о����~�߰�������, ���α� ���� ����� ��� Ŀ���� ���� �δ��� �ٿ�������, ���α׿� ���� ������ �߰� �Ǿ����ϴ�. (���� ���� ����� �ſ� 100���� ���� ������ �־ ������ ���Ŵϴ� ?) ����Ʈ ��Ͽ��� �ǵ�� �Բ� ���� ��Ÿ���� �˴ϴ�. �� ����� ���� ��α��� ����ڿ��Ը� �������ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '���� �Է� �� �ܺ� ���� ��ü ���� ��� ������Ʈ','�ȳ��ϼ���, �̹� ������Ʈ������ ���α׿� ���� ���� �Է� ����� �����ƽ��ϴ�! �� ��ɿ� ���Ͽ� �۳���� ��û�� ������ �־����ϴ�. �߰�������, ���α� v2 ����� �� �� Youtube, Twitter, CodeSandbox, Codepen�� ����Ʈ�� ������ �� �ִ� ����� ���Եƾ��µ�, �̿� ���� ���� ������ ������ ���� �ʾҾ, �̹� ��ȸ�� �Բ� �ȳ��帳�ϴ�. ���� �Է� ���� �Է��� KaTeX �̶�� ���̺귯���� �����Ͽ� ������ �߽��ϴ�. LaTeX �������� ������ �Է��Ͻø� �Ǹ�, ��� ���� �� �ζ��� ������ �ۼ� �� �� �ֽ��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '������Ʈ �ȳ� : �б� ���','�̹��� ������ �б� ��� ����� ���Ͽ� �������� ���ݱ��� ������ ����Ʈ��, ���� ����Ʈ�� ��Ƽ� ���� �� �ֽ��ϴ�. �� ����� ���ǰ� ���Դ� "�ϸ�ũ" ����̶��� ��� ������ ���� �ٸ��� ������, ������ ���ƿ並 ���� ��Ͽ� �����ϴ� �͵� ����ϴٰ� �����Ͽ� �̹��� �ϸ�ũ��� �̸��� ���� ����� �����Ͽ����ϴ�. ������, ���� ���α׿� �Ϸ翡 ������Ʈ �Ǵ� ����Ʈ ���� �ð� �Ǿ��� ��, �ϸ�ũ ����� ���� �߰� ���� �� �����Դϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� ��й�ȣ ���� ���� ����','�α��� ��й�ȣ ����� 2�� ��й�ȣ �Է��� ���� �����ϴ� ������ �����Ǿ����ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� �г��� ����','�α��� �г��� ������ �� 1ȸ�� ���ѵǾ��� ������ �����Ǿ����ϴ�. �����Ӱ� �г����� ������ �� �ֽ��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� ��й�ȣ ����','�α��� ��й�ȣ ������ �� 1ȸ�� ���ѵǾ��� ������ �����Ǿ����ϴ�. �����Ӱ� �г����� ������ �� �ֽ��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� �̸��� ����','�α��� �̸��� ������ �� 1ȸ�� ���ѵǾ��� ������ �����Ǿ����ϴ�. �����Ӱ� �г����� ������ �� �ֽ��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '���̷α� v2 ������Ʈ �ȳ�','1. �� ���� �˻� v1������ PostgreSQL�� vector ����� ����� ����Ʈ�� �˻��߾����ϴ�. ó���� ������ �۵��߾����� ����Ʈ�� �������ԵǸ鼭 �˻��� ��Ȯ���� �ſ� ���������ϴ�. �̹� v2 ������ ElasticSearch�� ���Ͽ� �������� �� ���� �������� �� ��Ȯ�� ������ �˻� �� �� �ְ� �ƽ��ϴ�. 2. ����/���� ����Ʈ ���� �������� ���� ����Ʈ�� ���� ����Ʈ�� ��Ȯ�ϰ� ��Ÿ�������� �ʾƼ� �ø���� �ۼ��� ����Ʈ�� ��� ����Ʈ�� �а� �ٽ� ���� ��ũ���� �Ͽ� ���� �Ǵ� ���� ����Ʈ�� �о�� �ϴ� �������� �־����ϴ�. v2������, ������ ���� ���� ����Ʈ�� ���� ����Ʈ�� ��Ȯ�ϰ� �����ؼ� �����ָ�, �ø�� ���Ե� ����Ʈ�� ��� �ð����� �ƴ� �ø����� ����Ʈ������ ����/���� ����Ʈ�� Ȯ���Ͽ� �����ݴϴ�..');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�α��� ���� �ذ�','�α��� ����� ���� �۵� ���� �ʴ� ������ �ذ��߽��ϴ�.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '�޸� ���� �ʱ�ȭ','�α��� ���� ����� 3�� �̻��� ���� ������ �ʱ�ȭ�� �����Դϴ� Ȯ�ιٶ��ϴ�.');

-- FAQ �ۼ�   --
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ���� ����� �����ΰ���?', '������ �����Ϸ��� ������Ʈ�� ȸ������ �������� �̵��Ͽ� �ʼ� ������ �Է��ϰ� ȸ������ ��ư�� Ŭ���ϼ���. ���� Ȯ�� �̸����� ���۵Ǹ�, ��ũ�� Ŭ���Ͽ� ������ Ȱ��ȭ�ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '��й�ȣ�� �ؾ���Ƚ��ϴ�. ��� ã�� �� �ֳ���?', '��й�ȣ�� �ؾ������ ��쿡�� �α��� ���������� "��й�ȣ ã��" ��ũ�� Ŭ���Ͽ� �̸��� �ּҸ� �Է��ϰ�, ���� �� ����� �̸��� �ּҷ� ��й�ȣ �缳�� ��ũ�� �޾ƺ�����.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ����� ������ �ֳ���?', '���� ���񽺴� �ſ�ī��, ������ü, ������ �� �پ��� ���� ����� �����մϴ�. ���� ����� ���� ���������� Ȯ���Ͻ� �� �ֽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���ǻ����� ���� ��� ��� �����ϸ� �ǳ���?', '���ǻ����� ������ ��� �����ͷ� �̸����� �����ֽðų�, ��ȭ�� �������ֽø� ģ���ϰ� �ȳ��� �帮�ڽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '��й�ȣ�� �����ϴ� ����� �����ΰ���?', '��й�ȣ�� �����Ϸ��� �α��� �� �������������� ��й�ȣ ������ �����ϰ� �� ��й�ȣ�� �Է��ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ��Ҵ� ��� �ϳ���?', '���� ��Ҹ� ���ϽŴٸ� �����ͷ� �����Ͻðų� ���� ��� ��û�� ���Ϸ� �����ּ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� �Ⱓ�� ������ �� �ֳ���?', '���� �̿� �Ⱓ�� �����Ϸ��� �������������� ������ �����ϰ� �߰� ������ �����ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� ����� �˰� �ͽ��ϴ�.', '���� �̿� ����� �α��� �� ���� ���������� ��� ������ Ȯ���Ͻ� �� �ֽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿��� ��� �����ϳ���?', '���� �̿��� ���� ���������� ���Ͻô� ���� ������ �����ϰ� ������ �����Ͻø� �˴ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� �� ������ �߻��߽��ϴ�. ��� �����ϸ� �ǳ���?', '���� �̿� �� ������ �߻��� ��쿡�� �����ͷ� �����Ͽ� ���� ������ �˷��ֽø� ������ ������ �帮�ڽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, 'ȸ�� ������ �����ϰ� ������ ��� �ؾ� �ϳ���?', 'ȸ�� ������ �����Ͻ÷��� �α��� �� �������������� ȸ�� ���� ������ �����Ͽ� �ʿ��� ������ �����ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� �� �ñ��� ���� �ֽ��ϴ�. ��� �����ϸ� �ǳ���?', '���� �̿� �� �ñ��� ���� �����ø� �����ͷ� �����Ͽ� �ڼ��� �ȳ��� ������ �� �ֽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� �� ������ �߻��߽��ϴ�. ��𿡼� ������ ���� �� �ֳ���?', '���� �̿� �� ������ �߻��� ��쿡�� �����ͷ� �����Ͽ� ���� ������ �˷��ֽø� ������ ������ �帮�ڽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿��� ���� û���ǳ���?', '���� �̿��� �̿� �Ⱓ�� ����� �� ���� �̿� �Ⱓ �����Ͽ� �ڵ����� û���˴ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ������ �н��߽��ϴ�. ��� ������ �� �ֳ���?', '���� ������ �н��Ͻ� ��쿡�� �α��� ���������� "���� ����" ��ũ�� Ŭ���Ͽ� �ȳ��� ���� ������ ������ �� �ֽ��ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� ����� �ڼ��� �˰� �ͽ��ϴ�.', '���� �̿� ����� ���� �ڼ��� �ȳ��� �������� ��� ������ �����Ͻø� �˴ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ��� ��û�� ���� �ؾ� �ϳ���?', '���� ��Ҹ� ���ϽŴٸ� �������������� ���� ��Ҹ� �����Ͽ� ��û�ϰų�, �����ͷ� �������ֽø� �˴ϴ�.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� �Ⱓ�� ������ �� �ֳ���?', '���� �̿� �Ⱓ�� �����Ϸ��� �������������� �̿� �Ⱓ ������ �����ϰ� �߰� ������ �����ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� ������ �����ϰ� �ͽ��ϴ�. ��� �ؾ� �ϳ���?', '���� ������ �����Ͻ÷��� �α��� �� �������������� ���� ������ �����Ͽ� �ʿ��� ������ �����ϼ���.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '���� �̿� ����� ��� �����ϳ���?', '���� �̿� ����� ������Ʈ �� ���� ���������� ���Ͻô� ���� ������ �����ϰ� ������ �����Ͻø� �˴ϴ�.');

-- QNA �ۼ�(����)  
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� ����� �ñ��մϴ�.', '���񽺸� �̿��ϴ� ����� ���� �ñ��� ���� �ֽ��ϴ�. ��� Ȯ���� �� �ֳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '��й�ȣ�� �н��Ͽ����ϴ�.', '��й�ȣ�� �н��߽��ϴ�. ��й�ȣ�� �缳���ϴ� ����� �˷��ּ���.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 1', 'QNA ���� 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 2', 'QNA ���� 2', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� ��Ұ� �����Ѱ���?', '������ ����ϰ� �ͽ��ϴ�. ��� �ؾ� �ϳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� �� ������ �߻��߽��ϴ�.', '���� �̿� �� ������ �߻��߽��ϴ�. ��� �����ؾ� �ϳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� ������ �����ϰ� �ͽ��ϴ�.', '���� ������ �����ϰ��� �մϴ�. ��𿡼� ������ �� �ֳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� ����� Ȯ���ϰ� �ͽ��ϴ�.', '���� �̿� ��ݿ� ���� �˰� �ͽ��ϴ�. ��� Ȯ���� �� �ֳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 3', 'QNA ���� 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, 'ȸ�������� �Ϸ��µ� ����� �𸣰ڽ��ϴ�.', 'ȸ�������� �ϰ��� �ϴµ�, ��� �ؾ� ���� �𸣰ڽ��ϴ�. �����ּ���!', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� ����� ���� �ڼ��� �˰� �ͽ��ϴ�.', '���񽺸� ��� �̿��ؾ� �ϴ��� �ڼ��� �˰� �ͽ��ϴ�. ���̵������ �ֳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� �� �ñ��� ������ �ֽ��ϴ�.', '���񽺸� �̿��ϸ鼭 �ñ��� ���� ������ϴ�. ��� �����ؾ� �ұ��?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� ������ �н��Ͽ����ϴ�.', '���� ������ �н��Ͽ����ϴ�. ��й�ȣ�� �缳���ϰ� �ͽ��ϴ�. �����ּ���!', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� ����� �ڼ��� �˰� �ͽ��ϴ�.', '���񽺸� �̿��ϴ� ����� ���� �ڼ��� ������ �ʿ��մϴ�. ���̵� �����̳� ������ �������ֽø� �����ϰڽ��ϴ�.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���ǻ����� �ֽ��ϴ�.', '���� �̿� �߿� �ñ��� ���� ������ϴ�. ���ǵ帱 ������ �ֽ��ϴ�. �亯 ��Ź�帳�ϴ�.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� �� �߻��� ������ ���� ���ǵ帳�ϴ�.', '���� �̿� �߿� ������ �߻��Ͽ� �������� �ް� �ֽ��ϴ�. ������ ���� ���� ���� �ذ� ��Ź�帳�ϴ�.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿뿡 ���� ���ǻ����Դϴ�.', '���� �̿� �߿� �ñ��� ������ �־� ���ǵ帳�ϴ�. �ε� �亯���ֽñ� �ٶ��ϴ�.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '���� �̿� ����� �� �𸣰ڽ��ϴ�.', '���񽺸� �̿��ϴ� ����� ���� �� �� ���� �˰� �ͽ��ϴ�. ��� Ȯ���� �� �ֳ���?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 4', 'QNA ���� 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 5', 'QNA ���� 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA �ۼ� 6', 'QNA ���� 1', 'Y'); 

UPDATE NOTICE 
SET TITLE = '����� ����222', CONTENT = '����� ����222' 
WHERE NO = 34
;

COMMIT;
