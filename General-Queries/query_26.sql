-- 26. Compute the ratio of payments for each customer for 2003 versus 2004.
SELECT
	c.customerNumber,
    c.customerName,
    SUM(CASE WHEN YEAR(p.paymentDate) = 2004 THEN p.amount ELSE 0 END) AS payments_2004,
    SUM(CASE WHEN YEAR(p.paymentDate) = 2003 THEN p.amount ELSE 0 END) AS payments_2003,
    (SUM(CASE WHEN YEAR(p.paymentDate) = 2004 THEN p.amount ELSE 0 END) /
     NULLIF(SUM(CASE WHEN YEAR(p.paymentDate) = 2003 THEN p.amount ELSE 0 END), 0)
    ) AS payments_ratio
FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY payments_ratio DESC;