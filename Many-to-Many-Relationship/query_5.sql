-- 5. List the names of products sold at less than 80% of the MSRP.
SELECT p.productName, p.MSRP, od.priceEach
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
WHERE od.priceEach < (p.MSRP * 0.8)
ORDER BY p.MSRP;