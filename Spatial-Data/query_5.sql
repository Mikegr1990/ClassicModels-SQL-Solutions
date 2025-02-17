-- 5. Who is the northernmost customer?
SELECT
	customerNumber,
    customerName,
    ST_Y(customerLocation) AS latitude, 
    ST_X(customerLocation) AS longitude
FROM customers
WHERE ST_Y(customerLocation) = (
	SELECT MAX(ST_Y(customerLocation))
    FROM customers);