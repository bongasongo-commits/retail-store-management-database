-- =========================================
-- 1. Categories
-- =========================================

INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Groceries'),
('Home & Kitchen'),
('Sports');


-- =========================================
-- 2. Suppliers
-- =========================================

INSERT INTO Suppliers
(supplier_name, contact_name, phone, email) VALUES
('TechWorld Distributors', 'David Mokoena', '0115551001', 'david@techworld.co.za'),
('FashionHub Supplies', 'Lerato Nkosi', '0115551002', 'lerato@fashionhub.co.za'),
('FreshChoice Foods', 'Thabo Dlamini', '0115551003', 'thabo@freshchoice.co.za'),
('HomeStyle Suppliers', 'Nomsa Khumalo', '0115551004', 'nomsa@homestyle.co.za'),
('SportPro Distributors', 'Sipho Ndlovu', '0115551005', 'sipho@sportpro.co.za');


-- =========================================
-- 3. Customers
-- =========================================

INSERT INTO Customers
(first_name, last_name, email, phone, created_at) VALUES
('John', 'Mokoena', 'john.mokoena@email.com', '0821000001', '2026-01-10'),
('Sarah', 'Dlamini', 'sarah.dlamini@email.com', '0821000002', '2026-01-15'),
('Michael', 'Nkosi', 'michael.nkosi@email.com', '0821000003', '2026-02-01'),
('Thandi', 'Khumalo', 'thandi.khumalo@email.com', '0821000004', '2026-02-12'),
('David', 'Ndlovu', 'david.ndlovu@email.com', '0821000005', '2026-02-20'),
('Amanda', 'Maseko', 'amanda.maseko@email.com', '0821000006', '2026-03-05'),
('Brian', 'Mthembu', 'brian.mthembu@email.com', '0821000007', '2026-03-18'),
('Lerato', 'Molefe', 'lerato.molefe@email.com', '0821000008', '2026-04-02'),
('Peter', 'Zwane', 'peter.zwane@email.com', '0821000009', '2026-04-15'),
('Nomsa', 'Sithole', 'nomsa.sithole@email.com', '0821000010', '2026-05-01');


-- =========================================
-- 4. Employees
-- =========================================

INSERT INTO Employees
(first_name, last_name, job_title, email) VALUES
('James', 'Mokoena', 'Sales Assistant', 'james@retailstore.co.za'),
('Linda', 'Dube', 'Cashier', 'linda@retailstore.co.za'),
('Robert', 'Mahlangu', 'Store Manager', 'robert@retailstore.co.za'),
('Grace', 'Molefe', 'Sales Assistant', 'grace@retailstore.co.za'),
('Samuel', 'Sithole', 'Cashier', 'samuel@retailstore.co.za');


-- =========================================
-- 5. Products
-- =========================================

INSERT INTO Products
(product_name, category_id, supplier_id, price) VALUES
('Wireless Headphones', 1, 1, 799.99),
('Bluetooth Speaker', 1, 1, 599.99),
('USB-C Charger', 1, 1, 249.99),
('Men''s T-Shirt', 2, 2, 199.99),
('Women''s Hoodie', 2, 2, 449.99),
('Running Shoes', 5, 5, 899.99),
('Basketball', 5, 5, 349.99),
('Coffee Maker', 4, 4, 1299.99),
('Blender', 4, 4, 899.99),
('Breakfast Cereal', 3, 3, 79.99),
('Cooking Oil', 3, 3, 109.99),
('Rice 5kg', 3, 3, 149.99),
('Desk Lamp', 4, 4, 299.99),
('Smart Watch', 1, 1, 1499.99),
('Yoga Mat', 5, 5, 299.99);


-- =========================================
-- 6. Inventory
-- =========================================

INSERT INTO Inventory
(product_id, quantity_in_stock, reorder_level) VALUES
(1, 25, 10),
(2, 18, 10),
(3, 8, 10),
(4, 40, 15),
(5, 12, 10),
(6, 7, 10),
(7, 30, 10),
(8, 5, 8),
(9, 14, 10),
(10, 50, 15),
(11, 35, 10),
(12, 20, 10),
(13, 9, 10),
(14, 6, 8),
(15, 22, 10);


-- =========================================
-- 7. Orders
-- =========================================

INSERT INTO Orders
(customer_id, employee_id, order_date, status) VALUES
(1, 1, '2026-06-01', 'Completed'),
(2, 2, '2026-06-03', 'Completed'),
(3, 1, '2026-06-05', 'Completed'),
(4, 3, '2026-06-08', 'Completed'),
(5, 4, '2026-06-10', 'Completed'),
(1, 2, '2026-06-15', 'Completed'),
(6, 1, '2026-06-18', 'Completed'),
(7, 5, '2026-06-20', 'Completed'),
(8, 4, '2026-06-22', 'Pending'),
(9, 2, '2026-06-25', 'Completed'),
(10, 1, '2026-06-28', 'Completed'),
(2, 3, '2026-07-01', 'Completed'),
(3, 4, '2026-07-03', 'Completed'),
(5, 5, '2026-07-05', 'Pending'),
(1, 1, '2026-07-08', 'Completed');


-- =========================================
-- 8. Order Details
-- =========================================

INSERT INTO OrderDetails
(order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 799.99),
(1, 3, 2, 249.99),

(2, 4, 2, 199.99),
(2, 5, 1, 449.99),

(3, 2, 1, 599.99),
(3, 10, 3, 79.99),

(4, 8, 1, 1299.99),

(5, 6, 1, 899.99),
(5, 15, 2, 299.99),

(6, 14, 1, 1499.99),

(7, 12, 2, 149.99),
(7, 11, 1, 109.99),

(8, 7, 2, 349.99),

(9, 9, 1, 899.99),
(9, 13, 2, 299.99),

(10, 1, 2, 799.99),

(11, 5, 1, 449.99),
(11, 4, 3, 199.99),

(12, 2, 2, 599.99),

(13, 10, 4, 79.99),
(13, 12, 1, 149.99),

(14, 6, 1, 899.99),

(15, 14, 1, 1499.99),
(15, 3, 1, 249.99);


-- =========================================
-- 9. Payments
-- =========================================

INSERT INTO Payments
(order_id, payment_date, amount, payment_method) VALUES
(1, '2026-06-01', 1299.97, 'Card'),
(2, '2026-06-03', 849.97, 'Cash'),
(3, '2026-06-05', 839.96, 'Card'),
(4, '2026-06-08', 1299.99, 'Card'),
(5, '2026-06-10', 1499.97, 'EFT'),
(6, '2026-06-15', 1499.99, 'Card'),
(7, '2026-06-18', 409.97, 'Cash'),
(8, '2026-06-20', 699.98, 'Card'),
(9, '2026-06-22', 1499.97, 'EFT'),
(10, '2026-06-25', 1599.98, 'Card'),
(11, '2026-06-28', 1049.96, 'Cash'),
(12, '2026-07-01', 1199.98, 'Card'),
(13, '2026-07-03', 469.95, 'Cash'),
(14, '2026-07-05', 899.99, 'Card'),
(15, '2026-07-08', 1749.98, 'EFT');
