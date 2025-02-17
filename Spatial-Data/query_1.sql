-- 1. Which customers are in the Southern Hemisphere?
-- The Offices and Customers tables contain the latitude and longitude of each office and customer in officeLocation and customerLocation, respectively, in POINT format. Conventionally, latitude and longitude and reported as a pair of points, with latitude first.
-- Convert customerLocation to Readable Text
SELECT
	customerNumber,
    customerName,
    ST_AsText(customerLocation) AS location
FROM customers;

SELECT
	customerNumber,
    customerName,
    ST_AsText(customerLocation) AS location,
    ST_Y(customerLocation) AS latitude,
    ST_X(customerLocation) AS longitude
FROM customers
WHERE ST_Y(customerLocation) < 0;