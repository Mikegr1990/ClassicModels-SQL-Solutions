-- 7. List the products ordered on a Monday.
SELECT p.productName, DAYNAME(o.orderDate) AS day_of_the_week, o.orderDate
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE DAYNAME(o.orderDate) = 'Monday';