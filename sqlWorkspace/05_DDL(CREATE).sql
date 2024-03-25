-- 08 DDL (CREATE)
/*
    <DDL(Data Definition Language)>
        ������ ���� ���� ����Ŭ���� �����ϴ� ��ü�� �����(CREATE), �����ϰ�(ALTER), �����ϴ�(DROP) ��
        ���� ������ ���� �ƴ� �������� ���� ��ü�� �����ϴ� ���� DB ������, �����ڰ� �ַ� ����Ѵ�.

        * ����Ŭ������ ��ü : ���̺�, ��, ������, �ε���, Ʈ����, ���ν���, �Լ�, ����� ���
        
    <CREATE>
        �����ͺ��̽��� ��ü�� �����ϴ� �����̴�.
    
    <TABLE(���̺�)>
        ���̺��� ��� ���� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü�� �����ͺ��̽� ������ ��� �����ʹ� ���̺� ����ȴ�.
        
    <���̺� ����>
        [����]
            CREATE TABLE ���̺�� (
                Į���� �ڷ���(ũ��) [DEFAULT �⺻��] [��������],
                Į���� �ڷ���(ũ��) [DEFAULT �⺻��] [��������],
                ...
            );
*/--
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    ID              VARCHAR2(100) 
    , PWD           VARCHAR2(100) 
    , NICK          VARCHAR2(100)
    , QUIT_YN       CHAR(1)     DEFAULT 'N'
    , ENROLL_DATE   TIMESTAMP
);

SELECT *
FROM MEMBER;

/*
    <Į���� �ּ� �ޱ�>
        [����]
            COMMENT ON COLUMN ���̺��.Į���� IS '�ּ�����';
*/
COMMENT ON COLUMN MEMBER.ID IS '���̵�';
COMMENT ON COLUMN MEMBER.PWD IS'�н�����';
COMMENT ON COLUMN MEMBER.NICK IS '�г���';
COMMENT ON COLUMN MEMBER.QUIT_YN IS 'Ż�𿩺�';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '������';

/*
    ������ ��ųʸ�(��Ÿ ������)
        �ڿ��� ȿ�������� �����ϱ� ���� �پ��� ��ü���� ������ �����ϴ� �ý��� ���̺��̴�.
        ����ڰ� ��ü�� �����ϰų� ��ü�� �����ϴ� ���� �۾��� �� �� �����ͺ��̽��� ���ؼ� �ڵ����� ���ŵǴ� ���̺��̴�.
        �����Ϳ� ���� �����Ͱ� ����Ǿ� �ִٰ� �ؼ� ��Ÿ �����Ͷ�� �Ѵ�.
        
    USER_TABLES         : ����ڰ� ������ �ִ� ���̺���� �������� ������ Ȯ���ϴ� �� ���̺��̴�. 
    USER_TAB_COLUMNS    : ���̺�, ���� Į���� ���õ� ������ ��ȸ�ϴ� �� ���̺��̴�.
*/
SELECT *
FROM USER_TABLES;

SELECT *
FROM USER_TAB_COLUMNS;

/*
    <���� ����(CONSTRAINT)>
        ����ڰ� ���ϴ� ������ �����͸� �����ϱ� ���ؼ� ���̺� �ۼ� �� �� Į���� ���� ����� ���� ���� ���������� ������ �� �ִ�.
        ���� ������ ������ ���Ἲ ������ �������� �Ѵ�. (�������� ��Ȯ���� �ϰ����� ������Ű�� ��)
        
        * ���� : NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY
        
        [����]
            1) Į�� ����
                CRATE TABLE ���̺�� (
                    Į���� �ڷ���(ũ��) [CONSTRAINT �������Ǹ�] ��������,
                    ...
                );
            
            2) ���̺� ����
                CRATE TABLE ���̺�� (
                    Į���� �ڷ���(ũ��),
                    ...,
                    [CONSTRAINT �������Ǹ�] ��������(Į����)
                );
*/
-- ���� ��ȸ
DESC MEMBER
SELECT * FROM USER_CONSTRAINTS;

/*
    <NOT NULL ��������>
        �ش� Į���� �ݵ�� ���� �־�߸� �ϴ� ��� ����Ѵ�.
        ����/���� �� NULL ���� ������� �ʵ��� �����Ѵ�.
*/

DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    ID              VARCHAR2(100) CONSTRAINT MEM_ID_NN_01 NOT NULL
    , PWD           VARCHAR2(100) NOT NULL
    , NICK          VARCHAR2(100)
    , QUIT_YN       CHAR(1)     DEFAULT 'N'
    , ENROLL_DATE   TIMESTAMP
);

COMMIT;
SELECT *
FROM MEMBER;

