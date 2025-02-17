-- 18. Basket of goods analysis: A common retail analytics task is to analyze each basket or order to learn what products are often purchased together. Report the names of products that appear in the same order ten or more times.
SELECT 
    p.productName, 
    o.orderNumber,
    SUM(od.quantityOrdered) AS total_quantity
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY p.productName, o.orderNumber
HAVING SUM(od.quantityOrdered) >= 10
ORDER BY total_quantity DESC;

-- check if the above code works by validating that '1969 Dodge Charger' in order 10405 has sold 97 items
SELECT quantityOrdered
FROM orderdetails
WHERE productCode = (
SELECT productCode
FROM products
WHERE productName = '1969 Dodge Charger')
AND orderNumber = 10405;