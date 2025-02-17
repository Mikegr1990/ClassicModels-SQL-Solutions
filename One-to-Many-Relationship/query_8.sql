-- 8. Report those payments greater than $100,000. Sort the report so the customer who made the highest payment appears first.
SELECT c.customerName, SUM(p.amount) AS high_payments
FROM customers c
JOIN payments p ON c.customernumber = p.customernumber
WHERE p.amount > 100000
GROUP BY c.customername
ORDER BY high_payments DESC;