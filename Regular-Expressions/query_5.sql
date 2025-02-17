-- 5. Which customers have a digit in their name?
SELECT *
FROM customers
WHERE customerName REGEXP '[0-9]';