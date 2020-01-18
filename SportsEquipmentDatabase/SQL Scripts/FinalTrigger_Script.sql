-- Trigger on Person Table (When Updated)

CREATE TABLE PersonAudit(
	
	PersonID varchar(20) NOT NULL,
	PersonName VARCHAR(30),
	PersonEmail VARCHAR(30),
	PersonContact VARCHAR(15),
	PersonAddress VARCHAR(50),
	PersonDOB DATE,
	PersonGender CHAR(10),
	PersonType VARCHAR(30),
	Action char(1),
	ActionDate datetime
);


GO
CREATE TRIGGER PersonTrigger on Person
FOR UPDATE
AS
BEGIN

INSERT INTO PersonAudit (PersonID, PersonName, PersonEmail, PersonContact,
PersonAddress,PersonDOB,PersonGender,PersonType,[Action],ActionDate) 

SELECT d.PersonID,d.PersonName,d.PersonEmail,d.PersonContact,
d.PersonAddress,d.PersonDOB,d.PersonGender,d.PersonType,'U',GETDATE()FROM deleted d

END


--Triger on Order Table (When Inserted/Updated/Deleted)

create table OrderAudit(

OrderID varchar(20) NOT NULL,
CustomerID VARCHAR(20) NOT NULL,
OrderDate DATE,
Amount float NOT NULL,
Action char(1),
ActionDate datetime

);

create trigger OrderTrigger on [Order]
for update,Insert,delete
As 
if exists(SELECT * from inserted) and exists (SELECT * from deleted)
Begin
insert into OrderAudit(OrderID,CustomerID ,OrderDate ,Amount, Action,ActionDate)
Select  OrderID,CustomerID ,OrderDate ,Amount,'U',getdate() from deleted
end


If exists (Select * from inserted) and not exists(Select * from deleted)
Begin
insert into OrderAudit(OrderID,CustomerID ,OrderDate ,Amount, Action,ActionDate)
Select OrderID,CustomerID ,OrderDate ,Amount, 'I',getdate() from Inserted
end


if exists(select * from deleted) and not exists(Select * from inserted)
Begin
insert into OrderAudit(OrderID,CustomerID ,OrderDate ,Amount, Action,ActionDate)
Select OrderID,CustomerID ,OrderDate ,Amount,'D',getdate() from Deleted
end


--Trigger on ProductInventory (When Updated/Inserted)

create table ProductInventoryAudit(

InventoryID VARCHAR(20) NOT NULL,
Quantity int,
ProductID varchar(20),
StoreID VARCHAR(20),
Action char(1),
ActionDate datetime
);

create trigger ProductInventoryTrigger on ProductInventory
for update,Insert
As 
if exists(SELECT * from inserted) and exists (SELECT * from deleted)
Begin
insert into ProductInventoryAudit(InventoryID,Quantity,ProductID ,StoreID, Action,ActionDate)
Select  InventoryID,Quantity,ProductID ,StoreID,'U',getdate() from deleted
end


If exists (Select * from inserted) and not exists(Select * from deleted)
Begin
insert into ProductInventoryAudit(InventoryID,Quantity,ProductID ,StoreID, Action,ActionDate)
Select InventoryID,Quantity,ProductID ,StoreID, 'I',getdate() from Inserted
end

