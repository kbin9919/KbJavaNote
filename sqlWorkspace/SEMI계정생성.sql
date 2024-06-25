DROP USER C##ORCA;
CREATE USER C##ORCA IDENTIFIED BY 1234;
GRANT RESOURCE, CONNECT TO C##ORCA;
ALTER USER C##ORCA DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;



---------------------------------------------------
---------------------- 삭제 ------------------------
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

-- 멤버 시퀀스
DROP SEQUENCE SEQ_MEMBER;
-- 제제 이력 시퀀스 
DROP SEQUENCE SEQ_WARNING;
-- 경고 규정 시퀀스 
DROP SEQUENCE SEQ_WARNING_LIST;
-- 팔로우 시퀀스 
DROP SEQUENCE SEQ_FOLLOW;
-- 팔로잉 시퀀스 
DROP SEQUENCE SEQ_FOLLOWING;
-- 차단한 회원 시퀀스 
DROP SEQUENCE SEQ_BLOCK_MEMBER;
-- 댓글 시퀀스 
DROP SEQUENCE SEQ_COMMENTS;
-- 대댓글 시퀀스 
DROP SEQUENCE SEQ_RECOMMENT;
-- 주제 시퀀스 
DROP SEQUENCE SEQ_CATEGORY;
-- FAQ 시퀀스 
DROP SEQUENCE SEQ_FAQ;
-- 쪽지함 시퀀스 
DROP SEQUENCE SEQ_MESSAGE;
-- 게시판 시퀀스 
DROP SEQUENCE SEQ_BOARD;
-- 공지사항 시퀀스
DROP SEQUENCE SEQ_NOTICE;
-- QNA 시퀀스
DROP SEQUENCE SEQ_QNA;
-- 게시글 이미지 시퀀스
DROP SEQUENCE SEQ_BOARD_ATTACHMENT;

-- 회원 테이블
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- 제제 이력 테이블 
DROP TABLE WARNING CASCADE CONSTRAINTS;
-- 경고 규정 테이블 
DROP TABLE WARNING_LIST CASCADE CONSTRAINTS;
-- 팔로우 테이블 
DROP TABLE FOLLOW CASCADE CONSTRAINTS;
-- 팔로잉 테이블 
DROP TABLE FOLLOWING CASCADE CONSTRAINTS;
-- 차단한 회원 테이블 
DROP TABLE BLOCK_MEMBER CASCADE CONSTRAINTS;
-- 댓글 테이블 
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
-- 댓글 추천 테이블 
DROP TABLE COMMENTRECOMMEND CASCADE CONSTRAINTS;
-- 대댓글 테이블 
DROP TABLE RECOMMENT CASCADE CONSTRAINTS;
-- 주제 테이블 
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
-- FAQ 테이블 
DROP TABLE FAQ CASCADE CONSTRAINTS;
-- 쪽지함 테이블 
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
-- 게시판 테이블 
DROP TABLE BOARD CASCADE CONSTRAINTS;
-- 공지사항 테이블
DROP TABLE NOTICE CASCADE CONSTRAINTS;
-- QNA 테이블
DROP TABLE QNA CASCADE CONSTRAINTS;
-- 방문자 테이블
DROP TABLE VISITOR CASCADE CONSTRAINTS;
-- 추천인 테이블
DROP TABLE RECOMMEND CASCADE CONSTRAINTS;
-- 게시글 이미지 테이블
DROP SEQUENCE SEQ_BOARD_ATTACHMENT;
-- 공지사항 이미지 테이블
DROP SEQUENCE SEQ_NOTICE_ATTACHMENT;
-- 멤버 이미지 테이블
DROP SEQUENCE SEQ_MEMBER_ATTACHMENT;

