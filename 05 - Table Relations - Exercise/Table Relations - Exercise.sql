CREATE DATABASE one_to_one;

use one_to_one;




/*      01. One-To-One Relationship       ***************************************************************************************************************************/
/*
•	Alter table people and make person_id a primary key. 
•	Create a foreign key between people and passports by using the passport_id column. 
•	Think about which passport field should be UNIQUE.
•	Format salary to second digit after decimal point.  */ 

CREATE TABLE passports(
passport_id INT PRIMARY KEY AUTO_INCREMENT,
passport_number VARCHAR(8) UNIQUE NOT NULL
);

CREATE TABLE people(
person_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
salary DECIMAL(16,2) DEFAULT 0,
passport_id INT UNIQUE,   /* --> One to One connection whit 'UNIQUE' */

FOREIGN KEY (passport_id) REFERENCES passports(passport_id)
);


INSERT INTO passports VALUES 
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO people VALUES
(1, 'Roberto', 43300.00, 102),
(2, 'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);







/*     02. One-To-Many Relationship        ***************************************************************************************************************************/
CREATE DATABASE one_to_many;
USE one_to_many;


CREATE TABLE manufacturers(
 manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(30) NOT NULL,
 established_on DATE 
);

CREATE TABLE models(
model_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
manufacturer_id INT,

FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)    
/* alternative to UP  ---->   CONSTRAINT fk_models_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (manufacturer_id) */
);


INSERT INTO manufacturers(`manufacturer_id`, `name`, `established_on`) VALUES
(1, 'BMW', '1916-03-01'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01');


INSERT INTO models(`model_id`, `name`, `manufacturer_id`) VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3);









/*     03. Many-To-Many Relationship             ***************************************************************************************************************************/

CREATE TABLE students (
        student_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(20)
);

INSERT INTO students (name) VALUES
    ('Mila'),
    ('Toni'),
    ('Ron');

CREATE TABLE exams (
        exam_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50)
);

ALTER TABLE exams AUTO_INCREMENT = 101;

INSERT INTO exams (name) VALUES
    ('Spring MVC'),
    ('Neo4j'),
    ('Oracle 11g');

CREATE TABLE
    students_exams (
        student_id INT,
        exam_id INT,
        CONSTRAINT pk_students_exams PRIMARY KEY (student_id, exam_id),
        CONSTRAINT fk_students_exams FOREIGN KEY (student_id) REFERENCES students (student_id),
        CONSTRAINT fk_exams_students FOREIGN KEY (exam_id) REFERENCES exams (exam_id)
    );

INSERT INTO students_exams (student_id, exam_id) VALUES
    (1, 101),
    (1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);









/*       04. Self-Refer-ncing           ***************************************************************************************************************************/

CREATE TABLE teachers(
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    manager_id INT
    
);

INSERT INTO teachers VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

ALTER TABLE teachers ADD FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id);







/*      05. Online Store Database          ***************************************************************************************************************************/



CREATE DATABASE store_online_1;
USE store_online_1;

CREATE TABLE item_types(
	item_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) 
);

CREATE TABLE items(
	item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    item_type_id INT,
    
    FOREIGN KEY (item_type_id) REFERENCES item_types(item_type_id)
);

CREATE TABLE cities(
	city_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
    birthday DATE,
    city_id INT,
    
     FOREIGN KEY (city_id) REFERENCES cities(city_id)
);


CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id INT,
    
     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
	order_id INT,
    item_id INT,
    
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);



/* !!!! 			REVERSE ENGINEER....  ------>  CTRL + R	*/









/*     06. University Database             ***************************************************************************************************************************/


CREATE DATABASE university_db_1;
USE university_db_1;

CREATE TABLE subjects(
	subject_id INT PRIMARY KEY AUTO_INCREMENT,
	subject_name VARCHAR(50)
);

CREATE TABLE majors(
	major_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

CREATE TABLE students(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
	student_name VARCHAR(50),
    major_id INT,
    
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);


CREATE TABLE payments(
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment_amount DECIMAl(8,2),
    student_id INT,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


CREATE TABLE agenda(
	student_id INT,
    subject_id INT,
    
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);



/*  7 *******************************************/
/*  8 *******************************************/


/*       09. Peaks in Rila           ***************************************************************************************************************************/

USE geography;

SELECT m.mountain_range, p.peak_name, p.elevation AS 'peak_elevation'
FROM mountains AS m
JOIN peaks AS p ON m.id = p.mountain_id
WHERE m.mountain_range = 'Rila'
ORDER BY peak_elevation DESC;