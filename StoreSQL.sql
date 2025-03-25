--Релации. Магазин - три таблици. С джоин да определим и where в дадения магазин за кой доставчик липсват продукти. 
-- Да извлечем за тях данните.
-- Една заявка таблица продукти с like да изведем перална телефон по името на продукта да изведем ключова дума например телефон и да ни изведе всички телефони.
--Да имаме сортиране. На supply да излязат във възходящ ред. Цената в низходящ.

CREATE TABLE Suppliers(
	SuppliersID int PRIMARY KEY IDENTITY(1,1),
	SupplierName NVARCHAR(100) NOT NULL
);

CREATE TABLE Stores(
	StoreID int PRIMARY KEY IDENTITY(1,1),
	StoresName NVARCHAR(100) NOT NULL
);

CREATE TABLE Products(
	ProductId int PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	SuppliersID INT FOREIGN KEY REFERENCES Suppliers(SuppliersID),
	StoreID INT FOREIGN KEY REFERENCES Stores(StoreID)
);

INSERT INTO Suppliers (SupplierName) VALUES 
('Samsung'), ('Apple'), ('LG'), ('Whirlpool');

INSERT INTO Stores (StoresName) VALUES 
('Tech Store'), ('Home Appliances'), ('ElectroShop');

INSERT INTO Products (ProductName, Price, SuppliersID, StoreID) VALUES 
('iPhone 14', 1200.00, 2, 1),
('Samsung Galaxy S23', 1100.00, 1, 1),
('LG Washing Machine', 700.00, 3, 2),
('Whirlpool Washing Machine', 650.00, 4, 2);

SELECT s.SuppliersID, s.SupplierName
FROM Suppliers s
LEFT JOIN Products p ON s.SuppliersID = p.SuppliersID AND p.StoreID = 1  
WHERE p.ProductID IS NULL;

SELECT * FROM Products 
WHERE ProductName LIKE '%телефон%' OR ProductName LIKE '%Phone%';

SELECT p.ProductName, p.Price, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SuppliersID = s.SuppliersID
ORDER BY s.SupplierName ASC, p.Price DESC;