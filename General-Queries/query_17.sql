-- 17. Write a procedure to change the credit limit of all customers in a specified country by a specified percentage.
DROP PROCEDURE IF EXISTS change_credit_limit;
DELIMITER $$
CREATE PROCEDURE change_credit_limit(
	IN country_name VARCHAR(50),
    IN percentage_change DECIMAL(5,2)
)
BEGIN
	UPDATE customers
	SET creditLimit = creditLimit * (1 + (percentage_change / 100))
	WHERE country = country_name;
SELECT CONCAT('Credit Limit updated for ', country_name, ' by ', percentage_change, '%') AS result_message;
END $$
DELIMITER ;

CALL change_credit_limit('France', 10);