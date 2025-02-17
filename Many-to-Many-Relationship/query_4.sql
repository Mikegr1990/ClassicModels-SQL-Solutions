-- 4. Are there any products that appear on all orders?
SELECT od.productCode
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY od.productCode
HAVING COUNT(DISTINCT o.orderNumber) = (SELECT COUNT(DISTINCT orderNumber) FROM orders);