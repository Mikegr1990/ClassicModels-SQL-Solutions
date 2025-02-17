-- 10. List the names of employees with non-alphabetic characters in their names.
SELECT *
FROM employees
WHERE CONCAT(firstname, ' ', lastname) REGEXP '[0-9%@]';