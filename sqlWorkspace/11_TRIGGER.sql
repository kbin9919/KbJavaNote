/*
    <TRIGGER>
        ���̺��� INSERT, UPDATE, DELETE �� DML ������ ���ؼ� ����� ���
        �ڵ����� ����� ������ �����س��� ��ü�̴�.
        
        * Ʈ������ ����
          1) SQL ���� ���� �ñ⿡ ���� �з�
            - BEFORE TRIGGER : �ش� SQL ���� ���� ���� Ʈ���Ÿ� �����Ѵ�.
            - AFTER TRIGGER : �ش� SQL ���� ���� �Ŀ� Ʈ���Ÿ� �����Ѵ�.
          
          2) SQL ���� ���� ������ �޴� �࿡ ���� �з�
            - ���� Ʈ���� : �ش� SQL ���� �� ���� Ʈ���Ÿ� �����Ѵ�.
            - �� Ʈ���� : �ش� SQL ���� ������ �޴� �ึ�� Ʈ���Ÿ� �����Ѵ�.
            
        [����]
            CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
            BEFORE|AFTER INSERT|UPDATE|DELETE ON ���̺��
            [FOR EACH ROW]
            DECLARE
                �����
            BEGIN
                �����
            EXCEPTION
                ����ó����
            END;
            /
*/

SELECT * FROM EMPLOYEE;

-- ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_01
AFTER UPDATE ON EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('������Ʈ ����');
END;
/

-- �� Ʈ����
CREATE OR REPLACE TRIGGER TRG_02
AFTER UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('���� �� : ' || :OLD.DEPT_CODE || ', ���� �� : ' || :NEW.DEPT_CODE);
END;
/

UPDATE EMPLOYEE
SET DEPT_CODE = 'D1'
WHERE DEPT_CODE = 'D9';

ROLLBACK;

-------------------------------------
-- ��ǰ �԰�, ��� ���� ����
-- 1. ��ǰ�� ���� �����͸� ������ ���̺�(PRODUCT)
CREATE TABLE PRODUCT (
    PCODE NUMBER PRIMARY KEY,
    PNAME VARCHAR2(30),
    BRAND VARCHAR2(30),
    PRICE NUMBER,
    STOCK NUMBER DEFAULT 0
);

-- ��ǰ�ڵ尡 �ߺ����� �ʰ� ���ο� ��ȣ�� �߻��ϴ� ������ ��ü�� ����
CREATE SEQUENCE SEQ_PCODE;

INSERT INTO PRODUCT VALUES(SEQ_PCODE.NEXTVAL, 'Z�ø�', '�Ｚ', 1500000, DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������13', '����', 1000000, DEFAULT);

SELECT * FROM PRODUCT;

-- 2. ��ǰ ����� �� �̷��� ������ ���̺�(PRODETAIL)
CREATE TABLE PRODETAIL(
    DCODE NUMBER PRIMARY KEY,
    PDATE DATE,
    AMOUNT NUMBER,
    STATUS VARCHAR2(10) CHECK(STATUS IN ('�԰�', '���')),
    PCODE NUMBER,
    FOREIGN KEY(PCODE) REFERENCES PRODUCT
);

CREATE SEQUENCE SEQ_DCODE;

-- 1�� ��ǰ�� ���� ��¥�� 10�� �԰�
INSERT INTO PRODETAIL VALUES(SEQ_DCODE.NEXTVAL, SYSDATE, 10, '�԰�', 1);
-- ��� ������ �����ؾ� �Ѵ�.
UPDATE PRODUCT
SET STOCK = STOCK + 10
WHERE PCODE = 1;

-- 2�� ��ǰ�� ���� ��¥�� 20�� �԰�
INSERT INTO PRODETAIL VALUES(SEQ_DCODE.NEXTVAL, SYSDATE, 20, '�԰�', 2);
-- ��� ������ �����ؾ� �Ѵ�.
UPDATE PRODUCT
SET STOCK = STOCK + 20
WHERE PCODE = 2;

-- 2�� ��ǰ�� ���� ��¥�� 5�� ���
INSERT INTO PRODETAIL VALUES(SEQ_DCODE.NEXTVAL, SYSDATE, 5, '���', 2);
-- ��� ������ �����ؾ� �Ѵ�.
UPDATE PRODUCT
SET STOCK = STOCK - 5
WHERE PCODE = 2;

SELECT * FROM PRODETAIL;

SELECT * FROM PRODUCT;

-- PRODETAIL ���̺� ������ ���� �� PRODUCT ���̺� ��� ������ ������Ʈ �ǵ��� Ʈ���Ÿ� �����Ѵ�.
CREATE OR REPLACE TRIGGER TRG_PRO_STOCK
AFTER INSERT ON PRODETAIL
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.STATUS || ', ' || :NEW.AMOUNT || ', ' || :NEW.PCODE);
    
    -- ��ǰ�� �԰�� ���
    IF(:NEW.STATUS = '�԰�') THEN
        UPDATE PRODUCT
        SET STOCK = STOCK + :NEW.AMOUNT
        WHERE PCODE = :NEW.PCODE;
    END IF;
    
    -- ��ǰ�� ���� ���
    IF(:NEW.STATUS = '���') THEN
        UPDATE PRODUCT
        SET STOCK = STOCK - :NEW.AMOUNT
        WHERE PCODE = :NEW.PCODE;
    END IF;   
END;
/

-- 1�� ��ǰ�� ���� ��¥�� 10�� �԰�
INSERT INTO PRODETAIL VALUES(SEQ_DCODE.NEXTVAL, SYSDATE, 10, '�԰�', 1);

-- 1�� ��ǰ�� ���� ��¥�� 10�� ���
INSERT INTO PRODETAIL VALUES(SEQ_DCODE.NEXTVAL, SYSDATE, 10, '���', 1);

SELECT * FROM PRODETAIL;

SELECT * FROM PRODUCT;

ROLLBACK;