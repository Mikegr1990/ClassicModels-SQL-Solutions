-- 10. Report the number of orders 'On Hold' for each customer.
SELECT COUNT(*) AS orders_on_hold, c.customername
FROM orders o 
JOIN customers c ON o.customernumber = c.customernumber
WHERE o.status = 'On Hold'
GROUP BY c.customername;