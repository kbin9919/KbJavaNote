/*
���� 1: Employees ���̺� ����
���� �䱸 ���׿� �´� ���̺��� �����ϼ���:

���̺� �̸�: Employees
�÷�:
EmployeeID (���� ����, ��Ű)
FirstName (���ڿ� ����)
LastName (���ڿ� ����)
DepartmentID (���� ����)
HireDate (��¥ ����)
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    DepartmentID NUMBER,
    HireDate DATE
);
/*
���� 2: Products ���̺� ����
���� �䱸 ���׿� �´� ���̺��� �����ϼ���:

���̺� �̸�: Products
�÷�:
ProductID (���� ����, ��Ű)
ProductName (���ڿ� ����)
Price (���� ����)
QuantityInStock (���� ����)
*/
CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price NUMBER,
    QuantityInStock NUMBER
);
/*
���� 3: Orders ���̺� ����
���� �䱸 ���׿� �´� ���̺��� �����ϼ���:

���̺� �̸�: Orders
�÷�:
OrderID (���� ����, ��Ű)
CustomerID (���� ����)
OrderDate (��¥ ����)
TotalAmount (���� ����)
*/
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE,
    TotalAmount NUMBER
);
/*
���� 4: Employees ���̺� ����
���� �䱸 ���׿� �´� ���̺��� �����ϼ���:

���̺� �̸�: Employees
�÷�:
EmployeeID (���� ����, ��Ű)
FirstName (���ڿ� ����)
LastName (���ڿ� ����)
DepartmentID (���� ����, �ܷ� Ű)
HireDate (��¥ ����)
���� ����:
EmployeeID �÷��� ��Ű�� ����
DepartmentID �÷����� Employees ���̺��� DepartmentID �÷��� �����ϴ� �ܷ� Ű ���� ���� �߰�
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    DepartmentID NUMBER,
    HireDate DATE,
    CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
/*
���� 5: Employees ���̺� ����
���� �䱸 ���׿� �´� ���̺��� �����ϼ���:

���̺� �̸�: Employees
�÷�:
EmployeeID (���� ����, ��Ű, NOT NULL)
FirstName (���ڿ� ����, NOT NULL)
LastName (���ڿ� ����, NOT NULL)
DepartmentID (���� ����)
HireDate (��¥ ����)
���� ����:
EmployeeID �÷��� ��Ű�� ����
FirstName, LastName �÷����� NOT NULL ���� ���� �߰�
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY NOT NULL,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DepartmentID NUMBER,
    HireDate DATE
);