-- 7. Who are the employees in Boston?
SELECT CONCAT(e.firstname, ' ', e.lastname) AS employee_name, o.city
FROM employees e
JOIN offices o ON e.officecode = o.officecode
WHERE o.city = 'Boston';

SELECT CONCAT(e.firstname, ' ', e.lastname) AS employee_name
FROM employees e
WHERE e.officecode IN (
SELECT o.officecode
FROM offices o
WHERE o.city = 'Boston');