---------------------------------------------------
--------------------- 시퀀스 -----------------------
---------------------------------------------------
-- 멤버 시퀀스 
CREATE SEQUENCE SEQ_MEMBER;
-- 제제 이력 시퀀스 
CREATE SEQUENCE SEQ_WARNING;
-- 경고 규정 시퀀스 
CREATE SEQUENCE SEQ_WARNING_LIST;
-- 팔로우 시퀀스 
CREATE SEQUENCE SEQ_FOLLOW;
-- 팔로잉 시퀀스 
CREATE SEQUENCE SEQ_FOLLOWING;
-- 차단한 회원 시퀀스 
CREATE SEQUENCE SEQ_BLOCK_MEMBER;
-- 댓글 시퀀스 
CREATE SEQUENCE SEQ_COMMENTS;
-- 대댓글 시퀀스 
CREATE SEQUENCE SEQ_RECOMMENT;
-- 주제 시퀀스 
CREATE SEQUENCE SEQ_CATEGORY;
-- FAQ 시퀀스 
CREATE SEQUENCE SEQ_FAQ;
-- 쪽지함 시퀀스 
CREATE SEQUENCE SEQ_MESSAGE;
-- 게시판 시퀀스 
CREATE SEQUENCE SEQ_BOARD;
-- 공지사항 시퀀스
CREATE SEQUENCE SEQ_NOTICE;
-- QNA 시퀀스
CREATE SEQUENCE SEQ_QNA;
-- 게시글 이미지 시퀀스
CREATE SEQUENCE SEQ_BOARD_ATTACHMENT;
-- 공지사항 이미지 시퀀스
CREATE SEQUENCE SEQ_NOTICE_ATTACHMENT;
-- 멤버 이미지 시퀀스
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
--------------------- 외래키 -----------------------
---------------------------------------------------

-- 제제 이력 외래키
ALTER TABLE WARNING ADD CONSTRAINT FK_WARNING_WARNING_LIST FOREIGN KEY (WARNING_NO) REFERENCES WARNING_LIST(NO);
ALTER TABLE WARNING ADD CONSTRAINT FK_WARNING_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);

-- 팔로우 외래키
ALTER TABLE FOLLOW ADD CONSTRAINT FK_FOLLOW_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);
ALTER TABLE FOLLOW ADD CONSTRAINT FK_FOLLOW_MEMBER_FOLLOWER FOREIGN KEY (FOLLOWER_NO) REFERENCES MEMBER(NO);

-- 팔로잉 외래키
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLOWING_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);
ALTER TABLE FOLLOWING ADD CONSTRAINT FK_FOLLOWING_MEMBER_FOLLOWING FOREIGN KEY (FOLLOWING_NO) REFERENCES MEMBER(NO);

-- 차단한 회원 외래키
ALTER TABLE BLOCK_MEMBER ADD CONSTRAINT FK_BLOCK_MEMBER_BLOCKER FOREIGN KEY (BLOCKER_NO) REFERENCES MEMBER(NO);
ALTER TABLE BLOCK_MEMBER ADD CONSTRAINT FK_BLOCK_MEMBER_BLOCKED FOREIGN KEY (BLOCKED_NO) REFERENCES MEMBER(NO);

-- 댓글 외래키
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- 대댓글 외래키
ALTER TABLE RECOMMENT ADD CONSTRAINT FK_RECOMMENT_COMMENT FOREIGN KEY (COMMENT_NO) REFERENCES COMMENTS(NO);
ALTER TABLE RECOMMENT ADD CONSTRAINT FK_RECOMMENT_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- 댓글 추천 외래키
ALTER TABLE COMMENTRECOMMEND ADD CONSTRAINT FK_COMMENTRECOMMEND_COMMENT FOREIGN KEY (COMMENT_NO) REFERENCES COMMENTS(NO);
ALTER TABLE COMMENTRECOMMEND ADD CONSTRAINT FK_COMMENTRECOMMEND_MEMBER FOREIGN KEY (REFERENCE_NO) REFERENCES MEMBER(NO);

