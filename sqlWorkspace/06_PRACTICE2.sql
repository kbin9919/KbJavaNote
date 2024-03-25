/*
INSERT 예제 문제:
주어진 Employees 테이블에 새로운 직원 정보를 추가합니다.

Employees 테이블에는 다음과 같은 컬럼이 있습니다: EmployeeID, FirstName, LastName, DepartmentID, HireDate
새로운 직원 정보를 추가합니다.
*/
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate)
VALUES (101, 'John', 'Doe', 1001, TO_DATE('2024-03-30', 'YYYY-MM-DD'));
/*
UPDATE 예제 문제:
주어진 Employees 테이블에서 직원 정보를 업데이트합니다.

Employees 테이블에는 다음과 같은 컬럼이 있습니다: EmployeeID, FirstName, LastName, DepartmentID, HireDate
EmployeeID가 101인 직원의 부서 번호를 1002로 변경합니다.
*/
UPDATE Employees
SET DepartmentID = 1002
WHERE EmployeeID = 101;
/*
DELETE 예제 문제:
주어진 Employees 테이블에서 직원 정보를 삭제합니다.

Employees 테이블에는 다음과 같은 컬럼이 있습니다: EmployeeID, FirstName, LastName, DepartmentID, HireDate
EmployeeID가 101인 직원의 정보를 삭제합니다.
*/
DELETE FROM Employees
WHERE EmployeeID = 101;