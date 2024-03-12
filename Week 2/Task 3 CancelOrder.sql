DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder (IN OrderIDInput INT)
	BEGIN
	DELETE FROM orders WHERE OrderID = OrderIDInput;
	SELECT CONCAT("Order", (OrderIDInput), " is cancelled") AS Confimation;

    END //
DELIMITER ;
call CancelOrder(5);