CREATE DATABASE IF NOT EXISTS salesdb;

USE salesdb;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    category VARCHAR(50),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(30),
    status VARCHAR(30)
);

INSERT INTO Sales
(sale_id, order_date, customer_name, city, category,
 product_name, quantity, price, payment_method, status)
VALUES
(1, '2026-01-05', 'Arun', 'Chennai', 'Electronics', 'Laptop', 1, 55000, 'UPI', 'Completed'),
(2, '2026-01-07', 'Priya', 'Madurai', 'Clothing', 'T-Shirt', 3, 500, 'Cash', 'Completed'),
(3, '2026-01-10', 'Karthik', 'Coimbatore', 'Electronics', 'Headphones', 2, 1500, 'Card', 'Completed'),
(4, '2026-01-12', 'Divya', 'Chennai', 'Furniture', 'Office Chair', 1, 4500, 'UPI', 'Pending'),
(5, '2026-01-15', 'Suresh', 'Salem', 'Clothing', 'Jeans', 2, 1200, 'Cash', 'Completed'),
(6, '2026-01-18', 'Meena', 'Trichy', 'Electronics', 'Mouse', 2, 800, 'Card', 'Cancelled'),
(7, '2026-01-20', 'Vijay', 'Chennai', 'Furniture', 'Desk', 1, 7000, 'UPI', 'Completed'),
(8, '2026-01-22', 'Anitha', 'Madurai', 'Clothing', 'Kurti', 2, 900, 'Card', 'Pending'),
(9, '2026-01-25', 'Rahul', 'Coimbatore', 'Electronics', 'Keyboard', 1, 2000, 'Cash', 'Completed'),
(10, '2026-01-28', 'Lakshmi', 'Salem', 'Furniture', 'Bookshelf', 1, 3500, 'UPI', 'Completed'),
(11, '2026-02-02', 'Arun', 'Chennai', 'Electronics', 'Monitor', 1, 12000, 'Card', 'Completed'),
(12, '2026-02-05', 'Priya', 'Madurai', 'Clothing', 'Saree', 1, 2500, 'UPI', 'Completed'),
(13, '2026-02-08', 'Karthik', 'Coimbatore', 'Furniture', 'Office Chair', 2, 4500, 'Cash', 'Pending'),
(14, '2026-02-11', 'Divya', 'Chennai', 'Electronics', 'Webcam', 1, 3000, 'Card', 'Completed'),
(15, '2026-02-14', 'Suresh', 'Salem', 'Clothing', 'Jacket', 1, 2200, 'UPI', 'Cancelled'),
(16, '2026-02-17', 'Meena', 'Trichy', 'Electronics', 'Laptop', 1, 55000, 'Card', 'Completed'),
(17, '2026-02-20', 'Vijay', 'Chennai', 'Clothing', 'T-Shirt', 4, 500, 'Cash', 'Completed'),
(18, '2026-02-23', 'Anitha', 'Madurai', 'Furniture', 'Desk', 1, 7000, 'UPI', 'Pending'),
(19, '2026-02-26', 'Rahul', 'Coimbatore', 'Electronics', 'Headphones', 3, 1500, 'Card', 'Completed'),
(20, '2026-02-28', 'Lakshmi', 'Salem', 'Clothing', 'Jeans', 2, 1200, 'UPI', 'Completed');

SELECT * FROM Sales;

-- Task 1: Window Functions
-- 1.Write a SQL query to rank sales by total sale value from highest to lowest within each product category.

SELECT
    sale_id,
    product_name,
    category,
    quantity * price AS total_sale,
    RANK() OVER (
        PARTITION BY category
        ORDER BY quantity * price DESC
    ) AS sales_rank
FROM Sales;


-- 2.Write a SQL query to rank sales by total sale value from highest to lowest within each city, without skipping rank numbers when sales values are tied.
SELECT
    sale_id,
    customer_name,
    city,
    quantity * price AS total_sale,
    DENSE_RANK() OVER (
        PARTITION BY city
        ORDER BY quantity * price DESC
    ) AS sales_rank
FROM Sales;

-- 3.Write a SQL query to display each sale along with its running total sales value and running average sales value within each product category, ordered by order date.
SELECT
    sale_id,
    order_date,
    product_name,
    category,
    quantity * price AS total_sale,

    SUM(quantity * price) OVER (
        PARTITION BY category
        ORDER BY order_date, sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,

    AVG(quantity * price) OVER (
        PARTITION BY category
        ORDER BY order_date, sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_average

FROM Sales;

-- 4.Write a SQL query to display every sale along with the total number of sales recorded in that sale's city.
SELECT
    sale_id,
    customer_name,
    city,
    COUNT(*) OVER (
        PARTITION BY city
    ) AS city_sales_count
FROM Sales;

-- 5.Write a SQL query to display each sale's total value, the previous sale's value, and the next sale's value in chronological order.
SELECT
    sale_id,
    order_date,
    product_name,
    quantity * price AS total_sale,

    LAG(quantity * price) OVER (
        ORDER BY order_date, sale_id
    ) AS previous_sale,

    LEAD(quantity * price) OVER (
        ORDER BY order_date, sale_id
    ) AS next_sale

FROM Sales;

-- Task 2: Stored Procedures
-- 1.Create a stored procedure named GetCompletedSales that displays all sales whose status is Completed.

DELIMITER //

CREATE PROCEDURE GetCompletedSales()
BEGIN
    SELECT *
    FROM Sales
    WHERE status = 'Completed';
END //

DELIMITER ;
call GetCompletedSales();

-- 2.Create a stored procedure named GetSalesByCity that accepts a city name as an input parameter and displays all sales from that city.

DELIMITER //

CREATE PROCEDURE GetSalesByCity(
    IN p_city VARCHAR(50)
)
BEGIN
    SELECT *
    FROM Sales
    WHERE city = p_city;
END //

DELIMITER ;
CALL GetSalesByCity('Chennai');

-- 3.Create a stored procedure named GetSalesByStatus that accepts a sales status as an input parameter and displays matching sales ordered by order_date from oldest to newest. 
DELIMITER //

CREATE PROCEDURE GetSalesByStatus(
    IN p_status VARCHAR(30)
)
BEGIN
    SELECT *
    FROM Sales
    WHERE status = p_status
    ORDER BY order_date ASC;
END //

DELIMITER ;
CALL GetSalesByStatus('Pending');







