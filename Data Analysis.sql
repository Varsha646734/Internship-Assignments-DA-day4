-- Task 4: SQL for Data Analysis

-- 1. Select customers from Bangalore
SELECT customer_id, name, city
FROM customers
WHERE city = 'Bangalore';

-- 2. Orders sorted by order date
SELECT order_id, customer_id, order_date, total_amount
FROM orders
ORDER BY order_date DESC;

-- 3. Total sales per product
SELECT p.product_name, SUM(o.total_amount) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;

-- 4. Average order value per customer
SELECT customer_id, AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id;

-- 5. Customers with orders greater than ₹5000
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 5000;

-- 6. Subquery: Customers who made at least 1 purchase
SELECT name
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

-- 7. INNER JOIN: Orders with customer details
SELECT o.order_id, c.name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 8. LEFT JOIN: All customers with or without orders
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 9. RIGHT JOIN: All orders and their customers
SELECT c.name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 10. Create a view for sales analysis
CREATE VIEW sales_summary AS
SELECT c.name, SUM(o.total_amount) AS total_spent, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
