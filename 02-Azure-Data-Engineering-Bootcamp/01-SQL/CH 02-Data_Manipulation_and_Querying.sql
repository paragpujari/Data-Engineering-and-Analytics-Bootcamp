---------------------------------------------------------Data Manipulation_and_Querying---------------------------------------------------------------------------------
/*
	Data Manipulation refers to the technique of manipulating with the data in the database table.

	Data Querying refers to the process of querying and retrieving the data from the database table.
*/
---------------------------------------------------------Coding Interview Questions-------------------------------------------------------------------------------------
---1.	Write a SQL query to retrieve all records from the Employees table
SELECT * FROM Employees
---2.	Write a SQL query to display only emp_name, department, and salary from the Employees table
SELECT emp_name,department,salary FROM Employees
---3.	Write a SQL query to retrieve employees whose department is IT
SELECT * FROM Employees WHERE department = 'IT' ORDER BY salary
---4.	Write a SQL query to retrieve employees whose salary is greater than ₹100,000
SELECT * FROM Employees WHERE salary > 100000 ORDER BY salary
---5.	Write a SQL query to retrieve employees who belong to the IT department and have a salary greater than ₹120,000
SELECT * FROM Employees WHERE (department = 'IT') AND (salary > 120000) ORDER BY salary
---6.	Write a SQL query to retrieve employees who belong to either the HR or Finance department
SELECT * FROM Employees WHERE (department = 'HR') OR (department = 'Finance') ORDER BY salary
---7.	Write a SQL query to retrieve employees who are not Active
SELECT * FROM Employees WHERE NOT status = 'Active' ORDER BY salary
---8.	Write a SQL query to retrieve employees working in Delhi, Mumbai, or Bangalore using the IN operator
SELECT * FROM Employees WHERE city IN ('Delhi','Mumbai','Bangalore') ORDER BY salary
---9.	Write a SQL query to retrieve employees whose salary is between ₹50,000 and ₹100,000
SELECT * FROM Employees WHERE salary BETWEEN 50000 AND 100000 ORDER BY salary
---10.	Write a SQL query to retrieve employees whose names start with the letter 'A'
SELECT * FROM Employees WHERE emp_name LIKE 'A%' ORDER BY emp_name
---11.	Write a SQL query to retrieve employees whose names end with the letter 'a'
SELECT * FROM Employees WHERE emp_name LIKE '%a' ORDER BY emp_name
---12.	Write a SQL query to retrieve employees whose names contain the substring 'an'
SELECT * FROM Employees WHERE emp_name LIKE '%an%' ORDER BY emp_name
---13.	Write a SQL query to display all employees ordered by salary in descending order
SELECT * FROM Employees ORDER BY salary DESC
---14.	Write a SQL query to display unique department names from the Employees table
SELECT DISTINCT department AS Unique_department_names FROM Employees
---15.	Write a SQL query to count the total number of employees in each department using GROUP BY
SELECT department,COUNT(1) AS Total_employees FROM Employees GROUP BY department
---16.	Write a SQL query to retrieve employees whose department is IT, salary is greater than ₹100,000, and status is Active
SELECT * FROM Employees WHERE (department = 'IT') AND (salary > 100000) AND (status = 'Active') ORDER BY salary
---17.	Write a SQL query to retrieve employees who belong to IT or HR and have a salary greater than ₹60,000
SELECT * FROM Employees WHERE department IN ('IT','HR') AND salary > 60000 ORDER BY salary
---18.	Write a SQL query to retrieve employees who are not from Delhi or Mumbai
SELECT * FROM Employees WHERE city NOT IN ('Delhi','Mumbai') ORDER BY salary
---19.	Write a SQL query to retrieve employees whose salary is not between ₹50,000 and ₹100,000
SELECT * FROM Employees WHERE salary NOT BETWEEN 50000 AND 100000 ORDER BY salary
---20.	Write a SQL query to retrieve employees whose names contain exactly five characters
SELECT * FROM Employees WHERE emp_name LIKE '_____' ORDER BY salary
---21. (a.)	Write a SQL query to retrieve the customers who have not purchased any order
SELECT c.customer_id,c.customer_name,c.city FROM customers c WHERE NOT EXISTS(SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id) ORDER BY 1
---		(b.) Write a SQL query to retrieve employees whose email addresses end with @gmail.com
SELECT * FROM Employees WHERE email LIKE '%@gmail.com' ORDER BY salary
---		(c.) Write a SQL query to retrieve all the payment records where the status is Success
SELECT * FROM Payments1 WHERE payment_status = 'Success'
---22.	Write a SQL query to retrieve the top five highest-paid employees
SELECT TOP 5 * FROM Employees ORDER BY salary DESC
---23.	Write a SQL query to retrieve employees ordered first by department in ascending order and then by salary in descending order
SELECT * FROM Employees ORDER BY department ASC, salary DESC
---24.	Write a SQL query to find the total salary expenditure for each department
SELECT department,SUM([salary]) AS Total_salary_expenditure FROM Employees GROUP BY department ORDER BY 2 DESC
---25.	Write a SQL query to find the average salary of employees in each department
SELECT department,AVG([salary]) AS Average_salary FROM Employees GROUP BY department ORDER BY 2 DESC
---26.	Write a SQL query to find the minimum and maximum salary in each department
SELECT department,MIN([salary]) AS Minimum_salary, MAX([salary]) AS Maximum_salary FROM Employees  GROUP BY department ORDER BY 2 DESC, 3 DESC
---27.	Write a SQL query to display departments having more than two employees
SELECT department,COUNT(1) AS Total_employees FROM Employees GROUP BY department HAVING COUNT(1) > 2 ORDER BY 2 DESC
---28.	Write a SQL query to display departments whose average salary is greater than ₹100,000 using HAVING
SELECT department,AVG([salary]) AS Average_salary FROM Employees GROUP BY department HAVING AVG([salary]) > 100000 ORDER BY 2 DESC
---29.	Write a SQL query to find the total number of orders placed by each customer
SELECT customer_id,COUNT(1) AS Total_orders FROM orders GROUP BY customer_id ORDER BY 2 DESC
---30.	Write a SQL query to find customers whose total order amount exceeds ₹5,000 using GROUP BY and HAVING
SELECT customer_id,SUM([order_amount]) AS Total_order_amount FROM orders GROUP BY customer_id HAVING SUM([order_amount]) > 5000 ORDER BY 2 DESC
--- (a.) Write a SQL query to find all the orders who have not received the payments
SELECT o.order_id,o.order_date,o.customer_id,o.order_amount FROM orders o WHERE NOT EXISTS (SELECT 1 FROM Payments1 p WHERE p.order_id = o.order_id) ORDER BY 1
---31.	Increase the salary of all IT department employees by 10% using an UPDATE statement
SELECT * FROM Employees WHERE department = 'IT' ORDER BY salary

