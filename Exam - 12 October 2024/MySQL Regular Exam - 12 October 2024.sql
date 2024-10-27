

CREATE DATABASE summer_olympics;
USE summer_olympics;


CREATE TABLE countries (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE sports (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE disciplines (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    sport_id INT NOT NULL,
    
    FOREIGN KEY (sport_id) REFERENCES sports(id)    
);


CREATE TABLE athletes (   
    id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    country_id INT NOT NULL,
    
    FOREIGN KEY (country_id) REFERENCES countries(id)    
);


CREATE TABLE medals (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(10) NOT NULL UNIQUE
);


CREATE TABLE disciplines_athletes_medals (
    discipline_id INT NOT NULL,
    athlete_id INT NOT NULL,
    medal_id INT NOT NULL,
    /* Hint: The combination of discipline and medal must be unique across all athletes */
    PRIMARY KEY (discipline_id, athlete_id),
    FOREIGN KEY (discipline_id) REFERENCES disciplines(id),
    FOREIGN KEY (athlete_id) REFERENCES athletes(id),
    FOREIGN KEY (medal_id) REFERENCES medals(id)
);



/*********************************************************************************************************************************************************************/


INSERT INTO countries (name)
VALUES ('Afghanistan'),
       ('Albania'),
       ('Algeria'),
       ('American Samoa'),
       ('Andorra'),
       ('Angola'),
       ('Antigua and Barbuda'),
       ('Argentina'),
       ('Armenia'),
       ('Aruba'),
       ('Australia'),
       ('Austria'),
       ('Azerbaijan'),
       ('Bahamas'),
       ('Bahrain'),
       ('Bangladesh'),
       ('Barbados'),
       ('Belgium'),
       ('Belize'),
       ('Bermuda'),
       ('Bhutan'),
       ('Bolivia'),
       ('Bosnia and Herzegovina'),
       ('Botswana'),
       ('Brazil'),
       ('Brunei Darussalam'),
       ('Bulgaria'),
       ('Burundi'),
       ('Cabo Verde'),
       ('Cambodia'),
       ('Canada'),
       ('Cayman Islands'),
       ('Chad'),
       ('Chile'),
       ('Chinese Taipei'),
       ('Colombia'),
       ('Congo'),
       ('Cook Islands'),
       ('Costa Rica'),
       ('Croatia'),
       ('Cuba'),
       ('Cyprus'),
       ('Czechia'),
       ('Democratic PeopleвЂ™s Republic of Korea'),
       ('Democratic Rep. of Timor-Leste'),
       ('Denmark'),
       ('Dominica'),
       ('Dominican Republic'),
       ('Ecuador'),
       ('El Salvador'),
       ('Equatorial Guinea'),
       ('Estonia'),
       ('Ethiopia'),
       ('Federated States of Micronesia'),
       ('Fiji'),
       ('Finland'),
       ('France'),
       ('Gabon'),
       ('Gambia'),
       ('Georgia'),
       ('Germany'),
       ('Ghana'),
       ('Greece'),
       ('Grenada'),
       ('Guam'),
       ('Guatemala'),
       ('Guinea'),
       ('Guinea-Bissau'),
       ('Guyana'),
       ('Haiti'),
       ('Honduras'),
       ('Hong Kong, China'),
       ('Hungary'),
       ('Iceland'),
       ('India'),
       ('Indonesia'),
       ('Iraq'),
       ('Ireland'),
       ('Islamic Republic of Iran'),
       ('Israel'),
       ('Italy'),
       ('Jamaica'),
       ('Japan'),
       ('Jordan'),
       ('Kazakhstan'),
       ('Kenya'),
       ('Kiribati'),
       ('Kosovo'),
       ('Kuwait'),
       ('Kyrgyzstan'),
       ('Lao PeopleвЂ™s Democratic Republic'),
       ('Latvia'),
       ('Lebanon'),
       ('Lesotho'),
       ('Liberia'),
       ('Libya'),
       ('Liechtenstein'),
       ('Lithuania'),
       ('Luxembourg'),
       ('Madagascar'),
       ('Malawi'),
       ('Malaysia'),
       ('Maldives'),
       ('Mali'),
       ('Malta'),
       ('Marshall Islands'),
       ('Mauritania'),
       ('Mauritius'),
       ('Mexico'),
       ('Monaco'),
       ('Mongolia'),
       ('Montenegro'),
       ('Morocco'),
       ('Mozambique'),
       ('Myanmar'),
       ('Namibia'),
       ('Nauru'),
       ('Nepal'),
       ('Netherlands'),
       ('New Zealand'),
       ('Nicaragua'),
       ('Niger'),
       ('Nigeria'),
       ('North Macedonia'),
       ('Norway'),
       ('Oman'),
       ('Pakistan'),
       ('Palau'),
       ('Palestine'),
       ('Panama'),
       ('Papua New Guinea'),
       ('Paraguay'),
       ('PeopleвЂ™s Republic of China'),
       ('Peru'),
       ('Philippines'),
       ('Poland'),
       ('Portugal'),
       ('Puerto Rico'),
       ('Qatar'),
       ('Republic of Korea'),
       ('Republic of Moldova'),
       ('Romania'),
       ('Rwanda'),
       ('Saint Kitts and Nevis'),
       ('Saint Lucia'),
       ('Samoa'),
       ('San Marino'),
       ('Sao Tome and Principe'),
       ('Saudi Arabia'),
       ('Senegal'),
       ('Serbia'),
       ('Seychelles'),
       ('Sierra Leone'),
       ('Singapore'),
       ('Slovakia'),
       ('Slovenia'),
       ('Solomon Islands'),
       ('Somalia'),
       ('South Africa'),
       ('South Sudan'),
       ('Spain'),
       ('Sri Lanka'),
       ('St. Vincent and the Grenadines'),
       ('Sudan'),
       ('Suriname'),
       ('Sweden'),
       ('Switzerland'),
       ('Syrian Arab Republic'),
       ('Tajikistan'),
       ('Thailand'),
       ('Togo'),
       ('Tonga'),
       ('Trinidad and Tobago'),
       ('Tunisia'),
       ('Turkey'),
       ('Turkmenistan'),
       ('Tuvalu'),
       ('Uganda'),
       ('Ukraine'),
       ('United Arab Emirates'),
       ('United Republic of Tanzania'),
       ('United States of America'),
       ('Uruguay'),
       ('Uzbekistan'),
       ('Vanuatu'),
       ('Venezuela'),
       ('Vietnam'),
       ('Virgin Islands, British'),
       ('Virgin Islands, US'),
       ('Yemen'),
       ('Zambia'),
       ('Zimbabwe')
;

INSERT INTO sports (name)
VALUES ('Archery'),
       ('Athletics'),
       ('Badminton'),
       ('Boxing'),
       ('Canoe'),
       ('Cycling'),
       ('Diving'),
       ('Equestrian'),
       ('Fencing'),
       ('Golf'),
       ('Gymnastics'),
       ('Judo'),
       ('Karate'),
       ('Modern Pentathlon'),
       ('Rowing'),
       ('Shooting'),
       ('Skateboarding'),
       ('Surfing'),
       ('Swimming'),
       ('Table Tennis'),
       ('Taekwondo'),
       ('Tennis'),
       ('Weightlifting')
;

INSERT INTO athletes (first_name, last_name, age, country_id)
VALUES ('Abdulah', 'Husein', 24, 153),
       ('Adam', 'Flores', 22, 23),
       ('Alicia', 'Watson', 31, 175),
       ('Austin', 'Wiggins', 31, 114),
       ('Aaron', 'Murray', 24, 15),
       ('Abigail', 'Foster', 20, 98),
       ('Aidan', 'Hunt', 19, 134),
       ('Alexandra', 'Reyes', 27, 51),
       ('Alfred', 'Gordon', 35, 73),
       ('Alice', 'Lopez', 26, 91),
       ('Alyssa', 'Murphy', 33, 123),
       ('Carlos', 'Alexander', 33, 99),
       ('Carmen', 'Robinson', 27, 192),
       ('Carol', 'Garcia', 22, 77),
       ('Cathy', 'Hammond', 26, 155),
       ('Christopher', 'Mendoza', 28, 61),
       ('Cody', 'Rogers', 24, 32),
       ('Courtney', 'Henry', 28, 161),
       ('Crystal', 'Gonzalez', 18, 3),
       ('Daniel', 'King', 18, 14),
       ('Daniel', 'Russell', 26, 191),
       ('Danielle', 'Dominguez', 33, 78),
       ('Danielle', 'King', 32, 137),
       ('Darren', 'Foley', 20, 139),
       ('David', 'Cunningham', 20, 92),
       ('Dennis', 'Dickson', 21, 99),
       ('Deanna', 'Ortiz', 21, 85),
       ('Gina', 'Herrera', 21, 55),
       ('James', 'Soto', 36, 109),
       ('Jackson', 'Diaz', 18, 26),
       ('Jacob', 'Carter', 33, 67),
       ('James', 'Bryant', 27, 116),
       ('Jasmine', 'Garcia', 23, 47),
       ('Jasmine', 'Hernandez', 28, 101),
       ('Jenna', 'Cooper', 22, 155),
       ('Jessica', 'Hughes', 28, 63),
       ('Jeffrey', 'Nelson', 25, 53),
       ('Jonathan', 'Flores', 31, 140),
       ('Jordan', 'Bailey', 20, 89),
       ('John', 'Smith', 34, 182),
       ('Jerry', 'Little', 27, 100),
       ('Jonathan', 'Cherry', 32, 167),
       ('Joseph', 'Cook', 36, 192),
       ('Joseph', 'Silva', 22, 28),
       ('Julie', 'Ford', 31, 128),
       ('Julie', 'Robertson', 31, 153),
       ('Justin', 'Howard', 35, 133),
       ('Kara', 'Fisher', 29, 182),
       ('Kathleen', 'Duarte', 27, 32),
       ('Krystal', 'Garcia', 32, 8),
       ('Linda', 'Peters', 22, 14),
       ('Melissa', 'Barton', 30, 100),
       ('Melissa', 'Olson', 17, 128),
       ('Michael', 'Clark', 32, 16),
       ('Nathan', 'Cox', 17, 157),
       ('Natalie', 'Gomez', 22, 26),
       ('Renee', 'Russell', 21, 81),
       ('Regina', 'Ross', 25, 134),
       ('Regina', 'Stewart', 29, 29),
       ('Richard', 'Bean', 30, 8),
       ('Ricky', 'Walker', 20, 148),
       ('Sheila', 'Hardin', 24, 35),
       ('Stephanie', 'Gray', 32, 7),
       ('Timothy', 'Daniels', 31, 164),
       ('Travis', 'Buck', 25, 29),
       ('Tyler', 'Taylor', 26, 69),
       ('Veronica', 'Jacobs', 34, 145),
       ('Warden', 'Stone', 27, 11),
       ('Van', 'Pascal', 23, 14)
;

INSERT INTO disciplines (name, sport_id)
VALUES ('Individual shooting 70m', 1),
       ('Sprint 100m', 2),
       ('Hurdles 400m', 2),
       ('Middle-distance 800m', 2),
       ('Long-distance 5000m', 2),
       ('One-on-one', 3),
       ('Match lightweight', 4),
       ('Match middleweight', 4),
       ('Match heavyweight', 4),
       ('Slalom', 5),
       ('Sprint', 5),
       ('BMX Freestyle', 6),
       ('BMX Racing', 6),
       ('Road', 6),
       ('Track', 6),
       ('10m Platform', 7),
       ('3m Springboard', 7),
       ('Synchronized 10m Platform', 7),
       ('Synchronized 3m Springboard', 7),
       ('Dressage', 8),
       ('Jumping', 8),
       ('Eventing', 8),
       ('Foil', 9),
       ('Epee', 9),
       ('Sabre', 9),
       ('Individual Stroke Play', 10),
       ('Floor Exercise', 11),
       ('Vault', 11),
       ('Bars', 11),
       ('Rhythmic', 11),
       ('Trampoline', 11),
       ('Judo lightweight', 12),
       ('Judo middleweight', 12),
       ('Judo heavyweight', 12),
       ('Kumite', 13),
       ('Kata', 13),
       ('Fencing', 14),
       ('Freestyle Swimming 200m', 14),
       ('Equestrian Show Jumping', 14),
       ('Laser-Run', 14),
       ('Single Sculls', 15),
       ('25m Rapid Fire', 16),
       ('10m Air Rifle', 16),
       ('Trap', 16),
       ('Skeet', 16),
       ('Street', 17),
       ('Park', 17),
       ('Short board', 18),
       ('Long board', 18),
       ('Freestyle 100m', 19),
       ('Individual Medley 200m', 19),
       ('Butterfly 100m', 19),
       ('Best-of-seven', 20),
       ('Sparring lightweight', 21),
       ('Sparring middleweight', 21),
       ('Sparring heavyweight', 21),
       ('Best-of-three', 22),
       ('Snatch', 23),
       ('Clean and Jerk', 23)
;

INSERT INTO medals (type)
VALUES ('Gold'),
       ('Silver'),
       ('Bronze')
;


INSERT INTO disciplines_athletes_medals (discipline_id, athlete_id, medal_id)
VALUES (1, 1, 1),
       (1, 3, 2),
       (1, 9, 3),
       (2, 29, 1),
       (2, 2, 2),
       (2, 46, 3),
       (3, 2, 1),
       (3, 4, 2),
       (3, 37, 3),
       (4, 17, 1),
       (4, 45, 2),
       (4, 27, 3),
       (5, 14, 1),
       (5, 15, 2),
       (5, 16, 3),
       (6, 26, 3),
       (7, 47, 3),
       (8, 8, 2),
       (8, 19, 3),
       (9, 39, 2),
       (9, 5, 3),
       (10, 35, 1),
       (11, 35, 1),
       (12, 20, 1),
       (13, 20, 1),
       (14, 20, 1),
       (15, 20, 1),
       (16, 68, 1),
       (16, 67, 2),
       (16, 65, 3),
       (17, 65, 2),
       (18, 59, 1),
       (19, 69, 2),
       (19, 59, 3),
       (20, 31, 1),
       (20, 32, 2),
       (20, 33, 3),
       (21, 43, 2),
       (21, 48, 3),
       (22, 49, 1),
       (22, 48, 3),
       (23, 41, 1),
       (23, 42, 3),
       (24, 41, 1),
       (25, 41, 1),
       (25, 11, 2),
       (25, 38, 3),
       (26, 34, 3),
       (27, 53, 1),
       (28, 50, 1),
       (29, 52, 2),
       (30, 51, 3),
       (31, 50, 1),
       (31, 40, 2),
       (31, 44, 3),
       (35, 6, 1),
       (35, 7, 2),
       (35, 61, 3),
       (36, 6, 1),
       (36, 7, 2),
       (36, 56, 3),
       (50, 10, 1),
       (50, 62, 2),
       (50, 23, 3),
       (51, 10, 1),
       (51, 13, 2),
       (51, 12, 3),
       (53, 21, 1),
       (53, 63, 2),
       (53, 55, 3),
       (57, 60, 1),
       (57, 64, 2),
       (57, 57, 3),
       (58, 66, 1),
       (59, 66, 2)
;





/****************************************************************************************************************************************************/
/****************************************************************************************************************************************************/




/****************************************************************************************************************************************************/
/* You will have to insert records of data into the athletes table.
For all athletes, which come from a country whose name starts with the letter "A", insert data in the athletes table with the following values:
•	first_name – set it to the first name of the athlete but uppercase.
•	last_name – set it to the athlete's last name followed by a white space and then "comes from" followed by one more white space and the name of the athlete's country.
e.g.(last_name+" comes from "+(country)name)
•	age – set it to the sum of the age of the athlete and his country_id.
•	country_id – keep the same value.					*/

INSERT INTO athletes (first_name, last_name, age, country_id)
SELECT
    UPPER(first_name),
    CONCAT(last_name, ' comes from ', countries.name),
    age + countries.id,
    countries.id
FROM athletes
JOIN countries ON athletes.country_id = countries.id
WHERE countries.name LIKE 'A%';


INSERT INTO athletes (first_name, last_name, age, country_id)
SELECT
    UPPER(a.first_name),
    CONCAT(a.last_name, ' comes from ', c.name),
    a.age + a.country_id,
    a.country_id
FROM athletes a
INNER JOIN countries c ON a.country_id = c.id
WHERE c.name LIKE 'A%';






/***		03. Update			*************************************************************************************************************************************************/
/* Remove the word "weight" from any discipline containing it. 			*/

UPDATE disciplines
SET name = REPLACE(name, 'weight', '')
WHERE name LIKE '%weight%';


UPDATE disciplines
SET name = REPLACE(name, 'weight', '')
WHERE name LIKE '%weight%';





/*****			04. Delete			***********************************************************************************************************************************************/
/* Delete all athletes, older than 35 years.  */

DELETE FROM athletes
WHERE age > 35;





/******		05. Countries without athletes			**********************************************************************************************************************************************/
/* Write a query that returns the id and name from table countries. 
Filter only the countries that do not have athletes at this Olympics. Show only the first 15 (fifteen) results.
Order the results descending by country name.
Required Columns
•	id (country)
•	name (country)											*/

SELECT countries.id, countries.name FROM countries
LEFT JOIN athletes ON countries.id = athletes.country_id
WHERE athletes.id IS NULL
ORDER BY countries.name DESC
LIMIT 15;







/*********			06. Youngest medalists			*******************************************************************************************************************************************/
/*Extract from the summer_olympics database full_name and age of the two athletes with the minimum age who have won at least one medal.
Order the results by the athlete's id in ascending order.
Required Columns
•	full_name (first_name + " " + last_name)
•	age																		*/

SELECT
    CONCAT(athletes.first_name, ' ', athletes.last_name) AS full_name,
    athletes.age
FROM athletes
JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
GROUP BY athletes.id
ORDER BY athletes.age ASC, athletes.id ASC
LIMIT 2;


SELECT 
    CONCAT(athletes.first_name, ' ', athletes.last_name) AS full_name,
    athletes.age
FROM athletes
INNER JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
GROUP BY athletes.id
ORDER BY athletes.age ASC, athletes.id ASC
LIMIT 2;



/*************		07. Athletes without medals			***************************************************************************************************************************************/
/* Not all athletes manage to reach the dream ladder of honour. 
Write a query that extracts (id, first_name, last_name) from the database all athletes who have not won any medals.
Order by id in ascending order.
Required Columns
•	id (athlete)
•	first_name (athlete)
•	last_name (athlete)								*/

SELECT athletes.id, athletes.first_name, athletes.last_name FROM athletes
LEFT JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
WHERE disciplines_athletes_medals.athlete_id IS NULL
ORDER BY athletes.id ASC;






/*************		08. Athletes with medals divided by sports			***************************************************************************************************************************************/
/* Extract from the summer_olympics database the id, first_name , last_name, medals_count and the sport (in which medals were won), 
of the top ten athletes who have won medals.
Order the results descending by medals_count, then by first_name in ascending order.
Required Columns
•	id (athlete)
•	first_name (athlete)
•	last_name (athlete)
•	medals_count (total medals won by a single athlete)
•	sport																*/


SELECT
    athletes.id,
    athletes.first_name,
    athletes.last_name,
    COUNT(disciplines_athletes_medals.medal_id) AS medals_count,
    sports.name AS sport
FROM athletes
JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
JOIN disciplines ON disciplines_athletes_medals.discipline_id = disciplines.id
JOIN sports ON disciplines.sport_id = sports.id
GROUP BY athletes.id, athletes.first_name, athletes.last_name, sports.name
ORDER BY medals_count DESC, athletes.first_name ASC
LIMIT 10;

											

SELECT
    athletes.id,
    athletes.first_name,
    athletes.last_name,
    COUNT(disciplines_athletes_medals.medal_id) AS medals_count,
    sports.name AS sport
FROM athletes
INNER JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
INNER JOIN disciplines ON disciplines_athletes_medals.discipline_id = disciplines.id
INNER JOIN sports ON disciplines.sport_id = sports.id
GROUP BY athletes.id, athletes.first_name, athletes.last_name, sports.name
ORDER BY medals_count DESC, athletes.first_name ASC
LIMIT 10;





/**********				09. Age groups of the athletes					******************************************************************************************************************************************/
/* From the database extract the full_name and age_group of the athletes. 
If the athlete is 18 years of age or younger user must see "Teenager", if it is between 18 (exclusive) 
and 25 years (inclusive) of age it should display "Young adult". If it is equal to or more than 26 of age ->"Adult".
Order the results descending by athlete's age, then by first_name in ascending order.
Required Columns
•	full_name (first_name + " " + last_name)
•	age_group																*/

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    CASE
        WHEN age <= 18 THEN 'Teenager'
        WHEN age <= 25 THEN 'Young adult'
        ELSE 'Adult'
    END AS age_group
FROM athletes
ORDER BY age DESC, first_name ASC;





/***************		10. Find the total count of medals by country		*************************************************************************************************************************************/
/* Create a user-defined function with the name udf_total_medals_count_by_country (name VARCHAR(40)) that 
receives a country_name and returns the total number of medals won by all athletes competing for that country.
Required Columns
•	country_name
•	count_of_medals								*/

DELIMITER //
CREATE FUNCTION udf_total_medals_count_by_country(country_name VARCHAR(40))
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(disciplines_athletes_medals.medal_id)
        FROM athletes
        JOIN disciplines_athletes_medals ON athletes.id = disciplines_athletes_medals.athlete_id
        JOIN countries ON athletes.country_id = countries.id
        WHERE countries.name = country_name
    );
END //
DELIMITER ;




CREATE FUNCTION udf_total_medals_count_by_country (country_name VARCHAR(40))
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(*)
    FROM disciplines_athletes_medals
    INNER JOIN athletes ON disciplines_athletes_medals.athlete_id = athletes.id
    INNER JOIN countries ON athletes.country_id = countries.id
    WHERE countries.name = country_name
);


SELECT c.name, udf_total_medals_count_by_country ('Bahamas') as count_of_medals
FROM countries c
WHERE c.name = 'Bahamas';








/**********				11. Update athlete's information				******************************************************************************************************************************************/
/*Create a stored procedure udp_first_name_to_upper_case which accepts the following parameters:
•	letter (CHAR(1))
Update the information in column first_name from the athletes table by capitalising all the letters in it. 
Do it only for the athletes whose first name ends with the given letter. (The given letter will always be lowercase)	*/

DELIMITER //
CREATE PROCEDURE udp_first_name_to_upper_case(IN letter CHAR(1))
DETERMINISTIC
BEGIN
    UPDATE athletes
    SET first_name = UPPER(first_name)
    WHERE first_name LIKE CONCAT('%', letter);
END //
DELIMITER ;


CALL udp_first_name_to_upper_case('s');

