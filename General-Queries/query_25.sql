-- 25. Same as Last Year (SALY) analysis: Compute the ratio for each product of sales for 2003 versus 2004.
SELECT
	p.productName,
    p.productCode,
    SUM(CASE WHEN YEAR(o.orderDate) = 2004 THEN od.priceEach * od.quantityOrdered ELSE 0 END) AS sales_2004,
    SUM(CASE WHEN YEAR(o.orderDate) = 2003 THEN od.priceEach * od.quantityOrdered ELSE 0 END) AS sales_2003,
    (SUM(CASE WHEN YEAR(o.orderDate) = 2004 THEN od.priceEach * od.quantityOrdered ELSE 0 END) /
	 NULLIF(SUM(CASE WHEN YEAR(o.orderDate) = 2003 THEN od.priceEach * od.quantityOrdered ELSE 0 END), 0) 
    ) AS sales_ratio
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productCode
ORDER BY sales_ratio DESC;
