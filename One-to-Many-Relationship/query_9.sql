-- 9. List the value of 'On Hold' orders.
SELECT SUM(p.amount) AS value, o.status
FROM payments p
JOIN orders o ON p.customernumber = o.customernumber
WHERE o.status = 'On Hold';