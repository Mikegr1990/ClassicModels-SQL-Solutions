-- 14. What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
SELECT CONCAT(firstName, ' ', lastName) AS full_name
FROM employees
WHERE jobTitle LIKE '%VP%' OR jobTitle LIKE '%Manager%';