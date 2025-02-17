-- 4. Which French customer is furthest from the Paris office?
SELECT
	c.customerNumber,
    c.customerName,
    ST_Distance(c.customerLocation, o.officeLocation) AS distance_to_paris
FROM customers c
JOIN offices o ON o.city = 'Paris'
WHERE c.country = 'France' -- Only French customers
AND ST_Distance(c.customerLocation, o.officeLocation) = (
	SELECT MAX(ST_Distance(c2.customerLocation, o.officeLocation))
    FROM customers c2
    WHERE c2.country = 'France'
)   
ORDER BY distance_to_paris DESC;