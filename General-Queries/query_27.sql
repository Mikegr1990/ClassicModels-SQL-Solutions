-- 27. Find the products sold in 2003 but not 2004.
-- This query finds products that were sold in 2003 but not in 2004.
-- "Sold" means any product that appeared in an order, regardless of order status.
SELECT
	DISTINCT p.productName
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE YEAR(o.orderDate) = 2003
AND p.productCode NOT IN (
	SELECT
		DISTINCT p2.productCode
    FROM products p2
    JOIN orderdetails od2 ON p2.productCode = od2.productCode
	JOIN orders o2 ON od2.orderNumber = o2.orderNumber
    WHERE YEAR(o2.orderDate) = 2004
);
-- In case we want to consider only shipped orders, then include the following
-- AND o.status = 'Shipped'
-- AND o2.status = 'Shipped'