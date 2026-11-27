--------------------------------------------DDL-------------------------------------------------------------------------------------------------
/*
	1.	DDL ----->	It stands for Data Definition Language. It is used to define and create the data in the database table

	(a.)	CREATE ----->	It is used to create the database table.

	(b.)	ALTER  ----->	It is used to alter or modify the structure of the database table.

	(c.)	DROP   ----->	It is used to delete the entire database table.
*/
------------------------------------------Coding Interview Questions----------------------------------------------------------------------------
---1.	Write a SQL query to create a new table named Employee_Backup with the following columns: emp_id, emp_name, department, and salary
DROP TABLE IF EXISTS Employee_Backup;

CREATE TABLE Employee_Backup(
	emp_id		INT IDENTITY(1,1)			,
	emp_name	VARCHAR(30)					,
	department	VARCHAR(30)					,
	salary		NUMERIC(18,2)

)

SELECT * FROM Employee_Backup

---2.	
/*
Write a SQL query to create a table named Department_Info with the following columns:
- dept_id as INT and Primary Key
- dept_name as VARCHAR(50) and NOT NULL
*/

DROP TABLE IF EXISTS Department_Info;

CREATE TABLE Department_Info(
		dept_id		INT  PRIMARY KEY			,
		dept_name	VARCHAR(5)	NOT NULL
)

SELECT * FROM Department_Info


---3.	Write a SQL query to drop the existing table named Employee_Backup from the database
DROP TABLE Employee_Backup;

---4.   Write a SQL query to add a new column named phone_number of type VARCHAR(15) to the existing Employees table
ALTER TABLE Employees ADD phone_number VARCHAR(15)

SELECT * FROM Employees

---5.	Write a SQL query to modify the data type of the salary column in the Employee_Backups table to DECIMAL(12,2)

DROP TABLE IF EXISTS Employee_Backups;

CREATE TABLE Employee_Backups(
	emp_id		INT IDENTITY(1,1)			,
	emp_name	VARCHAR(30)					,
	department	VARCHAR(30)					,
	email		VARCHAR(30)					,
	salary		NUMERIC(18,2) 

)

SELECT * FROM Employee_Backups

ALTER TABLE Employee_Backups ALTER COLUMN salary DECIMAL(12,2)

---6.	Write a SQL query to rename the column email to employee_email in the Employee_Backups table

EXEC sp_rename 'Employee_Backups.email','employee_email','COLUMN'

SELECT * FROM Employee_Backups

---7. Write a SQL query to add a UNIQUE constraint to the employee_email column of the Employee_Backups table

SELECT * FROM Employee_Backups

/*--------Adding a unique constraint on Employee_email column of Employees_Backups table------------------*/

ALTER TABLE Employee_Backups ADD CONSTRAINT UIX_Employee_Backups_employee_email UNIQUE(employee_email)


SELECT * FROM Employee_Backups

---8.	
/*
The HR department wants to maintain employee joining information. Write SQL queries to:
- Add a column named joining_bonus with DECIMAL(10,2) data type.
- Add a column named employment_type with VARCHAR(30) data type.
- Set the default value of employment_type to 'Full-Time'.
*/

---Add a column named joining_bonus with DECIMAL(10,2) data type
ALTER TABLE Employee_Backups ADD joining_bonus DECIMAL(10,2)
---Add a column named employment_type with VARCHAR(30) data type
ALTER TABLE Employee_Backups ADD employment_type VARCHAR(30)
---Set the default value of employment_type to 'Full-Time'
ALTER TABLE Employee_Backups ADD CONSTRAINT DF_Employee_Backups_employment_type DEFAULT 'Full-Time' FOR employment_type


SELECT * FROM Employee_Backups

---9.
/*
The company wants to restructure its department information. Write SQL queries to:
- Rename the Department_Info table to Company_Departments.
- Add a column named location with VARCHAR(100) data type.
- Modify the dept_name column to VARCHAR(190).
*/

SELECT * FROM Department_Info
---Rename the Department_Info table to Company_Departments
EXEC sp_rename 'Department_Info','Company_Departments'

SELECT * FROM Company_Departments
---Add a column named location with VARCHAR(100) data type
ALTER TABLE Company_Departments ADD location VARCHAR(100)

---Modify the dept_name column to VARCHAR(190)
ALTER TABLE Company_Departments ALTER COLUMN dept_name VARCHAR(190)

---10.
/*
The company has decided to archive employee records before restructuring its database. Write SQL queries to:
- Create a new table named Employees_Archive using the structure of the existing Employees table.
- Remove the status column from the Employees_Archive table.
- Drop the Employees_Archive table after the archival process is completed.
*/

---Create a new table named Employees_Archive using the structure of the existing Employees table
DROP TABLE IF EXISTS Employees_Archive

CREATE TABLE Employees_Archive(
emp_id			INT		PRIMARY KEY				,
emp_name		VARCHAR(30)						,
department      VARCHAR(30)						,
salary          INT							    ,
city            VARCHAR(30)						,
Hire_Date       DATE							,
birth_date		DATE							,
email			VARCHAR(30)						,		
status          VARCHAR(30)						,	
dept_id         INT								,
phone_number	VARCHAR(30)
)

SELECT * FROM Employees_Archive

---Remove the status column from the Employees_Archive table

ALTER TABLE Employees_Archive DROP COLUMN status

---Drop the Employees_Archive table after the archival process is completed

DROP TABLE Employees_Archive