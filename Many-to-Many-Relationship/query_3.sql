-- 3. List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?
SELECT c.customerName, o.orderNumber, SUM(od.quantityOrdered * od.priceEach) AS value
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName, o.orderNumber 
HAVING value > 25000
ORDER BY value DESC;