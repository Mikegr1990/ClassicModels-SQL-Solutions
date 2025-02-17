-- 4. For orders containing more than two products, report those products that constitute more than 50% of the value of the order.
-- orders containing more than 2 products
SELECT orderNumber, COUNT(DISTINCT productCode) AS number_of_products
FROM orderdetails
GROUP BY orderNumber
HAVING number_of_products > 2
ORDER BY number_of_products DESC;

-- total value of each order
SELECT orderNumber, SUM(priceEach * quantityOrdered) AS order_value
FROM orderdetails
GROUP BY orderNumber
HAVING COUNT(DISTINCT productCode) > 2
ORDER BY COUNT(DISTINCT productCode) DESC;

-- value of each product within an order
SELECT orderNumber, productCode, (priceEach * quantityOrdered) AS product_value
FROM orderdetails;

SELECT 
	od.orderNumber, 
    od.productCode, 
    (priceEach * quantityOrdered) AS product_value,
    (SELECT SUM(od2.priceEach * od2.quantityOrdered)
     FROM orderdetails od2
     WHERE od2.orderNumber = od.orderNumber) AS order_value
FROM orderdetails od; 

-- Final query	   	
SELECT 
	od.orderNumber, 
    od.productCode, 
    (od.priceEach * od.quantityOrdered) AS product_value,
    ROUND((od.priceEach * od.quantityOrdered) /
		(SELECT SUM(od2.priceEach * od2.quantityOrdered)
		 FROM orderdetails od2
		 WHERE od2.orderNumber = od.orderNumber) * 100, 2) AS product_percentage
FROM orderdetails od
WHERE
	(od.priceEach * od.quantityOrdered) >
    (SELECT SUM(od2.priceEach * od2.quantityOrdered) * 0.5
    FROM orderdetails od2
    WHERE od2.orderNumber = od.orderNumber)
AND od.orderNumber IN (
	SELECT orderNumber
    FROM orderdetails
    GROUP BY orderNumber
    HAVING COUNT(DISTINCT productCode) > 2
)
ORDER BY od.orderNumber, product_percentage DESC;