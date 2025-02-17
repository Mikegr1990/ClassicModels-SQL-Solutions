-- 2. Which US customers are south west of the New York office?
SELECT COUNT(*)
FROM customers
WHERE customerLocation IS NULL; -- check for missing coordinates

SELECT
	customerNumber,
    customerName,
    ST_AsText(customerLocation) AS location,
    ST_Y(customerLocation) AS latitude,
    ST_X(customerLocation) AS longitude
FROM customers
WHERE country = 'USA' -- Filter only US customers
AND ST_Y(customerLocation) < 40.7128  -- South of NYC
AND ST_X(customerLocation) < -74.0060 -- West of NYC
;