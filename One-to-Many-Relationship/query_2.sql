-- 2. Report total payments for Atelier graphique.
SELECT SUM(p.amount) AS total_payments, c.customername
FROM payments p
JOIN customers c ON p.customernumber = c.customernumber
WHERE c.customername = 'Atelier graphique';