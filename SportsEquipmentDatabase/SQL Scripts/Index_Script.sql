-- Indexes


--Index on column ProductID from table Product as it is most frequently used an attribute for extracting data

CREATE NONCLUSTERED INDEX idx_ProductID
ON Product(ProductID);

--Index on column PersonID from table Person as it is used to retrieve information about a person in the organization

CREATE NONCLUSTERED INDEX idx_PersonID
ON Person(PersonID);

--Index on column LocatorID from table ProductLocator for easy accessibility of finding the products for the customer in the store

CREATE NONCLUSTERED INDEX idx_LocatorID
ON ProductLocator(LocatorID);

--Index on column InventoryID from table ProductInventory for the ease to retrieve data for the organization for maintaining the inventory

CREATE NONCLUSTERED INDEX idx_InventoryID
ON ProductInventory(InventoryID);

--Index on column TrackingID from table ProductDelivery to have faster tracking of Product Delivery

CREATE NONCLUSTERED INDEX idx_TrackingID
ON ProductDelivery(TrackingID);

--Index on column SalesID from table Sales to have faster retrieval of Sales data for report and decision making of the organization

CREATE NONCLUSTERED INDEX idx_SalesID
ON Sales(SalesID);




