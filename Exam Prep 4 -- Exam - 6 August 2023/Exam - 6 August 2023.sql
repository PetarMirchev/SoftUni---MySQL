
CREATE DATABASE real_estate_db;
USE real_estate_db;


CREATE TABLE cities (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL UNIQUE
);


CREATE TABLE property_types (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(40) NOT NULL UNIQUE,
    description TEXT
);


CREATE TABLE properties (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(80) NOT NULL UNIQUE,
    price DECIMAL(19,2) NOT NULL,
    area DECIMAL(19,2),
    property_type_id INT,
    city_id INT,
    
    FOREIGN KEY (property_type_id) REFERENCES property_types(id),
	FOREIGN KEY (city_id) REFERENCES cities(id)
);


CREATE TABLE agents (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
	phone VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
    city_id INT,
    
    FOREIGN KEY (city_id) REFERENCES cities(id)
);


CREATE TABLE buyers (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
	phone VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
    city_id INT,
    
    FOREIGN KEY (city_id) REFERENCES cities(id)
);




CREATE TABLE property_offers (   
    property_id INT NOT NULL,
    agent_id INT NOT NULL,
    price DECIMAL(19,2) NOT NULL,
    offer_datetime DATETIME,
    
    FOREIGN KEY (property_id) REFERENCES properties(id),
    FOREIGN KEY (agent_id) REFERENCES agents(id)
);




