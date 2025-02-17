-- 13. What is the value of payments received in July 2004?
SELECT SUM(amount) AS total_July_2004_payments
FROM payments
WHERE paymentDate BETWEEN '2004-07-01' AND '2004-07-31';