CREATE DATABASE IF NOT EXISTS krra9226;
USE krra9226;

-- emloyees_surname -фамилия сотрудника
-- emloyees_name - имя сотрудника 
-- emloyees_patronymic - фамилия сотрудника
-- gender - пол сотрудника 
-- date_birth_emloyees - дата рождения_ сотрудника 
--job_division--должность
--subdivision-подразделение
-- city - город                
-- joining_date - дата вступления
-- leave_date - дата выхода
-- fired - уволили

-- таблицы сотрудники
CREATE TABLE Employees(
    id_emloyees INT PRIMARY KEY,
    emloyees_surname VARCHAR(50),
    emloyees_name VARCHAR(50),
    emloyees_patronymic VARCHAR(50),
    gender ENUM ('М','Ж') NOT NULL, 
	date_birth_emloyees DATE,
    city VARCHAR(50),
    home_adress VARCHAR(50),
    job_division INT,
    subdivision INT,
    city INT,
    joining_date DATE,
    leave_date DATE,
    fired ENUM ('Y','N')
);
    FOREIGN KEY (job_division) REFERENCES Job_title(Job_title_id),
    FOREIGN KEY (subdivision) REFERENCES Subdivision(id_subdivision),
    FOREIGN KEY (city) REFERENCES city(city_id)


-- таблица подразделения
CREATE TABLE Subdivision(
    id_subdivision INT PRIMARY KEY,
    name VARCHAR(50),
    type_of_unit VARCHAR(50)
);

-- ТАБЛИЦА название вакансии
CREATE TABLE Job_title(
     Job_title_id INT,
     name VARCHAR(50)
);

-- ТАБЛИЦА город
CREATE TABLE City ​(
    city_id INT,
    city VARCHAR(50)
)

INSERT INTO Employees VALUES (1, 'Пушкин', 'Александр', 'Сергеевич', 'М', '1799-06-06','Москва','ул. Тверская, д. 1', 1, 1, 1, '2020-01-01', '2022-12-31'),
INSERT INTO Employees VALUES (2, 'Лермонтов', 'Михаил', 'Юрьевич', 'М', '1814-10-15','Санкт-Петербург', 'Невский проспект, д. 10', 2, 1, 2, '2021-03-15', '2021-11-30'),
INSERT INTO Employees VALUES (4, 'Есенин', 'Сергей', 'Александрович', 'М', '1895-10-03','Ставрополь', 'ул. Красная, д. 20', 3, 2, 4, '2023-05-20', '2025-03-10'),
INSERT INTO Employees VALUES (5, 'Цветаева', 'Марина', 'Ивановна', 'Ж', '1892-10-08','Краснодар', 'ул. Большая Садовая, д. 30', 1, 1, 5, '2021-08-01', '2023-07-07'),
INSERT INTO Employees VALUES (6, 'Толстой', 'Лев', 'Николаевич', 'М', '1828-09-09','Ростов-на-Дону','пр. Кирова, д. 15', 4, 3, 6, '2022-02-14', NULL),
INSERT INTO Employees VALUES (7, 'Достоевский', 'Фёдор', 'Михайлович', 'М', '1821-11-11','Ставрополь','ул. Гоголя, д. 5', 5, 4, 1, '2023-09-01', NULL),
INSERT INTO Employees VALUES (8, 'Ахматова', 'Анна', 'Андреевна', 'Ж', '1889-06-23','Краснодар', 'ул. Пушкинская, д. 8', 2, 5, 2, '2021-11-20', '2025-01-15'),
INSERT INTO Employees VALUES (9, 'Булгаков', 'Михаил', 'Афанасьевич', 'М', '1891-05-15','Ставрополь', 'ул. Садовая, д. 10', 3, 3, 3, '2020-08-10', '2023-05-30'),
INSERT INTO Employees VALUES (10, 'Гоголь', 'Николай', 'Васильевич', 'М', '1809-04-01','Санкт-Петербург', 'ул. Никольская, д. 3', 1, 2, 4, '2022-06-06', NULL);


-- внесение подразделения 
INSERT INTO Subdivision VALUES
(1, 'Продажи', 'Отдел'),
(2, 'Охрана', 'Служба'),
(3, 'IT', 'Отдел'),
(4, 'HR', 'Отдел'),
(5, 'Бухгалтерия', 'Отдел'),
(6, 'Маркетинг', 'Отдел'),
(7, 'Логистика', 'Служба'),
(8, 'Администрация', 'Управление');


INSERT INTO City (city_id, city) VALUES
(1, 'Москва'),
(2, 'Санкт-Петербург'),
(3, 'Ставрополь'),
(4, 'Краснодар'),
(5, 'Ростов-на-Дону'),

-- №1
SELECT 
    emloyees_surname,
    emloyees_name,
    emloyees_patronymic
    job_division , 
    joining_date,
    leave_date
FROM Employees
WHERE YEAR(leave_date) = 2025
  AND fired = 'Y';


-- №2
SELECT 
    id_emloyees,
    emloyees_surname,
    emloyees_name, 
    emloyees_patronymic,
    date_birth_emloyees,
    city,
    home_adress,
    joining_date,
    leave_date
FROM Employees
WHERE city = 'Ставрополь';


































-- №1 
-- SELECT id_doctor FROM Doctor
-- WHERE country = 'Голландия';

-- -- №2
-- SELECT flower_name, price FROM Flowers
-- WHERE country = 'Россия';

-- -- №3 
-- SELECT org_name FROM Buyer -- ошибка
-- WHERE bank_details IS NULL;

-- -- №4
-- SELECT Buyer.org_name FROM Buyer, Sales, Flowers 
-- WHERE Buyer.id_org = Sales.id_org 
-- AND Flowers.id_flower = Sales.id_flower 
-- AND Flowers.flower_name IN ('Роза', 'Сирень') 
-- AND YEAR(Sales.sale_date) = 2025;

-- -- №5
-- SELECT Buyer.org_name, Buyer.bank_details FROM Buyer, Sales 
-- WHERE Buyer.id_org = Sales.id_org 
-- AND Sales.payment_status = 'нет';
