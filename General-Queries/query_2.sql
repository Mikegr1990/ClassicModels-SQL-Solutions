-- 2. Who reports to William Patterson?
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees
WHERE reportsTo = (
	SELECT employeeNumber
	FROM employees
	WHERE LOWER(CONCAT(firstname, ' ', lastname)) = 'William Patterson'
);