-- 9. List the employees who report to those employees who report to Diane Murphy. Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
CREATE OR REPLACE VIEW report_to_Murphy AS 
SELECT employeeNumber
FROM employees
WHERE reportsTo = (
SELECT employeeNumber
FROM employees
WHERE CONCAT(firstName, ' ', lastName) = 'Diane Murphy');

SELECT e.employeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS full_name
FROM employees e
WHERE e.reportsTo IN (
SELECT employeeNumber
FROM report_to_Murphy);

-- 2nd way to solve #9
SELECT 
    e.employeeNumber, 
    CONCAT(e.firstName, ' ', e.lastName) AS full_name
FROM employees e
WHERE e.reportsTo IN (
    SELECT employeeNumber
    FROM employees
    WHERE reportsTo = (
        SELECT employeeNumber
        FROM employees
        WHERE CONCAT(firstName, ' ', lastName) = 'Diane Murphy'
    )
);