-- 쪽지함 외래키
ALTER TABLE MESSAGE ADD CONSTRAINT FK_MESSAGE_MEMBER_RECEIVER FOREIGN KEY (RECEIVER_NO) REFERENCES MEMBER(NO);
ALTER TABLE MESSAGE ADD CONSTRAINT FK_MESSAGE_MEMBER_SENDER FOREIGN KEY (SENDER_NO) REFERENCES MEMBER(NO);

-- 게시판 외래키
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
ALTER TABLE BOARD ADD CONSTRAINT FK_BOARD_CATEGORY FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(NO);

-- 공지사항 외래키
ALTER TABLE NOTICE ADD CONSTRAINT FK_NOTICE_CATEGORY FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(NO);
ALTER TABLE NOTICE ADD CONSTRAINT FK_NOTICE_MEMBER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);

-- QNA 외래키
ALTER TABLE QNA ADD CONSTRAINT FK_QNA_MEMBER_WRITER FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO);
ALTER TABLE QNA ADD CONSTRAINT FK_QNA_MEMBER_ADMIN FOREIGN KEY (ADMIN_NO) REFERENCES MEMBER(NO);

-- 추천자 외래키
ALTER TABLE RECOMMEND ADD CONSTRAINT FK_RECOMMEND_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE RECOMMEND ADD CONSTRAINT FK_RECOMMEND_MEMBER FOREIGN KEY (REFERENCE_NO) REFERENCES MEMBER(NO);

-- 방문자 외래키
ALTER TABLE VISITOR ADD CONSTRAINT FK_VISITOR_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);
ALTER TABLE VISITOR ADD CONSTRAINT FK_VISITOR_MEMBER FOREIGN KEY (VISITOR_NUM) REFERENCES MEMBER(NO);

-- 게시글 이미지
ALTER TABLE BOARD_ATTACHMENT ADD CONSTRAINT FK_BOARD_ATTACHMENT_BOARD FOREIGN KEY (BOARD_NO) REFERENCES BOARD(NO);

-- 공지사항 이미지
ALTER TABLE NOTICE_ATTACHMENT ADD CONSTRAINT FK_NOTICE_ATTACHMENT_NOTICE FOREIGN KEY (NOTICE_NO) REFERENCES NOTICE(NO);

-- 멤버 이미지
ALTER TABLE MEMBER_ATTACHMENT ADD CONSTRAINT FK_MEMBER_ATTACHMENT_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(NO);

---------------------------------------------------
--------------------- 데이터 -----------------------
---------------------------------------------------
-- 관리자 등록 --
INSERT INTO MEMBER(NO, EMAIL, PASSWORD, NICK, ADMIN_YN) VALUES(SEQ_MEMBER.NEXTVAL, 'ADMIN01', 1234, 'NICK01', 'Y');
INSERT INTO MEMBER(NO, EMAIL, PASSWORD, NICK, ADMIN_YN) VALUES(SEQ_MEMBER.NEXTVAL, 'ADMIN02', 1234, 'NICK02', 'Y');
-- 카테고리 작성 --
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '전체');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '게임');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '공부');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '운동');
INSERT INTO CATEGORY(NO, TITLE) VALUES(SEQ_CATEGORY.NEXTVAL, '농구');
INSERT INTO CATEGORY(NO, TITLE) VALUES(99, '로그인');
INSERT INTO CATEGORY(NO, TITLE) VALUES(98, '게시글');
INSERT INTO CATEGORY(NO, TITLE) VALUES(97, '계정');
INSERT INTO CATEGORY(NO, TITLE) VALUES(96, '보안');
INSERT INTO CATEGORY(NO, TITLE) VALUES(95, '기타');
INSERT INTO CATEGORY(NO, TITLE) VALUES(94, '업테이트');
-- 게시글 작성 --
INSERT INTO BOARD(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_BOARD.NEXTVAL, 99, 1, 'S', '1');
-- 경고 규정 작성 --
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '욕설', 50);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '선정적인 콘텐츠', 100);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '도배', 75);
INSERT INTO WARNING_LIST(NO, TITLE, POINT) VALUES(SEQ_WARNING_LIST.NEXTVAL, '광고', 80);
-- 회원 경고 --
INSERT INTO WARNING(NO, WARNING_NO, MEMBER_NO) VALUES(SEQ_WARNING.NEXTVAL, 2, 2);

