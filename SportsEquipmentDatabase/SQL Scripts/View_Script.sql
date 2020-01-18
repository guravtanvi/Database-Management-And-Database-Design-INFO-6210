--Final Views


--(1) View to display products above average price

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Product
WHERE Price > (SELECT AVG(Price) FROM Product);

--Execution: 
select * from [Products Above Average Price];


--(2) View to display products sold per year

CREATE VIEW [Products Sold Per Year] AS
select p.ProductName,p.Price,o.Quantity,o.OrderID,o.OrderYear
from Product p INNER JOIN OrderLine o
ON p.ProductID = o.ProductID;

--Execution: 
select * from [Products Sold Per Year];


--(3) View to display products with bad reviews

create view [Bad Customer Feedback] AS
select f.Rating,c.CustomerID,p.ProductID
from CustomerFeedback f INNER JOIN Customer c 
ON f.CustomerID = c.CustomerID 
INNER JOIN Payment pa ON c.CustomerID = pa.CustomerID
INNER JOIN Product p ON pa.ProductID = p.ProductID
where RATING IN ('Bad','Worst');

--Execution: 
select * from [Bad Customer Feedback]; 


--(4) View to display the location of the product based on the product name

create view [Product Locator] AS
select pl.AisleNumber,pl.FloorNumber,p.ProductID,p.ProductName,s.CategoryName
from ProductLocator pl INNER JOIN SportsCategory s 
ON pl.CategoryID = s.CategoryID
INNER JOIN Product p ON s.ProductID = p.ProductID;

--Execution: 
select * from [Product Locator] where ProductName = 'Nets';
