-- 6. List the names of employees called Dianne or Diane.
SELECT *
FROM employees
WHERE firstName IN ('Dianne', 'Diane');