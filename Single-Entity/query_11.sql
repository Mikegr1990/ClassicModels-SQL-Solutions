-- 11. What is the average percentage markup of the MSRP on buyPrice?
SELECT AVG((MSRP - buyPrice) / MSRP) * 100 AS 'Average Percentage Markup'
FROM products;