-- 9. List the names of employees called Larry or Barry.
SELECT  *
FROM employees
WHERE 'Larry' IN (lastName,firstName)
      OR 'Barry' IN (lastName,firstName);