CREATE TABLE property_transactions (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    buyer_id INT NOT NULL,
    transaction_date DATE,
    bank_name VARCHAR(30),
    iban VARCHAR(40) UNIQUE,
    is_successful BOOLEAN,
    
    
	FOREIGN KEY (property_id) REFERENCES properties(id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(id)
);



/*******************************************************************************************************************************************************/

INSERT INTO cities (name)
VALUES ('London'),
       ('Paris'),
       ('Berlin'),
       ('Rome'),
       ('Madrid'),
       ('Vienna'),
       ('Amsterdam'),
       ('Plovdiv');
insert into property_types (id, type, description)
values (1, 'Apartment',
        'An apartment is a residential unit typically found in multi-story buildings, offering comfortable living spaces with a compact design. Apartments often feature amenities such as kitchens, bathrooms, and living areas, making them ideal for individuals or small families seeking a convenient and urban lifestyle.'),
       (2, 'House',
        'A "house" refers to a residential dwelling typically designed for single-family occupancy, featuring multiple rooms, a private yard, and an independent entrance. Houses offer a sense of privacy and often provide ample living space, making them suitable for families or individuals seeking a more spacious living environment.'),
       (3, 'Villa',
        'Villa: Luxurious and spacious residential property characterized by its elegance, grandeur, and exclusive amenities, offering a serene and lavish lifestyle.'),
       (4, 'Mansion',
        'A mansion is a grand and luxurious residential property, typically characterized by its large size, exquisite architecture, and extensive grounds. It is a prestigious and opulent living space associated with wealth and elegance. Mansions often feature numerous rooms, high-end amenities, and lavish interiors, offering a sophisticated and indulgent lifestyle.'),
       (5, 'Farmhouse',
        'Farmhouse: A farmhouse is a charming and rustic property type typically located in rural areas. It offers a peaceful retreat with spacious rooms, exposed beams, and a cozy atmosphere. Enjoy the tranquility and simplicity of country living surrounded by nature''s beauty.'),
       (6, 'Studio',
        'Studio: A studio is a compact and efficient property type that maximizes space and functionality. It is designed for individuals or couples seeking a modern and versatile living space. With an open floor plan, clever storage solutions, and contemporary design, studios offer a stylish and convenient urban lifestyle.'),
       (7, 'Penthouse',
        'A penthouse represents the epitome of luxury and sophistication. Situated at the top of a high-rise building, it offers breathtaking panoramic views and exclusive amenities. With spacious layouts, high-end finishes, private terraces, and access to top-notch facilities, penthouses provide an unparalleled residential experience for discerning individuals.'),
       (8, 'Bungalow',
        'A bungalow is a single-story house that offers a cozy and compact living space. It typically features a spacious front porch, open floor plan, and convenient accessibility, making it ideal for individuals or small families seeking a comfortable and low-maintenance home with a charming character.'),
       (9, 'Mobile Home',
        'A mobile home, also known as a manufactured home, is a prefabricated dwelling that can be easily transported and installed in various locations. These homes offer an affordable housing option with flexible mobility, providing individuals or families with the opportunity to enjoy a comfortable living space while maintaining the ability to relocate if desired.'),
       (10, 'Ranch',
        'A ranch-style property encompasses a single-story home design that emphasizes a relaxed and spacious living environment. With a focus on functionality and convenience, ranch-style properties typically feature an open layout, easy accessibility, and large outdoor areas. They provide a versatile and comfortable living space that suits a variety of lifestyles and preferences.'),
       (11, 'Split-level',
        'A split-level property offers a unique architectural design that combines multiple levels to create distinct living areas. These homes feature staggered floors, often dividing the living spaces into separate sections, providing a sense of privacy and individuality. Split-level properties are known for their versatility, accommodating different purposes for each level and offering an appealing aesthetic with interesting visual elements.');
insert into properties (id, address, price, area, property_type_id, city_id)
values (1, '10 Downing Street', 1000000.00, 2000, 1, 1),
       (2, '221B Baker Street', 750000.00, 1500, 2, 1),
       (3, '34 Trafalgar Square', 500000.00, 1200, 3, 1),
       (4, '1 Leicester Square', 800000.00, 1800, 4, 1),
       (5, '10 St. James''s Square', 1200000.00, 2500, 5, 1),
       (6, 'Hyden Park Gate 45', 900000.00, 2200, 6, 1),
       (7, '56 Abbey Road', 600000.00, 1400, 7, 1),
       (8, '12 Rue de Rivoli', 520000.00, 75.5, 1, 2),
       (9, '4 Avenue des Champs-Г‰lysГ©es', 850000.00, 105.8, 2, 2),
       (10, 'Rue de la Paix 7', 650000.00, 92, 3, 2),
       (11, '16 Place VendГґme', 1200000.00, 150.2, 4, 2),
       (12, '2 Rue du Faubourg Saint-HonorГ©', 980000.00, 120.75, 5, 2),
       (13, 'Rue de Varenne', 720000.00, 88.3, 6, 2),
       (14, '9 Rue de SГЁvres', 580000.00, 80.6, 7, 2),
       (15, 'Alexanderplatz 1, 10178', 250000.00, 1000, 1, 3),
       (16, 'Unter den Linden 16, 10117', 150000.00, 800, 2, 3),
       (17, 'FriedrichstraГџe 180, 10117', 300000.00, 1200, 3, 3),
       (18, 'Potsdamer Platz 1, 10785', 350000.00, 1500, 4, 3),
       (19, 'KurfГјrstendamm 200, 10719', 200000.00, 900, 5, 3),
       (20, 'SchlossstraГџe 1, 12163', 400000.00, 1000, 6, 3),
       (21, 'Ostbahnhof, 10243', 800000.00, 2500, 7, 3),
       (22, 'Via del Corso 123', 250000.00, 100, 1, 4),
       (23, 'Piazza Navona 456', 300000.00, 120.5, 2, 4),
       (24, 'Via Veneto 789', 450000.00, 180, 3, 4),
       (25, 'Trastevere 321', 350000.00, 150.75, 4, 4),
       (26, 'Colosseum Square 654', 550000.00, 220.8, 5, 4),
       (27, 'Trevi Fountain 987', 750000.00, 280.25, 6, 4),
       (28, 'Vatican City 123', 900000.00, 350, 7, 4),
       (29, 'Grana Via 123', 250000.00, 1000, 1, 5),
       (30, 'Paseo del Prado 456', 350000.00, 1500, 2, 5),
       (31, 'Calle Mayor 789', 200000.00, 900, 3, 5),
       (32, 'Puerta del Sol 321', 400000.00, 1000, 4, 5),
       (33, 'Avenida de America 654', 500000.00, 2000, 5, 5),
       (34, 'Plaza de Cibeles 987', 800000.00, 2500, 6, 5),
       (35, 'Calle Alcala 654', 350000.00, 1800, 7, 5),
       (36, 'Ringstrasse 1', 500000.00, 80, 1, 6),
       (37, 'Stephansplatz 2', 750000.00, 120, 2, 6),
       (38, 'Karlsplatz 3', 600000.00, 100, 3, 6),
       (39, 'Belvederegasse 4', 900000.00, 150, 4, 6),
       (40, 'Naschmarkt 5', 350000.00, 60, 5, 6),
       (41, 'Praterstrasse 6', 400000.00, 70, 6, 6),
       (42, 'SchГ¶nbrunner Schlossstrasse 7', 1000000.00, 200, 7, 6),
       (43, 'Herengracht 123', 500000.00, 1000, 1, 7),
       (44, 'Keizersgracht 456', 700000.00, 1200, 2, 7),
       (45, 'Prinsengracht 789', 600000.00, 1100, 3, 7),
       (46, 'Singel 321', 400000.00, 900, 4, 7),
       (47, 'Leidsestraat 654', 800000.00, 1300, 5, 7),
       (48, 'Damrak 987', 900000.00, 1400, 6, 7),
       (49, 'Rembrandtplein 222', 650000.00, 1100, 7, 7),
       (50, 'ul. Knyaginya Maria Luisa 1', 250000.00, 100, 1, 8),
       (51, 'ul. Otets Paisiy 10', 180000.00, 80, 2, 8),
       (52, 'ul. Georgi Benkovski 15', 300000.00, 120, 3, 8),
       (53, 'Hristo Botev str. 20', 350000.00, 150, 4, 8),
       (54, 'ul. Tsar Boris III Obedinitel 25', 200000.00, 90, 5, 8),
       (55, 'ul. Vasil Aprilov 30', 400000.00, 100, 6, 8),
       (56, 'ul. Ivan Vazov 35', 800000.00, 250, 7, 8);
insert into agents (id, first_name, last_name, phone, email, city_id)
values (1, 'Winnah', 'Magarrell', '236-874-1726', 'wmagarrell0@infoseek.co.jp', 6),
       (2, 'Tansy', 'Vicent', '824-943-0509', 'tvicent1@discovery.com', 6),
       (3, 'Giovanna', 'Verdi', '802-602-2852', 'nbroun2@jiathis.com', 4),
       (4, 'Hans', 'Schmidt', '645-844-1128', 'dcurror3@123-reg.co.uk', 3),
       (5, 'Franz', 'Hefe', '804-931-7628', 'aegell4@toplist.cz', 6),
       (6, 'Francesco', 'Melini', '768-294-6544', 'efaulkes5@wikipedia.org', 4),
       (7, 'Norbert', 'Urvoy', '223-521-4500', 'nurvoy6@latimes.com', 5),
       (8, 'Ashley', 'Hustings', '963-603-8339', 'ahustings7@ezinearticles.com', 4),
       (9, 'Clementina', 'MacCafferky', '203-584-2865', 'cmaccafferky8@chicagotribune.com', 5),
       (10, 'Toiboid', 'Danvey', '665-440-8905', 'tdancer9@ted.com', 4),
       (11, 'Maud', 'Mulvany', '830-721-8209', 'mmulvanya@cbsnews.com', 7),
       (12, 'Ferdinand', 'Upwood', '994-926-0660', 'fupwoodb@ucla.edu', 5),
       (13, 'Pier', 'Chattell', '488-647-6423', 'nchattellc@friendfeed.com', 2),
       (14, 'Luca', 'Pasteur', '401-321-8448', 'vshimwalld@java.com', 2),
       (15, 'Elisabet', 'Sarrell', '795-469-5605', 'esarrelle@hhs.gov', 2),
       (16, 'Matty', 'Fiske', '641-327-8490', 'mfiskef@chicagotribune.com', 2),
       (17, 'Odella', 'Gullivent', '143-976-6608', 'ogulliventg@shinystat.com', 2),
       (18, 'Siusan', 'Jobke', '284-870-5298', 'sjobkeh@home.pl', 4),
       (19, 'Martin', 'Penchev', '679-129-3977', 'mpenchev@hostgator.com', 8),
       (20, 'Wesley', 'Grishaev', '337-589-8538', 'wgrishaevj@timesonline.co.uk', 7);
insert into buyers (id, first_name, last_name, phone, email, city_id)
values (1, 'Giuseppe', 'Rossi', '123-456-7890', 'giuseppe@example.com', 1),
       (2, 'Sophie', 'LefГЁvre', '234-567-8901', 'sophie@example.com', 2),
       (3, 'Lukas', 'MГјller', '345-678-975', 'lukas@example.com', 3),
       (4, 'Emily', 'Smith', '456-789-0122', 'emily@example.com', 4),
       (5, 'Francesco', 'Bianchi', '567-830-1234', 'francesco@example.com', 5),
       (6, 'Camille', 'Dubois', '678-901-54', 'camille@example.com', 6),
       (7, 'Felix', 'Schmidt', '789-012-3156', 'felix@example.com', 7),
       (8, 'Alexandra', 'Spasova', '80-123-4567', 'spasova@example.com', 8),
       (9, 'Luca', 'Ricci', '901-234-678', 'luca@example.com', 4),
       (10, 'William', 'Jones', '012-45-6389', 'william@example.com', 1),
       (11, 'Alessandro', 'Romano', '23-456-784', 'alessandro@example.com', 1),
       (12, 'Juliette', 'Martin', '24-567-811', 'juliette@example.com', 2),
       (13, 'Max', 'MГјller', '345-68-9012', 'max@example.com', 3),
       (14, 'Olivia', 'Taylor', '46-789-0123', 'olivia@example.com', 4),
       (15, 'Marco', 'Ricci', '56-890-1234', 'marco@example.com', 5),
       (16, 'Leonardo', 'Conti', '678-901-2345', 'leonardo@example.com', 6),
       (17, 'ChloГ©', 'Dubois', '789-012-3416', 'chloe@example.com', 7),
       (18, 'Bogomil', 'Genchev', '890-1232-4567', 'benjamin@example.com', 8),
       (19, 'Alice', 'Moreau', '901-234-5378', 'alice@example.com', 1),
       (20, 'Matteo', 'Russo', '123-456-7490', 'matteo@example.com', 1),
       (21, 'LГ©a', 'Dupont', '234-567-8935', 'lea@example.com', 2),
       (22, 'Paul', 'MГјller', '345-678-9612', 'paul@example.com', 3),
       (23, 'Sophia', 'Smith', '456-789-7123', 'sophia@example.com', 4),
       (24, 'Luigi', 'Rossi', '567-890-1134', 'luigi@example.com', 5),
       (25, 'Hugo', 'Martin', '678-901-23', 'hugo@example.com', 6),
       (26, 'AmГ©lie', 'Weber', '789-012-3456', 'amelie@example.com', 7),
       (27, 'Noah', 'Moreau', '890-123-4567', 'noah@example.com', 7),
       (28, 'Mia', 'Taylor', '901-234-5678', 'mia@example.com', 3),
       (29, 'Oliver', 'Brown', '012-345-69', 'oliver@example.com', 1);
insert into property_offers (property_id, agent_id, price, offer_datetime)
values (44, 8, 684373.96, '2022-09-04 02:46:07'),
       (31, 2, 78335.92, '2018-03-14 02:50:48'),
       (21, 1, 647444.24, '2020-12-16 05:32:27'),
       (14, 15, 767776.91, '2020-04-06 19:20:10'),
       (24, 2, 46056.22, '2021-10-07 21:23:16'),
       (14, 18, 629844.54, '2021-05-26 04:53:43'),
       (7, 8, 262955.10, '2023-02-21 14:31:53'),
       (23, 4, 360772.54, '2017-04-19 14:00:04'),
       (36, 11, 143492.78, '2022-01-07 10:48:40'),
       (48, 4, 609566.40, '2015-05-14 15:29:04'),
       (37, 7, 801286.96, '2021-02-07 06:25:12'),
       (55, 1, 879633.64, '2021-10-03 05:19:06'),
       (9, 15, 163407.83, '2015-08-15 06:00:09'),
       (4, 18, 369629.51, '2023-06-05 12:38:44'),
       (51, 14, 735753.57, '2021-05-24 05:45:23'),
       (2, 12, 276764.64, '2018-07-08 01:10:50'),
       (55, 1, 934789.25, '2022-10-13 16:15:11'),
       (41, 13, 332812.32, '2018-06-20 21:36:26'),
       (35, 15, 621113.92, '2016-12-14 03:50:30'),
       (18, 15, 476698.87, '2017-03-15 04:26:51'),
       (31, 11, 625238.84, '2019-03-10 01:22:55'),
       (34, 2, 340321.59, '2015-01-13 04:06:13'),
       (37, 11, 138723.19, '2021-09-29 09:01:40'),
       (54, 19, 892604.47, '2021-09-08 20:14:39'),
       (11, 20, 110567.83, '2015-08-09 18:52:30'),
       (20, 15, 391223.29, '2023-03-20 04:50:58'),
       (17, 7, 151643.03, '2015-06-23 08:45:00'),
       (19, 17, 464012.71, '2023-01-30 12:38:42'),
       (23, 13, 155400.69, '2019-06-08 12:37:31'),
       (7, 15, 373048.80, '2020-09-09 00:26:39'),
       (23, 18, 253099.40, '2023-03-17 22:09:48'),
       (16, 7, 62569.81, '2017-08-20 06:48:24'),
       (8, 17, 168761.37, '2021-05-08 02:12:23'),
       (26, 17, 5924.23, '2016-12-07 16:35:01'),
       (40, 11, 562117.32, '2017-06-27 07:42:34'),
       (19, 16, 783410.81, '2022-05-24 17:16:53'),
       (31, 15, 69661.21, '2017-06-11 07:10:11'),
       (47, 5, 924009.63, '2018-07-18 20:25:01'),
       (25, 13, 34031.17, '2017-06-19 11:11:30'),
       (23, 1, 266221.77, '2015-12-12 11:49:17'),
       (9, 4, 439936.52, '2021-12-29 16:01:33'),
       (40, 2, 221246.93, '2017-01-10 14:30:56'),
       (5, 4, 325774.30, '2020-08-28 13:51:08'),
       (31, 13, 663474.29, '2022-09-21 18:02:41'),
       (20, 14, 268261.52, '2019-12-08 08:45:24'),
       (11, 12, 728277.45, '2016-05-21 05:07:32'),
       (23, 8, 433747.18, '2019-03-02 13:02:54'),
       (51, 9, 79042.05, '2016-04-08 06:57:00'),
       (52, 8, 81166.71, '2019-08-05 21:22:16'),
       (56, 11, 878319.32, '2022-01-14 12:46:50'),
       (12, 5, 981963.24, '2023-02-08 07:05:43'),
       (27, 17, 550468.96, '2020-10-13 10:13:29'),
       (1, 10, 903051.18, '2016-01-04 14:33:13'),
       (1, 19, 778621.69, '2016-06-28 14:02:29'),
       (47, 15, 823544.66, '2018-04-06 06:00:34'),
       (52, 4, 707559.30, '2018-12-12 19:42:07'),
       (31, 12, 575679.77, '2021-09-18 18:58:05'),
       (8, 8, 38060.40, '2016-12-20 01:15:11'),
       (26, 3, 279677.89, '2019-05-06 20:34:23'),
       (4, 6, 585417.13, '2021-06-27 21:54:48'),
       (32, 17, 970311.90, '2015-02-25 09:03:03'),
       (23, 13, 12004.99, '2020-10-05 18:28:33'),
       (38, 13, 582128.84, '2023-05-28 14:37:32'),
       (2, 16, 862594.15, '2015-06-09 20:36:58'),
       (8, 1, 485704.04, '2021-04-25 02:55:44'),
       (33, 7, 462887.02, '2015-11-22 14:21:49'),
       (35, 8, 519289.82, '2015-03-31 21:30:26'),
       (28, 6, 420258.44, '2015-05-27 05:59:57'),
       (56, 6, 649395.39, '2019-06-08 22:53:13'),
       (51, 9, 433351.05, '2015-07-21 16:23:55'),
       (44, 11, 684957.82, '2017-12-17 09:07:45'),
       (32, 13, 24353.30, '2017-06-04 18:51:29'),
       (42, 15, 207999.64, '2023-06-19 06:54:48'),
       (44, 8, 939751.72, '2018-05-24 01:43:38'),
       (32, 11, 465467.31, '2015-06-24 16:47:24'),
       (45, 1, 132770.47, '2016-05-13 19:02:16'),
       (7, 17, 825561.59, '2023-05-14 08:01:33'),
       (32, 8, 583521.03, '2017-03-31 12:58:47'),
       (18, 8, 478805.98, '2021-02-28 23:42:59'),
       (3, 7, 90617.06, '2022-05-05 06:27:49'),
       (25, 2, 454190.93, '2017-09-29 00:59:13'),
       (11, 19, 131342.25, '2016-01-25 23:41:22'),
       (54, 3, 431997.64, '2021-03-10 20:11:20'),
       (43, 11, 333688.67, '2022-08-22 11:01:27'),
       (30, 14, 899961.42, '2016-09-01 09:37:19'),
       (41, 3, 784375.02, '2023-04-28 01:06:02'),
       (38, 6, 188429.94, '2015-11-08 20:07:11'),
       (8, 17, 120667.24, '2021-05-18 19:46:17'),
       (22, 9, 852941.61, '2016-04-19 18:42:12'),
       (25, 12, 70774.61, '2019-04-11 03:49:55'),
       (50, 13, 768796.57, '2020-01-13 05:31:37'),
       (16, 13, 810003.48, '2021-07-02 16:51:16'),
       (32, 14, 171924.79, '2017-11-20 09:12:34'),
       (24, 14, 691986.59, '2018-09-20 05:34:03'),
       (5, 5, 1691.78, '2020-04-03 12:39:04'),
       (28, 6, 147229.54, '2022-03-07 23:48:27'),
       (31, 18, 324726.81, '2015-08-06 13:05:05'),
       (33, 3, 377989.70, '2016-03-17 23:42:36'),
       (49, 8, 994933.10, '2019-09-14 12:05:13'),
       (21, 10, 647932.56, '2018-02-06 01:47:04');
insert into property_transactions (id, property_id, buyer_id, transaction_date, bank_name, iban, is_successful)
values (1, 14, 8, '2019-12-08', 'City Bank', 'BE7109612456769', 1),
       (2, 32, 10, '2005-04-07', 'First National Bank', 'SE720000810340009783246', 1),
       (3, 47, 13, '2009-12-23', 'First National Bank', 'NL3RABO0300065264', 1),
       (4, 56, 11, '2010-11-22', 'City Bank', 'NL39RABO030062264', 1),
       (5, 48, 16, '2013-04-11', 'United Financial', 'FR140041010050500013M02606', 1),
       (6, 3, 19, '2009-10-28', 'United Financial', 'ES911000418450200051332', 1),
       (7, 56, 27, '2003-04-13', 'Central Savings', 'NL39RABO0300065164', 1),
       (8, 48, 9, '2005-04-25', 'Central Savings', 'GB29NWBK60161331326819', 1),
       (9, 22, 13, '2002-09-12', 'Central Savings', 'FR1420041010050500013M02606', 1),
       (10, 39, 25, '2011-04-13', 'United Financial', 'NL39RABO0300065264', 1),
       (11, 4, 5, '2017-03-01', 'City Bank', 'GB29NWBK60161331926879', 1),
       (12, 47, 6, '2006-01-05', 'United Financial', 'CH9300762011523852957', 1),
       (13, 37, 1, '2010-08-16', 'United Financial', 'AT6119043002473201', 1),
       (14, 32, 24, '2022-01-08', 'Central Savings', 'SE7280000834009783246', 1),
       (15, 29, 10, '2009-03-19', 'United Financial', 'CH93007601623852957', 1),
       (16, 37, 3, '2021-09-28', 'Central Savings', 'GB29NWBK616331926819', 1),
       (17, 34, 27, '2012-03-16', 'First National Bank', 'AT61943002333573201', 1),
       (18, 30, 6, '2022-08-28', 'United Financial', 'FR14204110050500013M02606', 1),
       (19, 41, 17, '2004-08-10', 'Central Savings', 'AT6110400234573601', 1),
       (20, 43, 20, '2018-01-09', 'United Financial', 'AT61904300234573101', 0),
       (21, 51, 27, '2003-06-04', 'Central Savings', 'IT6X0542811101000000123456', 1),
       (22, 13, 27, '2014-03-18', 'City Bank', 'DE8937040440532013000', 1),
       (23, 3, 14, '2001-03-01', 'Central Savings', 'IT0X0542811101000000123456', 1),
       (24, 11, 5, '2008-11-23', 'City Bank', 'SE728000810340009783246', 1),
       (25, 3, 14, '2017-11-19', 'First National Bank', 'AT61904300234513201', 1),
       (26, 19, 26, '2021-05-08', 'Global Trust Bank', 'NL39ABO0300065264', 1),
       (27, 13, 20, '2004-10-14', 'Global Trust Bank', 'NL3RABO03002365264', 1),
       (28, 52, 9, '2011-06-01', 'City Bank', 'SE728000081340009783246', 0),
       (29, 5, 14, '2015-09-26', 'Global Trust Bank', 'IT0X05428111000123456', 1),
       (30, 31, 4, '2003-12-05', 'United Financial', 'SE28000081030009783246', 0),
       (31, 21, 19, '2016-02-05', 'Global Trust Bank', 'DE893040040532013000', 1),
       (32, 46, 3, '2007-07-11', 'First National Bank', 'GB2NWBK6061331926819', 1),
       (33, 42, 10, '2002-08-02', 'Global Trust Bank', 'SE78000081340009783246', 1),
       (34, 8, 25, '2009-03-14', 'Central Savings', 'DE893040044052013000', 1),
       (35, 33, 21, '2012-03-09', 'Central Savings', 'AT6190430024573201', 1),
       (36, 19, 7, '2003-12-09', 'Global Trust Bank', 'N39RABO030065264', 1),
       (37, 7, 10, '2019-12-19', 'Central Savings', 'FR1204101050500013M02606', 1),
       (38, 38, 13, '2011-08-12', 'Global Trust Bank', 'ES9200018450200051332', 0),
       (39, 27, 2, '2010-09-14', 'Global Trust Bank', 'NL39RBO000065264', 1),
       (40, 40, 24, '2020-11-02', 'Global Trust Bank', 'SE72000810340009783246', 1);
       
       
       
/*******************************************************************************************************************************************************************************/


/****	02. Insert		***************************************************************************************************************************************************************************/

/*You will have to insert records of data into the property_transactions table.
The new data will be based on property_offers with agent_id equal or less than 2. Insert data in the property_transactions table with the following values:
•	property_id – set it to the agent_id plus the days of the offer's datetime.
•	buyer_id – set it to the agent_id plus the month number of the offer's datetime.
•	transaction_date– set it to the date only of the offer's datetime.
•	bank_name – set it to "Bank" followed by whitespace and then followed by agent_id.
•	iban – set it to "BG" followed by price and then followed by agent_id.
•	is_successful – set it to true.					*/

INSERT INTO property_transactions (property_id, buyer_id, transaction_date, bank_name, iban, is_successful)
SELECT
    agent_id + DAY(offer_datetime) AS property_id,
    agent_id + MONTH(offer_datetime) AS buyer_id,
    DATE(offer_datetime) AS transaction_date,
    CONCAT('Bank ', agent_id) AS bank_name,
    CONCAT('BG', price, agent_id) AS iban,
    TRUE AS is_successful
FROM property_offers
WHERE agent_id <= 2;








/*****			03. Update				**************************************************************************************************************************************************************************/
/* There are some tax frauds and you have to correct the price for some properties. 
You must reduce the price by 50 000 for all properties that cost more or equal to 800 000. 	*/

UPDATE properties
SET price = price - 50000
WHERE price >= 800000;






/*****		04. Delete		**************************************************************************************************************************************************************************/
/* Delete all property_transactions that are not successful. 	*/

DELETE FROM property_transactions
WHERE is_successful = FALSE;





/******		05. Agents			*************************************************************************************************************************************************************************/
/* Extract from the real_estate_db, info about the agents.
Order the results by city_id in descending and then by phone in descending.
Required Columns
•	id
•	first_name
•	last_name
•	phone
•	email
•	city_id						*/

SELECT id, first_name, last_name, phone, email, city_id
FROM agents
ORDER BY city_id DESC, phone DESC;





/******	06. Offers from 2021			***********************************************************************************************************************************************************************/
/* Write a query that returns: property_id, agent_id, price and offer_datetime from table property_offers. Filter offers only from 2021 year.
Order the results ascending by price and show only the first 10 results.
Required Columns
•	property_id
•	agent_id
•	price
•	offer_datetime										*/

SELECT property_id, agent_id, price, offer_datetime
FROM property_offers
WHERE YEAR(offer_datetime) = 2021
ORDER BY price ASC
LIMIT 10;




	
/*******		07. Properties without offers			************************************************************************************************************************************************************************/
/* Some properties are not included in offers and don’t have an agent.
Write a query that returns:  agent_name and price for all properties that are not included in any offer.
To find their agent_name you must take the first 6 letters from the address and to find the offered price you need 
to get the number of characters in the address and multiply it by 5430.
Order by agent_name in descending order and then by price in descending order.
Required Columns
•	agent_name (first 6 characters from address)
•	price (number of characters in the address multiplied by 5430 								*/

SELECT
    LEFT(address, 6) AS agent_name,
    CHAR_LENGTH(address) * 5430 AS price
FROM properties
LEFT JOIN property_offers ON properties.id = property_offers.property_id
WHERE property_offers.property_id IS NULL
ORDER BY agent_name DESC, price DESC;

SELECT
    LEFT(address, 6) AS agent_name,
    LENGTH(address) * 5430 AS price
FROM properties
WHERE id NOT IN (SELECT DISTINCT property_id FROM property_offers)
ORDER BY agent_name DESC, price DESC;








/******		08. Best Banks			*************************************************************************************************************************************************************************/
/* Our popular real estate app is set to highlight the top banks that have facilitated 9 or more transactions within our database.
Extract from the database, the banks that have 9 or more ibans used for transactions.
Order the results by count in descending and then by bank_name in ascending.
Required Columns
•	bank_name 
•	count						*/

SELECT
    bank_name,
    COUNT(*) AS countd
FROM property_transactions
GROUP BY bank_name
HAVING COUNT(*) >= 9
ORDER BY COUNT(*) DESC, bank_name ASC;







/******		09. Size of the area		*************************************************************************************************************************************************************************/
/* From the database extract the address and area and assign the size. If it is less or equal 100 is "small", "medium" is lesser 
or equal to 200, "large"is lesser or equal to 500 and above 500 is "extra large".
Order the results ascending by area and then by address in descending. 
Required Columns
•	address
•	area
•	size (small  is lesser or equal 100, medium is  lesser or equal to 200, large is lesser or equal to 500 and above 500 is extra large)  */

SELECT
    address,
    area,
    CASE
        WHEN area <= 100 THEN 'small'
        WHEN area <= 200 THEN 'medium'
        WHEN area <= 500 THEN 'large'
        ELSE 'extra large'
    END AS size
FROM properties
ORDER BY area ASC, address DESC;





/****		10. Offers count in a city		***************************************************************************************************************************************************************************/
/* Create a user defined function with the name udf_offers_from_city_name (cityName VARCHAR(50)) that receives a city name and returns the total number of offers from that city.
Required Columns
•	offers_count (udf_offers_from_city_name)			*/

DELIMITER //
CREATE FUNCTION udf_offers_from_city_name(cityName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM property_offers
        JOIN properties ON property_offers.property_id = properties.id
        JOIN cities ON properties.city_id = cities.id
        WHERE cities.name = cityName
    );
END //
DELIMITER ;



CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50))
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(property_offers.property_id)
    FROM property_offers
    INNER JOIN properties ON property_offers.property_id = properties.id
    INNER JOIN cities ON properties.city_id = cities.id
    WHERE cities.name = cityName
);

SELECT udf_offers_from_city_name('Amsterdam') AS offers_count;








/*****		11. Special Offer			**************************************************************************************************************************************************************************/
/* The real estate agents want to make special offers for their loyal clients. Your task is to find all offers from an agent and reduce the prices by 10%.
Create a stored procedure udp_special_offer which accepts the following parameters:
•	first_name VARCHAR(50)											*/

DELIMITER //
CREATE PROCEDURE udp_special_offer(IN first_name VARCHAR(50))
BEGIN
    UPDATE property_offers
    JOIN agents ON property_offers.agent_id = agents.id
    SET property_offers.price = property_offers.price * 0.9
    WHERE agents.first_name = first_name;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE udp_special_offer(IN first_name VARCHAR(50))
BEGIN
    UPDATE property_offers
    SET price = price * 0.9
    WHERE agent_id IN (
        SELECT agents.id
        FROM agents
        WHERE agents.first_name = first_name
    );
END //
DELIMITER ;


CALL udp_special_offer('Hans');