BEGIN TRANSACTION
	UPDATE x
	SET    x.salary = x.salary * 1.10
	FROM Employees x
	WHERE x.department = 'IT'
COMMIT

SELECT * FROM Employees WHERE department = 'IT' ORDER BY salary
---32.	Update the status of all employees in the HR department to 'Active'
SELECT * FROM Employees WHERE department = 'HR' ORDER BY salary

BEGIN TRANSACTION
UPDATE x 
SET    x.status = 'Active'     
FROM    Employees x 
WHERE x.department = 'HR'
COMMIT

SELECT * FROM Employees WHERE department = 'HR' ORDER BY salary
---33.	Update the city of employee Amit to Hyderabad
SELECT * FROM Employees WHERE emp_name = 'Amit'
BEGIN TRANSACTION
UPDATE x
SET    x.city = 'Hyderabad'
FROM Employees x WHERE x.emp_name = 'Amit'
COMMIT
SELECT * FROM Employees WHERE emp_name = 'Amit'
---(a.)	Update the emp_id of Anisha,Amisha,Anamika to 12,13,14 respectively
SELECT * FROM Employees ORDER BY emp_id
BEGIN TRANSACTION
UPDATE x
SET    x.emp_id = 12
FROM   Employees x WHERE x.emp_name = 'Anisha'

