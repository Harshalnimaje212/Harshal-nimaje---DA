CREATE DATABASE Ola ;
USE Ola ;

# please import bookins csv file in ola table

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    user_type ENUM('Driver', 'Passenger'),
    location VARCHAR(100)
);

CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    vehicle_type VARCHAR(50),
    vehicle_number VARCHAR(20) UNIQUE,
    availability_status ENUM('Available', 'Not Available'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Rides (
    ride_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    ride_status ENUM('Completed', 'Pending', 'Canceled'),
    ride_start_time DATETIME,
    ride_end_time DATETIME,
    fare DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    ride_id INT,
    amount DECIMAL(10, 2),
    payment_status ENUM('Pending', 'Completed'),
    payment_time DATETIME,
    FOREIGN KEY (ride_id) REFERENCES Rides(ride_id)
);

SELECT * FROM bookings WHERE Booking_Status = "Success" ;

INSERT INTO Users (name, email, phone_number, user_type, location)
VALUES 
('John Doe', 'john.doe@example.com', '9876543210', 'Driver', 'Location A'),
('Alice Smith', 'alice.smith@example.com', '9123456789', 'Passenger', 'Location B'),
('Michael Brown', 'michael.brown@example.com', '9234567890', 'Driver', 'Location C'),
('Emily Davis', 'emily.davis@example.com', '9345678901', 'Passenger', 'Location D'),
('Chris Taylor', 'chris.taylor@example.com', '9456789012', 'Driver', 'Location E'),
('Sophia Johnson', 'sophia.johnson@example.com', '9567890123', 'Passenger', 'Location F'),
('David White', 'david.white@example.com', '9678901234', 'Driver', 'Location G'),
('Olivia Harris', 'olivia.harris@example.com', '9789012345', 'Passenger', 'Location H'),
('James Green', 'james.green@example.com', '9890123456', 'Driver', 'Location I'),
('Isabella Lee', 'isabella.lee@example.com', '9901234567', 'Passenger', 'Location J'),
('Liam King', 'liam.king@example.com', '9002345678', 'Driver', 'Location K'),
('Mia Scott', 'mia.scott@example.com', '9113456789', 'Passenger', 'Location L'),
('William Hall', 'william.hall@example.com', '9224567890', 'Driver', 'Location M'),
('Charlotte Lewis', 'charlotte.lewis@example.com', '9335678901', 'Passenger', 'Location N'),
('Ethan Allen', 'ethan.allen@example.com', '9446789012', 'Driver', 'Location O'),
('Amelia Young', 'amelia.young@example.com', '9557890123', 'Passenger', 'Location P'),
('Noah Adams', 'noah.adams@example.com', '9668901234', 'Driver', 'Location Q'),
('Ava Martinez', 'ava.martinez@example.com', '9779012345', 'Passenger', 'Location R'),
('Logan Walker', 'logan.walker@example.com', '9880123456', 'Driver', 'Location S'),
('Harper Hill', 'harper.hill@example.com', '9991234567', 'Passenger', 'Location T');

INSERT INTO Vehicles (user_id, vehicle_type, vehicle_number, availability_status)
VALUES 
(1, 'Sedan', 'ABC123', 'Available'),
(3, 'SUV', 'DEF456', 'Available'),
(5, 'Hatchback', 'GHI789', 'Not Available'),
(7, 'Sedan', 'JKL012', 'Available'),
(9, 'SUV', 'MNO345', 'Available'),
(11, 'Hatchback', 'PQR678', 'Not Available'),
(13, 'Sedan', 'STU901', 'Available'),
(15, 'SUV', 'VWX234', 'Available'),
(17, 'Hatchback', 'YZA567', 'Not Available'),
(19, 'Sedan', 'BCD890', 'Available');

INSERT INTO Rides (user_id, vehicle_id, pickup_location, drop_location, ride_status, ride_start_time, ride_end_time, fare)
VALUES 
(2, 1, 'Rajajinagar', 'Kadugodi', 'Completed', '2025-01-08 08:00:00', '2025-01-08 08:30:00', 200.00),
(4, 2, 'Kadugodi', 'Hennur', 'Completed', '2025-01-08 09:00:00', '2025-01-08 09:20:00', 150.00),
(6, 3, 'Tumkur Road', 'Peenya', 'Pending', '2025-01-08 10:00:00', NULL, NULL),
(8, 4, 'Bannerghatta Road', 'Varthur', 'Completed', '2025-01-08 11:00:00', '2025-01-08 11:40:00', 250.00),
(10, 5, 'Chamarajpet', 'Jayanagar', 'Canceled', NULL, NULL, NULL),
(12, 6, 'RT Nagar', 'Banashankari', 'Completed', '2025-01-08 13:00:00', '2025-01-08 13:25:00', 180.00),
(14, 7, 'Hosur Road', 'MG Road', 'Pending', NULL, NULL, NULL),
(16, 8, 'Cox Town', 'HSR Layout', 'Completed', '2025-01-08 15:00:00', '2025-01-08 15:50:00', 300.00),
(18, 9, 'Indiranagar', 'BTM Layout', 'Completed', '2025-01-08 16:00:00', '2025-01-08 16:30:00', 220.00),
(20, 10, 'Magadi Road', 'Langford Town', 'Completed', '2025-01-08 17:00:00', '2025-01-08 17:45:00', 270.00);

INSERT INTO Payments (ride_id, amount, payment_status, payment_time)
VALUES 
(41, 200.00, 'Completed', '2025-01-08 08:40:00'),
(42, 150.00, 'Completed', '2025-01-08 09:30:00'),
(43, 250.00, 'Completed', '2025-01-08 11:50:00'),
(44, NULL, 'Pending', NULL),
(45, 180.00, 'Completed', '2025-01-08 13:40:00'),
(46, NULL, 'Pending', NULL),
(47, 300.00, 'Completed', '2025-01-08 15:55:00'),
(48, NULL, 'Pending', NULL),
(49, 220.00, 'Completed', '2025-01-08 16:40:00'),
(50, 270.00, 'Completed', '2025-01-08 17:50:00');


SELECT * FROM Vehicles WHERE availability_status = 'Available';


UPDATE Vehicles
SET availability_status = 'Not Available'
WHERE vehicle_id = 1;


INSERT INTO Rides (user_id, vehicle_id, pickup_location, drop_location, ride_status, ride_start_time, ride_end_time, fare)
VALUES (2, 1, 'Location B', 'Location A', 'Pending', NOW(), NULL, NULL);


UPDATE Rides
SET fare = (TIMESTAMPDIFF(MINUTE, ride_start_time, NOW()) * 5)
WHERE ride_id = 1;


UPDATE Rides
SET ride_status = 'Completed', ride_end_time = NOW()
WHERE ride_id = 1;


INSERT INTO Payments (ride_id, amount, payment_status, payment_time)
VALUES (1, 200.00, 'Completed', NOW());


SELECT SUM(amount) AS total_earnings
FROM Payments
JOIN Rides ON Rides.ride_id = Payments.ride_id
WHERE Rides.vehicle_id IN (SELECT vehicle_id FROM Vehicles WHERE user_id = 1);


SELECT COUNT(*) AS total_rides
FROM Rides
WHERE vehicle_id IN (SELECT vehicle_id FROM Vehicles WHERE user_id = 1);


SELECT * FROM Rides
WHERE ride_start_time BETWEEN '2025-01-01' AND '2025-08-01';


SELECT pickup_location, COUNT(*) AS pickup_count
FROM Rides GROUP BY pickup_location ORDER BY pickup_count DESC LIMIT 5;


UPDATE Payments SET payment_status = 'Completed' WHERE ride_id = 1;


SELECT pickup_location, drop_location, AVG(fare) AS average_fare FROM Rides 
WHERE ride_status = 'Completed'GROUP BY pickup_location, drop_location
ORDER BY average_fare DESC;


SELECT pickup_location, COUNT(*) AS total_rides FROM Rides
GROUP BY pickup_location ORDER BY total_rides DESC LIMIT 5;


