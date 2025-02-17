-- 15. Which orders have a value greater than $5,000?
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS 'Value' 
FROM orderdetails
GROUP BY orderNumber
HAVING Value > 5000
ORDER BY Value DESC;