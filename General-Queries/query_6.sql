-- 6. Compute the average time between order date and ship date for each customer ordered by the largest difference.
SELECT AVG(DATEDIFF(o.shippedDate, o.orderDate)) AS difference_in_days, o.customerNumber, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
GROUP BY o.customerNumber, c.customerName
ORDER BY difference_in_days DESC;