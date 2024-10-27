
USE soft_uni;

/*******  01. Find All Information About Departments   ***************************************************************************************/

SELECT * FROM departments
ORDER BY department_id;




/**** 02. Find all Department Names  *************************************/

SELECT name FROM departments
ORDER BY department_id;




/***** 03. Find Salary of Each Employee  *********************************************/

SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id;




/****  04. Find Full Name of Each Employee   ***************************************/

SELECT first_name, middle_name, last_name FROM employees
ORDER BY employee_id;




/*****  05. Find Email Address of Each Employee   *******************************/
/* Guy.Gilbert@softuni.bg   */
SELECT CONCAT(first_name, '.' , last_name, '@softuni.bg') AS `full_email_address`
FROM employees;




/* 06. Find All Different Employee’s Salaries   ************************************/

SELECT DISTINCT salary FROM employees;
-- DISTINCT  --- show only the unic values! /cut repeat data/




/*    07. Find all Information About Employees           ********************************************************************/

SELECT employee_id AS id, first_name AS `First Name`,
last_name AS `Last Name`, middle_name AS `Middle Name`,
job_title AS `Job Title`, department_id AS `Dept ID`,
manager_id AS `Mngr ID`, hire_date AS `Hire Date`,
salary AS `salary`, address_id AS `address_id`
FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY id; -- same as --> ORDER BY id employee_id




/*   08. Find Names of All Employees by Salary in Range      **********************************************************************************************/

SELECT first_name, last_name, job_title FROM employees
WHERE salary >= 20000 AND salary <= 30000 
/* WHERE salary BETWEEN 20000 AND 30000  */
ORDER BY employee_id;




/*    9. Find Names of All Employees        *************************************************************************************************************************/

/* !!!  SELECT CONCAT_WS(' ', first_name, middle_name, last_name)  <---same as---> SELECT CONCAT(first_name, ' ', middle_name, ' ', last_name)  */
SELECT CONCAT(first_name, ' ', middle_name, ' ', last_name)
FROM employees
/* all employees whose salary is 25000, 14000, 12500 or 23600  */
WHERE salary IN (25000, 14000, 12500, 23600);
/* WHERE salary = 25000 OR  salary = 14000 OR salary =  12500 OR salary =  23600) */





/*    10. Find All Employees Without Manager        *************************************************************************************************************************/

SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

/* !! special example - for extra filter rull 
SELECT first_name, last_name, salary FROM employees
WHERE salary IS (12500, 43500) AND department_id BETWEEN 1 and 4;
*/




/*   11. Find All Employees with Salary More Than   ***********************************************************************************************************************************/

SELECT first_name, last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;





/*   12. Find 5 Best Paid Employees      ***********************************************************************************************************************************/

SELECT first_name, last_name FROM employees
ORDER BY salary DESC 
LIMIT 5;  /* 5 best paid Employees  */

/*
LIMIT 5 OFFSET 1  --> top 5 but skip first 1 record






/*   13. Find All Employees Except Marketing        **********************************************************************************************************************/

SELECT first_name, last_name FROM employees
WHERE department_id != 4;  -- all employees whose department ID is different from 4





/*    14. Sort Employees Table        ***********************************************************************************************************************************************************/

SELECT employee_id AS id, first_name AS `First Name`,
last_name AS `Last Name`, middle_name AS `Middle Name`,
job_title AS `Job Title`, department_id AS `Dept ID`,
manager_id AS `Mngr ID`, hire_date AS `Hire Date`,
salary AS `salary`, address_id AS `address_id`
FROM employees
ORDER BY salary DESC, first_name, last_name DESC, middle_name;






/*    15. Create View Employees with Salaries    ****************************************************************************************************************************************************************************/

-- create VIEW
CREATE VIEW v_employees_salaries AS 
SELECT first_name, last_name, salary FROM employees;

/*
-- call the VIEW to run & create temporary table to be used 
SELECT * FROM v_employees_salariesl
*/





/*   16. Create View Employees with Job Titles    *****************************************************************************************************************/

CREATE VIEW v_employees_job_titles AS
SELECT CONCAT_WS(' ', first_name, middle_name, last_name) AS full_name, job_title
/* SELECT CONCAT(first_name, ' ', IFNULL(CONCAT( middle_name, ' '), ''), last_name) AS 'full_name', job_title  */
FROM employees; 





/*  17. Distinct Job Titles   *************************************************************************************************************************************************************/
/* find all distinct job titles. Sort the result by job title alphabetically  */
SELECT DISTINCT job_title FROM employees
ORDER BY job_title ASC;







/*   18. Find First 10 Started Projects   **************************************************************************************************************************************************************/
/* first 10 started projects. Select all information about them and sort them by start date, then by name. Sort the information by id.   */
SELECT * FROM projects
ORDER BY start_date, name, project_id
LIMIT 10;







/* 19. Last 7 Hired Employees **********************************************************************************************************************************************************************************/
/* find last 7 hired employees. Select their first, last name and their hire date.  */
SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC
LIMIT 7;





/*   20. Increase Salaries  ***********************************************************************************************************************************************************************************************/
/* ncrease salaries of all employees that are in the Engineering, Tool Design, Marketing or Information Services department by 12%. */ 


UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1, 2, 4, 11);

SELECT salary FROM employees;







/*       21. All Mountain Peaks    **************************************************************************************************************************************************************************************************/
SELECT peak_name FROM peaks
ORDER BY peak_name ASC;



/*   22. Biggest Countries by Population  *************************************************************************************************************************************************/
SELECT country_name, population
FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC, country_name
LIMIT 30;





/*  23. Countries and Currency (Euro / Not Euro)   ****************************************************************************************************************************************/

SELECT country_name, country_code, IF (currency_code = 'EUR', 'Euro', 'Not Euro')
AS 'currency'  FROM countries
ORDER BY country_name;





/*        24. All Diablo Characters       ************************************************************************************************************************/
SELECT `name` FROM `characters`
ORDER BY `name`;





