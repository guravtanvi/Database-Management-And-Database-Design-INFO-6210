--Final Stored Procedures


--1) To get the inventory list of the products in the database
--Input: ProductName
--Output: Details of the product according to name

create Procedure getInventoryReport 
@ProductName varchar(20)
AS  
select p.ProductName, p.Price, p.Brand, i.Quantity, i.InventoryID, s.StoreLocation
from Product p INNER JOIN ProductInventory i
ON p.ProductID = i.ProductID
LEFT JOIN 
Store s ON i.StoreID = s.StoreID
where ProductName=@ProductName;

--Execution: 
EXEC getInventoryReport 'Nets';

--2) To get the inventory status of the product in the database
--Input: ProductId
--Output: Details of the product according to ID

CREATE PROCEDURE ProdInvStatus
@ProductID varchar(20)
AS
select Quantity, StoreID from ProductInventory
where ProductID = @ProductID;
SELECT * FROM ProductInventory

--Execution: 
exec ProdInvStatus  '76203459';

--3) To get the list of all the employee in the database
--Input: No Input
--Output: List of employees

create procedure getEmployeeList
AS BEGIN
select p.PersonName,p.PersonContact,p.PersonEmail,p.PersonGender,e.EmployeeID
from Person p INNER JOIN Employee e 
ON p.PersonID = e.PersonID
where p.PersonType = 'Employee'
END;

--Execution: 
EXEC getEmployeeList;


--4) To get the list of all the customers in the database
--Input: No Input
--Output: List of customers

create procedure getCustomerList
AS BEGIN
select p.PersonName,p.PersonContact,p.PersonEmail,p.PersonGender,c.CustomerID
from Person p INNER JOIN Customer c
ON p.PersonID = c.PersonID
where p.PersonType = 'Customer'
END;

--Execution: 
EXEC getCustomerList;

--5) To get the shipment status of the product
--Input: TrackingID
--Output: Status of the product

create Procedure getShipmentStatus
@TrackingID varchar(20)
AS BEGIN
select p.ShipmentStatus,p.StoreID,p.ShipmentDate,p.TrackingID
from ProductDelivery p
where p.TrackingID = @TrackingID
END;

--Execution: 
EXEC getShipmentStatus 'TR0994';

--6) To get the product details of the product in the database
--Input: ProductId
--Output: Details of the product according to ID

CREATE PROCEDURE ProductDetails(
@productID AS varchar(20)
)
AS 
BEGIN	
		select p.ProductID, p.ProductName, p.Brand,p.Price
		from Product p
		WHERE p.ProductID=@productID;		
END;

--Execution: 
EXEC ProductDetails '12358519';



--7) To insert a new product record in the database
--Input: ProductName, Price, Brand
--Output: Inserts new record with unique ProductID

CREATE PROCEDURE NewProductRecord( 
@ProductName varchar(255), 
@Price float,
@Brand varchar(20)
)
AS 
BEGIN
		DECLARE @ProductIDRan varchar(20);
		-- SET @allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		SET @ProductIDRan = ABS(CHECKSUM(NEWID())) % 1000000 + 1;
		
		INSERT into Product
		values(@ProductIDRan,@ProductName,@Price,@Brand);

		Select *
		from Product p 
		WHERE p.ProductID = @ProductIDRan ;
END;


--Execution: 
EXEC NewProductRecord 'Hill',132,'Adidas';

