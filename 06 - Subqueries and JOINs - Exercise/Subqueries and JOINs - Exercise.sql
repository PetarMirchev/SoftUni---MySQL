

/*     01. Employee Address                ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	job_title
•	address_id
•	address_text
Return the first 5 rows sorted by address_id in ascending order.  */
USE soft_uni;

SELECT e.employee_id, e.job_title, e.address_id, a.address_text FROM employees e
JOIN addresses a
ON e.address_id = a.address_id
ORDER BY e.address_id
LIMIT 5;






/*     02. Addresses with Towns             ***************************************************************************************************************************************/
/* Write a query that selects:
•	first_name
•	last_name
•	town
•	address_text
Sort the result by first_name in ascending order then by last_name. Select first 5 employees.   */

SELECT e.first_name, e.last_name, t.name, a.address_text FROM employees e
JOIN addresses a
ON e.address_id = a.address_id
JOIN towns t
ON a.town_id = t.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;







/*     03. Sales Employee                ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	first_name
•	last_name
•	department_name
Sort the result by employee_id in descending order. Select only employees from the "Sales" department.	 */ 
 
SELECT employees.employee_id, employees.first_name, employees.last_name, departments.name 
FROM employees
JOIN departments
ON employees.department_id  = departments.department_id 
WHERE departments.name = 'Sales'
ORDER BY employees.employee_id DESC;







/*       04. Employee Departments              ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	first_name
•	salary
•	department_name
Filter only employees with salary higher than 15000. Return the first 5 rows sorted by department_id in descending order. */

SELECT e.employee_id, e.first_name, e.salary, d.name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;





/*       05. Employees Without Project              ***************************************************************************************************************************************/
/*Write a query that selects:
•	employee_id
•	first_name
Filter only employees without a project. Return the first 3 rows sorted by employee_id in descending order.  */

SELECT employees.employee_id, employees.first_name
FROM employees 
LEFT JOIN employees_projects ON employees.employee_id = employees_projects.employee_id
WHERE employees_projects.project_id IS NULL
ORDER BY employees.employee_id DESC
LIMIT 3;





/*       06. Employees Hired After              ***************************************************************************************************************************************/
/* Write a query that selects:
•	first_name
•	last_name
•	hire_date
•	dept_name
Filter only employees hired after 1/1/1999 and from either the "Sales" or the "Finance" departments. 
Sort the result by hire_date (ascending).  */

SELECT e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE DATE (e.hire_date) > '1999-01-01' AND d.name IN ('Sales', 'Finance')
ORDER BY e.hire_date ASC;







/*       07. Employees with Project              ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	first_name
•	project_name
Filter only employees with a project, which has started after 13.08.2002 and it is still ongoing (no end date). 
Return the first 5 rows sorted by first_name then by project_name both in ascending order.  */

SELECT
    e.employee_id,
    e.first_name,
    p.name AS project_name
FROM employees AS e
    JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
    JOIN projects AS p ON ep.project_id = p.project_id
WHERE
    DATE (p.start_date) > '2002-08-13'
    AND p.end_date IS NULL
ORDER BY first_name, project_name
LIMIT 5;






/*      08. Employee 24               ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	first_name
•	project_name
Filter all the projects of employees with id 24. If the project has started after 2005 inclusively the return value should be NULL. 
Sort the result by project_name alphabetically.   */

SELECT e.employee_id, e.first_name,
IF (YEAR (p.start_date) >= 2005, NULL, p.name) AS project_name
FROM employees AS e
JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name;




/*      09. Employee Manager               ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	first_name
•	manager_id
•	manager_name
Filter all employees with a manager who has id equal to 3 or 7. Return all rows sorted by employee first_name in ascending order.  */

SELECT e.employee_id, e.first_name, 
e2.employee_id AS manager_id,
e2.first_name AS manager_name
FROM employees e
JOIN employees e2 ON e.manager_id = e2.employee_id
WHERE e.manager_id IN (3, 7)
ORDER BY e.first_name;





/*        10. Employee Summary             ***************************************************************************************************************************************/
/* Write a query that selects:
•	employee_id
•	employee_name
•	manager_name		
•	department_name
Show the first 5 employees (only for employees who have a manager) with their managers and the departments they are 
in (show the departments of the employees). Order by employee_id.   */

