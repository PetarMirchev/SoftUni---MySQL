


USE gringotts;

/*          01. Records’ Count                    ****************************************************************************************************************/
/* send the total count of records */
 SELECT COUNT(*) AS count FROM wizzard_deposits;

 SELECT COUNT(id) AS count FROM wizzard_deposits;





/*     02. Longest Magic Wand           ******************************************************************************************************************/
/* Select the size of the longest magic wand.  */
SELECT MAX(magic_wand_size) AS longest_magic_wand FROM wizzard_deposits;





/*        03. Longest Magic Wand per Deposit Groups                *****************************************************************************************************************/
/* For wizards in each deposit group show the longest magic wand. 
Sort result by longest magic wand for each deposit group in increasing order, 
then by deposit_group alphabetically.  */

SELECT deposit_group, MAX(magic_wand_size) AS longest_magic_wand
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand, deposit_group;







/*        04. Smallest Deposit Group per Magic Wand Size         ****************************************************************************************************/
/* Select the deposit group with the lowest average wand size. */

SELECT deposit_group FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size) ASC
LIMIT 1;








/*     05. Deposits Sum         **************************************************************************************************************/

SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;




/*    06. Deposits Sum for Ollivander Family           *****************************************************************************************************************/
/* Select all deposit groups and its total deposit sum but only for the wizards who has their 
magic wand crafted by Ollivander family. Sort result by deposit_group alphabetically. */
SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;








/*     07. Deposits Filter         ***************************************************************************************************************************************/
/* Select all deposit groups and its total deposit sum but only for the wizards who has their magic wand crafted by Ollivander family. 
After this, filter total deposit sums lower than 150000. Order by total deposit sum in descending order. */
SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;









/*    08. Deposit Charge         ************************************************************************************************************************************************/

SELECT deposit_group, magic_wand_creator,
MIN(deposit_charge) AS min_deposit_charge
FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;







/*    09. Age Groups          ***************************************************************************************************************************************************************/

SELECT 
	CASE 
		WHEN age <= 10 THEN '[0-10]'
		WHEN age <= 20 THEN '[11-20]'
		WHEN age <= 30 THEN '[21-30]'
		WHEN age <= 40 THEN '[31-40]'
		WHEN age <= 50 THEN '[41-50]'
		WHEN age <= 60 THEN '[51-60]'
		WHEN age > 60 THEN '[61+]'
	END AS age_group,
COUNT(*) AS wizard_count
FROM wizzard_deposits
GROUP BY age_group
ORDER BY wizard_count;








/*  10. First Letter         **********************************************************************************************************************************************/
/* returns all unique wizard first letters of their first names only if they have deposit of type Troll Chest. 
Order them alphabetically. Use GROUP BY for uniqueness.  */

SELECT LEFT(first_name, 1) AS first_letter
FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;









/*  11. Average Interest  		 *********************************************************************************************************************************************************/

SELECT deposit_group, is_deposit_expired,
AVG(deposit_interest) AS average_interest
FROM wizzard_deposits
WHERE deposit_start_date > '1985-01-01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;








/*     12. Employees Minimum Salaries   	 *******************************************************************************************************************************************************/
/* Select the minimum salary from the employees for departments with ID (2,5,7) 
but only for those who are hired after 01/01/2000. 
Sort result by department_id in ascending order. 	*/
SELECT department_id, MIN(salary) AS minimum_salary FROM employees
WHERE hire_date > '2000-01-01'
GROUP BY department_id
HAVING department_id IN (2, 5, 7)
ORDER BY department_id;






/*      13. Employees Average Salaries          ********************************************************************************************************************************************************/
/* Select all high paid employees who earn more than 30000 into a new table. 
Then delete all high paid employees who have manager_id = 42 from the new table. 
Then increase the salaries of all high paid employees with department_id = 1 with 5000 in the new table. 
Finally, select the average salaries in each department from the new table. Sort result by department_id in increasing order. */

CREATE TABLE high_paid_employees
SELECT * FROM employees
WHERE salary > 30000;

DELETE FROM high_paid_employees WHERE manager_id = 42;

UPDATE high_paid_employees SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, AVG(salary) AS avg_salary 
FROM high_paid_employees
GROUP BY department_id
ORDER BY department_id;







/*  14. Employees Maximum Salaries         *******************************************************************************************************************************************************************/
/* Find the max salary for each department. 
Filter those which have max salaries not in the range 30000 and 70000. 
Sort result by department_id in increasing order. */

SELECT department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id
HAVING max_salary NOT BETWEEN 30000 AND 70000
ORDER BY department_id;





/*    15. Employees Count Salaries             ********************************************************************************************************************************************************************/
/* Count the salaries of all employees who don't have a manager. */
SELECT COUNT(*) FROM employees 
WHERE manager_id IS NULL;


                   

/*   16. 3rd Highest Salary            **********************************************************************************************************************************************************************************/
/* Find the third highest salary in each department if there is such. Sort result by department_id in increasing order. */

SELECT DISTINCT department_id, (
					SELECT DISTINCT salary FROM employees e2
					WHERE e2.department_id = e1.department_id
					ORDER BY salary DESC
					LIMIT 1 OFFSET 2
				) AS 'third_highest_salary'
FROM employees e1
HAVING `third_highest_salary` IS NOT NULL
ORDER BY department_id;








/*   17. Salary Challenge      ********************************************************************************************************************************************************************************/
/* for all employees who have salary higher than the average salary of their respective departments. 
Select only the first 10 rows. Order by department_id, employee_id. */

SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department_id
) d ON e.department_id = d.department_id
WHERE e.salary > d.avg_dept_salary
ORDER BY e.department_id, e.employee_id
LIMIT 10;







/*    18. Departments Total Salaries          ****************************************************************************************************************************************************************************/
/* shows the total sum of salaries for each department. Order by department_id.  */
SELECT department_id, SUM(salary) AS total_salary FROM employees
GROUP BY department_id
ORDER BY department_id;