-- 공지사항 작성 --
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 접속 오류 공지사항','금일 06시 ~ 07시까지 업데이트로 인해 로그인이 제한됩니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 98, 1, '게시글 욕설 관련 규정','게시글 작성 내용 중 욕설 적발시 경고 1회 경고 누적 3회시 계정 이용이 제한됩니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 97, 1, '계정 탈퇴 복구','한번 탈퇴한 계정은 복구가 불가능합니다. 계정 탈퇴시 다시 확인 바랍니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 96, 1, '보안 패치 안내','2023년 12월 23일에 포스트에서 JavaScript가 작동되는 XSS 취약점이 제보되어 2023년 12월 29일에 보완되었습니다. 이 취약점을 통해 사용자에게 원치않는 URL Redirection이 일어날 수 있었으며, 사용자 인증정보는 httpOnly 쿠키를 사용하기에 JavaScript를 통해 탈취될 가능성은 없었습니다. 감사합니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '마이로그 v3 업데이트 소식','안녕하세요, 여러분! 마이로그가 개설된지 벌써 5년(2018년 개설)이 넘었습니다. 그 동안은 이 프로젝트가 풀타임이 아닌 사이드로 운영하게 되면서 서비스 개선에 속도를 잘 내질 못 했었는데요, 2023년 6월 부터는 제가 작년에 창업한 회사 (주)체프에서 이 프로젝트를 관리하게 되었고 현재 풀타임으로 이 프로젝트를 개발 및 운영하는 담당자가 합류하였습니다. 워낙 레거시가 많았어서 기존 프로젝트에 계속해서 기능을 더하는 것 보다는 프로젝트를 새로 구성하여 점진적으로 페이지별로 업데이트 하는 것을 계획중입니다. 지금 가장 우선시 공개하려는 기능은 팔로우 및 피드 기능인데요, 그 기능을 배포하기 전에 홈 화면을 새로 만들었고, 트렌딩 알고리즘을 개선하였습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 2, '[비활성화] 조회수 통계 기능 도입 안내','해당 기능은 2023.11.22일 임시적으로 비활성화 되었습니다. 기존의 방식이 데이터가 쌓여감에 따라 성능이 좋지 못해서 데이터베이스 연산을 느리게 만드는 현상을 발생시켰습니다. 이 기능은 조만간 다시 개선하여 도입하겠습니다. 추가적으로, 게시물 전체의 통계를 한꺼번에 볼 수 있는 통합 통계 기능도 준비를 해보겠습니다. 이용에 불편을 드려 죄송합니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '트렌딩 기간 설정 및 광고 지면 안내','그 동안 트렌딩 페이지는 45일간 동안 작성한 포스트들에 대하여 14일의 사용자 반응을 추합하여 트렌딩 페이지에 노출했었습니다. 이제, 이 기간을 선택하여 트렌딩 포스트 목록을 확인 할 수 있습니다. 기본 옵션으로는 이번 주가 선택 됩니다. 벨로그에서 하루에 작성되는 포스트 수가 지금보다 많아지면 기본 옵션을 오늘로 설정하겠습니다. 이 기능은 사실 벨로그 초창기 때부터 기획한 기능이였지만, 벨로그의 포스트 수가 적어서 도입 할 수 없었는데요, 여러분들의 꾸준한 사랑과 열정 덕분에 이 기능을 드디어 공개 할 수 있게 되어 정말 기쁩니다. 최대 1년까지의 트렌딩 포스트를 확인 할 수 있는데요, 그 동안 묻혀서 못 봤던 유익한 포스트를 읽어보세요~추가적으로, 벨로그 서버 비용이 계속 커짐에 따라 부담을 줄여보고자, 벨로그에 광고 지면이 추가 되었습니다. (현재 서버 비용이 매월 100만원 가량 나오고 있어서 통장이 아픕니다 ?) 포스트 목록에서 피드와 함께 광고가 나타나게 됩니다. 이 광고는 현재 비로그인 사용자에게만 보여집니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '수식 입력 및 외부 서비스 개체 삽입 기능 업데이트','안녕하세요, 이번 업데이트에서는 벨로그에 드디어 수식 입력 기능이 지원됐습니다! 이 기능에 대하여 작년부터 요청이 꾸준히 있었습니다. 추가적으로, 벨로그 v2 릴리즈가 될 때 Youtube, Twitter, CodeSandbox, Codepen을 포스트에 삽입할 수 있는 기능이 도입됐었는데, 이에 대한 별도 공지를 기존에 하지 않았어서, 이번 기회에 함께 안내드립니다. 수식 입력 수식 입력은 KaTeX 이라는 라이브러리를 적용하여 도입을 했습니다. LaTeX 형식으로 수식을 입력하시면 되며, 블록 수식 및 인라인 수식을 작성 할 수 있습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '업데이트 안내 : 읽기 목록','이번에 구현된 읽기 목록 기능을 통하여 여러분이 지금까지 좋아한 포스트와, 읽은 포스트를 모아서 보실 수 있습니다. 이 기능이 문의가 들어왔던 "북마크" 기능이랑은 사실 성격이 조금 다르긴 하지만, 지금은 좋아요를 통해 목록에 보관하는 것도 충분하다고 생각하여 이번에 북마크라는 이름을 가진 기능은 생략하였습니다. 하지만, 추후 벨로그에 하루에 업데이트 되는 포스트 양이 늘게 되었을 때, 북마크 기능을 따로 추가 구현 할 예정입니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 비밀번호 변경 내용 수정','로그인 비밀번호 변경시 2차 비밀번호 입력을 통해 변경하던 내용이 삭제되었습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 닉네임 변경','로그인 닉네임 변경이 월 1회로 제한되었던 규정이 삭제되었습니다. 자유롭게 닉네임을 변경할 수 있습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 비밀번호 변경','로그인 비밀번호 변경이 월 1회로 제한되었던 규정이 삭제되었습니다. 자유롭게 닉네임을 변경할 수 있습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 이메일 변경','로그인 이메일 변경이 월 1회로 제한되었던 규정이 삭제되었습니다. 자유롭게 닉네임을 변경할 수 있습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 94, 1, '마이로그 v2 업데이트 안내','1. 더 나은 검색 v1에서는 PostgreSQL의 vector 기능을 사용해 포스트를 검색했었습니다. 처음엔 괜찮게 작동했었지만 포스트가 많아지게되면서 검색의 정확도가 매우 낮아졌습니다. 이번 v2 에서는 ElasticSearch를 통하여 이전보다 더 나은 성능으로 더 정확한 내용을 검색 할 수 있게 됐습니다. 2. 이전/다음 포스트 개선 기존에는 이전 포스트와 다음 포스트가 명확하게 나타나져있지 않아서 시리즈로 작성된 포스트의 경우 포스트를 읽고 다시 위로 스크롤을 하여 다음 또는 이전 포스트를 읽어야 하는 불편함이 있었습니다. v2에서는, 다음과 같이 이전 포스트와 다음 포스트를 명확하게 구분해서 보여주며, 시리즈에 포함된 포스트의 경우 시간순이 아닌 시리즈의 포스트순으로 이전/다음 포스트를 확인하여 보여줍니다..');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '로그인 오류 해결','로그인 기능이 정상 작동 하지 않던 오류를 해결했습니다.');
INSERT INTO NOTICE(NO, CATEGORY_NO, WRITER_NO, TITLE, CONTENT) VALUES(SEQ_NOTICE.NEXTVAL, 99, 1, '휴면 계정 초기화','로그인 접속 기록이 3년 이상이 지난 계정을 초기화할 예정입니다 확인바랍니다.');

