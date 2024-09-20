--7.09 сентября
--1 Создать БД со связью таблиц "1 к 1".-
--2. Создать БД со связью таблиц "1 к многим".
--3. Создать БД со связью таблиц "многим к многим".
--4. Создать и заполнить данными таблицы.



--1
--CREATE DATABASE OneToOneDB;
--USE OneToOneDB;
-- CREATE TABLE Person (
--    id INT PRIMARY KEY AUTO_INCREMENT,
--    name VARCHAR(50) NOT NULL
-- );


-- CREATE TABLE Passport (
--    id INT PRIMARY KEY AUTO_INCREMENT,
--    person_id INT UNIQUE,
--    passport_number VARCHAR(20) NOT NULL,
--    FOREIGN KEY (person_id) REFERENCES Person(id)
-- );


-- INSERT INTO Person (name) VALUES ('John Doe'), ('Jane Smith');


-- INSERT INTO Passport (person_id, passport_number) VALUES (1, 'AB1234567'), (2, 'CD9876543');

--2

-- CREATE DATABASE OneToManyDB;
-- USE OneToManyDB;


-- CREATE TABLE Author (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(50) NOT NULL
-- );


-- CREATE TABLE Book (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     author_id INT,
--     title VARCHAR(100) NOT NULL,
--     FOREIGN KEY (author_id) REFERENCES Author(id)
-- );


-- INSERT INTO Author (name) VALUES ('George Orwell'), ('J.K. Rowling');


-- INSERT INTO Book (author_id, title) VALUES (1, '1984'), (1, 'Animal Farm'), (2, 'Harry Potter and the Sorcerer\'s Stone');

--3

-- CREATE DATABASE ManyToManyDB;
-- USE ManyToManyDB;

-- CREATE TABLE Student (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(50) NOT NULL
-- );


-- CREATE TABLE Course (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     course_name VARCHAR(100) NOT NULL
-- );


-- CREATE TABLE Enrollment (
--     student_id INT,
--     course_id INT,
--     FOREIGN KEY (student_id) REFERENCES Student(id),
--     FOREIGN KEY (course_id) REFERENCES Course(id),
--     PRIMARY KEY (student_id, course_id)
-- );


-- INSERT INTO Student (name) VALUES ('Alice'), ('Bob'), ('Charlie');


-- INSERT INTO Course (course_name) VALUES ('Mathematics'), ('History'), ('Computer Science');

-- INSERT INTO Enrollment (student_id, course_id) VALUES (1, 1), (1, 2), (2, 3), (3, 1), (3, 3);


--11.09
-- 1. Выбрать все данные из таблицы customers
-- 2. Выбрать все записи из таблицы customers, но только колонки "имя контакта" и "город"
-- 3. Выбрать все записи из таблицы orders, но взять две колонки: идентификатор заказа и колонку, значение в которой мы рассчитываем как разницу между датой отгрузки и датой формирования заказа.
-- 4. Выбрать все уникальные города в которых "зарегестрированы" заказчики
-- 5. Выбрать все уникальные сочетания городов и стран в которых "зарегестрированы" заказчики
-- 6. Посчитать кол-во заказчиков
-- 7. Посчитать кол-во уникальных стран в которых "зарегестрированы" заказчики

--1 SELECT * FROM customers;
--2 SELECT contact_name, city FROM customers;
--3 SELECT order_id, DATEDIFF(ship_date, order_date) AS days_between FROM orders;\
--4 SELECT DISTINCT city FROM customers;
--5 SELECT DISTINCT city, country FROM customers;
--6 SELECT COUNT(*) AS total_customers FROM customers;
--7 SELECT COUNT(DISTINCT country) AS unique_countries FROM customers;


--14.09
-- 1. Выбрать все записи заказов в которых наименование страны отгрузки начинается с 'U'

-- 2. Выбрать записи заказов (включить колонки идентификатора заказа, идентификатора заказчика, веса и страны отгузки), которые должны быть отгружены в страны имя которых начинается с 'N', отсортировать по весу (по убыванию) и вывести только первые 10 записей.

-- 3. Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен

-- 4. Подсчитать кол-во заказчиков регион которых известен

-- 5. Подсчитать кол-во поставщиков в каждой из стран и отсортировать результаты группировки по убыванию кол-ва

-- 6. Подсчитать суммарный вес заказов (в которых известен регион) по странам, затем отфильтровать по суммарному весу (вывести только те записи где суммарный вес больше 2750) и отсортировать по убыванию суммарного веса.

-- 7. Выбрать все уникальные страны заказчиков и поставщиков и отсортировать страны по возрастанию

-- 8. Выбрать такие страны в которых "зарегистированы" одновременно и заказчики и поставщики и работники.

-- 9. Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники.



--1 
-- SELECT * 
-- FROM orders 
-- WHERE ship_country LIKE 'U%';

--2
-- SELECT order_id, customer_id, weight, ship_country 
-- FROM orders 
-- WHERE ship_country LIKE 'N%' 
-- ORDER BY weight DESC 
-- LIMIT 10;

--3
-- SELECT first_name, last_name, phone, region 
-- FROM employees 
-- WHERE region IS NULL;

--4
-- SELECT COUNT(*) AS known_region_customers 
-- FROM customers 
-- WHERE region IS NOT NULL;

--5
-- SELECT country, COUNT(*) AS supplier_count 
-- FROM suppliers 
-- GROUP BY country 
-- ORDER BY supplier_count DESC;

--6
-- SELECT ship_country, SUM(weight) AS total_weight 
-- FROM orders 
-- WHERE region IS NOT NULL 
-- GROUP BY ship_country 
-- HAVING total_weight > 2750 
-- ORDER BY total_weight DESC;

--7
-- SELECT DISTINCT country 
-- FROM customers 
-- UNION 
-- SELECT DISTINCT country 
-- FROM suppliers 
-- ORDER BY country ASC;


--8
-- SELECT country 
-- FROM customers 
-- WHERE country IN (SELECT country FROM suppliers) 
-- AND country IN (SELECT country FROM employees);

--9
-- SELECT country 
-- FROM customers 
-- WHERE country IN (SELECT country FROM suppliers) 
-- AND country NOT IN (SELECT country FROM employees);

--18.09
-- 1. Найти заказчиков и обслуживающих их заказы сотрудников таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

-- 2. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.

-- 3. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

-- 4. Переписать предыдущий запрос, использовав симметричный вид джойна (подсказка: речь о LEFT и RIGHT).
