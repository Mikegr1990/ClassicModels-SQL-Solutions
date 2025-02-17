-- 13. Report the name and city of customers who don't have sales representatives?
SELECT customerName, city
FROM customers
WHERE salesRepEmployeeNumber IS NULL;