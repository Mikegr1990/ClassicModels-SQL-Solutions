-- 4. Compute the commission for each sales representative, assuming the commission is 5% of the value of an order. Sort by employee last name and first name.
SELECT SUM(od.priceEach * od.quantityOrdered * 0.05) AS comission, CONCAT(e.lastName, ' ', e.firstName) AS sales_representative
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber, e.lastName, e.firstName
ORDER BY e.lastName, e.firstName;