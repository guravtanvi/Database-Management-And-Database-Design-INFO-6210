--Final User-Defined Functions


--(1) To compute age from Date of Birth of a Person based on PersonID
--Input: PersonID
--Output: Age of the particular person

CREATE FUNCTION GetAge(@PersonID VARCHAR(20)) 
RETURNS INT  -- Returns Age.
AS
BEGIN 
DECLARE @Years INT, 
      @TempDate DATETIME,
                              @Age INT, 
      @DOB DATE

SELECT @DOB=p.PersonDOB
FROM Person p
WHERE p.PersonID=@PersonID 

  SET @Years = DATEDIFF(YY, @DOB, GETDATE())
  SET @TempDate = DATEADD(YY, @Years, @DOB)
  SET @Age = @Years - CASE
                          WHEN @TempDate>GETDATE() THEN 1
                          ELSE 0
                      END RETURN @Age END;

--Execution: 
SELECT [dbo].GetAge ('PID1225') 'Age of the Person';



--(2) Total Revenue for each year
--Input: No Input
--Output: List of total revenue for every year

CREATE FUNCTION ComputeRevenuePerYear()
    RETURNS @totalRevenue TABLE (
        TotalRevenuePerYear float,
        OrderYear INT
    )
AS
BEGIN
	INSERT INTO @totalRevenue
    SELECT SUM(p.Price * ol.Quantity) AS TotalRevenuePerYears, ol.OrderYear  
	FROM Product p, OrderLine ol 
	GROUP BY ol.OrderYear
    RETURN;
END;

--Execution: 
select * from ComputeRevenuePerYear();


--(3) Total Sales according to year
--Input: No Input
--Output: Total Quantity of products sold each year

CREATE FUNCTION TotalSalesInaYear()
    RETURNS @totalsales TABLE (
        SalesYear INT,
        TotalSales INT
    )
AS
BEGIN
	INSERT INTO @totalsales
    SELECT YEAR(SalesDate) as SalesYear,
         SUM(Quantity) AS TotalSales
    FROM Sales
GROUP BY YEAR(SalesDate)
ORDER BY YEAR(SalesDate);
    RETURN;
END;

--Execution: 
select * from TotalSalesInaYear();


--(4) Total Profit each year
--Input: No Input
--Output: List of profit according to years

Create function ProfitByYear()
 RETURNS @Profit Table (
 SalesYear int,
 Profit float)
 AS
 BEGIN 
 INSERT into @Profit
 SELECT YEAR(SalesDate) as SalesYear,
 (sum(p.price)* 0.4) as Profit
 FROM Sales s, Product p 
 where s.ProductID = p.ProductID
 GROUP BY YEAR(SalesDate)
ORDER BY YEAR(SalesDate);
    RETURN;
END;

--Execution: 
select * from ProfitByYear() ;




