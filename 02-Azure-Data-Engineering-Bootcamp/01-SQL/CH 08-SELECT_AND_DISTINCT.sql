-----------------------------------------------------SELECT AND DISTINCT--------------------------------------------------------------------------------
/*
	SELECT	 ----->	It helps in fetching all the records from the database table.

	DISTINCT -----> It helps in fetching all the unique records from the database table.
*/
---------------------------------------------------Coding Interview Questions---------------------------------------------------------------------------
---1.	Write a SQL query to retrieve all columns and records from the Employees table
SELECT * FROM Employees
---2.	Write a SQL query to display only emp_name, department, salary, and city from the Employees table
SELECT emp_name,department,salary,city FROM Employees
---3.	Write a SQL query to display all unique department names from the Employees table without duplicate values
SELECT DISTINCT department AS Unique_department_names FROM Employees
---4.	Write a SQL query to display all distinct cities from the Employees table
SELECT DISTINCT city AS Unique_cities FROM Employees
---5.	Write a SQL query to retrieve unique combinations of department and city from the Employees table
SELECT DISTINCT department,city FROM Employees
---6.	Write a SQL query to display unique combinations of payment_mode and payment_status from the Payments1 table
SELECT DISTINCT payment_mode, payment_status FROM Payments1
---7.	Write a SQL query to retrieve all unique city names from the Customers table
SELECT DISTINCT city AS Unique_city FROM customers
---8.	The HR department wants to identify all departments currently represented in the employee database. Write a SQL query to retrieve the unique department names from the Employees table.
SELECT DISTINCT department AS Unique_departments FROM Employees
---9.	The business team wants to identify all product categories available in its product catalog. Write a SQL query to display unique product categories from the Products table.
SELECT DISTINCT category AS Unique_categories FROM products
---10.	The sales team wants to identify all customers who have placed orders.Write a SQL query to retrieve unique customer_id values from the Orders table
SELECT DISTINCT customer_id AS Unique_customer_id FROM orders