SELECT e.employee_id,
CONCAT_WS (' ', e.first_name, e.last_name) employee_name,
CONCAT_WS (' ', e2.first_name, e2.last_name) manager_name,
d.name department_name
FROM employees e
JOIN employees e2 ON e.manager_id = e2.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY employee_id
LIMIT 5;






/*    11. Min Average Salary                 ***************************************************************************************************************************************/
/* Write a query that returns the value of the lowest average salary of all departments. */
SELECT AVG(salary) as min_average_salary FROM employees e
GROUP BY e.department_id
ORDER BY min_average_salary
LIMIT 1;




/*      12. Highest Peaks in Bulgaria               ***************************************************************************************************************************************/
/* Write a query that selects:
•	country_code	
•	mountain_range
•	peak_name
•	elevation
Filter all peaks in Bulgaria with elevation over 2835. Return all rows sorted by elevation in descending order.  */

SELECT c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM countries c
    JOIN mountains_countries mc ON c.country_code = mc.country_code
    JOIN mountains m ON mc.mountain_id = m.id
    JOIN peaks p ON m.id = p.mountain_id
WHERE c.country_code = 'BG' AND p.elevation > 2836
ORDER BY elevation DESC;





/*       13. Count Mountain Ranges              ***************************************************************************************************************************************/
/* Write a query that selects:
•	country_code
•	mountain_range
Filter the count of the mountain ranges in the United States, Russia and Bulgaria. Sort result by mountain_range count in decreasing order.  */

SELECT c.country_code,
COUNT(m.mountain_range) mountain_range
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON mc.mountain_id = m.id
GROUP BY country_code
HAVING c.country_code IN ('BG', 'US', 'RU')
ORDER BY mountain_range DESC;





/*       14. Countries with Rivers              ***************************************************************************************************************************************/
/* Write a query that selects:
•	country_name
•	river_name
Find the first 5 countries with or without rivers in Africa. Sort them by country_name in ascending order. 			*/

SELECT c.country_name, r.river_name
FROM countries c
LEFT JOIN countries_rivers cr ON c.country_code = cr.country_code
LEFT JOIN rivers r ON cr.river_id = r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;





/*        15. *Continents and Currencies             ***************************************************************************************************************************************/
/* Write a query that selects:
•	continent_code
•	currency_code
•	currency_usage
Find all continents and their most used currency. Filter any currency that is used in only one country. 
Sort the result by continent_code and currency_code. */

SELECT c.continent_code, c.currency_code,
COUNT(*) AS 'currency_usage'
FROM countries c
GROUP BY c.continent_code, c.currency_code
HAVING currency_usage > 1
    AND currency_usage = (
        SELECT COUNT(*) AS 'most_used_curr'
        FROM countries c2
        WHERE c2.continent_code = c.continent_code
        GROUP BY c2.currency_code
        ORDER BY most_used_curr DESC
        LIMIT 1
    )
ORDER BY c.continent_code, c.currency_code;




/*       16. Countries without any Mountains              ***************************************************************************************************************************************/
/* Find the count of all countries which don't have a mountain.	*/
SELECT COUNT(*) country_count
FROM countries c
LEFT JOIN mountains_countries mc ON c.country_code = mc.country_code
LEFT JOIN mountains m ON mc.mountain_id = m.id
WHERE m.id IS NULL;



/*      17. Highest Peak and Longest River by Country               ***************************************************************************************************************************************/
/* For each country, find the elevation of the highest peak and the length of the longest river, 
sorted by the highest peak_elevation (from highest to lowest), then by the longest river_length (from longest to smallest), 
then by country_name (alphabetically). Display NULL when no data is available in some of the columns. Limit only the first 5 rows.  */
SELECT c.country_name,
MAX(p.elevation) AS 'highest_peak_elevation',
MAX(r.length) AS 'longest_river_length'
FROM countries c
LEFT JOIN mountains_countries mc USING (country_code)
LEFT JOIN peaks p USING (mountain_id)
LEFT JOIN countries_rivers cr USING (country_code)
LEFT JOIN rivers r ON cr.river_id = r.id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name
LIMIT 5;



