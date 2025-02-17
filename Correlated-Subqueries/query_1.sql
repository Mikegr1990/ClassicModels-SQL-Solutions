-- 1. Who reports to Mary Patterson?
SELECT CONCAT(firstName, ' ', lastName) AS full_name
FROM employees
WHERE reportsTo = (
	SELECT employeeNumber
	FROM employees
    WHERE CONCAT(firstName, ' ', lastName) = 'Mary Patterson'
);