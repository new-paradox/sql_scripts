DROP DATABASE new_ex;
CREATE DATABASE new_ex;

USE new_ex;

-- Тема Операции, задание 1

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	created_at DATETIME,
  	updated_at DATETIME);



INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('voluptatem', '2016-10-30', NULL, NULL),
  ('provident', '1999-12-28', NULL, NULL),
  ('et', '1980-11-22', NULL, NULL);

UPDATE
  users

SET
  created_at = NOW(),
  updated_at = NOW();
  	
ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users MODIFY updated_at DATETIME 
DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
 
-- Тема Операции, задание 2

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  value bigint UNSIGNED);

INSERT INTO
  storehouses (value)
VALUES
  (0),
  (24300),
  (0),
  (30),
  (10000),
  (0);


SELECT
  *
FROM
  storehouses
ORDER BY
  value = 0, value;

-- Тема Агрегация, задание 1
SELECT 
  ROUND(AVG(YEAR(NOW()) - YEAR(birthday_at)))
FROM 
  users;
  

-- Тема Агрегация, задание 2
SELECT
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;
