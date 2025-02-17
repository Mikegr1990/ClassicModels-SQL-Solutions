-- 2. List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
SELECT DISTINCT(p.productName), o.orderDate
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.productName = '1940 Ford Pickup Truck'
ORDER BY o.orderDate DESC;