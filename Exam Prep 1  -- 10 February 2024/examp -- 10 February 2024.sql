


/*  01.	Table Design    ************************************************************************************************************/
CREATE database preserves_db;
USE preserves_db;

-- ok
CREATE TABLE continents (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);

-- ok
CREATE TABLE countries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    continent_id INT NOT NULL,
    FOREIGN KEY (continent_id) REFERENCES continents(id)
);


-- ok
CREATE TABLE preserves (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    area INT,
    type VARCHAR(20),
    established_on DATE
);

-- ok 
CREATE TABLE positions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    description TEXT,
    is_dangerous TINYINT(1) NOT NULL  /* <-- or -->  is_dangerous BOOLEAN NOT NULL */
);

-- ok
CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT,
    personal_number VARCHAR(20) NOT NULL UNIQUE,
    salary DECIMAL(19,2),
    is_armed TINYINT(1) NOT NULL, /* <-- or -->  is_armed BOOLEAN NOT NULL */
    start_date DATE,
    preserve_id INT,
    position_id INT NOT NULL,
    
    
    FOREIGN KEY (preserve_id) REFERENCES preserves(id),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

-- ok 
CREATE TABLE countries_preserves (
    country_id INT NOT NULL,
    preserve_id INT NOT NULL,
    
    -- INDEX (country_id)
    KEY (country_id, preserve_id),   -- !!!!!!!!!!!!!!!!
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (preserve_id) REFERENCES preserves(id)
);





/*  02.	Insert   ******************************************************************************************************************************************************************/



INSERT INTO preserves (name, latitude, longitude, area, type, established_on)
SELECT 
    CONCAT(name, ' is in South Hemisphere'), latitude, longitude, area * id,
    LOWER(type), established_on
FROM preserves
WHERE latitude < 0;






/* 03. Update  ******************************************************************************************************************************************************************************/
/* Due to the dangerous nature of their work, increase the salary of the workers with position_id - 5, 8, 11 and 13 by 500. */

UPDATE workers
SET salary = salary + 500
WHERE position_id IN (5, 8, 11, 13);





/*   04. Delete       *****************************************************************************************************************************************************************************/
/* Delete all preserves, without information about their establishment. */

DELETE FROM preserves
WHERE established_on IS NULL;





/*      05. Most experienced workers      *************************************************************************************************************************************************************************/
/* Extract from the preserves_db database, info about the workers with more than 5 years of experience.
(experience must be calculated from the day the workers started working until 01-01-2024)
Order the results by days_of_experience in descending order and show only the first 10 results.
Required Columns
•	full_name (first_name + " " + last_name)
•	days_of_experience (duration of experience in days)    */

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    DATEDIFF('2024-01-01', start_date) AS days_of_experience
FROM workers
WHERE DATEDIFF('2024-01-01', start_date) > 1825
ORDER BY days_of_experience DESC
LIMIT 10;





/*      06. Workers salarym     ********************************************************************************************************************************************************************************************/
/* Write a query that returns: worker_id, first_name, last_name , preserve name and country_code from table workers. 
Filter only the workers whose salary is higher than 5000 and their age is lower than 50.
Order the results ascending by country_code.
Required Columns
•	id (worker)
•	first_name 
•	last_name
•	preserve_name
•	country_code    			*/

SELECT
    workers.id AS worker_id,
    workers.first_name,
    workers.last_name,
    preserves.name AS preserve_name,
    countries.country_code
FROM workers
JOIN preserves ON workers.preserve_id = preserves.id
JOIN countries_preserves ON countries_preserves.preserve_id = preserves.id   /* missing connection -->  Table: countries_preserves - Columns: country_id int, preserve_id int  */ 
JOIN countries ON countries_preserves.country_id = countries.id
WHERE workers.salary > 5000 AND workers.age < 50
ORDER BY countries.country_code ASC;



/* 		07. Armed workers count		************************************************************************************************************************************************************************************/
/* Write a query that returns: the name of the preserve and the total count of armed workers who worked there.
Order by armed_workers count in descending order, then by preserve name ascending.
Required Columns
•	name (preserve)
•	armed_workers 						*/

SELECT
    preserves.name,
    COUNT(CASE WHEN workers.is_armed = 1 THEN 1 END) AS armed_workers
FROM workers
JOIN preserves ON workers.preserve_id = preserves.id
WHERE workers.is_armed = 1
GROUP BY preserves.name
ORDER BY armed_workers DESC, preserves.name ASC;








/*  08. Oldest preserves   ***************************************************************************************************************/
/* Extract from the preserves_db database, the name, country_code and year of establishment for the five oldest preserves, which are founded in May.
Order the results ascending by established_on.
Required Columns
•	name (preserve)
•	country_code
•	founded_in 					*/

SELECT
    preserves.name,
    countries.country_code,
    YEAR(preserves.established_on) AS founded_in
FROM preserves
JOIN countries_preserves ON preserves.id = countries_preserves.preserve_id
JOIN countries ON countries_preserves.country_id = countries.id
WHERE MONTH(preserves.established_on) = 5
ORDER BY established_on ASC
LIMIT 5;






/*    09. Preserve categories      ******************************************************************************************************************************************************/
/* From the database extract the id, name and category. If the area is equal to or less than 100 the 
user must see "very small", above 100 and equal to or less than 1000 it should display "small", 
above 1000 and equal to or less than 10000 it should display "medium", above 10000 and equal to 
or less than 50000 should display "large" and above 50000 it should display "very large"
Order the results descending by area. 
Required Columns
•	id (preserve)
•	name (preserve)
•	category					*/


SELECT
    preserves.id,
    preserves.name,
    CASE
        WHEN preserves.area <= 100 THEN 'very small'
        WHEN preserves.area <= 1000 THEN 'small'
        WHEN preserves.area <= 10000 THEN 'medium'
        WHEN preserves.area <= 50000 THEN 'large'
        ELSE 'very large'
    END AS category
FROM preserves
ORDER BY preserves.area DESC;








/*  10. Extract average salary   **************************************************************************************************************/
/* Create a user defined function with the name udf_average_salary_by_position_name (name VARCHAR(40)) 
that receives a position name and returns the average amount of salary for this position for all workers who practice it
Required Columns
•	name (position)
•	position_average_salary (average_salary_amount)  			*/

DELIMITER //
CREATE FUNCTION udf_average_salary_by_position_name(name VARCHAR(40))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
	RETURN (
		SELECT AVG(salary) FROM workers
		JOIN positions ON workers.position_id = positions.id
		WHERE positions.name = name
	);
    
END //
DELIMITER ;


SELECT udf_average_salary_by_position_name('Forester');






/* 	11. Improving the standard of living   *************************************************************************************************/
/* Create a stored procedure udp_increase_salaries_by_country which accepts the following parameters:
•	country_name (VARCHAR(40))
Extract data on all workers who work in all preserves of the territory of the given country and increase their salaries by 5%  	*/

DELIMITER //
CREATE PROCEDURE udp_increase_salaries_by_country(IN country_name VARCHAR(40))
BEGIN
    UPDATE workers
    JOIN preserves ON workers.preserve_id = preserves.id
    JOIN countries_preserves ON preserves.id = countries_preserves.preserve_id
    JOIN countries ON countries_preserves.country_id = countries.id
    SET workers.salary = workers.salary * 1.05
    WHERE countries.name = country_name;
END //
DELIMITER ;

CALL udp_increase_salaries_by_country('Germany');
