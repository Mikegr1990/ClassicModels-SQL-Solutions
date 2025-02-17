-- 7. List the products containing ship or boat in their product name.
SELECT *
FROM products
WHERE productName REGEXP ('ship'|'boat');