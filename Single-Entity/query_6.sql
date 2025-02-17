-- 6. Report those payments greater than $100,000.
SELECT *
FROM payments
WHERE amount > 100000
ORDER BY amount DESC;