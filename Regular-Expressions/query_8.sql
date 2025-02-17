-- 8. List the products with a product code beginning with S700.
SELECT *
FROM products
WHERE productCode LIKE 'S700%';