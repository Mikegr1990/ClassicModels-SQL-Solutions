-- 1. List products sold by order date.
SELECT p.productName, o.orderDate, DAYNAME(o.orderDate) AS Day
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
ORDER BY o.orderDate DESC;