UPDATE x
SET    x.emp_id = 13
FROM   Employees x WHERE x.emp_name = 'Amisha'


UPDATE x
SET    x.emp_id = 14
FROM   Employees x WHERE x.emp_name = 'Anamika'
COMMIT
SELECT * FROM Employees ORDER BY emp_id
---34.	
/*
Insert a new employee into the Employees table with the following details:
- emp_id: 15
- emp_name: Karthik
- department: IT
- salary: 95000
- city: Hyderabad
- Hire_Date: 2026-11-01
- birth_date: 1998-04-15
- email: karthik@example.com
- status: Active
- dept_id: 101
*/
SELECT * FROM Employees ORDER BY emp_id

BEGIN TRANSACTION
    INSERT INTO Employees(
    emp_id                                  ,
    emp_name								,
    department								,
    salary									,
    city									,
    Hire_Date								,
    birth_date								,
    email									,
    status									,
    dept_id		                        	
    )VALUES(		                        
    15				                        ,
    'Karthik'                               ,
    'IT'                                    ,
    95000                                   ,
    'Hyderabad'                             ,
    '2026-11-01'                            ,
    '1998-04-15'                            ,
    'karthik@example.com'                   ,
    'Active'                                ,
    101
    )
COMMIT

SELECT * FROM Employees ORDER BY emp_id
---35.  Delete employees whose status is Inactive and whose department is Marketing
SELECT * FROM Employees ORDER BY emp_id
BEGIN TRANSACTION
DELETE x
FROM Employees x WHERE x.status = 'Inactive' AND x.department = 'Marketing'
ROLLBACK
SELECT * FROM Employees ORDER BY emp_id
---36.  Delete employee records where the department, salary, and email are all NULL
SELECT * FROM Employees ORDER BY emp_id
BEGIN TRANSACTION
DELETE x
FROM Employees x WHERE x.department IS NULL AND x.salary IS NULL AND x.email IS NULL
ROLLBACK 
SELECT * FROM Employees ORDER BY emp_id
---37.  Retrieve customers whose total valid order amount (excluding negative order amounts) is greater than ₹5,000. Display customer ID, total order amount, and order count
SELECT customer_id,SUM(order_amount) AS Total_order_amount, COUNT(1) AS Order_count
FROM orders
WHERE order_amount > 0
GROUP BY customer_id
HAVING SUM(order_amount) > 5000
ORDER BY 2 DESC,3 DESC
---38.  Retrieve payment modes having at least two successful payments from the Payments1 table
SELECT payment_mode,COUNT(1) AS Total_successful_payments
FROM Payments1 
WHERE payment_status = 'Success'
GROUP BY payment_mode
HAVING COUNT(1) >= 2
ORDER BY 2 DESC
---39. Retrieve product categories whose average product price is greater than ₹10,000. Display category, average price, and product count.
SELECT 
category                                                     ,
AVG([price])    AS  Average_price                            ,
COUNT(1)        AS  Product_Count
FROM products
GROUP BY category
HAVING AVG([price]) > 10000
ORDER BY 2 DESC, 3 DESC
---40.  Retrieve monthly sales totals from the Orders table. Exclude negative order amounts and display only months where total sales exceed ₹5,000. Sort the results by monthly sales in descending order
SELECT YEAR(order_date) AS Years, MONTH(order_date) AS Months, SUM(order_amount) AS Total_order_amount
FROM orders 
WHERE order_amount > 0
GROUP BY YEAR(order_date), MONTH(order_date) 
HAVING   SUM(order_amount) > 5000
ORDER BY 3 DESC