/*
    <UNIQUE ��������>
        Į���� �Է� ���� �ߺ� ���� �����ϴ� ���������̴�.
        �����͸� ����/���� �� ������ �ִ� ������ �� �߿� �ߺ��Ǵ� ���� ���� ��� ����/�������� �ʴ´�.
        �������� ���� ������� Į�� ����, ���̺� ���� ��� ��� ��� �����ϴ�.
*/
CREATE TABLE MEMBER(
    ID              VARCHAR2(100) CONSTRAINT MEM_ID_NN_01 NOT NULL
    , PWD           VARCHAR2(100) 
    , NICK          VARCHAR2(100)
    , QUIT_YN       CHAR(1)     DEFAULT 'N' 
    , ENROLL_DATE   TIMESTAMP
    , CONSTRAINT MEM_NICK_UQ_AVC UNIQUE(NICK)
);
/*
    <CHECK ��������>
        Į���� ��ϵǴ� ���� ������ �����ϰ� ������ �����ϴ� ���� ����� �� �ִ�.
        �� ���� ���ͷ��� ��� �����ϴ�.(���ϴ� ���̳� �Լ� ������� ���Ѵ�.)
        
        [����]
            CHECK(�񱳿�����)
                CHECK(Į�� [NOT] IN(��, ��, ...))
                CHECK(Į�� = ��)
                CHECK(Į�� BETWEEN �� AND ��)
                CHECK(Į�� LIKE '_����' OR Į�� LIKE '����%')
                ...
*/
CREATE TABLE MEMBER(
    ID              VARCHAR2(100) CONSTRAINT MEM_ID_NN_01 NOT NULL
    , PWD           VARCHAR2(100) 
    , NICK          VARCHAR2(100)
    , QUIT_YN       CHAR(1)      DEFAULT 'N' CONSTRAINT YN_�ٸ������� CHECK(QUIT_YN IN ('Y', 'N'))
    , ENROLL_DATE   TIMESTAMP
    , CONSTRAINT MEM_NICK_UQ_AVC UNIQUE(NICK)
);
/*
    <PRIMARY KEY(�⺻ Ű) ��������>
        -NOT NULL �������� �������
        - UNIQUE �������� �������
        - INDEX �������
        - ���̺� ��ǥ Į���� ����(���� ������ �ĺ��ڷ� ����)
        - �� ���̺� �� ���� ������ �� �ִ�.
        
        ���̺��� �� ���� ������ �ĺ��ϱ� ���� ����� Į���� �ο��ϴ� ���������̴�.
        �� ����� ������ �� �ִ� �ĺ��� ����(���, �μ� �ڵ�, ���� �ڵ�, ..)
        �⺻ Ű ���������� �����ϰ� �Ǹ� �ڵ����� �ش� Į���� NOT NULL + UNIQUE ���������� �����ȴ�.
        �� ���̺� �� ���� ������ �� �ִ�.(��, �� �� �̻��� Į���� ��� PRIMARY KEY�� ���������� ������ �� �ִ�.)
        Į�� ����, ���̺� ���� ��� ��� ���� �����ϴ�. 
*/
CREATE TABLE MEMBER(    
    MEM_NO          NUMBER PRIMARY KEY 
    ,ID              VARCHAR2(100) CONSTRAINT MEM_ID_NN_01 NOT NULL
    , PWD           VARCHAR2(100) 
    , NICK          VARCHAR2(100)
    , QUIT_YN       CHAR(1)      DEFAULT 'N' CONSTRAINT YN_�ٸ������� CHECK(QUIT_YN IN ('Y', 'N'))
    , ENROLL_DATE   TIMESTAMP
    , CONSTRAINT MEM_NICK_UQ_AVC UNIQUE(NICK)
);

INSERT INTO MEMBER(MEM_NO , ID, NICK) VALUES(2, 'USER02' , 'NICK02');
SELECT *
FROM MEMBER;
/*
    <FOREIGN KEY(�ܷ� Ű) ��������>
        �ٸ� ���̺� �����ϴ� ������ ������ �ϴ� Į���� �ο��ϴ� ���������̴�.(��, NULL ���� ���� �� �ִ�.)
        ��, ������ �ٸ� ���̺��� �����ϴ� ���� ����� �� �ִ�. (FOREIGN KEY �������ǿ� ���ؼ� ���̺� ���� ���谡 �����ȴ�.)
        
        [����]
            1) Į�� ����
                Į���� �ڷ���(ũ��) [CONSTRAINT �������Ǹ�] REFERENCES ���������̺�� [(�⺻Ű)] [������]
                
            2) ���̺� ����
                [CONSTRAINT �������Ǹ�] FOREIGN KEY(Į����) REFERENCES ���������̺�� [(�⺻Ű)] [������]
                
        [������]
            �θ� ���̺��� �����Ͱ� �������� ���� �ɼ��� ������ ���� �� �ִ�. - �⺻������ ���� �Ұ�
            1) ON DELETE RESTRICT : �ڽ� ���̺��� ���� Ű�� �θ� ���̺��� Ű ���� �����ϴ� ��� �θ� ���̺��� ���� ������ �� ����. (���������� ����Ǵ� �ɼ�)
            2) ON DELETE SET NULL : �θ� ���̺��� �����Ͱ� ���� �� �����ϰ� �ִ� �ڽ� ���̺��� �÷� ���� NULL�� ����ȴ�.
            3) ON DELETE CASCADE  : �θ� ���̺��� �����Ͱ� ���� �� �����ϰ� �ִ� �ڽ� ���̺��� �ķ� ���� �����ϴ� �� ��ü�� �����ȴ�.
*/
DROP TABLE BOARD;
CREATE TABLE BOARD(
    B_NO        NUMBER              NOT NULL UNIQUE
    , TITLE     VARCHAR2(1000)      NOT NULL
    , CONTENT   VARCHAR2(4000)      NOT NULL
    , WRITER    NUMBER       REFERENCES MEMBER (MEM_NO) ON DELETE CASCADE
);

INSERT INTO BOARD(B_NO, TITLE, CONTENT, WRITER)
VALUES(1 , '���񤻤�' , '���뤻����', 3)
;

INSERT INTO MEMBER(MEM_NO, ID, PWD, NICK)
VALUES(3, 'USER03' , '1234', 'NICK03')
;

DELETE MEMBER WHERE MEM_NO = 3
;
DROP TABLE MEMBER;