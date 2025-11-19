CREATE DATABASE  CarDealershipDB;
USE CarDealershipDB;

CREATE TABLE Inventory (
	CarID INT PRIMARY KEY,
    Make VARCHAR(255),
    Model VARCHAR(255),
    Year INT,
    Prince INT,
    Status BOOLEAN,
    VIN_Number VARCHAR(255),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES DealershipLocation(LocationID)
);
 
CREATE TABLE DealershipLocation (
	LocationID INT PRIMARY KEY,
    LocationName VARCHAR(255),
    Adress VARCHAR(255),
    PhoneNumber VARCHAR(255)
);
 


CREATE TABLE Sales (
	SalesID INT PRIMARY KEY, 
	Car_ID INT, 
	Customers_ID INT,
	Employee_ID INT, 
	SaleDate DATE,
	FinalPrice INT,
	Status BOOLEAN,
	FOREIGN KEY (Car_ID) REFERENCES Inventory(CarID),
	FOREIGN KEY (Customers_ID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (Employee_ID) REFERENCES Employees(EmployeeID)
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(50),
    Address VARCHAR(255),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES DealershipLocation(LocationId)

);

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    PhoneNumber INT,
    HireDate DATETIME,
    Position VARCHAR(50),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES DealershipLocation(LocationID)
);


INSERT INTO Inventory(CarID, Make,  Model, Year, Price, Status, VIN_Number, Location_ID)
VALUES 	(1, "BMW", "3 Series Gran Limousine 320Ld Luxury Line", "2023", "£5800000", 1, "WE61 AMY", 1), 
		(2, "Ford", "Freestyle Titanium Petrol BSIV", "2020", "£400000", 1, "T45 HOY", 1),
        (3, "Peugeot", "309 GLD", "1997", "£57000", 1, "BA51 XJR",1),
        (4, "Honda", "City 2017-2020 GXi", "2006", "£200000", 1, "SC07 SSL",1),
        (5, "Ford", "Fiesta 1.4 Duratorq ZXI", "2006", "£180000", 1, "G5 AAR", 1),
        (6, "Chevrolet", "Spark 1.0", "2008", "£45000", 1, "Y70 JAK" ,2),
        (7, "Hyundai", "i10 Sportz Option", "2009", "£199000", 1, "RE56 EVE", 2),
        (8, "Fiat", "Punto 1.3 Emotion", "2009", "£150000", 0, "Y300 BEV", 2),
        (9, "Volkswagen", "Polo Diesel Highline 1.2L", "2010", "3275000", 0, "50 CEX", 2),
        (10, "Skoda", "Fabia 1.2L Diesel Elegance", "2011", "£340000", 0, "84 CAT", 2);


INSERT INTO DealershipLocation (LocationID, LocationName, Adress, PhoneNumber)
VALUES (1, "Parc Lane Cars", "Tyneside Autoparc, Newcastle, NE3 5HE", "01913401291"), 
	(2, "Midlands Motors", "69A Cotterills Lane, Birmingham B8 2", "0121 684 0803");
    
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address, Location_ID)
VALUES
(1, 'Clifton', 'Collins', 'CliftonCollin@gmail.com', '07121387894', '13 Ormskirk Grove, Cramlington', 1),
(2, 'Conrad', 'Arroyo', 'ConradArroyo@gmail.com', '07144287679', 'Moor View, Melkridge', 2),
(3, 'Truman', 'Taylor', 'TrumanTaylor@gmail.com', '07866249131', '24 Harleston Way, Gateshead', 2),
(4, 'James', 'Sanders', 'JamesSanders@gmail.com', '07904402347', '1 Old School Close, Alnwick', 1),
(5, 'Julia', 'Archer', 'JuliaArcher@gmail.com', '075088029481', '1 Admiral Close, Swarland', 2);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, Position, Location_ID)
VALUES (1, 'Andi', 'Xhelilaj', 'AndiX@CoolCars.com', 0734567890 , '2020-01-01', 'Sales Manager', 2),
    (2, 'Conan', 'Hildrew', 'ConanH@CoolCars.com', 0776543210, '2024-02-01 08:30:00', 'Technician', 1),
    (3, 'Jacob', 'Adjei', 'JacobA@CoolCars.com', 0751234567, '2024-03-10 10:00:00', 'Salseman', 2),
    (4, 'Razik', 'Ali', 'RazikA@CoolCars.com', 0778372057, '2023-07-15 07:45:00', 'Salseman', 1); employees



    
ALTER TABLE Employees
MODIFY PhoneNumber VARCHAR(255);
ALTER TABLE inventory
RENAME COLUMN Prince to Price;
ALTER TABLE Inventory
MODIFY Price VARCHAR(255);

ALTER TABLE Sales
MODIFY FinalPrice VARCHAR(255);
ALTER TABLE Sales
RENAME COLUMN Car_ID to CarID;
ALTER TABLE Sales
RENAME COLUMN Customers_ID to CustomerID;
ALTER TABLE Sales
RENAME COLUMN Employee_ID to EmployeeID;

INSERT INTO Sales (SalesID, CarID, CustomerID, EmployeeID, SaleDate, FinalPrice, Status)
VALUES(1, 4, 4, 4,  "2025-08-20", "£200000", 1),
	  (2, 7, 3, 3, "2025-07-11", "£199000", 1),
	  (3, 1, 1, 4, "2025-05-31", "£5550000", 1),
      (4, 8, 5, 1, "2025-08-23", "£150000", 1),
      (5, 6, 2, 3, "2025-04-27", "£80000", 1);


 