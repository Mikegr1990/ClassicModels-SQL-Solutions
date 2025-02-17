-- 3. List all the products purchased by Herkku Gifts.
SELECT DISTINCT p.productName
FROM products p 
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.customerName = 'Herkku Gifts';