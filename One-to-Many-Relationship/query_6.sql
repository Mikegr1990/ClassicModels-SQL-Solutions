-- 6. How many orders have been placed by Herkku Gifts?
SELECT COUNT(o.ordernumber) AS 'orders', c.customerName
FROM orders o	
JOIN customers c ON o.customernumber = c.customernumber
WHERE c.customername = 'Herkku Gifts'
GROUP BY c.customername;

/* Whats the quantity of products ordered by Herkku Gifts? */

SELECT SUM(od.quantityOrdered) AS total_quantity, c.customerName
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.customerName = 'Herkku Gifts'
GROUP BY c.customerName;