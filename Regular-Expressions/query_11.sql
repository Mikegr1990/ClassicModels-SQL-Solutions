-- 11. List the vendors whose name ends in Diecast.
SELECT *
FROM products
WHERE productVendor LIKE '%Diecast';