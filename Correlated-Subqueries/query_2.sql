-- 2. Which payments in any month and year are more than twice the average for that month and year (i.e. compare all payments in Oct 2004 with the average payment for Oct 2004)? Order the results by the date of the payment. You will need to use the date functions.
SELECT
	p.customerNumber,
    p.paymentDate,
    p.amount
FROM payments p
WHERE p.amount > 2 * (
		SELECT AVG(p2.amount)
        FROM payments p2
        WHERE MONTH(p2.paymentDate) = MONTH(p.paymentDate)
        AND YEAR(p2.paymentDate) = YEAR(p.paymentDate)
)
ORDER BY p.paymentDate;