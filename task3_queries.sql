
-- TASK 3 SQL ANALYSIS USING ECOMMERCE DATABASE

-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT customer_name, email, created_at FROM customers WHERE country = 'USA' ORDER BY created_at DESC;
SELECT country, COUNT(*) AS total_customers FROM customers GROUP BY country ORDER BY total_customers DESC;

-- b. JOINS
SELECT o.order_id, c.customer_name, o.order_date, o.order_total FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;
SELECT c.customer_name, o.order_id, o.order_date FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;
SELECT o.order_id, c.customer_name FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id;

-- c. Subqueries
SELECT customer_id, customer_name FROM customers WHERE customer_id IN (
    SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(order_total) > (
        SELECT AVG(order_total) FROM orders
    )
);

-- d. Aggregate Functions
SELECT AVG(order_total) AS avg_order_value FROM orders;
SELECT p.product_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name ORDER BY total_revenue DESC;

-- e. Views
CREATE VIEW daily_revenue AS
SELECT order_date, SUM(order_total) AS revenue FROM orders GROUP BY order_date;

CREATE VIEW customer_spend AS
SELECT c.customer_id, c.customer_name, SUM(o.order_total) AS total_spend
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- f. Indexes
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_id ON order_items(product_id);
