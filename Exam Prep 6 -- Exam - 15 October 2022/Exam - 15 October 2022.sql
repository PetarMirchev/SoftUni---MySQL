
CREATE DATABASE restaurant_db;
USE restaurant_db;


CREATE TABLE products (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE,
    type VARCHAR(30) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);



CREATE TABLE clients (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    card VARCHAR(50),
    review TEXT
);


CREATE TABLE tables (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    floor INT NOT NULL,
    reserved BOOLEAN,
	capacity INT NOT NULL
);



CREATE TABLE waiters (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
	salary DECIMAL(10,2)
);


CREATE TABLE orders (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    table_id INT NOT NULL,
    waiter_id INT NOT NULL,
    order_time TIME NOT NULL,
    payed_status BOOLEAN,
    
    FOREIGN KEY (waiter_id) REFERENCES waiters(id),
    FOREIGN KEY (table_id) REFERENCES tables(id)
);



CREATE TABLE orders_clients (
    order_id INT,
    client_id INT,
    
    -- INDEX (country_id)
    KEY (order_id, client_id),   -- !!!!!!!!!!!!!!!!
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);



CREATE TABLE orders_products (
    order_id INT,
    product_id INT,
    
    -- INDEX (country_id)
    KEY (order_id, product_id),   -- !!!!!!!!!!!!!!!!
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


/********************************************************************************************************************************************/



insert into products (id, name, type, price)
values  (1, 'Johnnie Walker Red Label', 'Whiskey', 6.00),
        (2, 'Johnnie Walker Black Label 12Y', 'Whiskey', 10.00),
        (3, 'J & B Rare', 'Whiskey', 6.00),
        (4, 'Balantines finest blended scot', 'Whiskey', 6.00),
        (5, 'Chivas Regal 12YO', 'Whiskey', 9.00),
        (6, 'Jameson Irish Whiskey', 'Whiskey', 6.00),
        (7, 'Jameson Black Barrel', 'Whiskey', 9.00),
        (8, 'The Porgues Single Malt Irish ', 'Whiskey', 9.00),
        (9, 'Four Roses Bourbon Whiskey', 'Whiskey', 6.00),
        (10, 'Jack Daniel''s Tenessee Whiskey', 'Whiskey', 8.00),
        (11, 'Bulleit Bourbon', 'Whiskey', 10.00),
        (12, 'American Straight BULLEIT 95 R', 'Whiskey', 11.00),
        (13, 'The Glenlivet 12YO Single Malt', 'Whiskey', 12.00),
        (14, 'The Glenlivet Licensed Dram', 'Whiskey', 14.00),
        (15, 'Amrut Indian Single Malt', 'Whiskey', 15.00),
        (16, 'Finlaggan', 'Whiskey', 15.00),
        (17, 'Nikka From the Barrel', 'Whiskey', 14.00),
        (18, 'Nikka Super', 'Whiskey', 18.00),
        (19, 'Beefeater London Dry Gin', 'Gin', 6.00),
        (20, 'Beefeater Pink Gin', 'Gin', 6.00),
        (21, 'Bombay Sapphire Gin', 'Gin', 7.00),
        (22, 'Plymouth Gin', 'Gin', 9.00),
        (23, 'Malfy con Arancia Sicilian Blo', 'Gin', 9.00),
        (24, 'Malfy Rosa Sicilian Pink Grape', 'Gin', 9.00),
        (25, 'Hendrick''s Gin', 'Gin', 10.00),
        (26, 'Zelenaja Marka', 'Vodka', 5.00),
        (27, 'Vodka Absolut Blue', 'Vodka', 6.00),
        (28, 'Rejka Small Batch Vodka - Icel', 'Vodka', 8.00),
        (29, 'Brandy Ararat 5YO Armenia', 'Cognac', 6.00),
        (30, 'Brandy Sarajishvili VS, Georgi', 'Cognac', 8.00),
        (31, 'Martell VS Single Distillery F', 'Cognac', 10.00),
        (32, 'Barcelo Anejo Ron Dominicano 4', 'Rum', 6.00),
        (33, 'Havana Club 3YO Rum', 'Rum', 5.00),
        (34, 'Havana Club Anejo Especial', 'Rum', 5.00),
        (35, 'Havana Club 7YO Rum', 'Rum', 9.00),
        (36, 'Tequila Olmeca Gold', 'Tequila', 3.50),
        (37, 'Tequila Olmeca Blanco', 'Tequila', 3.50),
        (38, 'Ракия Ябълкова отлежала Испери', 'Rakia', 4.00),
        (39, 'Бистра Мускатова Ракия Кортен ', 'Rakia', 5.00),
        (40, 'Отлежала Ракия от Мускат Отоне', 'Rakia', 6.00),
        (41, 'Whiskey Sour', 'Cocktail', 12.00),
        (42, 'Boston Sour', 'Cocktail', 12.00),
        (43, 'Whiskey Fix', 'Cocktail', 12.00),
        (44, 'Old Fashioned', 'Cocktail', 14.00),
        (45, 'Gin Tonic', 'Cocktail', 10.00),
        (46, 'Gin Tonic VS', 'Cocktail', 14.00),
        (47, 'Martini', 'Cocktail', 12.00),
        (48, 'Vodka Martini', 'Cocktail', 12.00),
        (49, 'White Russian', 'Cocktail', 12.00),
        (50, 'Bloody Mary', 'Cocktail', 12.00),
        (51, 'Margarita', 'Cocktail', 14.00),
        (52, 'Paloma', 'Cocktail', 14.00),
        (53, 'Sidecar', 'Cocktail', 14.00),
        (54, 'Brandy Alexander', 'Cocktail', 14.00),
        (55, 'Gingerpolitan', 'Cocktail', 14.00),
        (56, 'Sour Cherry Sour', 'Cocktail', 12.00),
        (57, 'Малка Наливна Бира / Small Dra', 'Beer', 4.00),
        (58, 'Голяма Наливна Бира / Large Dr', 'Beer', 6.00),
        (59, 'Биричка 10'' / Birichka Beer 10', 'Beer', 3.50),
        (60, 'Витошко Лале Светло / Vitosha ', 'Beer', 5.50),
        (61, 'Витошко Лале БЛОНД 10'' / Vitos', 'Beer', 5.50),
        (62, 'Витошко Лале ВАЙС / Vitosha Tu', 'Beer', 7.00),
        (63, 'Голям Пустиняк 7 Вида Малц / G', 'Beer', 6.00),
        (64, 'Bernard 10''', 'Beer', 7.00),
        (65, 'Bernard SWING', 'Beer', 8.00),
        (66, 'Primator', 'Beer', 6.50),
        (67, 'Primator MOTHER IN LAW IPL 11''', 'Beer', 7.50),
        (68, 'Clausthaler Unfiltered', 'Beer', 4.50),
        (69, 'Капатово Шардоне, Вионие и Сов', 'Wine', 7.00),
        (70, 'Капатово 2019г. Червен Бленд /', 'Wine', 7.00),
        (71, 'Типченица Червено вино Рубин, ', 'Wine', 7.00),
        (72, 'Типченица Розе, Рубин, Сира / ', 'Wine', 7.00),
        (73, 'Типченица Бяло Вино Врачански ', 'Wine', 7.00),
        (74, 'Prosecco', 'Wine', 6.00),
        (75, 'Совиньон Блан Салинас 2019г. 0', 'Wine', 32.00),
        (76, 'Ризлинг и Траминер Салинас 201', 'Wine', 32.00),
        (77, 'Совиньон Блан Резерва Сейнт Кл', 'Wine', 32.00),
        (78, 'Капатово Совиньон Блан и Виони', 'Wine', 40.00),
        (79, 'Sovignon Blan Special', 'Wine', 40.00),
        (80, 'Пино Ноар Салинас 2019г. 0,75л', 'Wine', 32.00),
        (81, 'Салла 2018г. Пино Ноар и Кабер', 'Wine', 40.00),
        (82, 'Капатово Гренаж, Мурведър и Си', 'Wine', 40.00),
        (83, 'Капатово Сира, Пети Вердо и Пр', 'Wine', 40.00),
        (84, 'Пино Ноар и Каберне Фран Салин', 'Wine', 32.00),
        (85, 'Розе от Гренаж и Мурведър, Кап', 'Wine', 40.00),
        (86, 'Розе от Совиньон Блан Резерва ', 'Wine', 40.00),
        (87, 'Coca Cola, Schweppes', 'Non alcoholic', 2.50),
        (88, 'Mineral Water Bankya 0.25л.', 'Non alcoholic', 2.00),
        (89, 'Mineral Water Bankya 1.5л.', 'Non alcoholic', 4.00),
        (90, 'CAPPY Glass 0.35л.', 'Non alcoholic', 3.00),
        (91, 'Fresh Orange 300ml.', 'Non alcoholic', 6.00),
        (92, 'Klopatar Craft Soda', 'Non alcoholic', 4.50),
        (93, 'Three Cents', 'Non alcoholic', 6.00),
        (94, 'Домашна Лимонада / Homemade Le', 'Non alcoholic', 5.00),
        (95, 'Домашен Сироп / Homemade Syrup', 'Non alcoholic', 5.00),
        (96, 'Espresso 100% Arabica', 'Non alcoholic', 2.50),
        (97, 'Espresso Macchiato', 'Non alcoholic', 3.00),
        (98, 'Cappuccino', 'Non alcoholic', 4.00),
        (99, 'Лате Макиато / Latte Machiato', 'Non alcoholic', 4.50),
        (100, 'Hot chocolate', 'Non alcoholic', 6.00),
        (101, 'Tea from Tea Vibes', 'Non alcoholic', 4.00),
        (102, 'Канелен Облак / Cinnamon Cloud', 'Non alcoholic', 5.00),
        (103, 'Пикантен фъстък / Spicy Peanut', 'Food', 3.00),
        (104, 'Печен фъстък / Roasted Peanuts', 'Food', 3.00),
        (105, 'Бадеми и Фъстъци микс / Almond', 'Food', 5.00),
        (106, 'Бадем / Almond', 'Food', 7.00),
        (107, 'Порция Маслини / Portion of Ol', 'Food', 3.50),
        (108, 'Класик (Прошуто, Червен Лук ', 'Food', 12.00),
        (109, 'Средиземноморски с Сушени до', 'Food', 13.00),
        (110, 'Три Вида Сирена и Сладко / T', 'Food', 14.00),
        (111, 'Козе Сирене / Goat Cheese', 'Food', 14.00),
        (112, 'Джаксън Поллок, с Шоколад и ', 'Food', 12.00),
        (113, 'Телешки Бургер / Beef Burger', 'Food', 12.00),
        (114, 'Вегетариански Бургер / Vegetar', 'Food', 14.00),
        (115, 'Нюрнбергски Наденички / Nürnbe', 'Food', 9.00),
        (116, 'Кезе Крайнер — Наденици с Емен', 'Food', 9.00),
        (117, 'Виенски кренвирши с хрян Wiene', 'Food', 7.50),
        (118, 'Супа на деня с Пида / Soup of ', 'Food', 5.50),
        (119, 'Салати / Salads', 'Food', 9.00),
        (120, 'Паста на Деня / Pasta of the D', 'Food', 9.00),
        (121, 'Десерт на Деня / Dolce of the ', 'Food', 5.50),
        (122, 'Mixed Bruschettas with Hummus ', 'Food', 14.80),
        (123, 'Mozzarella and Pesto', 'Food', 8.10),
        (124, 'Mixed Bruschettas 250 g.', 'Food', 9.80),
        (125, 'Prosciutto Crudo and Ricotta a', 'Food', 12.20),
        (126, 'Sun-dried Tomatoes', 'Food', 15.40),
        (127, 'NEW Burrata with Prosciutto Cr', 'Food', 12.00),
        (128, 'Arugula Pesto', 'Food', 10.30),
        (129, 'Mediterranean Dips 200 g.', 'Food', 11.30),
        (130, 'Tarama Wedges Potatoes 300 g.', 'Food', 16.50),
        (131, 'Truffle OilCheese', 'Food', 10.50),
        (132, 'Housemade Wedges Potatoes with', 'Food', 13.40),
        (133, 'Sauce and Pancetta Powder 300 ', 'Food', 11.70),
        (134, 'Mixed Grilled Vegetables 300 g', 'Food', 11.70),
        (135, 'Balsamico Virgin Olive Oil', 'Food', 14.40),
        (136, 'Chicken Crispy Fillets 300 g.', 'Food', 17.90),
        (137, 'Honey Mustard Sauce', 'Food', 13.50),
        (138, 'Crispy Mozzarella Sticks 200 g', 'Food', 9.80),
        (139, 'Marinara Sauce', 'Food', 8.30),
        (140, 'Housemade Falafel 200 g.', 'Food', 11.30),
        (141, 'Yogurt-Tahini Sauce', 'Food', 11.30),
        (142, 'Kibbeh 200 g.', 'Food', 8.60),
        (143, 'Beef Minced Meat with Bulgur', 'Food', 18.60),
        (144, 'Beef Carpaccio 150 g.', 'Food', 11.90),
        (145, 'ParmesanGel', 'Food', 16.30),
        (146, 'Deep Fried Calamari 200 g.', 'Food', 17.30),
        (147, 'Tarama', 'Food', 18.90),
        (148, 'NEW Shrimps a la Plancha 180 g', 'Food', 14.70),
        (149, 'Cherry Curry-Mayonnaise', 'Food', 12.90),
        (150, 'NEW Octopus 150 g.', 'Food', 12.60),
        (151, 'Cherry Tomatoes|', 'Food', 15.60),
        (152, 'Artichoke', 'Food', 18.40),
        (153, 'NEW Steamed Mussels 650 g.', 'Food', 15.60),
        (154, 'White Wine| Parsley', 'Food', 9.50),
        (155, 'NEW Mussels Saganaki 500 g.', 'Food', 19.70),
        (156, 'Tomato Sauce| Peppers| Onions ', 'Food', 14.30),
        (157, 'Freshly Baked Bread with Buffa', 'Food', 12.80),
        (158, 'Mozzarella 400 g.', 'Food', 10.20),
        (159, 'TomatoesPesto', 'Food', 8.40),
        (160, 'Stuffed Avocado 180 g.', 'Food', 12.90),
        (161, 'ShrimpsOnion', 'Food', 15.30),
        (162, 'LemonSauce', 'Food', 11.70),
        (163, 'Cold Cuts and Cheeses Plate 15', 'Food', 17.50),
        (164, 'NEW Rigatoni Al ‘Arrabiata’ 30', 'Food', 9.00),
        (165, 'Stracchino', 'Food', 5.50),
        (166, 'NEW Rigatoni with Pesto Genove', 'Food', 14.80),
        (167, 'Green Bean | Cherry | Parmesan', 'Food', 8.10),
        (168, '300 g', 'Food', 9.80),
        (169, 'Rigatoni Formaggi 300 g', 'Food', 12.20),
        (170, 'Cream | Parmesan | Gorgonzola ', 'Food', 15.40),
        (171, 'Scamorza | Cherry', 'Food', 12.00),
        (172, 'Housemade Potato Gnocchi 250 g', 'Food', 10.30),
        (173, 'Gorgonzola | Pepper Reduction', 'Food', 11.30),
        (174, 'Spaghetti with Burrata 300 g', 'Food', 16.50),
        (175, 'Tomato sauce| Basil', 'Food', 10.50),
        (176, 'Spaghetti Bolognese 300 g', 'Food', 13.40),
        (177, 'Beef Ragout| Parmesan', 'Food', 11.70),
        (178, 'Spaghetti with Truffle and Par', 'Food', 11.70),
        (179, 'Butter 300 g', 'Food', 14.40),
        (180, 'Linguine Nero di Seppia 300 g', 'Food', 17.90),
        (181, 'Shrimps | Garlic | Cherry | Pi', 'Food', 13.50),
        (182, 'Parmesan', 'Food', 9.80),
        (183, 'Agnolotti Stuffed with Ricotta', 'Food', 8.30),
        (184, 'Tomato Sauce | Mushrooms | Spi', 'Food', 11.30),
        (185, 'NEW Ravioli with Burrata 280 g', 'Food', 11.30),
        (186, 'Tomato Sauce | Parmesan | Basi', 'Food', 8.60),
        (187, 'Ravioli with Goat Cheese 300 g', 'Food', 18.60),
        (188, 'Tomato Sauce', 'Food', 11.90),
        (189, 'Pappardelle with Porcini 300 g', 'Food', 16.30),
        (190, 'Cream | Prosciutto Cotto | Par', 'Food', 17.30),
        (191, 'NEW Spaghetti Frutti di Mare 3', 'Food', 18.90),
        (192, 'Squids | Mussels | Shrimps| To', 'Food', 14.70),
        (193, 'Garlic | Parsley', 'Food', 12.90),
        (194, 'Porcini Risotto 350 g', 'Food', 12.60),
        (195, 'Carnaroli Rice | Scamorza | Pa', 'Food', 15.60),
        (196, 'NEW Risotto Frutti di Mare 350', 'Food', 18.40),
        (197, 'Carnaroli Rice | Squids | Muss', 'Food', 15.60),
        (198, 'Tomato sauce | Garlic | Parsle', 'Food', 9.50),
        (199, 'NEW Shrimp Risotto with Martin', 'Food', 19.70),
        (200, 'Vanilla Panna Cotta with Straw', 'Food', 10.50);
insert into clients (id, first_name, last_name, birthdate, card, review)
values  (88, 'Eal', 'Scorey', '2000-10-29', 'maestro', 'I tried to shatter it but got potato all over it.'),
        (57, 'Jedidiah', 'Thunnercliffe', '1999-09-26', null, 'I saw one of these in Bhutan and I bought one.'),
        (93, 'Debi', 'De Souza', '1999-04-29', 'visa', null),
        (31, 'Joye', 'Beveridge', '1999-04-29', 'maestro', 'I tried to pepper it but got prune all over it.'),
        (28, 'Kikelia', 'Hoyte', '1999-02-27', null, 'I tried to nail it but got strawberry all over it.'),
        (71, 'Everard', 'Danaher', '1998-05-25', 'visa', 'My co-worker Linnie has one of these. He says it looks wide.'),
        (53, 'Sharon', 'Burchatt', '1998-04-02', 'mastercard', null),
        (10, 'Sutherland', 'McGourty', '1998-02-18', 'switch', null),
        (14, 'Larina', 'Going', '1997-04-18', 'visa', null),
        (86, 'Coralyn', 'Alred', '1997-03-26', null, null),
        (38, 'Winnie', 'Hardinge', '1996-11-05', 'maestro', null),
        (25, 'Candide', 'Medcalfe', '1996-02-23', null, 'My penguin loves to play with it.'),
        (56, 'Cyndi', 'Lawn', '1995-03-08', 'visa', 'this pizza is slurpee.'),
        (40, 'Conn', 'Scogings', '1993-08-04', 'mastercard', null),
        (100, 'Pete', 'Cogle', '1993-04-29', 'switch', null),
        (66, 'Arv', 'Helgass', '1992-08-20', 'mastercard', 'I tried to electrocute it but got sweetmeat all over it.'),
        (85, 'Caralie', 'Ledur', '1992-07-18', 'visa-electron', null),
        (39, 'Bibby', 'Sturgis', '1992-06-18', 'mastercard', 'this Pasta is awesome.'),
        (68, 'Gabbie', 'Peploe', '1992-03-15', 'visa-electron', 'i use it for 10 weeks when i''m in my jail.'),
        (95, 'Aidan', 'Floris', '1991-11-10', 'switch', 'i use it every Tuesday when i''m in my store.'),
        (48, 'Silvio', 'Blyth', '1991-07-25', 'visa', 'I saw one of these in Moldova and I bought one.'),
        (23, 'Merv', 'Carney', '1990-03-09', 'visa-electron', 'This Pasta works very well. It harmonically improves my tennis by a lot.'),
        (33, 'Bartel', 'Cow', '1990-03-02', null, 'The box this comes in is 4 yard by 5 inch and weights 12 pound!'),
        (32, 'Kitty', 'Lyte', '1989-07-03', 'visa-electron', 'i use it on Mondays when i''m in my fort.'),
        (9, 'Marya', 'Niessen', '1989-06-09', null, 'The box this comes in is 5 light-year by 6 foot and weights 17 megaton!!!'),
        (52, 'Hillery', 'Staples', '1989-04-21', 'mastercard', null),
        (15, 'Devlin', 'Ciobotaro', '1989-01-08', 'visa-electron', 'My neighbor Krista has one of these. She works as a salesman and she says it looks soapy.'),
        (99, 'Norine', 'Burbudge', '1988-12-14', null, 'The box this comes in is 5 yard by 6 centimeter and weights 12 kilogram.'),
        (43, 'George', 'Dymocke', '1988-04-03', null, 'i use it barely when i''m in my store.'),
        (61, 'Colleen', 'Lawling', '1988-03-25', 'visa-electron', 'this pizza is mellow.'),
        (21, 'Innis', 'Peebles', '1987-12-06', 'mastercard', null),
        (47, 'Desi', 'Bogges', '1987-10-10', 'mastercard', 'The box this comes in is 3 meter by 6 yard and weights 12 pound.'),
        (65, 'Rudolfo', 'Rushbury', '1987-04-07', 'visa-electron', 'This pizza works too well. It buoyantly improves my football by a lot.'),
        (26, 'Lars', 'Byars', '1987-01-19', 'switch', 'My neighbor Elisha has one of these. She works as a fortune teller and she says it looks floppy.'),
        (13, 'Rafi', 'MacElholm', '1986-06-13', 'mastercard', null),
        (42, 'Celestyn', 'Clacson', '1985-06-15', 'mastercard', 'This Pasta works too well. It buoyantly improves my football by a lot.'),
        (80, 'Ami', 'Deason', '1981-12-02', 'mastercard', null),
        (19, 'Honoria', 'Clewlowe', '1980-12-10', null, 'talk about bliss!!'),
        (79, 'Magnum', 'Corran', '1980-10-18', null, 'My co-worker Mitchell has one of these. He says it looks dry.'),
        (78, 'Almira', 'Dodgshon', '1980-03-14', 'mastercard', null),
        (55, 'Laney', 'Klemz', '1979-12-05', 'maestro', 'My locust loves to play with it.'),
        (12, 'Trudie', 'Swayte', '1979-10-14', null, 'heard about this on melodic death metal radio, decided to give it a try.'),
        (46, 'Chantal', 'Sor', '1978-12-04', null, 'My neighbor Krista has one of these. She works as a salesman and she says it looks soapy.'),
        (77, 'Steffie', 'Gwyneth', '1978-11-27', 'mastercard', 'this pizza is complimentary.'),
        (51, 'Frances', 'Hagley', '1978-07-29', 'visa-electron', 'this Pasta is dominant.'),
        (89, 'Alphard', 'Skelly', '1978-05-15', null, 'My neighbor Lori has one of these. She works as a taxidermist and she says it looks whopping.'),
        (3, 'Elihu', 'Mottershaw', '1976-12-07', 'maestro', 'I''m very glad to have found this site. I loved the pasta burger cocktail. I was in the mood for something spicy and it was delicious! I would definitely order this again.'),
        (5, 'Rogers', 'Haswall', '1976-04-01', 'switch', 'talk about optimism!!!'),
        (69, 'Roberto', 'Skettles', '1976-01-29', 'visa-electron', 'heard about this on alternative dance radio, decided to give it a try.'),
        (11, 'Carver', 'Ionnidis', '1974-09-24', 'maestro', 'This Pasta works considerably well. It secretly improves my basketball by a lot.'),
        (75, 'Morris', 'Corneil', '1974-06-20', 'visa', 'talk about irritation.'),
        (20, 'Bailey', 'Worrell', '1974-06-07', 'switch', 'one of my hobbies is cooking. and when i''m cooking this works great.'),
        (62, 'Jennie', 'Water', '1974-04-18', null, 'My co-worker Matthew has one of these. He says it looks gigantic.'),
        (1, 'Patience', 'Sermin', '1973-04-02', null, 'I was looking for something different for my next birthday party - so I was on the lookout for something at the supermarket for my boyfriend. They didn''t have anything that I liked, but when I got to the checkout, I noticed a pasta burger cocktail, and I was like "why not?" So I bought it, and it was so delicious! Everybody loved it, and even the cheese sauce was perfect :D I was very happy with the purchase :)'),
        (50, 'Oren', 'Vlahos', '1973-03-31', 'switch', 'My co-worker Knute has one of these. He says it looks smoky.'),
        (37, 'Leena', 'Flag', '1973-03-17', null, 'talk about anticipation!'),
        (36, 'Harlin', 'Blease', '1972-12-19', 'visa-electron', 'My co-worker Merwin has one of these. He says it looks bubbly.'),
        (70, 'Salvidor', 'Pocock', '1972-06-11', null, 'talk about hatred!!!'),
        (6, 'Claiborn', 'Algar', '1971-01-07', 'visa-electron', 'i use it hardly when i''m in my prison.'),
        (4, 'Charil', 'Sheaber', '1970-02-24', 'visa', 'this Pasta is papery.'),
        (29, 'Charmian', 'Robberts', '1970-02-23', 'visa-electron', 'This Pasta works so well. It delightedly improves my football by a lot.'),
        (7, 'Willette', 'Croser', '1969-10-11', 'switch', null),
        (60, 'Malchy', 'Argue', '1969-09-11', null, null),
        (64, 'Wrennie', 'De Mitri', '1969-07-05', null, 'My co-worker Mitchell has one of these. He says it looks dry.'),
        (90, 'Rahal', 'De Angelis', '1968-10-03', 'visa-electron', 'talk about shame.'),
        (17, 'Haily', 'Whitwell', '1967-11-01', 'visa', 'My gentoo penguin loves to play with it.'),
        (59, 'Wynn', 'Baddam', '1967-08-17', 'mastercard', null),
        (74, 'Judah', 'Klimentyonok', '1967-05-02', null, null),
        (18, 'Claudianus', 'Klishin', '1964-06-05', 'mastercard', null),
        (63, 'Rutledge', 'McComas', '1964-04-06', null, 'My neighbor Krista has one of these. She works as a salesman and she says it looks soapy.'),
        (84, 'Amitie', 'Gudahy', '1963-11-13', 'maestro', null),
        (54, 'Harv', 'Kirkham', '1963-08-16', null, 'heard about this on folktronica radio, decided to give it a try.'),
        (82, 'Evangeline', 'Janata', '1963-07-11', 'mastercard', 'heard about this on chicha radio, decided to give it a try.'),
        (87, 'Paolo', 'Pesterfield', '1961-11-25', 'maestro', null),
        (2, 'Anitra', 'Jahn', '1961-05-29', 'mastercard', 'I am very happy with my pasta burger cocktail. It is great to have a drink at the end of a long day and the pasta burger cocktail is perfect for that. It is delicious, refreshing and unique. I am glad I found this product on this site.
Thanks!'),
        (91, 'Alvina', 'Godber', '1961-04-01', 'mastercard', null),
        (24, 'Austin', 'Cooksey', '1961-01-23', 'switch', null),
        (98, 'Geraldine', 'Doghartie', '1961-01-17', 'mastercard', 'I tried to pinch it but got peanut all over it.'),
        (44, 'Talya', 'Feathersby', '1960-09-14', 'mastercard', 'My co-worker Reed has one of these. He says it looks microscopic.'),
        (22, 'Myrvyn', 'Tunnadine', '1959-08-16', null, 'this Pasta is smooth.'),
        (97, 'Helga', 'Wheelwright', '1958-07-14', 'visa-electron', null),
        (8, 'Davidde', 'Liver', '1957-09-04', 'switch', null),
        (96, 'Ellette', 'Collyer', '1957-03-25', null, 'talk about hatred!!!'),
        (72, 'Sandra', 'Ferrone', '1956-09-14', 'switch', null),
        (67, 'Luciana', 'Gellion', '1956-08-01', null, null),
        (41, 'Corella', 'Jerdon', '1956-06-30', null, 'This Pasta works so well. It hungrily improves my basketball by a lot.'),
        (49, 'Dulsea', 'Faltin', '1956-04-07', null, null),
        (27, 'Valery', 'Albrooke', '1956-02-07', 'visa', null),
        (58, 'Cordy', 'Dimitriou', '1956-02-03', 'visa', null),
        (92, 'Dyan', 'Rowan', '1955-11-07', null, null),
        (35, 'Aeriela', 'Hannaford', '1955-08-17', 'mastercard', 'It only works when I''m South Korea.'),
        (73, 'Fanchon', 'Friar', '1955-03-01', 'visa-electron', 'I tried to slay it but got truffle all over it.'),
        (34, 'Nalani', 'Crucitti', '1954-09-18', 'maestro', null),
        (83, 'Dale', 'Fforde', '1954-05-18', null, null),
        (94, 'Edouard', 'Clarke', '1953-07-16', null, 'this pizza is complimentary.'),
        (81, 'Alica', 'Florey', '1953-06-27', 'mastercard', 'I saw one of these in Haiti and I bought one.'),
        (30, 'Killy', 'Rubanenko', '1952-12-16', 'maestro', null),
        (76, 'Sib', 'Brownhall', '1952-06-01', 'maestro', 'one of my hobbies is baking. and when i''m baking this works great.'),
        (16, 'Kevina', 'Prahl', '1952-01-31', null, 'this Pasta is mellow.'),
        (45, 'Marcille', 'Gatheridge', '1952-01-05', 'visa-electron', 'this Pasta is smooth.');

insert into waiters (id, first_name, last_name, email, phone, salary)
values  (1, 'Andres', 'Moffat', 'amoffat0@devhub.com', '+86 339 536 9344', 1469.98),
        (2, 'Fredric', 'Oglevie', 'foglevie1@paginegialle.it', '+880 771 169 1581', 2198.01),
        (3, 'Christy', 'Levin', 'clevin2@symantec.com', '+33 712 850 8728', 1769.50),
        (4, 'Drusy', 'Broadis', 'dbroadis3@newyorker.com', '+86 727 731 8418', 1801.10),
        (5, 'Juana', 'Carrivick', 'jcarrivick4@etsy.com', '+237 359 237 0243', 1700.34),
        (6, 'Yoshiko', 'Charleston', 'ycharleston5@independent.co.uk', '+420 171 160 2054', null),
        (7, 'Raffarty', 'Fulger', 'rfulger6@discuz.net', '+86 949 235 7816', 1940.92),
        (8, 'Mohammed', 'Pinks', 'mpinks7@adobe.com', '+86 312 475 9476', 2055.47),
        (9, 'Eden', 'Clewer', 'eclewer8@ow.ly', '+216 900 742 5375', 2183.85),
        (10, 'Brandon', 'Geering', 'bgeering9@issuu.com', '+57 624 199 9795', 1362.45);
insert into tables (id, floor, reserved, capacity)
values  (1, 2, 0, 6),
        (2, 1, 1, 10),
        (3, 3, 0, 6),
        (4, 1, 0, 9),
        (5, 3, 1, 12),
        (6, 1, 1, 12),
        (7, 1, 1, 9),
        (8, 2, 0, 7),
        (9, 3, 1, 5),
        (10, 2, 1, 6),
        (11, 1, 0, 5),
        (12, 3, 0, 9),
        (13, 1, 0, 9),
        (14, 2, 1, 5),
        (15, 2, 1, 7),
        (16, 3, 1, 5),
        (17, 3, 1, 11),
        (18, 1, 0, 6),
        (19, 3, 1, 5),
        (20, 3, 0, 7),
        (21, 3, 1, 12),
        (22, 1, 1, 9),
        (23, 2, 0, 9),
        (24, 1, 0, 9),
        (25, 2, 0, 5),
        (26, 2, 1, 12),
        (27, 2, 1, 9),
        (28, 1, 1, 11),
        (29, 1, 1, 5),
        (30, 1, 0, 12);
insert into orders (id, table_id, waiter_id, order_time, payed_status)
values  (3, 16, 1, '17:27:49', 0),
        (32, 13, 1, '11:15:59', 1),
        (5, 16, 1, '17:45:42', 1),
        (42, 5, 1, '03:23:44', 1),
        (10, 6, 1, '02:06:27', 1),
        (33, 17, 1, '21:14:28', 0),
        (1, 25, 2, '19:37:20', 0),
        (18, 21, 2, '20:24:54', 0),
        (37, 7, 2, '00:56:02', 0),
        (38, 7, 2, '01:15:07', 1),
        (35, 25, 2, '02:34:34', 1),
        (34, 4, 2, '23:08:15', 1),
        (16, 11, 2, '20:15:54', 1),
        (30, 6, 3, '07:09:31', 0),
        (9, 25, 3, '18:06:54', 1),
        (12, 23, 3, '23:08:24', 0),
        (21, 26, 3, '20:40:18', 1),
        (2, 19, 4, '20:59:12', 1),
        (41, 20, 4, '12:26:00', 0),
        (7, 10, 4, '00:34:09', 1),
        (27, 29, 4, '08:07:26', 1),
        (6, 23, 4, '04:59:25', 1),
        (28, 20, 4, '07:33:07', 1),
        (25, 19, 6, '07:45:07', 0),
        (26, 19, 6, '05:03:31', 1),
        (31, 14, 6, '07:09:33', 0),
        (19, 15, 6, '05:03:33', 1),
        (14, 3, 6, '04:02:05', 1),
        (13, 12, 6, '18:36:23', 0),
        (22, 2, 8, '10:26:58', 1),
        (17, 18, 8, '04:39:57', 1),
        (39, 21, 8, '22:55:00', 1),
        (4, 27, 9, '05:21:04', 0),
        (20, 2, 9, '21:30:01', 0),
        (11, 14, 9, '02:56:23', 0),
        (40, 20, 9, '17:02:32', 0),
        (23, 26, 10, '05:44:40', 0),
        (29, 7, 10, '14:25:05', 1),
        (15, 27, 10, '14:56:01', 1),
        (36, 19, 10, '17:20:17', 0),
        (24, 3, 10, '06:15:05', 0),
        (8, 12, 10, '01:43:59', 0);
insert into orders_products (order_id, product_id)
values  (1, 1),
        (1, 4),
        (1, 33),
        (1, 53),
        (1, 54),
        (1, 91),
        (1, 172),
        (2, 21),
        (2, 34),
        (2, 57),
        (2, 68),
        (2, 90),
        (2, 103),
        (2, 111),
        (2, 134),
        (2, 135),
        (2, 139),
        (2, 143),
        (2, 145),
        (2, 148),
        (2, 161),
        (2, 174),
        (2, 182),
        (2, 188),
        (2, 194),
        (3, 9),
        (3, 25),
        (3, 34),
        (3, 36),
        (3, 38),
        (3, 70),
        (3, 78),
        (3, 82),
        (3, 106),
        (3, 151),
        (3, 152),
        (3, 158),
        (3, 182),
        (4, 5),
        (4, 28),
        (4, 58),
        (4, 74),
        (4, 77),
        (4, 85),
        (4, 117),
        (4, 120),
        (4, 128),
        (4, 151),
        (4, 154),
        (4, 162),
        (4, 167),
        (4, 181),
        (4, 190),
        (4, 194),
        (5, 17),
        (5, 20),
        (5, 34),
        (5, 68),
        (5, 101),
        (5, 116),
        (5, 122),
        (5, 141),
        (5, 197),
        (6, 21),
        (6, 33),
        (6, 81),
        (6, 86),
        (6, 110),
        (6, 122),
        (6, 132),
        (6, 171),
        (6, 190),
        (7, 21),
        (7, 40),
        (7, 47),
        (7, 70),
        (7, 84),
        (7, 89),
        (7, 117),
        (7, 132),
        (7, 143),
        (7, 155),
        (7, 166),
        (7, 184),
        (8, 3),
        (8, 42),
        (8, 62),
        (8, 71),
        (8, 90),
        (8, 90),
        (8, 100),
        (8, 100),
        (8, 116),
        (8, 120),
        (8, 122),
        (8, 151),
        (8, 153),
        (8, 163),
        (8, 169),
        (8, 182),
        (9, 17),
        (9, 19),
        (9, 20),
        (9, 37),
        (9, 57),
        (9, 100),
        (9, 101),
        (9, 101),
        (9, 118),
        (9, 136),
        (9, 145),
        (9, 154),
        (9, 157),
        (9, 186),
        (9, 190),
        (10, 23),
        (10, 34),
        (10, 43),
        (10, 48),
        (10, 50),
        (10, 99),
        (10, 168),
        (11, 40),
        (11, 42),
        (11, 94),
        (11, 96),
        (11, 108),
        (11, 128),
        (11, 140),
        (11, 141),
        (11, 180),
        (11, 186),
        (12, 4),
        (12, 12),
        (12, 21),
        (12, 33),
        (12, 50),
        (12, 107),
        (12, 116),
        (12, 126),
        (12, 127),
        (12, 143),
        (12, 146),
        (13, 15),
        (13, 58),
        (13, 71),
        (13, 112),
        (13, 134),
        (13, 180),
        (14, 20),
        (14, 28),
        (14, 45),
        (14, 53),
        (14, 62),
        (14, 66),
        (14, 94),
        (14, 97),
        (14, 116),
        (14, 143),
        (14, 157),
        (14, 168),
        (14, 175),
        (15, 10),
        (15, 19),
        (15, 32),
        (15, 38),
        (15, 41),
        (15, 45),
        (15, 46),
        (15, 54),
        (15, 59),
        (15, 130),
        (15, 136),
        (15, 136),
        (16, 3),
        (16, 23),
        (16, 24),
        (16, 28),
        (16, 52),
        (16, 88),
        (16, 116),
        (16, 122),
        (16, 127),
        (16, 157),
        (16, 163),
        (16, 171),
        (16, 172),
        (16, 173),
        (16, 177),
        (17, 16),
        (17, 62),
        (17, 74),
        (17, 77),
        (17, 107),
        (17, 131),
        (17, 155),
        (17, 166),
        (17, 183),
        (18, 22),
        (18, 44),
        (18, 64),
        (18, 66),
        (18, 81),
        (18, 82),
        (18, 100),
        (18, 102),
        (18, 117),
        (18, 127),
        (18, 136),
        (18, 161),
        (18, 176),
        (18, 187),
        (19, 30),
        (19, 67),
        (19, 86),
        (19, 111),
        (19, 125),
        (19, 135),
        (19, 149),
        (19, 168),
        (19, 186),
        (20, 24),
        (20, 30),
        (20, 61),
        (20, 80),
        (20, 91),
        (20, 100),
        (20, 143),
        (20, 149),
        (20, 154),
        (20, 157),
        (20, 170),
        (20, 185),
        (20, 190),
        (20, 190),
        (21, 26),
        (21, 32),
        (21, 45),
        (21, 67),
        (21, 115),
        (21, 132),
        (21, 135),
        (21, 141),
        (21, 148),
        (21, 166),
        (21, 176),
        (21, 189),
        (21, 191),
        (21, 196),
        (21, 197),
        (22, 5),
        (22, 6),
        (22, 6),
        (22, 7),
        (22, 22),
        (22, 28),
        (22, 32),
        (22, 34),
        (22, 64),
        (22, 66),
        (22, 68),
        (22, 99),
        (22, 106),
        (22, 122),
        (22, 165),
        (22, 182),
        (23, 12),
        (23, 16),
        (23, 28),
        (23, 30),
        (23, 62),
        (23, 63),
        (23, 104),
        (23, 122),
        (23, 128),
        (23, 143),
        (23, 160),
        (23, 189),
        (23, 199),
        (24, 17),
        (24, 17),
        (24, 29),
        (24, 40),
        (24, 41),
        (24, 57),
        (24, 62),
        (24, 78),
        (24, 85),
        (24, 101),
        (24, 124),
        (24, 137),
        (24, 146),
        (24, 171),
        (24, 171),
        (24, 182),
        (24, 183),
        (24, 192),
        (25, 6),
        (25, 15),
        (25, 27),
        (25, 52),
        (25, 87),
        (25, 91),
        (25, 101),
        (25, 123),
        (25, 153),
        (25, 163),
        (25, 172),
        (26, 5),
        (26, 24),
        (26, 27),
        (26, 29),
        (26, 35),
        (26, 47),
        (26, 51),
        (26, 74),
        (26, 88),
        (26, 123),
        (26, 154),
        (26, 176),
        (26, 197),
        (27, 15),
        (27, 86),
        (27, 109),
        (27, 146),
        (27, 162),
        (27, 185),
        (28, 16),
        (28, 33),
        (28, 59),
        (28, 99),
        (28, 100),
        (28, 111),
        (28, 135),
        (28, 151),
        (28, 182),
        (29, 12),
        (29, 18),
        (29, 24),
        (29, 94),
        (29, 104),
        (29, 117),
        (29, 157),
        (29, 158),
        (29, 185),
        (29, 188),
        (30, 18),
        (30, 51),
        (30, 53),
        (30, 100),
        (30, 109),
        (30, 109),
        (30, 125),
        (30, 138),
        (30, 144),
        (30, 173),
        (30, 180),
        (30, 192),
        (31, 46),
        (31, 60),
        (31, 110),
        (31, 119),
        (31, 122),
        (31, 154),
        (31, 159),
        (31, 160),
        (31, 180),
        (31, 190),
        (32, 22),
        (32, 31),
        (32, 32),
        (32, 42),
        (32, 47),
        (32, 51),
        (32, 76),
        (32, 83),
        (32, 100),
        (32, 104),
        (32, 104),
        (32, 108),
        (32, 132),
        (32, 136),
        (32, 137),
        (32, 150),
        (32, 159),
        (32, 169),
        (33, 30),
        (33, 39),
        (33, 114),
        (33, 120),
        (33, 120),
        (33, 135),
        (33, 136),
        (33, 152),
        (33, 162),
        (34, 1),
        (34, 3),
        (34, 51),
        (34, 54),
        (34, 70),
        (34, 82),
        (34, 86),
        (34, 91),
        (34, 140),
        (34, 141),
        (34, 142),
        (34, 151),
        (34, 163),
        (34, 174),
        (34, 178),
        (34, 184),
        (35, 31),
        (35, 34),
        (35, 38),
        (35, 70),
        (35, 70),
        (35, 77),
        (35, 86),
        (35, 90),
        (35, 120),
        (35, 122),
        (35, 160),
        (35, 172),
        (35, 175),
        (36, 28),
        (36, 43),
        (36, 72),
        (36, 76),
        (36, 83),
        (36, 125),
        (36, 143),
        (36, 143),
        (36, 163),
        (36, 164),
        (36, 183),
        (37, 32),
        (37, 40),
        (37, 57),
        (37, 90),
        (37, 97),
        (37, 114),
        (37, 114),
        (37, 121),
        (37, 145),
        (37, 182),
        (37, 184),
        (37, 187),
        (38, 4),
        (38, 10),
        (38, 16),
        (38, 17),
        (38, 20),
        (38, 57),
        (38, 66),
        (38, 94),
        (38, 109),
        (38, 115),
        (38, 118),
        (38, 136),
        (38, 145),
        (38, 162),
        (38, 181),
        (39, 8),
        (39, 20),
        (39, 45),
        (39, 74),
        (39, 76),
        (39, 84),
        (39, 102),
        (39, 135),
        (39, 136),
        (39, 137),
        (39, 152),
        (39, 169),
        (39, 179),
        (39, 189),
        (40, 42),
        (40, 55),
        (40, 94),
        (40, 100),
        (40, 116),
        (40, 140),
        (40, 163),
        (41, 34),
        (41, 64),
        (41, 73),
        (41, 93),
        (41, 141),
        (41, 143),
        (41, 168),
        (42, 9),
        (42, 54),
        (42, 63),
        (42, 75),
        (42, 80),
        (42, 93),
        (42, 103),
        (42, 127),
        (42, 130),
        (42, 131);
insert into orders_clients (order_id, client_id)
values  (1, 29),
        (1, 31),
        (1, 40),
        (1, 43),
        (1, 52),
        (1, 62),
        (1, 85),
        (2, 28),
        (2, 28),
        (2, 44),
        (2, 63),
        (2, 69),
        (2, 80),
        (3, 51),
        (3, 57),
        (3, 80),
        (3, 91),
        (4, 4),
        (4, 9),
        (4, 21),
        (4, 35),
        (4, 35),
        (4, 47),
        (4, 54),
        (4, 66),
        (4, 72),
        (5, 3),
        (5, 9),
        (5, 22),
        (5, 22),
        (5, 85),
        (5, 98),
        (6, 7),
        (6, 18),
        (6, 24),
        (6, 33),
        (6, 45),
        (6, 66),
        (6, 76),
        (6, 93),
        (6, 99),
        (7, 6),
        (7, 41),
        (7, 43),
        (7, 59),
        (7, 75),
        (7, 92),
        (7, 94),
        (8, 3),
        (8, 11),
        (8, 11),
        (8, 24),
        (8, 24),
        (8, 58),
        (8, 78),
        (9, 12),
        (9, 41),
        (9, 52),
        (9, 90),
        (10, 1),
        (10, 6),
        (10, 15),
        (10, 20),
        (10, 27),
        (10, 37),
        (10, 69),
        (10, 93),
        (10, 100),
        (11, 3),
        (11, 8),
        (11, 17),
        (11, 29),
        (11, 43),
        (11, 48),
        (11, 58),
        (11, 67),
        (11, 78),
        (11, 81),
        (12, 8),
        (12, 19),
        (12, 27),
        (12, 30),
        (12, 46),
        (12, 54),
        (12, 55),
        (12, 61),
        (12, 67),
        (12, 68),
        (12, 68),
        (12, 76),
        (12, 94),
        (12, 97),
        (13, 10),
        (13, 25),
        (13, 28),
        (13, 34),
        (13, 45),
        (13, 47),
        (13, 67),
        (13, 74),
        (13, 85),
        (14, 31),
        (14, 33),
        (14, 63),
        (14, 88),
        (15, 6),
        (15, 16),
        (15, 19),
        (15, 25),
        (15, 44),
        (15, 46),
        (15, 49),
        (15, 71),
        (15, 72),
        (15, 76),
        (15, 100),
        (16, 32),
        (16, 58),
        (16, 67),
        (16, 78),
        (17, 15),
        (17, 19),
        (17, 40),
        (17, 47),
        (17, 55),
        (17, 91),
        (18, 3),
        (18, 26),
        (18, 35),
        (18, 43),
        (18, 46),
        (18, 89),
        (18, 94),
        (18, 99),
        (19, 5),
        (19, 6),
        (19, 9),
        (19, 36),
        (19, 68),
        (19, 77),
        (19, 91),
        (20, 9),
        (20, 18),
        (20, 18),
        (20, 25),
        (20, 62),
        (20, 93),
        (20, 99),
        (20, 99),
        (21, 9),
        (21, 14),
        (21, 24),
        (21, 41),
        (21, 62),
        (21, 71),
        (21, 72),
        (21, 86),
        (22, 14),
        (22, 17),
        (22, 60),
        (22, 73),
        (22, 75),
        (22, 77),
        (22, 78),
        (22, 79),
        (22, 91),
        (22, 91),
        (22, 94),
        (23, 31),
        (23, 31),
        (23, 72),
        (23, 76),
        (23, 92),
        (24, 8),
        (24, 9),
        (24, 25),
        (24, 75),
        (24, 84),
        (24, 86),
        (24, 89),
        (25, 2),
        (25, 20),
        (25, 29),
        (25, 55),
        (25, 64),
        (25, 97),
        (26, 4),
        (26, 12),
        (26, 27),
        (26, 33),
        (26, 57),
        (26, 100),
        (27, 3),
        (27, 18),
        (27, 53),
        (27, 61),
        (27, 76),
        (28, 11),
        (28, 14),
        (28, 17),
        (28, 25),
        (28, 49),
        (28, 75),
        (28, 100),
        (29, 5),
        (29, 16),
        (29, 17),
        (29, 17),
        (29, 26),
        (29, 36),
        (29, 50),
        (29, 59),
        (29, 66),
        (29, 69),
        (29, 78),
        (29, 86),
        (30, 9),
        (30, 12),
        (30, 26),
        (30, 32),
        (30, 35),
        (30, 98),
        (31, 5),
        (31, 21),
        (31, 38),
        (31, 54),
        (31, 81),
        (31, 81),
        (31, 87),
        (31, 90),
        (32, 15),
        (32, 21),
        (32, 82),
        (32, 92),
        (32, 94),
        (32, 99),
        (33, 13),
        (33, 14),
        (33, 64),
        (33, 71),
        (33, 75),
        (33, 91),
        (33, 98),
        (34, 44),
        (34, 60),
        (34, 61),
        (34, 64),
        (35, 2),
        (35, 20),
        (35, 26),
        (35, 38),
        (35, 41),
        (35, 43),
        (35, 50),
        (35, 53),
        (35, 68),
        (35, 74),
        (35, 82),
        (35, 84),
        (35, 87),
        (36, 4),
        (36, 22),
        (36, 49),
        (36, 64),
        (36, 71),
        (36, 73),
        (36, 98),
        (36, 99),
        (37, 14),
        (37, 29),
        (37, 50),
        (37, 54),
        (37, 64),
        (37, 69),
        (37, 89),
        (37, 95),
        (38, 4),
        (38, 57),
        (39, 10),
        (39, 56),
        (39, 77),
        (39, 89),
        (39, 97),
        (39, 99),
        (40, 3),
        (40, 10),
        (40, 41),
        (40, 54),
        (40, 70),
        (40, 94),
        (41, 61),
        (41, 65),
        (41, 77),
        (42, 59),
        (42, 62),
        (42, 64),
        (42, 83),
        (42, 88),
        (42, 91),
        (42, 95);
        
        
        
        
/********************************************************************************************************************************************/








/*************************************************************************************************************************************************************/




/******		02. Insert		*******************************************************************************************************************************************************/
/* You will have to insert records of data into the products table, based on the waiters table.
For waiters with id greater than 6, insert data in the products table with the following values:
•	name – set it to the last name of the waiter followed by white space and then "specialty". 
-	(last_name + " " + "specialty")
•	type – set it to the "Cocktail".
•	price – set it to 1% of the waiter's salary and round the DECIMAL always to the next largest number.
(HINT: FLOOR will round the decimal to the previous whole number, but we need the opposite of FLOOR)			*/

INSERT INTO products (name, type, price)
SELECT
    CONCAT(last_name, ' specialty'),
    'Cocktail',
    CEILING(salary * 0.01)
FROM waiters
WHERE id > 6;


INSERT INTO products (name, type, price)
SELECT 
    CONCAT(last_name, ' specialty') AS name,
    'Cocktail' AS type,
    CEIL(salary * 0.01) AS price
FROM waiters
WHERE id > 6;






/******			03. Update				*******************************************************************************************************************************************************/
/* Somebody made a mistake with the orders and you should correct it. Find the orders with id from 12(inclusive) to 23(inclusive) 
and lower their tables id with 1.
 - e.g. table_id 40 -> table_id 39				*/

UPDATE orders
SET table_id = table_id - 1
WHERE id BETWEEN 12 AND 23;






/*****			04. Delete				********************************************************************************************************************************************************/
/* Delete all waiters, who don't have any orders.  */

DELETE FROM waiters
WHERE id NOT IN (SELECT waiter_id FROM orders);

DELETE FROM waiters
WHERE id NOT IN (SELECT DISTINCT waiter_id FROM orders);





	
/*******			05. Clients				******************************************************************************************************************************************************/
/* Extract from the restaurant_db system database, info about the clients.
Order the results by birthdate in descending order and id in descending;
Required Columns
•	id (clients)
•	first_name
•	last_name
•	birthdate
•	card
•	review											*/

SELECT id, first_name, last_name, birthdate, card, review
FROM clients
ORDER BY birthdate DESC, id DESC;






/****		06. Birthdate		*********************************************************************************************************************************************************/
/* Write a query that returns: first_name, last_name, birthdate and review from clients. 
Filter clients which don't have card and their birthdate is between 1978 and  1993 inclusive.
Show only the first 5 results and order them descending by last_name, then by id ascending.
Required Columns
•	first_name
•	last_name 
•	birthdate
•	review													*/

SELECT 
    first_name,
    last_name,
    birthdate,
    review
FROM clients
WHERE card IS NULL AND birthdate BETWEEN '1978-01-01' AND '1993-12-31'
ORDER BY last_name DESC, id ASC
LIMIT 5;






/****			07. Accounts			*********************************************************************************************************************************************************/
/* Write a query that returns: the username and password for all waiters who are not fired (a fired waiter is a waiter without salary). 
The username is generated by their last name immediately followed by their first name followed by the number of characters 
from first name and at the end "Restaurant". The password is their email starting from the 2nd character to the 13th character 
and then reversed.
Order by password in descending order.
Required Columns
•	username (last_name + first_name + characters count from first_name + "Restaurant")
•	password (starting from the 2nd character to the 13th character of their email and then reversed) 				*/

SELECT
    CONCAT(last_name, first_name, LENGTH(first_name), 'Restaurant') AS username,
    REVERSE(SUBSTRING(email, 2, 12)) AS password
FROM waiters
WHERE salary IS NOT NULL
ORDER BY password DESC;







/****			08. Top from menu			*********************************************************************************************************************************************************/
/* Extract from the database the id (product), the name and the count of products from all orders with 
this name where the count is greater or equal to 5.
Order the results descending by count and then by name in ascending.
Required Columns
•	id (product)
•	name (product)
•	count (the count of products with the same name) 									*/

SELECT 
    products.id AS id,
    products.name AS name,
    COUNT(orders_products.product_id) AS count
FROM orders_products
INNER JOIN products ON orders_products.product_id = products.id
GROUP BY products.id, products.name
HAVING COUNT(orders_products.product_id) >= 5
ORDER BY count DESC, name ASC;

SELECT
    products.id,
    products.name,
    COUNT(*) AS count
FROM orders_products
JOIN products ON orders_products.product_id = products.id
GROUP BY products.id
HAVING COUNT(*) >= 5
ORDER BY COUNT(*) DESC, products.name ASC;







/*****		09. Availability	(0/100)	********************************************************************************************************************************************************/
/* Write a query that returns the table_id, capacity, count_clients  and availability of all tables from the 1st floor. 
Count_clients is the number of people from all orders that are sitting on that table. Availability is 
based on how many people are sitting and the capacity of the table. If the capacity is greater than count_clients 
then it should be "Free seats", if the capacity is equal to the count_clients it should be "Full", and if the capacity 
is lower than the count_clients it should be "Extra seats".
Order the results descending by table_id. 
*/

SELECT
    tables.id AS table_id,
    tables.capacity,
       IFNULL(
        SUM(
            CASE 
                WHEN orders.payed_status = TRUE THEN 1 
                ELSE 0 
            END
        ), 0
    ) AS count_clients,
    CASE
        WHEN tables.capacity > IFNULL(
            SUM(
                CASE 
                    WHEN orders.payed_status = TRUE THEN 1 
                    ELSE 0 
                END
            ), 0
        ) THEN 'Free seats'
        WHEN tables.capacity = IFNULL(
            SUM(
                CASE 
                    WHEN orders.payed_status = TRUE THEN 1 
                    ELSE 0 
                END
            ), 0
        ) THEN 'Full'
        ELSE 'Extra seats'
    END AS availability
FROM tables
LEFT JOIN orders ON tables.id = orders.table_id
LEFT JOIN orders_clients ON orders.id = orders_clients.order_id
WHERE tables.floor = 1
GROUP BY tables.id, tables.capacity
HAVING count_clients != 0
ORDER BY tables.id DESC;








/******			10. Extract bill		*******************************************************************************************************************************************************/
/* Create a user defined function with the name udf_client_bill(full_name VARCHAR(50)) that receives a customer's full name 
and returns the total price of products he ordered;
Required Columns
•	first_name (client)
•	last_name (client)
•	bill (udf_client_bill) (should be DECIMAL(19,2))								*/

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(19,2)
DETERMINISTIC
RETURN (
    SELECT SUM(products.price)
    FROM orders_clients
    INNER JOIN orders ON orders_clients.order_id = orders.id
    INNER JOIN clients ON orders_clients.client_id = clients.id
    INNER JOIN orders_products ON orders.id = orders_products.order_id
    INNER JOIN products ON orders_products.product_id = products.id
    WHERE CONCAT(clients.first_name, ' ', clients.last_name) = full_name
);


SELECT c.first_name,c.last_name, udf_client_bill('Silvio Blyth') as 'bill' FROM clients c
WHERE c.first_name = 'Silvio' AND c.last_name= 'Blyth';





/*****		11. Happy hour			********************************************************************************************************************************************************/
/* Create a stored procedure udp_happy_hour which accepts the following parameters:
•	type (VARCHAR(50))
Extracts data about the products from the given type and reduces the prices by 20% of all 
products which have prices higher or equal to 10.00 and are from the given type.	*/

DELIMITER //
CREATE PROCEDURE udp_happy_hour(IN prod_type VARCHAR(50))
BEGIN
    UPDATE products
    SET price = price * 0.8
    WHERE type = prod_type AND price >= 10.00;
END //
DELIMITER ;


