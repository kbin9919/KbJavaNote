-- SEQUENCE


/*
    <SEQUENCE>
        �������� ���������� �����ϴ� ������ �ϴ� ��ü�̴�.
        
    <SEQUENCE ����>
        [����]
            CREATE SEQUNCE ��������
            [START WITH ����]
            [INCREMENT BY ����]
            [MAXVALUE ����]
            [MINVALUE ����]
            [CYCLE | NOCYCLE]
            [CACHE ����Ʈũ�� | NOCACHE]; (�⺻�� 20 ����Ʈ)
            
        [��� ����]
            ��������.CURRVAL : ���� �������� ��
            ��������.NEXTVAL : ������ ���� ������Ű�� ������ ������ ��
                              (���� ������ ������ INCREAMENT �� ��ŭ ������ ��)
                              
        * ĳ�ø޸�
          - �̸� ���� ������ �����ؼ� �����صд�.
          - �Ź� ȣ���� ������ ������ ���� ���� ������ �ϴ� ���� �ƴ� ĳ�� �޸� ������ �̸� ������ ������ ����Ѵ�.
*/



/*
    <SEQUENCE ����>
        [ǥ����]
            ALTER SEQUENCE ��������
            [INCREAMENT BY ����]
            [MAXVALUE ����]
            [MINVALUE ����]
            [CYCLE | NOCYCLE]
            [CACHE ����Ʈũ�� | NOCACHE]; (�⺻�� 20 ����Ʈ)
            
        - START WITH�� ������ �Ұ����ϴ�. ��, �缳���ϰ� �ʹٸ� ������ �������� ���� �� �� �����ؾ� �Ѵ�.
*/

/*
    <SEQUENCE ����>
        DROP SEQUENCE ��������;
*/
-------------------------------------------------------------
DROP SEQUENCE SEQ_MEM_NO;
CREATE SEQUENCE SEQ_MEM_NO NOCACHE NOCYCLE
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    MINVALUE 1;
    
        
SELECT SEQ_MEM_NO.NEXTVAL FROM DUAL;
SELECT SEQ_MEM_NO.CURRVAL FROM DUAL;