-- FAQ 작성   --
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '계정 생성 방법은 무엇인가요?', '계정을 생성하려면 웹사이트의 회원가입 페이지로 이동하여 필수 정보를 입력하고 회원가입 버튼을 클릭하세요. 가입 확인 이메일이 전송되면, 링크를 클릭하여 계정을 활성화하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '비밀번호를 잊어버렸습니다. 어떻게 찾을 수 있나요?', '비밀번호를 잊어버리신 경우에는 로그인 페이지에서 "비밀번호 찾기" 링크를 클릭하여 이메일 주소를 입력하고, 가입 시 등록한 이메일 주소로 비밀번호 재설정 링크를 받아보세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '결제 방법은 무엇이 있나요?', '저희 서비스는 신용카드, 계좌이체, 페이팔 등 다양한 결제 방법을 지원합니다. 결제 방법은 결제 페이지에서 확인하실 수 있습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '문의사항이 있을 경우 어떻게 연락하면 되나요?', '문의사항이 있으신 경우 고객센터로 이메일을 보내주시거나, 전화로 문의해주시면 친절하게 안내해 드리겠습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '비밀번호를 변경하는 방법은 무엇인가요?', '비밀번호를 변경하려면 로그인 후 마이페이지에서 비밀번호 변경을 선택하고 새 비밀번호를 입력하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '결제 취소는 어떻게 하나요?', '결제 취소를 원하신다면 고객센터로 문의하시거나 결제 취소 요청을 메일로 보내주세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 기간을 연장할 수 있나요?', '서비스 이용 기간을 연장하려면 마이페이지에서 연장을 선택하고 추가 결제를 진행하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 방법을 알고 싶습니다.', '서비스 이용 방법은 로그인 후 메인 페이지에서 사용 설명서를 확인하실 수 있습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용료는 어떻게 지불하나요?', '서비스 이용료는 결제 페이지에서 원하시는 결제 수단을 선택하고 결제를 진행하시면 됩니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 중 문제가 발생했습니다. 어디에 문의하면 되나요?', '서비스 이용 중 문제가 발생한 경우에는 고객센터로 문의하여 상세한 내용을 알려주시면 빠르게 도움을 드리겠습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '회원 정보를 수정하고 싶은데 어떻게 해야 하나요?', '회원 정보를 수정하시려면 로그인 후 마이페이지에서 회원 정보 수정을 선택하여 필요한 정보를 수정하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 중 궁금한 점이 있습니다. 어디에 문의하면 되나요?', '서비스 이용 중 궁금한 점이 있으시면 고객센터로 문의하여 자세한 안내를 받으실 수 있습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 중 문제가 발생했습니다. 어디에서 도움을 받을 수 있나요?', '서비스 이용 중 문제가 발생한 경우에는 고객센터로 문의하여 상세한 내용을 알려주시면 빠르게 도움을 드리겠습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용료는 언제 청구되나요?', '서비스 이용료는 이용 기간이 종료된 후 다음 이용 기간 시작일에 자동으로 청구됩니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '계정 정보를 분실했습니다. 어떻게 복구할 수 있나요?', '계정 정보를 분실하신 경우에는 로그인 페이지에서 "계정 복구" 링크를 클릭하여 안내에 따라 계정을 복구할 수 있습니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 방법을 자세히 알고 싶습니다.', '서비스 이용 방법에 대한 자세한 안내는 고객센터의 사용 설명서를 참조하시면 됩니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '결제 취소 요청은 어디로 해야 하나요?', '결제 취소를 원하신다면 마이페이지에서 결제 취소를 선택하여 요청하거나, 고객센터로 문의해주시면 됩니다.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 기간을 연장할 수 있나요?', '서비스 이용 기간을 연장하려면 마이페이지에서 이용 기간 연장을 선택하고 추가 결제를 진행하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '계정 정보를 변경하고 싶습니다. 어떻게 해야 하나요?', '계정 정보를 변경하시려면 로그인 후 마이페이지에서 계정 정보를 선택하여 필요한 정보를 수정하세요.');
INSERT INTO FAQ (NO, TITLE, CONTENT)
VALUES (SEQ_FAQ.NEXTVAL, '서비스 이용 요금은 어떻게 결제하나요?', '서비스 이용 요금은 웹사이트 내 결제 페이지에서 원하시는 결제 수단을 선택하고 결제를 진행하시면 됩니다.');

