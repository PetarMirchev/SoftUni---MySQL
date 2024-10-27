USE soft_uni;



/*         01. Find Names of All Employees by First Name        ************************************************************************************/
/* find first and last names of all employees whose first name starts with "Sa" (case insensitively). Order the information by id.  */ 

SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'Sa%'    /* starts with "Sa" */
ORDER BY employee_id;





/*      02. Find Names of All Employees by Last Name     ******************************************************************************************************************************/      

SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%ei%'   /* last name contains "ei"  */
ORDER BY employee_id;





/*     03. Find First Names of All Employess        ******************************************************************************************************************************/

SELECT first_name FROM employees
WHERE department_id IN (3,10) AND  
	YEAR(hire_date)  BETWEEN 1995 and 2005   /* departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusively. */
ORDER BY employee_id;





/*        04. Find All Employees Except Engineers       ********************************************************************************************************************************************/

SELECT first_name, last_name FROM  employees
WHERE job_title NOT LIKE '%engineer%' /* job titles does not contain "engineer".  */
ORDER BY employee_id;






/*      05. Find Towns with Name Length     ******************************************************************************************************************************************************************************/

SELECT name FROM towns
WHERE LENGTH(name) IN (5,6)  /*find town names that are 5 or 6 symbols long */
ORDER BY name;  /* order them alphabetically by town name */



/*      06. Find Towns Starting With     *********************************************************************************************************************/

SELECT town_id, name FROM towns
WHERE name LIKE 'M%' OR name LIKE 'K%' OR name LIKE 'B%' OR name LIKE 'E%' 		/* towns that start with letters M, K, B or E (case insensitively).  */
ORDER BY name; 			/* Order them alphabetically by town name. */


SELECT town_id, name FROM towns
WHERE LEFT(name, 1) IN ('M', 'K', 'B', 'E') 		/* towns that start with letters M, K, B or E (case insensitively).  */
ORDER BY name; 	/* Order them alphabetically by town name. */






/*     07. Find Towns Not Starting With    ***********************************************************************************************************************************************************************************************/

SELECT town_id, name FROM towns
WHERE NOT (name LIKE 'R%' OR name LIKE 'B%' OR name LIKE 'D%') 		/* find all towns that do not start with letters R, B or D (case insensitively).  */
ORDER BY name; 			/* Order them alphabetically by town name. */





/*      08. Create View Employees Hired After    ***************************************************************************************************************************************************************************************/

CREATE or REPLACE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name FROM employees
WHERE YEAR(hire_date) > '2000-12-31';    /* all employees hired after 2000 year. */

SELECT * FROM v_employees_hired_after_2000;





/*       09. Length of Last Name    ****************************************************************************************************************************************/


SELECT first_name, last_name FROM employees
WHERE LENGTH(last_name) = (5);  /* all employees whose last name is exactly 5 characters long. */





/* 		 10. Countries Holding 'A'  			************************************************************************************************************************/
/* Find all countries that hold the letter 'A' in their name at least 3 times (case insensitively), 
sorted by ISO code. Display the country name and the ISO code. */

SELECT country_name, iso_code FROM countries
WHERE country_name LIKE '%A%A%A%'  /* that hold the letter 'A' in their name at least 3 times (case insensitively)  */
ORDER BY iso_code;






/*      11. Mix of Peak and River Names                 *****************************************************************************************************************************/
/* Combine all peak names with all river names, so that the last letter of each peak name is the 
same as the first letter of its corresponding river name. Display the peak name, the river name, 
and the obtained mix(converted to lower case). Sort the results by the obtained mix alphabetically. */

SELECT peak_name, river_name,
LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2) ) ) as mix
FROM peaks, rivers
WHERE RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY mix;

SELECT p.peak_name, r.river_name, 
LOWER(CONCAT(p.peak_name, SUBSTRING(r.river_name, 2) ) ) AS mix
FROM peaks p
JOIN rivers r ON RIGHT(p.peak_name, 1) = LEFT(r.river_name, 1)
ORDER BY mix;








/*       12. Games From 2011 and 2012 Year                ***************************************************************************************************************************************/
/* Find the top 50 games ordered by start date, then by name. 
Display only the games from the years 2011 and 2012. Display the start date in the format "YYYY-MM-DD" */

SELECT name, DATE_FORMAT(start, '%Y-%m-%d') AS start FROM games
WHERE EXTRACT(YEAR FROM start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;

SELECT name, DATE_FORMAT(start, '%Y-%m-%d') AS start FROM games
WHERE YEAR(start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;





/*       13. User Email Providers               *******************************************************************************************************************************************/

SELECT user_name, SUBSTRING(email, LOCATE('@', email) +1 ) AS `email provider` 
FROM users
ORDER BY `email provider`, user_name;


SELECT user_name, SUBSTRING_INDEX(email, '@', -1) AS email_provider
FROM users
ORDER BY email_provider, user_name;



/*       14. Get Users with IP Address Like Pattern            ****************************************************************************************************************************************************/
/* Find the user_name and the ip_address for each user, sorted by user_name alphabetically. 
Display only the rows, where the ip_address matches the pattern: "___.1%.%.___".  */

SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;




/*         15. Show All Games with Duration     *******************************************************************************************************************************************************/

SELECT name,
    CASE
        WHEN HOUR(`start`) >= 0 AND HOUR(`start`) < 12 THEN 'Morning'
        WHEN HOUR(`start`) >= 12 AND HOUR(`start`) < 18 THEN 'Afternoon'
        WHEN HOUR(`start`) >= 18 AND HOUR(`start`) < 24 THEN 'Evening'
    END AS 'Parts of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration > 3 AND duration <= 6 THEN 'Short'
        WHEN duration > 6 AND duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM games;


SELECT name,
    CASE
        WHEN HOUR(`start`) < 12 THEN 'Morning'
        WHEN HOUR(`start`) < 18 THEN 'Afternoon'
        WHEN HOUR(`start`) < 24 THEN 'Evening'
    END AS 'Parts of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration > 3 AND duration <= 6 THEN 'Short'
        WHEN duration > 6 AND duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM games;






/*       16. Orders Table              **************************************************************************************************************************************************************************/
/* Find all games with their corresponding part of the day and duration. Parts of the day should be Morning 
(start time is >= 0 and < 12), Afternoon (start time is >= 12 and < 18), Evening (start time is >= 18 and < 24). 
Duration should be Extra Short (smaller or equal to 3), Short (between 3 and 6 including), 
Long (between 6 and 10 including) and Extra Long in any other cases or without duration.  */

SELECT product_name, order_date,
	DATE_ADD(order_date, INTERVAL 3 DAY) AS pay_due,
	DATE_ADD(order_date, INTERVAL 1 MONTH) AS deliver_due
FROM orders;




           
