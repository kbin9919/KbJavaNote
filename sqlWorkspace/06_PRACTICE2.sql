/*
INSERT ���� ����:
�־��� Employees ���̺� ���ο� ���� ������ �߰��մϴ�.

Employees ���̺��� ������ ���� �÷��� �ֽ��ϴ�: EmployeeID, FirstName, LastName, DepartmentID, HireDate
���ο� ���� ������ �߰��մϴ�.
*/
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate)
VALUES (101, 'John', 'Doe', 1001, TO_DATE('2024-03-30', 'YYYY-MM-DD'));
/*
UPDATE ���� ����:
�־��� Employees ���̺��� ���� ������ ������Ʈ�մϴ�.

Employees ���̺��� ������ ���� �÷��� �ֽ��ϴ�: EmployeeID, FirstName, LastName, DepartmentID, HireDate
EmployeeID�� 101�� ������ �μ� ��ȣ�� 1002�� �����մϴ�.
*/
UPDATE Employees
SET DepartmentID = 1002
WHERE EmployeeID = 101;
/*
DELETE ���� ����:
�־��� Employees ���̺��� ���� ������ �����մϴ�.

Employees ���̺��� ������ ���� �÷��� �ֽ��ϴ�: EmployeeID, FirstName, LastName, DepartmentID, HireDate
EmployeeID�� 101�� ������ ������ �����մϴ�.
*/
DELETE FROM Employees
WHERE EmployeeID = 101;