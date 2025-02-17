-- 1. Report the account representative for each customer.
SELECT c.customername, CONCAT(e.firstname, ' ', e.lastname) AS 'Account Representative'
FROM customers c
JOIN employees e ON c.salesrepemployeenumber = e.employeenumber;