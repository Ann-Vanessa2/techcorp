BEGIN TRANSACTION;

-- Create new order record
INSERT INTO orders (
    order_date,
    customer_id,
    product_id,
    quantity,           
    total
) 
VALUES (CURRENT_DATE, 4, 2, 1, 1000) RETURNING order_id;

-- Insert into Order_Details
INSERT INTO order_details (
    product_id,
    order_id
) 
VALUES (2, currval('orders_order_id_seq'));

-- Decrease the stock quantity in the Products table
UPDATE products
SET stock_quantity = stock_quantity - 1
FROM orders o
WHERE products.product_id = 2;

-- If successful, commit the transaction
COMMIT;
-- ROLLBack
-- If any errors occur, the transaction will automatically be rolled back
