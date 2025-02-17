-- 4. List the product lines that contain 'Cars'.
SELECT productLine AS 'Cars'
FROM productlines
WHERE productLine LIKE '%Cars%';