CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) 

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

--question numéro 3:
select Name
from Products
--question numéro 4:
select Name,Price
from Products
--question numéro 5:
select Name
from Products
where Price<=200
--question numéro 6:
select Name
from Products
where Price Between 60 and 120
--question numéro 7:
select Name,Price*10
from Products
--question numéro 8:
select AVG(price)
from Products
--question numéro 9:
select AVG(price)
from Products
where Manufacturer=2
--question numéro 10:
select COUNT(name)
from Products
where Price>=180
--question numéro 11:
select name,Price
from Products
where Price>=180
order by Price DESC
--
select name,Price
from Products
where Price>=180
order by name ASC
--question numéro 12:
select*
from Products  join Manufacturers on Products.Manufacturer=Manufacturers.Code
--
select*
from Products,Manufacturers
where Products.Manufacturer=Manufacturers.Code
--question numéro 13:
select x.Name,x.Price , y.Name
from Products  x inner join Manufacturers  y on x.Manufacturer=y.Code
--question numéro 14:
select Manufacturer, AVG(Price) as [le prix moyen]
from Products
group by Manufacturer

--question numéro 15:	
select x.Name , AVG(Price) as [le prix moyen]
from Manufacturers as x inner join Products on x.Code=Products.Manufacturer
group by x.Name

--question numéro 16:
select x.Name , AVG(Price) as [le prix moyen]
from Manufacturers as x inner join Products on x.Code=Products.Manufacturer
group by x.Name
having AVG(Price)>=150
--question numéro 17:
select top(1) name, Price 
from Products
order by Price ASC

--question numéro 18:
select max_price.name as manu_name, max_price.price, procduts_y.name as product_name
from 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     as max_price
   left join
     (select products.*, manufacturers.name manu_name
      from products join manufacturers
      on (products.manufacturer = manufacturers.code))
      as procduts_y
 on
   (max_price.name = procduts_y.manu_name
    and
    max_price.price = procduts_y.price);
--question numéro 19:
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(12,'Loudspeakkers',70,2);
--question numéro 20:
UPDATE Products
SET Name='laser Print'
WHERE Code=1;
--question numéro 20:
select (Price-(Price*10/100))
from Products
--question numéro 21:
select (Price-(Price*10/100))
from Products
where Price>=120