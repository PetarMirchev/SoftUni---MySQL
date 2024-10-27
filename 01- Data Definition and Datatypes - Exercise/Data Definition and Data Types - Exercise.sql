CREATE DATABASE minions;

USE minions;

/* 1 add table minions (id, name, age). Then add new table towns (town_id, name). 
Set id and town_id columns of both tables to be primary key as constraint, id's must be auto increment.  */

CREATE TABLE minions(
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100),
	age INT
);

CREATE TABLE towns(
town_id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100)
);


//****************************************************************************************************************************/
/* 2   - rename the town_id to id. Change the structure of the Minions table to have new column town_id 
that would be of the same type as the id column of towns table. Add new constraint that makes town_id foreign key and 
references to id column of towns table.   */

ALTER TABLE minions ADD COLUMN town_id int;

ALTER TABLE minions ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);





/* 3   ------------  Insert Records in Both Tables   ****************************************************************************/

INSERT INTO towns(id, name) VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna');

INSERT INTO minions VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2);

SELECT * FROM towns;





/* 4   -------   Delete all the data from the minions table using SQL query.  *************************************************** */

TRUNCATE TABLE minions;  /* alternative to "DELETE FROM minions;" */

SET SQL_SAFE_UPDATES = 0; /* special command to open DB when is used "DELETE FROM minions;" (fix error) */






/* 5   -------   Delete all tables from the minions database using SQL query.   ********************************************** */

DROP TABLE minions, towns;





/* 6  ------    Create Table People  whit columns   *******************************************************************************/

CREATE TABLE people(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(2, 2),
weight DOUBLE(2, 2),
gender CHAR NOT NULL,
birthdate DATE NOT NULL,
biography VARCHAR(247)
);

INSERT INTO people (id, name, gender, birthdate)
VALUES (1, 'test', 'm', NOW()),
	(2, 'test', 'm', NOW()),
	(3, 'test', 'm', NOW()),
	(4, 'test', 'm', NOW()),
	(5, 'test', 'm', NOW()
);

SELECT * FROm people;





/* 7 -----------------	Create Table Users             ********************************************************************  */

CREATE TABLE users (
	id INT NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY (id),
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture TEXT,
    last_login_time DATETIME,
    is_deleted BOOLEAN
);


INSERT INTO users(username, password, profile_picture, last_login_time, is_deleted) 
VALUES('Lili', '1248472', NULL, '2024-09-15 09:55:11', false),
('Mimi', '1248472', NULL, '2024-06-15 08:55:11', false),
('Ana', '1248472', NULL, '2024-07-15 05:55:11', false),
('Pepi', '1558475', NULL, '2024-07-15 10:55:10', false),
('Kiro', '1248472', NULL, '2024-08-15 04:55:11', false);

SELECT * FROM users;





/* *****   8.	Change Primary Key             ******************************************************************************  */
/* First remove current primary key then create new primary key that would be 
combination of fields id and username. The initial primary key name on id is pk_users. */

ALTER TABLE users 
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY(id, username);
/* !!! kogato tarsim po 2- PK se tarsi mnogo po-barzo */




/* *****  9. Set Default Value of a Field             **************************************************************************  */
/* Using SQL queries modify table users. Make the default value of last_login_time field to be the current time.  */

/* I-- whe have the the possibility to chennge COLUMN name (last_login_time --> last_login_time1) */
ALTER TABLE users 
CHANGE COLUMN last_login_time last_login_time1 DATETIME DEFAULT NOW();

/* II-- */
ALTER TABLE users 
MODIFY COLUMN last_login_time DATETIME DEFAULT NOW();




/* *****  10 . Set Unique Field            **********************************************************************************  */
/* Remove username field from the primary key so only the field id would 
be primary key. Now add unique constraint to the username field. 
The initial primary key name on (id, username) is pk_users. */

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY (id);

ALTER TABLE users
MODIFY username VARCHAR(30) NOT NULL UNIQUE;





/****    11.	Movies Database     **********************************************************************************************/
/* create Movies database with ...... Populate each table with 5 records. ....  */ 

CREATE DATABASE movies DEFAULT CHARACTER SET = 'utf8mb4';
USE movies;

CREATE TABLE directors(
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes VARCHAR(200)
);

INSERT INTO directors(director_name) VALUES('Gogo1'),
('Gogo2'),
('Gogo3'),
('Gogo4'),
('Gogo5');

CREATE TABLE genres (
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes VARCHAR(200)
);

INSERT INTO genres(genre_name) VALUES('Drama'),
('Si-fi'),
('X-si-fi'),
('Kills'),
('Horor');

CREATE TABLE categories (
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    notes VARCHAR(200)
);

INSERT INTO categories(category_name) VALUES('Above 18'),
('Below 18'),
('Kids'),
('X'),
('JP');

