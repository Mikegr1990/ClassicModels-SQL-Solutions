-- 4. Report the products that have not been sold.
SELECT *
FROM products p
WHERE NOT EXISTS (
	SELECT *
	FROM orderdetails o
	WHERE p.productcode = o.productcode
);