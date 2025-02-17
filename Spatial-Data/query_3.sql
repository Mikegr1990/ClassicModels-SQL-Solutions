-- 3. Which customers are closest to the Tokyo office (i.e., closer to Tokyo than any other office)?
-- Tokyo Office Coordinates
SELECT 
    officeCode, 
    city, 
    ST_AsText(officeLocation) AS location, 
    ST_Y(officeLocation) AS latitude, 
    ST_X(officeLocation) AS longitude
FROM offices
WHERE city = 'Tokyo';

-- Distance to Tokyo
SELECT
	c.customerNumber,
    c.customerName,
    ST_Distance(c.customerLocation, o.officeLocation) AS distance_to_tokyo
FROM customers c
JOIN offices o ON o.city = 'Tokyo'
ORDER BY distance_to_tokyo ASC;

-- final query
SELECT 
    c.customerNumber, 
    c.customerName, 
    ST_Distance(c.customerLocation, o.officeLocation) AS distance_to_tokyo
FROM customers c
JOIN offices o ON o.city = 'Tokyo'
WHERE ST_Distance(c.customerLocation, o.officeLocation) <= ALL (
	SELECT ST_Distance(c.customerLocation, o2.officeLocation)
    FROM offices o2
)
ORDER BY distance_to_tokyo ASC;