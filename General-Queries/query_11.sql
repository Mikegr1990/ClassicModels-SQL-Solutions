-- 11. Write a function to convert miles per gallon to liters per 100 kilometers.
DELIMITER $$
CREATE FUNCTION mpg_to_l_per_100km(mpg DECIMAL(10,2)) -- Input parameter: mpg
RETURNS DECIMAL(10,2)								  -- Return type: DECIMAL(10,2)
DETERMINISTIC										  -- Function always produces the same result for the same input
BEGIN
	-- Handle division by zero to avoid errors
    IF mpg = 0 THEN
		RETURN NULL; -- Return NULL (or 0, if preferred) for MPG = 0
    END IF;
    -- Perform the conversion
    RETURN 235.214583 / mpg;
END $$
DELIMITER ;

SELECT mpg_to_l_per_100km(25) AS liters_per_100km;