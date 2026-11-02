CREATE DATABASE IF NOT EXISTS peeranishop;
USE peeranishop;

-- Remove tables if they already exist
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;


-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_mode VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Add customers
INSERT INTO customers (name, email, city, signup_date) VALUES
('Ahmed Khan','ahmed@gmail.com','Karachi','2025-01-01'),
('Ayesha Malik','ayesha@gmail.com','Lahore','2025-01-02'),
('Ali Raza','ali@gmail.com','Islamabad','2025-01-03'),
('Fatima Ahmed','fatima@gmail.com','Rawalpindi','2025-01-04'),
('Hassan Shah','hassan@gmail.com','Faisalabad','2025-01-05'),
('Sana Iqbal','sana@gmail.com','Multan','2025-01-06'),
('Usman Tariq','usman@gmail.com','Peshawar','2025-01-07'),
('Zainab Noor','zainab@gmail.com','Quetta','2025-01-08'),
('Bilal Hussain','bilal@gmail.com','Hyderabad','2025-01-09'),
('Hira Aslam','hira@gmail.com','Sialkot','2025-01-10'),
('Saad Qureshi','saad@gmail.com','Gujranwala','2025-01-11'),
('Maryam Javed','maryam@gmail.com','Bahawalpur','2025-01-12'),
('Hamza Siddiqui','hamza@gmail.com','Sukkur','2025-01-13'),
('Eman Khalid','eman@gmail.com','Larkana','2025-01-14'),
('Daniyal Akhtar','daniyal@gmail.com','Abbottabad','2025-01-15'),
('Maham Sheikh','maham@gmail.com','Karachi','2025-01-16'),
('Fahad Ali','fahad@gmail.com','Lahore','2025-01-17'),
('Laiba Yousuf','laiba@gmail.com','Islamabad','2025-01-18'),
('Omar Farooq','omar@gmail.com','Rawalpindi','2025-01-19'),
('Iqra Nadeem','iqra@gmail.com','Faisalabad','2025-01-20');


-- Add products (prices in PKR)
INSERT INTO products (product_name, category, price, stock) VALUES
('Python Hoodie','Clothing',5500,50),
('Java Hoodie','Clothing',5200,40),
('Debugging Mug','Accessories',1500,100),
('Code Like a Pro Mug','Accessories',1700,80),
('DSA Notebook','Stationery',1200,150),
('SQL Cheat Sheet','Stationery',800,200),
('Sticker Pack','Stationery',650,300),
('Algorithm T-Shirt','Clothing',3500,60),
('GitHub Cap','Accessories',2200,70),
('Keyboard Mat','Accessories',2800,90),
('Linux Hoodie','Clothing',5800,35),
('AI Nerd T-Shirt','Clothing',3800,55),
('Whiteboard Notebook','Stationery',1800,120),
('Bug Hunter Mug','Accessories',1400,100),
('Terminal Stickers','Stationery',500,250),
('Coder Bottle','Accessories',2500,110),
('Late Night Hoodie','Clothing',6000,30),
('Python Socks','Accessories',1000,140),
('DSA Flash Cards','Stationery',900,180),
('Clean Code Notebook','Stationery',1500,130);


-- Add orders
INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1,'2025-02-01','Delivered'),
(2,'2025-02-02','Delivered'),
(3,'2025-02-03','Delivered'),
(4,'2025-02-04','Cancelled'),
(5,'2025-02-05','Delivered'),
(6,'2025-02-06','Pending'),
(7,'2025-02-07','Delivered'),
(8,'2025-02-08','Delivered'),
(9,'2025-02-09','Delivered'),
(10,'2025-02-10','Cancelled'),
(11,'2025-02-11','Delivered'),
(12,'2025-02-12','Delivered'),
(13,'2025-02-13','Pending'),
(14,'2025-02-14','Delivered'),
(15,'2025-02-15','Delivered'),
(16,'2025-02-16','Delivered'),
(17,'2025-02-17','Cancelled'),
(18,'2025-02-18','Delivered'),
(19,'2025-02-19','Delivered'),
(20,'2025-02-20','Delivered');


-- Add items to orders
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,1,1),(1,7,2),
(2,3,1),(2,5,1),
(3,8,1),
(4,2,1),
(5,6,3),
(6,4,1),
(7,10,1),
(8,12,2),
(9,15,3),
(10,9,1),
(11,11,1),
(12,13,1),
(13,14,2),
(14,16,1),
(15,17,1),
(16,18,2),
(17,19,1),
(18,20,1),
(19,1,1),
(20,5,2);


-- Add payments
INSERT INTO payments (order_id, payment_mode, amount, payment_date) VALUES
(1,'JazzCash',6800,'2025-02-01'),
(2,'Easypaisa',2700,'2025-02-02'),
(3,'Bank Transfer',3500,'2025-02-03'),
(5,'Cash on Delivery',2400,'2025-02-05'),
(7,'JazzCash',2800,'2025-02-07'),
(8,'Debit Card',7600,'2025-02-08'),
(9,'Easypaisa',1500,'2025-02-09'),
(11,'Bank Transfer',5800,'2025-02-11'),
(12,'Cash on Delivery',1800,'2025-02-12'),
(14,'JazzCash',2500,'2025-02-14'),
(15,'Debit Card',6000,'2025-02-15'),
(16,'Easypaisa',2000,'2025-02-16'),
(18,'Cash on Delivery',1500,'2025-02-18'),
(19,'Bank Transfer',5500,'2025-02-19'),
(20,'JazzCash',2400,'2025-02-20');


-- Show all tables
SHOW TABLES;

-- Show all records
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;


-- Total revenue
SELECT SUM(amount) AS total_revenue_pkr
FROM payments;

-- Revenue by product for delivered orders
SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue_pkr
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue_pkr DESC;

-- Top customers by spending
SELECT
    c.name,
    c.city,
    SUM(pay.amount) AS total_spent_pkr
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent_pkr DESC;

-- Best selling products
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

-- Cancelled orders
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';

-- Orders with customer details
SELECT
    o.order_id,
    c.name,
    c.city,
    o.order_date,
    o.order_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Revenue by payment method
SELECT
    payment_mode,
    SUM(amount) AS revenue_pkr
FROM payments
GROUP BY payment_mode
ORDER BY revenue_pkr DESC;

-- Customers by city
SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Products with low stock
SELECT product_name, stock
FROM products
WHERE stock < 50
ORDER BY stock;
