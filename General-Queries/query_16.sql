-- 16. Write a procedure to report the amount ordered in a specific month and year for customers containing a specified character string in their name.
DROP PROCEDURE IF EXISTS amount_ordered;
DELIMITER $$
CREATE PROCEDURE amount_ordered (
    IN month_input INT,    -- Month (as a number)
    IN year_input INT,     -- Year (as a number)
    IN customer_name_input VARCHAR(50)  -- Customer name filter
)
BEGIN
    SELECT 
        SUM(od.priceEach * od.quantityOrdered) AS total_amount_ordered
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    JOIN customers c ON o.customerNumber = c.customerNumber
    WHERE YEAR(o.orderDate) = year_input
    AND MONTH(o.orderDate) = month_input
    AND c.customerName LIKE CONCAT('%', customer_name_input, '%');
END $$
DELIMITER ;

CALL amount_ordered(2, 2005, 'Euro+'); -- Expected output '120166.57999999999'

-- check if procedure works
SELECT c.customerName, MONTH(o.orderDate) AS month_number, YEAR(o.orderDate) AS year, SUM(od.priceEach * od.quantityOrdered) AS total_amount_ordered
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName, MONTH(o.orderDate), YEAR(o.orderDate)
ORDER BY total_amount_ordered DESC;