-- 8. How many products in each product line?
SELECT COUNT(productCode) AS num_of_products, productLine
FROM products
GROUP BY productLine
ORDER BY num_of_products DESC;