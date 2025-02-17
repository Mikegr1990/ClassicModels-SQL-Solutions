-- 3. Report the number of customers in Denmark, Norway, and Sweden.
SELECT COUNT(*) AS number_of_customers
FROM customers
WHERE country IN ('Denmark', 'Norway', 'Sweden');