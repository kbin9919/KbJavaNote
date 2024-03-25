/*
문제 1: Employees 테이블 생성
다음 요구 사항에 맞는 테이블을 생성하세요:

테이블 이름: Employees
컬럼:
EmployeeID (숫자 형식, 주키)
FirstName (문자열 형식)
LastName (문자열 형식)
DepartmentID (숫자 형식)
HireDate (날짜 형식)
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    DepartmentID NUMBER,
    HireDate DATE
);
/*
문제 2: Products 테이블 생성
다음 요구 사항에 맞는 테이블을 생성하세요:

테이블 이름: Products
컬럼:
ProductID (숫자 형식, 주키)
ProductName (문자열 형식)
Price (숫자 형식)
QuantityInStock (숫자 형식)
*/
CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price NUMBER,
    QuantityInStock NUMBER
);
/*
문제 3: Orders 테이블 생성
다음 요구 사항에 맞는 테이블을 생성하세요:

테이블 이름: Orders
컬럼:
OrderID (숫자 형식, 주키)
CustomerID (숫자 형식)
OrderDate (날짜 형식)
TotalAmount (숫자 형식)
*/
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE,
    TotalAmount NUMBER
);
/*
문제 4: Employees 테이블 생성
다음 요구 사항에 맞는 테이블을 생성하세요:

테이블 이름: Employees
컬럼:
EmployeeID (숫자 형식, 주키)
FirstName (문자열 형식)
LastName (문자열 형식)
DepartmentID (숫자 형식, 외래 키)
HireDate (날짜 형식)
제약 조건:
EmployeeID 컬럼을 주키로 지정
DepartmentID 컬럼에는 Employees 테이블의 DepartmentID 컬럼을 참조하는 외래 키 제약 조건 추가
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
문제 5: Employees 테이블 생성
다음 요구 사항에 맞는 테이블을 생성하세요:

테이블 이름: Employees
컬럼:
EmployeeID (숫자 형식, 주키, NOT NULL)
FirstName (문자열 형식, NOT NULL)
LastName (문자열 형식, NOT NULL)
DepartmentID (숫자 형식)
HireDate (날짜 형식)
제약 조건:
EmployeeID 컬럼을 주키로 지정
FirstName, LastName 컬럼에는 NOT NULL 제약 조건 추가
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY NOT NULL,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DepartmentID NUMBER,
    HireDate DATE
);