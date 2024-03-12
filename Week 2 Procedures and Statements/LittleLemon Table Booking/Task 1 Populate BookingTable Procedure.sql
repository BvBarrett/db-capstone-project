use LittleLemonDB;

-- Task 1: Populate the Bookings table  (BookingID is AUTO INCREMENT field)
INSERT INTO Bookings (BookingDate, TableNo, BookingSlot, CustomerID, StaffID)
VALUES
('2022-10-10', 5, '19:00:00', 1, 1),
('2022-11-12', 3, '21:00:00', 2, 1),
('2022-10-11', 2, '15:00:00', 3, 3),
('2022-10-13', 2, '17:30:00', 4, 4),
('2023-04-17', 1, '18:30:00', 5, 2),
('2023-07-30', 8, '20:00:00', 6, 5);

select * from Bookings;