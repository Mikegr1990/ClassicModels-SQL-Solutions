-- 3. Report the total payments by date.
SELECT SUM(amount) AS total_payments, paymentDate
FROM payments
GROUP BY paymentDate
ORDER BY total_payments DESC;