-- 8. What is the quantity on hand for products listed on 'On Hold' orders?
SELECT DISTINCT p.productName, p.quantityInStock, o.status
FROM orderDetails od
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE o.status = 'On Hold'
ORDER BY p.quantityInStock DESC;