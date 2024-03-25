-- DML (INSERT, UPDATE, DELECT)
/*
    <DML(Data Manipulation Language)>
        ������ ���� ���� ���̺� ���� ����(INSERT)�ϰų�, ����(UPDATE), ����(DELETE)�ϴ� �����̴�.
    
    <INSERT>
        ���̺� ���ο� ���� �߰��ϴ� �����̴�.
        
        [����]
            1) INSERT INTO ���̺�� VALUES(��, ��, ��, ..., ��);
                ���̺� ��� Į���� ���� INSERT �ϰ��� �� �� ����Ѵ�.
                Į�� ������ ���Ѽ� VALUES�� ���� �����ؾ� �Ѵ�.
            2) INSERT INTO ���̺��(Į����, Į����, ..., Į����) VALUES(��, ��, ..., ��);
                ���̺� ���� ������ Į���� ���� ���� INSERT �ϰ��� �� �� ����Ѵ�.
                ������ �ȵ� Į������ �⺻������ NULL ���� ����. (NOT NULL ���������� �ɷ��ִ� Į���� �ݵ�� �����ؼ� ���� �����ؾ� �Ѵ�.)
                ��, �⺻��(DEFAULT)�� �����Ǿ� ������ NULL�� �ƴ� �⺻���� ����.
            3) INSERT INTO ���̺�� (��������);
                VALUES�� ����ؼ� ���� ������ ��ȸ�� ������� ��ä�� INSERT �Ѵ�.(��, �������� INSERT ��ų �� �ִ�.)
                ���� ������ ������� INSERT ���� ������ Į���� ������ ������ Ÿ���� ���ƾ� �Ѵ�.
*/
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES (101, 'John', 'Doe', 10, 50000);
/*
    <INSERT ALL>
        �� �� �̻��� ���̺� INSERT �ϴµ� ������ ���� ������ ���Ǵ� ���
        INSERT ALL�� �̿��ؼ� ���� ���̺� �� ���� ������ ������ �����ϴ�.
        
        [����]
            1) INSERT ALL
               INTO ���̺��1[(Į��, Į��, ...)] VALUES(��, ��, ...)
               INTO ���̺��2[(Į��, Į��, Į��, ...)] VALUES(��, ��, ��, ...)
               ���� ����;
               
            2) INSERT ALL
               WHEN ����1 THEN 
                   INTO ���̺��1[(Į��, Į��, ...)] VALUES(��, ��, ...)
               WHEN ����2 THEN     
                   INTO ���̺��2[(Į��, Į��, ...)] VALUES(��, ��, ...)
               ���� ����;
*/
INSERT ALL
  INTO employees (employee_id, first_name, last_name) VALUES (101, 'John', 'Doe')
  INTO departments (department_id, department_name) VALUES (10, 'Engineering')
SELECT * FROM dual;

/*
    <UPDATE>
        ���̺� ��ϵ� �����͸� �����ϴ� �����̴�.
         
        [����]
            UPDATE ���̺��
            SET Į���� = �����Ϸ��� ��,
                Į���� = �����Ϸ��� ��,
                ...
            [WHERE ����];

            UPDATE ���̺��
            SET Į���� = (���� ����),
                Į���� = (���� ����),
                ...
            [WHERE ����];

        - SET ������ ���� ���� Į���� �޸�(,)�� �����ؼ� ���� ���ÿ� ������ �� �ִ�.
        - WHERE ���� �����ϸ� ��� ���� �����Ͱ� ����ȴ�.
        - UPDATE �ÿ� ���� ������ ����ؼ� ���� ������ ������ ��������� Į���� ���� ������ �� �ִ�.
*/
UPDATE employees
SET salary = 55000
WHERE first_name = 'John' AND last_name = 'Doe';

/*
    <DELETE>
        ���̺� ��� �� �����͸� �����ϴ� �����̴�. (�� ������ �����Ѵ�.)
        
        [����]
            DELETE FROM ���̺��
            [WHERE ���ǽ�];
            
        - WHERE ���� �������� ������ ��ü ���� �����ȴ�.
*/
DELETE FROM employees
WHERE first_name = 'John' AND last_name = 'Doe';
/*
    <TRUNCATE>
        ���̺��� ��ü ���� ������ �� ����ϴ� �������� DELETE ���� ���� �ӵ��� �� ������.
        ������ ���� ���ð� �Ұ����ϰ� ROLLBACK�� �Ұ����ϴ�.
        
        [����]
            TRUNCATE TABLE ���̺��;
*/
TRUNCATE TABLE employees;


