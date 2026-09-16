-- ============================================
-- RETAIL STORE STORED PROCEDURES
-- ============================================


-- Procedure 1: Get low-stock products
DELIMITER //

CREATE PROCEDURE get_low_stock_products()
BEGIN
    SELECT Products.product_name, Inventory.quantity_in_stock
    FROM Products
    JOIN Inventory
    ON Products.product_id = Inventory.product_id
    WHERE Inventory.quantity_in_stock <= Inventory.reorder_level
    ORDER BY Inventory.quantity_in_stock ASC;
END //

DELIMITER ;


-- Procedure 2: Get customer spending
DELIMITER //

CREATE PROCEDURE get_customer_spending()
BEGIN
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
END //

DELIMITER ;


-- Procedure 3: Get category revenue
DELIMITER //

CREATE PROCEDURE get_category_revenue()
BEGIN
    SELECT Categories.category_name,
           SUM(OrderDetails.quantity * OrderDetails.unit_price) AS total_revenue
    FROM Categories
    JOIN Products
    ON Categories.category_id = Products.category_id
    JOIN OrderDetails
    ON Products.product_id = OrderDetails.product_id
    JOIN Orders
    ON OrderDetails.order_id = Orders.order_id
    WHERE Orders.status = 'Completed'
    GROUP BY Categories.category_name
    ORDER BY total_revenue DESC;
END //

DELIMITER ;
