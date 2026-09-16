-- ============================================
-- RETAIL STORE DATABASE VIEWS
-- ============================================


-- View 1: Low-stock products
CREATE VIEW low_stock_products AS
SELECT Products.product_name, Inventory.quantity_in_stock
FROM Products
JOIN Inventory
ON Products.product_id = Inventory.product_id
WHERE Inventory.quantity_in_stock <= Inventory.reorder_level
ORDER BY Inventory.quantity_in_stock ASC;


-- View 2: Customer spending
CREATE VIEW customer_spending AS
SELECT Customers.first_name,
       SUM(OrderDetails.quantity * OrderDetails.unit_price) AS total_spend
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN OrderDetails
ON Orders.order_id = OrderDetails.order_id
WHERE Orders.status = 'Completed'
GROUP BY Customers.first_name
ORDER BY total_spend DESC;


-- View 3: Category revenue
CREATE VIEW category_revenue AS
SELECT Categories.category_name,
       SUM(OrderDetails.quantity * OrderDetails.unit_price) AS total_revenue
FROM Categories
JOIN Products
ON Categories.category_id = Products.category_id
JOIN OrderDetails
ON OrderDetails.product_id = Products.product_id
JOIN Orders
ON Orders.order_id = OrderDetails.order_id
WHERE Orders.status = 'Completed'
GROUP BY Categories.category_name
ORDER BY total_revenue DESC;
