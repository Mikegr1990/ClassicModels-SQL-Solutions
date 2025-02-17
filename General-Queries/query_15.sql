-- 15. What is the difference in the amount received for each month of 2004 compared to 2003?
SELECT 
    MONTHNAME(paymentDate) AS month,
    MONTH(paymentDate) AS month_number,  -- Needed for correct ordering
    SUM(CASE WHEN YEAR(paymentDate) = 2004 THEN amount ELSE 0 END) AS total_2004,
    SUM(CASE WHEN YEAR(paymentDate) = 2003 THEN amount ELSE 0 END) AS total_2003,
    SUM(CASE WHEN YEAR(paymentDate) = 2004 THEN amount ELSE 0 END) 
    - SUM(CASE WHEN YEAR(paymentDate) = 2003 THEN amount ELSE 0 END) AS difference
FROM payments
WHERE YEAR(paymentDate) IN (2003, 2004)
GROUP BY month, month_number
ORDER BY month_number;