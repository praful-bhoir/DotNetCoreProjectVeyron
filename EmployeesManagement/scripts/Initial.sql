IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'EmployeesManagement')
BEGIN
    CREATE DATABASE EmployeesManagement;
END;

USE EmployeesManagement
GO

/* =========================
   DEPARTMENTS TABLE
========================= */
IF OBJECT_ID('dbo.Departments', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Departments
    (
        DepartmentId INT IDENTITY(1,1) NOT NULL,
        DepartmentCode NVARCHAR(20) NOT NULL,
        DepartmentName NVARCHAR(100) NOT NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

        CONSTRAINT PK_Departments PRIMARY KEY CLUSTERED (DepartmentId),
        CONSTRAINT UQ_Departments_DepartmentCode UNIQUE (DepartmentCode),
        CONSTRAINT UQ_Departments_DepartmentName UNIQUE (DepartmentName)
    );
END;
GO

/* =========================
   SEED DATA (SAFE INSERT)
========================= */

INSERT INTO dbo.Departments (DepartmentName, DepartmentCode)
SELECT 'Human Resources', 'HR'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentCode = 'HR');

INSERT INTO dbo.Departments (DepartmentName, DepartmentCode)
SELECT 'Information Technology', 'IT'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentCode = 'IT');

INSERT INTO dbo.Departments (DepartmentName, DepartmentCode)
SELECT 'Finance', 'FIN'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentCode = 'FIN');

INSERT INTO dbo.Departments (DepartmentName, DepartmentCode)
SELECT 'Sales', 'SAL'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentCode = 'SAL');

INSERT INTO dbo.Departments (DepartmentName, DepartmentCode)
SELECT 'Marketing', 'MKT'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentCode = 'MKT');
GO

IF OBJECT_ID('dbo.Employees', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Employees
    (
        EmployeeId INT IDENTITY(1,1) NOT NULL,
        FirstName NVARCHAR(100) NOT NULL,
        LastName NVARCHAR(100) NOT NULL,
        Email NVARCHAR(255) NULL,
        PhoneNumber NVARCHAR(20) NULL,

        DepartmentId INT NOT NULL, 

        Salary DECIMAL(18,2) NULL,
        HireDate DATE NOT NULL,
        CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

        CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (EmployeeId)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Employees_Departments')
BEGIN
    ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId]) REFERENCES [dbo].[Departments] ([DepartmentId])
    ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
END;
GO


SELECT * FROM dbo.Departments;
SELECT * FROM dbo.Employees;