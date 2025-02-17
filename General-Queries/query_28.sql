-- 28. Find the customers without payments in 2003.
SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN payments p
	ON c.customerNumber = p.customerNumber
    AND YEAR(p.paymentDate) = 2003
    WHERE p.customerNumber IS NULL;

-- 2nd solution using EXISTS
SELECT c.customerNumber, c.customerName
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM payments p
    WHERE p.customerNumber = c.customerNumber
    AND YEAR(p.paymentDate) = 2003
);