INSERT INTO orders (quantity, total, product_id, order_date, customer_id)
VALUES (1, 1000, 2, '2023-11-01', 1),
	   (2, 1000, 3, '2023-11-02', 2),
	   (2, 50, 4, '2024-11-02', 3),
	   (1, 10, 5, '2024-11-03', 4)

SELECT * FROM orders

DELETE FROM orders
WHERE order_id = 10

INSERT INTO order_details (order_id, product_id)
VALUES (5, 2),
	   (6, 3),
	   (7, 4),
	   (8, 5)
