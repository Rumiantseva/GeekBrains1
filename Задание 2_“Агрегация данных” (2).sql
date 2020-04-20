drop database if exists DZ;
create database DZ;
use DZ;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
  select `id`, `name`, `birthday_at` from users;
  select day(birthday_at), month(birthday_at), year(now()) from users;
  select `id`, `name`, concat_ws('-', year(now()), month(birthday_at), day(birthday_at)) as `bday` from users;
SELECT date_format(concat_ws('-', year(now()), month(birthday_at), day(birthday_at)), '%W') as bday FROM users;
SELECT name, date_format(concat_ws('-', year(now()), month(birthday_at), day(birthday_at)), '%W') as bday FROM users;
  