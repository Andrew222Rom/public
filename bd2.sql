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

-- Таблица сотрудников с внешними ключами
CREATE TABLE Employees (
    id_emloyees INT PRIMARY KEY,
    emloyees_surname VARCHAR(50),
    emloyees_name VARCHAR(50),
    emloyees_patronymic VARCHAR(50),
    gender ENUM('М','Ж'),
    date_birth_emloyees DATE,
    home_adress VARCHAR(50),
    job_division INT,        -- внешний ключ к Job_title
    subdivision INT,         -- внешний ключ к subdivision
    city INT,                -- внешний ключ к city
    joining_date DATE,
    leave_date DATE,
    fired ENUM ('Y','N')

    -- Определение внешних ключей
    FOREIGN KEY (job_division) REFERENCES Job_title(Job_title_id),
    FOREIGN KEY (subdivision) REFERENCES subdivision(id_subdivision),
    FOREIGN KEY (city) REFERENCES city(city_id)
);


-- Справочник должностей
CREATE TABLE Job_title (
    Job_title_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Справочник городов (с нужными городами)
CREATE TABLE city (
    city_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Справочник подразделений
CREATE TABLE subdivision (
    id_subdivision INT PRIMARY KEY,
    name VARCHAR(50),
    type_of_unit VARCHAR(50)
);

-- Заполнение сотрудников (ID ссылаются на существующие записи в справочниках)
INSERT INTO Employees VALUES
(1, 'Пушкин', 'Александр', 'Сергеевич', 'М', '1799-06-06', 1, 1, 1, '2020-01-01','2022-12-31'),
(2, 'Лермонтов', 'Михаил', 'Юрьевич', 'М', '1814-10-15', 2, 1, 2, '2021-03-15','2021-11-30' ),
(3, 'Лермонтов', 'Михаил', 'Юрьевич', 'М', '1814-10-15', 2, 1, 3, '2022-01-10','2023-02-28' ),
(4, 'Есенин', 'Сергей', 'Александрович', 'М', '1895-10-03', 3, 2, 4, '2023-05-20','2024-03-10'  ),
(5, 'Цветаева', 'Марина', 'Ивановна', 'Ж', '1892-10-08', 1, 1, 5, '2021-08-01','2023-07-07' );

-- Заполнение справочников
INSERT INTO Job_title (Job_title_id, name) VALUES
(1, 'Начальник отдела'),
(2, 'Консультант'),
(3, 'Менеджер'),
(4, 'Специалист'),
(5, 'Руководитель направления');

-- Города: Москва, СПб, Ставрополь, Краснодар, Ростов-на-Дону, Пятигорск
INSERT INTO city (city_id, name) VALUES
(1, 'Москва'),
(2, 'Санкт-Петербург'),
(3, 'Ставрополь'),
(4, 'Краснодар'),
(5, 'Ростов-на-Дону'),


INSERT INTO subdivision (id_subdivision, name, type_of_unit) VALUES
(1, 'Продажи', 'Отдел'),
(2, 'Охрана', 'Служба')
(3, 'IT', 'Отдел'),
(4, 'HR', 'Отдел'),
(5, 'Бухгалтерия', 'Отдел');

-- (При необходимости можно добавить остальные запросы из вашего исходного списка)
-- №1 
SELECT id_doctor FROM Doctor WHERE country = 'Голландия';
-- №2
SELECT flower_name, price FROM Flowers WHERE country = 'Россия';
-- №3 
SELECT org_name FROM Buyer WHERE bank_details IS NULL;
-- №4
SELECT Buyer.org_name FROM Buyer, Sales, Flowers 
WHERE Buyer.id_org = Sales.id_org 
AND Flowers.id_flower = Sales.id_flower 
AND Flowers.flower_name IN ('Роза', 'Сирень') 
AND YEAR(Sales.sale_date) = 2025;
-- №5
SELECT Buyer.org_name, Buyer.bank_details FROM Buyer, Sales 
WHERE Buyer.id_org = Sales.id_org 
AND Sales.payment_status = 'нет';
