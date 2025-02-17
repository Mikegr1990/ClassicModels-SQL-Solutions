-- 10. List all payments greater than twice the average payment.
SELECT amount
FROM payments
WHERE amount > 2 * (
	SELECT AVG(amount)
	FROM payments
);