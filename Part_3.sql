-- Initialize the Products table (if not exists)
CREATE TABLE IF NOT EXISTS part3.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    StockQuantity INT
);

-- Insert initial data (if not exists)
INSERT INTO part3.Products (ProductID, ProductName, StockQuantity)
VALUES (101, 'TechCorp Smart Speaker', 10)

-- Transaction 1 (Alex's order)
BEGIN TRANSACTION;

-- Place an exclusive row-level lock on the product column
SELECT StockQuantity 
FROM part3.Products
WHERE ProductID = 101 FOR UPDATE;

-- Update stock quantity
UPDATE part3.Products 
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 101 AND StockQuantity >= 5;
    
COMMIT TRANSACTION;


-- Transaction 2 (Taylor's order)
-- This will automatically wait for Transaction 1's lock to be released
BEGIN TRANSACTION;

SELECT StockQuantity 
FROM part3.Products
WHERE ProductID = 101 FOR UPDATE;

-- Update stock quantity
UPDATE part3.Products 
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 101 AND StockQuantity >= 5;
    
COMMIT TRANSACTION;
