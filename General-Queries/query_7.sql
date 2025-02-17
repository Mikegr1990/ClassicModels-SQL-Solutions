-- 7. What is the value of orders shipped in August 2004? (Hint).
SELECT SUM(od.priceEach * od.quantityOrdered) AS value_of_order
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE o.shippedDate BETWEEN '2004-08-01' AND '2004-08-31';