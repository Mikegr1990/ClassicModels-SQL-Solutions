-- 6. Reports those products that have been sold with a markup of 100% or more (i.e.,  the priceEach is at least twice the buyPrice)
SELECT p.productName, 2*(p.buyPrice) AS twice_buy_price, od.priceEach
FROM products p	
JOIN orderdetails od ON p.productcode = od.productcode
WHERE od.priceEach > 2*(p.buyPrice);