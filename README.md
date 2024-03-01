# Capstone project Little Lemon Database

## About
<p align="center">
  <a href="https://github.com/marcoshsq/PythonPredictiveAnalytics">
    <img src="https://1000logos.net/wp-content/uploads/2021/10/logo-Meta.png" alt="Developer Roadmap" width="120" height="">
  </a>
</p>
  <h2 align="center">Meta Database Engineer</h2>
</div>

The capstone project serves as a culmination of the specialization [meta-database-engineer](https://www.coursera.org/professional-certificates/meta-database-engineer#courses), by demonstrating the skills that constitutes designing and composing a database solution and the relevant technologies.

## Acknowledgement  
This project utilizes synthetic data generated by OpenAI's ChatGPT. Due to the unavailability of the specific data initially intended for use in this capstone project course, I opted to leverage ChatGPT to create a realistic dataset that aligns with the project's requirements. This approach allowed us to proceed with the database and client system development for the Little Lemon restaurant, ensuring the project's continuity and the demonstration of the skills acquired throughout the project.

## Description 
This  project will design a data solution for the Little Lemon Restaurant. it involves setting upset a database, incorporating `Stored Procedures`, A way to interact with the client and the use of visualization to communicate the data.

tools used:
`MySQL(Workbench)` - For developing and setup of the databsase.
`Python` - Setting up a client and interacting with the database.
`Tableau` - Visualization of the data.

## Week 1 - Setting Up the Project
To get your database ready, follow the steps:

1. **Install MySQL:** If MySQL isn't already on your computer, download and install it.
2. **Get the SQL File:** Download the `LittleLemonDB.sql` file from this repository - in week-1.
3. **Set Up in MySQL Workbench:**
   - Open MySQL Workbench.
   - Go to `Server` > `Data Import`.
   - Select `Import from Self-Contained File` and choose the `LittleLemonDB.sql` file.
   - Hit `Start Import` to bring in and run the SQL commands from the file.

After these steps, your database will be set up with all the necessary tables and stored procedures ready to go.


### Entity-Relationship Diagram
---
This diagram represents the database structure for the Little Lemon restaurant's management system.  aims to translate the technical structure into business-oriented language that highlights the relevance of each part of the diagram to the client's daily operations.

![LittleLemonDM](LittleLemonDM.png)
 
- **Staff Information**: This entity holds details about your staff members, including their roles and salaries. It's the core of your human resources data.
- **Bookings**: Here, we manage customer reservations with details about the booking time and the table number reserved. It links to both your customers and staff, showing who booked and who will be serving them.
- **Customer Details**: This entity stores information about your customers, like their names, contact numbers, and email addresses, which is vital for your marketing and customer relationship efforts.
- **Orders**: This is where we track each order placed, linked to the menu, booking, and staff information. It records what was ordered, by whom, the cost, and the table number, giving you a comprehensive view of sales transactions.
- **Menu**: It lists all the items on your menu, categorized by type of cuisine, starters, main courses, drinks, and desserts. This allows for easy updates and management of what you offer.
- **Order Delivery Status**: For orders that are out for delivery, this entity keeps track of the delivery date and the status, ensuring you have up-to-date information on order fulfillment.
---

## Week 2 - Create optimized queries to manage and analyze data
Scenario 

Little Lemon need to query the data in their database. To do this, they need your help with creating optimized queries using stored procedures and prepared statements.

Prerequisites
Refer to the folder for extra screenshots

- `GetMaxQuantity()`
```sql
DELIMITER $$

DROP PROCEDURE IF EXISTS GetMaxQuantity$$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE MaxQty INT;    
    SELECT MAX(Quantity) INTO MaxQty FROM Orders;
    SELECT MaxQty AS `Maximum ordered quantity`;
END$$

DELIMITER ;
###
CALL GetMaxQuantity();
```
- `CheckBooking()`
```sql
USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER $$ 

CREATE PROCEDURE CheckBooking(IN BookDate DATE, IN TableNum INT)
BEGIN
    DECLARE bookingCount INT DEFAULT 0;
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE `Date` = BookDate AND `TableNumber` = TableNum;

    IF bookingCount > 0 THEN
        SELECT CONCAT('Table ', TableNum, ' is already booked') AS 'Booking Status'; 
    ELSE
        SELECT CONCAT('Table ', TableNum, ' is available') AS 'Booking Status'; 
    END IF;
END$$

DELIMITER ;

CALL CheckBooking('2024-02-25 13:00:00', 1);
```
- `UpdateBooking()`
```sql
USE `LittleLemonDM`;

DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER $$

CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookDate DATE) 
BEGIN
	UPDATE Bookings SET BookDate = BookDate WHERE BookingID = BookingID; 
	SELECT CONCAT("Booking ", BookingID, " updated") AS "Confirmation"; 
END$$
 
DELIMITER ; 
###
Call UpdateBooking(10100, '2024-02-25 21:00:00');
```
- `Addbooking()`
```sql
USE `LittleLemonDM`;

DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER $$

CREATE PROCEDURE AddBooking(IN BookingID INT, IN CustomerID INT, IN BookDate DATETIME, IN StaffID INT, IN TableNumber INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookDate, StaffID, TableNumber)
    VALUES (BookingID, CustomerID, BookDate, StaffID, TableNumber);
    SELECT CONCAT("New Booking Added: ", BookingID) AS Confirmation;
END$$

DELIMITER ;
##
CALL AddBooking(10102, 15102, '2024-02-26 20:00:00', 15, 4);
```
- `CancelBooking()`
```sql
USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = BookINGID;
SELECT CONCAT("Booking ", BookID, " cancelled") AS "Confirmation"; 
END//

DELIMITER ;

###
CALL CancelBooking('2024-02-25 13:00:00',1);
```

- `AddValidBooking()`
```sql
USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER $$ 

CREATE PROCEDURE AddValidBooking(IN BookDate DATE, IN TableNum INT, IN CustomID INT)
BEGIN
    DECLARE bookingCount INT DEFAULT 0;
    
    -- Check for existing bookings for the given date and table number before starting the transaction
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE `BookDate` = BookDate AND `TableNumber` = TableNum;

    -- Start the transaction after the check
    START TRANSACTION;

    IF bookingCount = 0 THEN
        -- If no existing booking is found, proceed to insert the new booking
        INSERT INTO Bookings (`Date`, `TableNumber`, `CustomerID`)
        VALUES (BookDate, TableNum, CustomID);
        
        -- Commit the transaction to save the new booking
        COMMIT;
        SELECT 'Booking successful.' AS Message;
    ELSE
        -- If an existing booking is found, rollback any changes made during the transaction (if any)
        ROLLBACK;
        SELECT CONCAT("Table ", TableNum, " is already booked - booking cancelled") AS "Booking Status";
    END IF;
END$$

DELIMITER ; 

CALL AddValidBooking('2024-02-01 20:00:00', 5, 15001);
#Output:
# Booking Status
#'Table 5 is already booked - booking cancelled'
```

- `CancelOrder()`
```sql
USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = BookINGID;
SELECT CONCAT("Booking ", BookID, " cancelled") AS "Confirmation"; 
END//

DELIMITER ;

#----
CALL CancelBooking('2024-02-25 13:00:00',1);
```
## Week 3 - Visualization in Tableau
