CREATE PROCEDURE GetMaxQuantity()
SELECT max(Quantity) AS 'Max Quantity in Order'
FROM Orders;

CALL GetMaxQuantity()