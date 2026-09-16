-- ============================================
-- RETAIL STORE BUSINESS ANALYSIS QUERIES
-- ============================================

-- Question 1: Which products are low in stock?
SELECT Products.product_name, Inventory.quantity_in_stock
FROM Products
JOIN Inventory
ON Products.product_id = Inventory.product_id
WHERE Inventory.quantity_in_stock <= Inventory.reorder_level
ORDER BY Inventory.quantity_in_stock ASC;


-- Question 2: How many products are in each category?
SELECT Categories.category_name, COUNT(*) AS product_count
FROM Products
JOIN Categories
ON Products.category_id = Categories.category_id
GROUP BY Categories.category_name;


-- Question 3: Which customers have placed more than one order?
SELECT Customers.first_name, COUNT(*) AS order_count
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
GROUP BY Customers.first_name
HAVING COUNT(*) > 1;


-- Question 4: Which products have sold the most units?
SELECT Products.product_name,
       SUM(OrderDetails.quantity) AS total_sold
FROM OrderDetails
JOIN Products
ON OrderDetails.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY total_sold DESC;


-- Question 5: How much revenue has the store generated
-- from completed orders?
SELECT SUM(OrderDetails.quantity * OrderDetails.unit_price) AS revenue
FROM Orders
JOIN OrderDetails
ON Orders.order_id = OrderDetails.order_id
WHERE Orders.status = 'Completed';


-- Question 6: Which customers have spent the most money?
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


-- Question 7: What is the average order value?
SELECT AVG(average_order)
FROM (
    SELECT SUM(OrderDetails.quantity * OrderDetails.unit_price) AS average_order
    FROM Customers
    JOIN Orders
    ON Customers.customer_id = Orders.customer_id
    JOIN OrderDetails
    ON Orders.order_id = OrderDetails.order_id
    WHERE Orders.status = 'Completed'
    GROUP BY OrderDetails.order_id
) AS average_order;


-- Question 8: Which payment methods are used most often?
SELECT payment_method, COUNT(*) AS times_used
FROM Payments
GROUP BY payment_method
ORDER BY times_used DESC;


-- Question 9: Which employee processed the most orders?
SELECT Employees.first_name, COUNT(*) AS most_orders
FROM Orders
JOIN Employees
ON Orders.employee_id = Employees.employee_id
GROUP BY Employees.first_name
ORDER BY most_orders DESC;


-- Question 10: Which product category generates the most revenue?
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
