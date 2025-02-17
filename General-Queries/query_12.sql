-- 12. Write a procedure to increase the price of a specified product category by a given percentage. You will need to create a product table with appropriate data to test your procedure. Alternatively, load the ClassicModels database on your personal machine so you have complete access. You have to change the DELIMITER prior to creating the procedure.
-- DROP PROCEDURE IF EXISTS increase_price_by_category;
DELIMITER $$
CREATE PROCEDURE increase_price_by_category (
	IN product_category VARCHAR(50), -- Input: Category to update
    IN percentage_increase DECIMAL(5,2) -- Input: Percentage increase
)
BEGIN
	-- Update the prices in the specified category
    UPDATE products
    SET buyPrice = buyPrice * (1 + (percentage_increase / 100))
    WHERE productline = product_category;
     -- Provide feedback
     SELECT CONCAT('Prices updated for category: ', product_category, ' by ', percentage_increase, '%') AS result_message;
END $$
DELIMITER ;

-- Test and Call the procedure
SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine = 'Motorcycles';

CALL increase_price_by_category('Motorcycles', 10);

SELECT productCode, productName, productLine, buyPrice
FROM products
WHERE productLine = 'Motorcycles';