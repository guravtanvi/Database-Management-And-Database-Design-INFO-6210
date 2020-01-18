--Create Scripts


-- Table: Product

CREATE TABLE Product
(
ProductID varchar(20) NOT NULL,
ProductName varchar(20) NOT NULL,
Price float,
Brand varchar(20),
CONSTRAINT ProductID_PK Primary Key (ProductID)
);

-- Table: Person

CREATE TABLE Person(
	PersonID varchar(20) NOT NULL,
	PersonName VARCHAR(30),
	PersonEmail VARCHAR(30),
	PersonContact VARCHAR(15),
	PersonAddress VARCHAR(50),
	PersonDOB DATE,
	PersonGender CHAR(10),
	PersonType VARCHAR(30),
	CONSTRAINT Person_PK PRIMARY KEY (PersonID)
);
-- Table: Store

CREATE TABLE Store
(
	StoreID varchar(20) NOT NULL,
	PhoneNumber varchar(15),
	StoreAddress varchar(50), 
	OnlineOrder varchar(10),
	StoreLocation varchar(50),
	CONSTRAINT StoreID_PK Primary Key(StoreID)
);


-- Table: Customer

CREATE TABLE Customer(
	CustomerID varchar(20) NOT NULL,
	PersonID VARCHAR(20),
	CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
	CONSTRAINT Customer_FK FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON UPDATE CASCADE
);

-- Table: Employee

CREATE TABLE Employee(
	EmployeeID varchar(20) NOT NULL,
	PersonID varchar(20),
	CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
	CONSTRAINT Employee_FK FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON UPDATE CASCADE
);


-- Table: Vendor

CREATE TABLE Vendor
 (VendorID VARCHAR(20) NOT NULL,
 VendorName varchar(25),
 RequiredQuantity bigint,
 SellingAmount int,
 ProductID varchar(20),
 CONSTRAINT VendorID_PK Primary Key (VendorID),
 CONSTRAINT VendorID_FK Foreign Key(ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE
);

-- Table: Order

 create table [Order]
(OrderID varchar(20) NOT NULL,
CustomerID VARCHAR(20) NOT NULL,
OrderDate DATE,
Amount float NOT NULL,
CONSTRAINT OrderID_PK Primary Key (OrderID),
CONSTRAINT OrderID_FK Foreign Key (CustomerID) REFERENCES Customer (CustomerID) ON UPDATE CASCADE);


-- Table: OrderLine

create table OrderLine
(OrderLineID varchar(20),
OrderID varchar(20),
ProductID varchar(20),
Quantity INT,
OrderYear VARCHAR(4),
CONSTRAINT OrderLineID_PK Primary Key (OrderLineID),
CONSTRAINT OrderLineID_FK1 Foreign Key (OrderID) REFERENCES [Order] (OrderID) ON UPDATE CASCADE,
CONSTRAINT OrderLineID_FK2 Foreign Key (ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE);


-- Table: CustomerFeedback

create table CustomerFeedback
(FeedbackID varchar(20) NOT NULL,
Rating varchar(30),
Description varchar(50),
CustomerID VARCHAR(20) NOT NULL,
CONSTRAINT Feedback_PK Primary Key (FeedbackID),
CONSTRAINT Feedback_FK Foreign Key (CustomerID) REFERENCES Customer (CustomerID) ON UPDATE CASCADE);

-- Table: ProductInventory

CREATE TABLE ProductInventory 
(InventoryID VARCHAR(20) NOT NULL,
Quantity int,
ProductID varchar(20),
StoreID VARCHAR(20),
CONSTRAINT Inventory_PK Primary Key (InventoryID),
CONSTRAINT Inventory_FK1 Foreign key (ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE,
CONSTRAINT Inventory_FK2 Foreign Key (StoreID) REFERENCES Store (StoreID) ON UPDATE CASCADE
);

-- Table: ProductLine

CREATE TABLE ProductLine
(ProductLineID varchar(20) NOT NULL,
ProductID varchar(20),
CONSTRAINT ProductLine_PK Primary Key (ProductLineID),
CONSTRAINT ProductLine_FK Foreign Key(ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE);


-- Table: ProductDelivery

CREATE TABLE ProductDelivery
(	TrackingID varchar(20),
	ShipmentDate date,
	ShipmentStatus varchar(20),
	StoreID VARCHAR(20),
	CONSTRAINT ProductDelivery_PK Primary Key(TrackingID),
	CONSTRAINT ProductDelivery_FK Foreign Key(StoreID) REFERENCES Store(StoreID) ON UPDATE CASCADE);

-- Table: SportsCategory

create table SportsCategory 
(CategoryID varchar(20) NOT NULL,
CategoryName varchar(30),
ProductID varchar(20) NOT NULL,
CONSTRAINT SportsCategory_PK Primary Key (CategoryID),
CONSTRAINT SportsCategory_FK Foreign Key (ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE);

-- Table: ProductLocator

CREATE TABLE ProductLocator(
	LocatorID VARCHAR(20) NOT NULL,
	CategoryID VARCHAR(20),
	AisleNumber VARCHAR(10),
	FloorNumber INT,
	CONSTRAINT Locator_PK Primary Key (LocatorID),
	CONSTRAINT Locator_FK Foreign Key (CategoryID) REFERENCES SportsCategory(CategoryID) ON UPDATE CASCADE
);


-- Table: Payment

CREATE TABLE Payment
( PaymentID VARCHAR(50) NOT NULL,
  PaymentDate DATE,
  PaymentMethod VARCHAR(50) NOT NULL,
  CustomerID VARCHAR(20) NOT NULL,
  ProductID VARCHAR(20) NOT NULL,
  CONSTRAINT Payment_PK Primary Key(PaymentID),
  CONSTRAINT Payment_FK1 Foreign Key(CustomerID) REFERENCES Customer(CustomerID) ON UPDATE CASCADE,
  CONSTRAINT Payment_FK2 Foreign key(ProductID) REFERENCES Product(ProductID) ON UPDATE CASCADE);

-- Table: WorksIn

CREATE TABLE WorksIn(
	Designation VARCHAR(30),
	StoreID VARCHAR(20) NOT NULL REFERENCES Store(StoreID),
	EmployeeID VARCHAR(20) NOT NULL REFERENCES Employee(EmployeeID) ,
	PRIMARY KEY (StoreID, EmployeeID)
);

-- Table: Supplies

CREATE TABLE Supplies
(	SupplyID varchar(20),
	ProductID varchar(20) REFERENCES Product(ProductID),
	VendorID VARCHAR(20) REFERENCES Vendor(VendorID),
	PRIMARY KEY(ProductID,VendorID) 
);

-- Table: Sales

CREATE TABLE Sales(
SalesID VARCHAR(20) NOT NULL,
SalesDate Date,
ProductID VARCHAR(20),
Quantity INT,
CONSTRAINT Sales_PK Primary Key (SalesID),
CONSTRAINT Sales_FK Foreign key (ProductID) REFERENCES Product (ProductID) ON UPDATE CASCADE
);




