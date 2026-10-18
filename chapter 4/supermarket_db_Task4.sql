-- SIMPLE SUPERMARKET DATABASE FOR SQL PRACTICE
-- Run this entire script in MySQL Workbench.

CREATE DATABASE IF NOT EXISTS supermarket_practice_db;
USE supermarket_practice_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS SaleItems;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Customers;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL
);

CREATE TABLE Categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category_id INT NOT NULL,
  selling_price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  sale_date DATE NOT NULL,
  payment_method VARCHAR(30) NOT NULL,
  sale_status VARCHAR(30) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE SaleItems (
  sale_item_id INT PRIMARY KEY,
  sale_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'Arun Kumar', 'Chennai'),
(2, 'Priya Sharma', 'Tambaram'),
(3, 'Karthik Ravi', 'Coimbatore'),
(4, 'Divya Iyer', 'Chennai'),
(5, 'Rahul Nair', 'Madurai'),
(6, 'Sneha Reddy', 'Bengaluru'),
(7, 'Vijay Kumar', 'Tambaram'),
(8, 'Anitha Das', 'Hyderabad'),
(9, 'Suresh Patel', 'Chennai'),
(10, 'Kavya Menon', 'Kochi'),
(11, 'Mohan Rao', 'Pune'),
(12, 'Nisha Gupta', 'Coimbatore');

INSERT INTO Categories VALUES
(1, 'Fruits'), (2, 'Vegetables'), (3, 'Dairy'),
(4, 'Bakery'), (5, 'Beverages'), (6, 'Snacks');

INSERT INTO Products VALUES
(1, 'Apple', 1, 180.00, 50),
(2, 'Banana', 1, 60.00, 120),
(3, 'Orange', 1, 90.00, 75),
(4, 'Tomato', 2, 40.00, 100),
(5, 'Potato', 2, 35.00, 150),
(6, 'Onion', 2, 45.00, 90),
(7, 'Milk', 3, 32.00, 80),
(8, 'Cheese', 3, 250.00, 25),
(9, 'Butter', 3, 180.00, 30),
(10, 'Bread', 4, 45.00, 60),
(11, 'Cake', 4, 350.00, 15),
(12, 'Bun', 4, 20.00, 100),
(13, 'Orange Juice', 5, 120.00, 40),
(14, 'Mineral Water', 5, 20.00, 200),
(15, 'Coffee', 5, 220.00, 35),
(16, 'Potato Chips', 6, 30.00, 110),
(17, 'Biscuits', 6, 25.00, 140),
(18, 'Chocolate', 6, 80.00, 65);

INSERT INTO Sales VALUES
(1001, 1, '2026-01-05', 'UPI', 'Completed'),
(1002, 2, '2026-01-06', 'Cash', 'Completed'),
(1003, 3, '2026-01-07', 'Card', 'Completed'),
(1004, 1, '2026-01-10', 'UPI', 'Completed'),
(1005, 4, '2026-01-12', 'Cash', 'Cancelled'),
(1006, 5, '2026-01-15', 'Card', 'Completed'),
(1007, 6, '2026-01-17', 'UPI', 'Pending'),
(1008, 7, '2026-01-20', 'Cash', 'Completed'),
(1009, 8, '2026-01-22', 'UPI', 'Completed'),
(1010, 9, '2026-01-25', 'Card', 'Completed'),
(1011, 10, '2026-02-01', 'Cash', 'Completed'),
(1012, 2, '2026-02-03', 'UPI', 'Completed'),
(1013, 11, '2026-02-05', 'Card', 'Pending'),
(1014, 12, '2026-02-07', 'Cash', 'Completed'),
(1015, 3, '2026-02-10', 'UPI', 'Completed');

INSERT INTO SaleItems VALUES
(1, 1001, 1, 2, 180.00),
(2, 1001, 7, 3, 32.00),
(3, 1002, 10, 2, 45.00),
(4, 1002, 16, 5, 30.00),
(5, 1003, 2, 10, 60.00),
(6, 1003, 14, 4, 20.00),
(7, 1004, 8, 1, 250.00),
(8, 1004, 18, 3, 80.00),
(9, 1005, 11, 1, 350.00),
(10, 1006, 4, 8, 40.00),
(11, 1006, 5, 5, 35.00),
(12, 1007, 15, 2, 220.00),
(13, 1008, 17, 6, 25.00),
(14, 1008, 12, 10, 20.00),
(15, 1009, 13, 3, 120.00),
(16, 1009, 3, 4, 90.00),
(17, 1010, 6, 7, 45.00),
(18, 1011, 9, 2, 180.00),
(19, 1012, 1, 1, 180.00),
(20, 1012, 7, 4, 32.00),
(21, 1013, 8, 2, 250.00),
(22, 1014, 16, 3, 30.00),
(23, 1014, 18, 2, 80.00),
(24, 1015, 10, 4, 45.00),
(25, 1015, 2, 5, 60.00);


select * from  Categories;
select * from Customers;
select * from Products;
select * from SaleItems;
select * from Sales;

-- Task 1 — Aggregate Functions
-- 1. Count the total number of products.

select count(*) 
from Products;

-- 2. Calculate the total stock quantity of all products.

select sum(stock_quantity)
from Products;

-- 3. Find the average, minimum, and maximum selling price of products.

select avg(selling_price) as average, 
min(selling_price) as minimum , 
max(selling_price) as maximum 
from Products;

-- Task 2 — Aggregate Functions with WHERE
-- 4. Count products with a selling price greater than ₹100.

select selling_price from products where selling_price > 100;

select count(selling_price)
from Products
where selling_price > 100;

-- 5. Find the total stock quantity of products with fewer than 50 units in stock.

select stock_quantity from Products;

select sum(stock_quantity) 
from Products
where stock_quantity < 50;

-- 6. Count sales where the status is 'Completed'.

select count(sale_status)
from Sales
where sale_status = 'Completed';

-- Task 3 — Aggregate Functions with GROUP BY
-- 7. Find the number of products in each category.

select 
c.category_name,
count(p.product_id) as total_product
from Categories c 
inner join Products p 
on c.category_id = p.category_id
group by c.category_id,c.category_name;

-- 8. Find the total quantity sold for each product.

select 
p.product_name,
sum(si.quantity) as total_quantity
from Products p 
inner join SaleItems si
on p.product_id = si.product_id
group by p.product_id,p.product_name;

-- 9. Count how many sales each customer has made.

select
c.customer_name,
count(s.sale_id) as sales_count
from Customers c 
inner join Sales s 
on c.customer_id = s.customer_id
group by c.customer_id,c.customer_name;

-- 10. Find products whose selling price is greater than the average selling price of all products.

SELECT
    product_id,
    product_name,
    selling_price
FROM Products
WHERE selling_price > (
    SELECT AVG(selling_price)
    FROM Products
);
