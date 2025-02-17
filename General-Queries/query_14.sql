-- 14. What is the ratio of the value of payments made to orders received for each month of 2004? (i.e., divide the value of payments made by the orders received)?
SELECT SUM(od.priceEach * od.quantityOrdered) AS total_order_value, MONTHNAME(o.orderDate) AS month, YEAR(o.orderDate) AS year
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE YEAR(o.orderDate) = '2004'
GROUP BY year, month;

SELECT SUM(amount) AS total_payments, MONTHNAME(paymentDate) AS month, YEAR(paymentDate) AS year
FROM payments
WHERE YEAR(paymentDate) = '2004'
GROUP BY year, month;

SELECT
	COALESCE(p.month, o.month) AS month,
    COALESCE(p.year, o.year) AS year,
    COALESCE(total_payments, 0) AS total_payments,
    COALESCE(total_order_value, 0) AS total_order_value,
    COALESCE(total_payments, 0) / COALESCE(total_order_value, 1) AS payment_to_order_ratio
FROM
-- LEFT JOIN: All payments and matching orders
(
        SELECT 
            MONTHNAME(paymentDate) AS month,
            YEAR(paymentDate) AS year,
            SUM(amount) AS total_payments
        FROM payments
        WHERE YEAR(paymentDate) = 2004
        GROUP BY year, month
    ) p
LEFT JOIN 
    (
        SELECT 
            MONTHNAME(o.orderDate) AS month,
            YEAR(o.orderDate) AS year,
            SUM(od.priceEach * od.quantityOrdered) AS total_order_value
        FROM orders o
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        WHERE YEAR(o.orderDate) = 2004
        GROUP BY year, month
    ) o
ON p.month = o.month AND p.year = o.year

UNION

SELECT 
    COALESCE(p.month, o.month) AS month,
    COALESCE(p.year, o.year) AS year,
    COALESCE(total_payments, 0) AS total_payments,
    COALESCE(total_order_value, 0) AS total_order_value,
    COALESCE(total_payments, 0) / COALESCE(total_order_value, 1) AS payment_to_order_ratio
FROM 
    -- RIGHT JOIN: All orders and matching payments
    (
        SELECT 
            MONTHNAME(paymentDate) AS month,
            YEAR(paymentDate) AS year,
            SUM(amount) AS total_payments
        FROM payments
        WHERE YEAR(paymentDate) = 2004
        GROUP BY year, month
    ) p
RIGHT JOIN 
    (
        SELECT 
            MONTHNAME(o.orderDate) AS month,
            YEAR(o.orderDate) AS year,
            SUM(od.priceEach * od.quantityOrdered) AS total_order_value
        FROM orders o
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        WHERE YEAR(o.orderDate) = 2004
        GROUP BY year, month
    ) o
ON p.month = o.month AND p.year = o.year
ORDER BY year, month;