-- 8. Compute the total value ordered, total amount paid, and their difference for each customer for orders placed in 2004 and payments received in 2004 (Hint; Create views for the total paid and total ordered).
CREATE VIEW total_ordered AS
SELECT 
    o.customerNumber,
    SUM(od.priceEach * od.quantityOrdered) AS total_value_ordered
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.orderDate BETWEEN '2004-01-01' AND '2004-12-31'
GROUP BY o.customerNumber;

CREATE VIEW total_paid AS
SELECT 
    customerNumber,
    SUM(amount) AS total_amount_paid
FROM payments
WHERE paymentDate BETWEEN '2004-01-01' AND '2004-12-31'
GROUP BY customerNumber;

SELECT 
    o.customerNumber,
    c.customerName,
    COALESCE(o.total_value_ordered, 0) AS total_value_ordered,
    COALESCE(p.total_amount_paid, 0) AS total_amount_paid,
    COALESCE(o.total_value_ordered, 0) - COALESCE(p.total_amount_paid, 0) AS difference
FROM total_ordered o
LEFT JOIN total_paid p ON o.customerNumber = p.customerNumber
JOIN customers c ON o.customerNumber = c.customerNumber
ORDER BY difference DESC;

-- 2nd way to solve #8
SELECT 
    o.customerNumber,
    c.customerName,
    SUM(od.priceEach * od.quantityOrdered) AS total_value_ordered,
    SUM(p.amount) AS total_amount_paid,
    SUM(od.priceEach * od.quantityOrdered) - SUM(p.amount) AS difference
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
LEFT JOIN payments p ON o.customerNumber = p.customerNumber
WHERE o.orderDate BETWEEN '2004-01-01' AND '2004-12-31'
  AND p.paymentDate BETWEEN '2004-01-01' AND '2004-12-31'
GROUP BY o.customerNumber, c.customerName
ORDER BY difference DESC;