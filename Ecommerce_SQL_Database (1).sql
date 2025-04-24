
-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at DATE
);

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO customers (customer_name, email, country, created_at) VALUES
('Alice Smith', 'alice@example.com', 'USA', '2023-01-10'),
('Bob Johnson', 'bob@example.com', 'Canada', '2023-02-15'),
('Charlie Lee', 'charlie@example.com', 'UK', '2023-03-05');

INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 999.99, 10),
('Smartphone', 'Electronics', 699.99, 20),
('Headphones', 'Accessories', 199.99, 50);

INSERT INTO orders (customer_id, order_date, order_total) VALUES
(1, '2023-04-01', 1699.98),
(2, '2023-04-03', 699.99),
(3, '2023-04-05', 1199.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 699.99),
(2, 2, 1, 699.99),
(3, 1, 1, 999.99),
(3, 3, 1, 199.99);