CREATE TABLE movies(
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    director_id INT,
    copyright_year YEAR,
    length DOUBLE(10,2),
    genre_id INT,
    category_id INT,
    rating DOUBLE(5,2),
    notes VARCHAR(250)
);

INSERT INTO movies(title) VALUES ('Harry Potter'),
('Dexter'),
('Kill Bill'),
('Titanik'),
('X-men');









//********* 12.	Car Rental Database   ************************************************************************************/
/* create car_rental database with the following entities .... Set primary key to each table. Populate each table with 3 records. */


CREATE DATABASE car_rental DEFAULT CHARACTER SET = 'utf8mb4';
USE car_rental;

CREATE TABLE categories(
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
	category VARCHAR(50),
	daily_rate DOUBLE NOT NULL,
	weekly_rate DOUBLE NOT NULL,
	monthly_rate DOUBLE NOT NULL,
	weekend_rate DOUBLE NOT NULL
);

INSERT INTO categories(category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES 
('test1', 10.11, 20.22, 30.33, 40.44),
('test2', 10.11, 20.22, 30.33, 40.44),
('test5', 10.11, 20.22, 30.33, 40.44);


CREATE TABLE cars(
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    plate_number INT NOT NULL,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    car_year INT,
    category_id INT,
    doors INT,
    picture BLOB,
    car_condition VARCHAR(200),
    available BOOLEAN NOT NULL
);


INSERT INTO cars(plate_number, make, model, available) VALUES
(1111, 'Toyota', 'CH-R', TRUE),
(2222, 'BMV', 'M5', TRUE),
(5555, 'Ford', 'Focus', TRUE);


CREATE TABLE employees (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(50),
    notes VARCHAR(200)
); 

 INSERT INTO employees (first_name, last_name) 
 VALUES ('Ivan1', 'Petrov1'),
 ('Ivan2', 'Petrov2'),
 ('Ivan5', 'Petrov5');

CREATE TABLE customers (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    driver_licence_number INT NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code INT, 
    notes VARCHAR(200)
);

INSERT INTO customers (driver_licence_number, full_name, address, city)
VALUES (27125, 'Ivan X', 'Vitosha', 'Sofia'),
(27125, 'Ivan Z', 'Vitosha', 'Sofia'),
(27125, 'Ivan L', 'Vitosha', 'Sofia');


CREATE TABLE rental_orders  (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    customer_id INT, 
    car_id INT,
    car_condition BOOLEAN,
    tank_level DOUBLE NOT NULL,
    kilometrage_start INT NOT NULL,
    kilometrage_end INT NOT NULL,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DOUBLE,
    tax_rate DOUBLE,
    order_status VARCHAR(20),
    notes VARCHAR(200)
);

INSERT INTO rental_orders (tank_level, kilometrage_start, kilometrage_end)
VALUES (22.1, 10000, 20000),
(22.2, 10000, 20000),
(22.5, 10000, 20000);






/*     13.	Basic Insert     *******************************************************************************************************/
/* Now create bigger database called soft_uni. You will use database in the future tasks. It should hold information about */

DROP DATABASE soft_uni;
CREATE DATABASE soft_uni;
USE soft_uni;

CREATE TABLE towns (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO towns (name)
VALUES ('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');


CREATE TABLE addresses  (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(50) NOT NULL,
    town_id INT
);

INSERT INTO addresses (address_text)
VALUES ('some address text');


CREATE TABLE departments   (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO departments (name)
VALUES ('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');



CREATE TABLE employees  (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
	middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    department_id INT,
    hire_date DATE,
    salary DOUBLE,
    address_id INT     
);

INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES
  ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
  ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
  ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
  ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
  ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);





/*****  14. Basic Select All Fields  **********************************************************************************************/

SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;



/************    15. Basic Select All Fields and Order Them            ***********************************************************/
-- Modify queries from previous problem by sorting:
-- •	towns - alphabetically by name
-- •	departments - alphabetically by name
-- •	employees - descending by salary

SELECT * FROM towns ORDER BY name;
SELECT * FROM departments ORDER BY name;
SELECT * FROm employees ORDER BY salary DESC;



/************    16.	Basic Select Some Fields            ***********************************************************/
-- Modify queries from previous problem to show only some of the columns. For table:
-- •	towns – name
-- •	departments – name
-- •	employees – first_name, last_name, job_title, salary
-- Keep the ordering from the previous problem.

SELECT name FROM towns ORDER BY name;
SELECT name FROM departments ORDER BY name;
SELECT first_name, last_name, job_title, salary FROm employees ORDER BY salary DESC;





//************  17.	Increase Employees Salary  *******************************************************************************/
-- increase the salary of all employees by 10%. Then select only salary column from the employees table.

UPDATE employees SET salary = salary * 1.10;
SELECT salary FROM employees;


0.28.16
