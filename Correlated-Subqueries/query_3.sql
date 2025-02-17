-- 3. Report for each product, the percentage value of its stock on hand as a percentage of the stock on hand for product line to which it belongs. Order the report by product line and percentage value within product line descending. Show percentages with two decimal places.
SELECT 
	productName,
    productLine,
    quantityInStock,
    ROUND((quantityInstock / (
		SELECT SUM(p2.quantityInStock)
        FROM products p2
        WHERE p2.productLine = p1.productLine
    )) * 100, 2) AS stock_percentage
FROM products p1
ORDER BY productLine, stock_percentage DESC;