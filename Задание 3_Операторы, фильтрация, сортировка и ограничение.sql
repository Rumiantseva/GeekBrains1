drop database if exists storehouses_products;
create database storehouses_products;
use storehouses_products;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (storehouse_id, product_id, value) 
VALUES
(1, 1, 0),
(1, 2, 14),
(1, 3, 400),
(2, 4, 6),
(2, 5, 52),
(1, 6, 0),
(1, 7, 3);

SELECT * FROM storehouses_products
ORDER BY CASE WHEN value = 0 THEN 401 ELSE value END;