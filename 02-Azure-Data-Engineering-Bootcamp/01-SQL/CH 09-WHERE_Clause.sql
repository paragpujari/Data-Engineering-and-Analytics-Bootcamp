---------------------------------------------------------------WHERE Clause---------------------------------------------------------------------------------
/*
	WHERE Clause ----->	It is used to fetch all the records from the database table based on some conditions

	Syntax:---

	SELECT col_name FROM table_name WHERE condition;
*/
---------------------------------------------------------------Coding Interview Questions-------------------------------------------------------------------
---1.	Write a SQL query to retrieve all employee details whose salary is greater than ₹100,000
SELECT * FROM Employees WHERE salary > 100000 ORDER BY salary
---2.	 Write a SQL query to retrieve all employees who belong to the IT department
SELECT * FROM Employees WHERE department = 'IT' ORDER BY salary
---3.	Write a SQL query to retrieve customer details for customers who belong to either Delhi, Mumbai, or Bangalore
SELECT * FROM customers WHERE city IN ('Delhi','Mumbai','Bangalore')
---4.	
/*
Write a SQL query to retrieve employees who:
- Belong to the IT department.
- Have a salary greater than ₹120,000.
- Have Active status.
*/
SELECT * FROM Employees WHERE (department = 'IT') AND (salary > 120000) AND (status = 'Active') ORDER BY salary
---5.	Write a SQL query to retrieve employees whose salary is between ₹60,000 and ₹100,000
SELECT * FROM Employees WHERE salary BETWEEN 60000 AND 100000 ORDER BY salary
---6.	Write a SQL query to retrieve employees who belong to IT, HR, or Finance departments but exclude employees from Delhi
SELECT * FROM Employees WHERE department IN ('IT','HR','Finance') AND city <> 'Delhi' ORDER BY city
---7.	Write a SQL query to retrieve all customers whose names start with the letter 'A'
SELECT * FROM customers WHERE customer_name LIKE 'A%' ORDER BY customer_name
---8.	
/*
The finance team wants to identify all successfully completed UPI transactions.

Write a SQL query to retrieve payment details where:
- Payment mode is UPI.
- Payment status is Success.
*/
SELECT * FROM Payments1 WHERE payment_mode = 'UPI' AND payment_status = 'Success'
---9.	
/*
The HR team wants to identify employee records where important information is missing.

Write a SQL query to retrieve employees whose:
- Department is NULL, OR
- Salary is NULL, OR
- Email is NULL.
*/
SELECT * FROM Employees WHERE (department IS NULL) OR (salary IS NULL) OR (email IS NULL)
---10.	
/*
The sales team wants to analyze high-value customer orders.

Write a SQL query to retrieve orders where:
- Order amount is greater than ₹2,000.
- Order date falls between 1 July 2026 and 31 July 2026.
- Exclude orders with negative amounts.
*/
SELECT * FROM orders WHERE (order_amount > 2000) AND (order_date BETWEEN '2026-07-01' AND '2026-07-31') AND (order_amount > 0) ORDER BY order_date