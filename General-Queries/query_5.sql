-- 5. What is the difference in days between the most recent and oldest order date in the Orders file?
SELECT DATEDIFF(MAX(orderDate), MIN(orderDate)) AS days_difference
FROM orders;