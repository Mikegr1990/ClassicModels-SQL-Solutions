-- 10. What is the percentage value of each product in inventory sorted by the highest percentage first (Hint: Create a view first).
CREATE OR REPLACE VIEW total_inventory_value AS
SELECT SUM(quantityInStock * buyPrice) AS total_value
FROM products;

CREATE OR REPLACE VIEW product_values AS
SELECT (quantityInStock * buyPrice) AS product_value, productCode, productName
FROM products;

SELECT pv.productCode, pv.productName, pv.product_value, ROUND((pv.product_value / tiv.total_value) * 100, 2) AS percentage_value
FROM product_values pv
CROSS JOIN total_inventory_value tiv
ORDER BY percentage_value DESC;

-- 2nd way to solve #10
SELECT 
    productCode,
    productName,
    (quantityInStock * buyPrice) AS product_value,
    ((quantityInStock * buyPrice) / (SELECT SUM(quantityInStock * buyPrice) FROM products)) * 100 AS percentage_value
FROM products
ORDER BY percentage_value DESC;