-- QNA 작성(유저)  
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 방법이 궁금합니다.', '서비스를 이용하는 방법에 대해 궁금한 점이 있습니다. 어디서 확인할 수 있나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '비밀번호를 분실하였습니다.', '비밀번호를 분실했습니다. 비밀번호를 재설정하는 방법을 알려주세요.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 1', 'QNA 내용 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 2', 'QNA 내용 2', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '결제 취소가 가능한가요?', '결제를 취소하고 싶습니다. 어떻게 해야 하나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 중 문제가 발생했습니다.', '서비스 이용 중 문제가 발생했습니다. 어디에 문의해야 하나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '계정 정보를 수정하고 싶습니다.', '계정 정보를 수정하고자 합니다. 어디에서 수정할 수 있나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 요금을 확인하고 싶습니다.', '서비스 이용 요금에 대해 알고 싶습니다. 어디서 확인할 수 있나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 3', 'QNA 내용 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '회원가입을 하려는데 방법을 모르겠습니다.', '회원가입을 하고자 하는데, 어떻게 해야 할지 모르겠습니다. 도와주세요!', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 방법에 대해 자세히 알고 싶습니다.', '서비스를 어떻게 이용해야 하는지 자세히 알고 싶습니다. 가이드라인이 있나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 중 궁금한 사항이 있습니다.', '서비스를 이용하면서 궁금한 점이 생겼습니다. 어디에 문의해야 할까요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '계정 정보를 분실하였습니다.', '계정 정보를 분실하였습니다. 비밀번호를 재설정하고 싶습니다. 도와주세요!', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 방법을 자세히 알고 싶습니다.', '서비스를 이용하는 방법에 대해 자세한 설명이 필요합니다. 가이드 라인이나 도움말을 제공해주시면 감사하겠습니다.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '문의사항이 있습니다.', '서비스 이용 중에 궁금한 점이 생겼습니다. 문의드릴 내용이 있습니다. 답변 부탁드립니다.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 중 발생한 오류에 대해 문의드립니다.', '서비스 이용 중에 오류가 발생하여 불편함을 겪고 있습니다. 가능한 빠른 시일 내에 해결 부탁드립니다.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용에 관한 문의사항입니다.', '서비스 이용 중에 궁금한 사항이 있어 문의드립니다. 부디 답변해주시기 바랍니다.', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL, 1, '서비스 이용 방법을 잘 모르겠습니다.', '서비스를 이용하는 방법에 대해 좀 더 상세히 알고 싶습니다. 어디서 확인할 수 있나요?', 'N');
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 4', 'QNA 내용 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 5', 'QNA 내용 1', 'Y'); 
INSERT INTO QNA(NO, WRITER_NO, TITLE, CONTENT, SECRET_YN) VALUES(SEQ_QNA.NEXTVAL,1,'QNA 작성 6', 'QNA 내용 1', 'Y'); 

UPDATE NOTICE 
SET TITLE = '변경된 제목222', CONTENT = '변경된 내용222' 
WHERE NO = 34
;

COMMIT;
