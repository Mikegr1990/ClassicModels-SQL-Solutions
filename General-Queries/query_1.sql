-- 1. Who is at the top of the organization (i.e.,  reports to no one).
SELECT *
FROM employees
WHERE reportsTo IS NULL;