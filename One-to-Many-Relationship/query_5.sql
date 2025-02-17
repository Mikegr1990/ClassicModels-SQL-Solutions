-- 5. List the amount paid by each customer.
SELECT c.customerName, o.ordernumber, ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS amount_paid
FROM customers c
JOIN orders o ON c.customernumber = o.customernumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.ordernumber, c.customerName
ORDER BY amount_paid DESC;