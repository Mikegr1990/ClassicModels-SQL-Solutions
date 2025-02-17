-- 5. Report total payments for October 28, 2004.
SELECT SUM(amount) AS 'Amount for 28th oct 2004'
FROM payments
WHERE paymentDate = '2004-10-28';