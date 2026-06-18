-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- ========== USERS TABLE ==========
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== PRODUCTS TABLE ==========
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(500),
    category VARCHAR(50),
    stock_quantity INT DEFAULT 0,
    rating DECIMAL(3, 2) DEFAULT 0,
    reviews INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== CART ITEMS TABLE ==========
CREATE TABLE IF NOT EXISTS cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    UNIQUE KEY unique_cart_item (user_id, product_id)
);

-- ========== ORDERS TABLE ==========
CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    shipping_address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ========== ORDER ITEMS TABLE ==========
CREATE TABLE IF NOT EXISTS order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_time DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- ========== SAMPLE PRODUCT DATA ==========
INSERT INTO products (name, description, price, image_url, category, stock_quantity, rating, reviews) VALUES
('Wireless Bluetooth Headphones', 'Premium noise-cancelling headphones with 30-hour battery life', 79.99, 'https://picsum.photos/seed/headphones/400/400', 'Electronics', 50, 4.5, 120),
('Smartphone 5G', 'Latest 5G smartphone with 108MP camera and 5000mAh battery', 699.99, 'https://picsum.photos/seed/phone/400/400', 'Electronics', 30, 4.8, 200),
('Laptop Backpack', 'Water-resistant laptop backpack with USB charging port', 49.99, 'https://picsum.photos/seed/backpack/400/400', 'Accessories', 100, 4.3, 85),
('Smart Watch', 'Fitness tracker with heart rate monitor and GPS', 199.99, 'https://picsum.photos/seed/watch/400/400', 'Electronics', 45, 4.6, 150),
('Cotton T-Shirt', 'Comfortable 100% cotton t-shirt, available in multiple colors', 24.99, 'https://picsum.photos/seed/tshirt/400/400', 'Clothing', 200, 4.2, 60),
('Running Shoes', 'Lightweight running shoes with cushioned sole', 89.99, 'https://picsum.photos/seed/shoes/400/400', 'Footwear', 75, 4.7, 95),
('Coffee Maker', 'Programmable coffee maker with thermal carafe', 129.99, 'https://picsum.photos/seed/coffee/400/400', 'Home', 40, 4.4, 110),
('Desk Lamp', 'LED desk lamp with adjustable brightness and color temperature', 34.99, 'https://picsum.photos/seed/lamp/400/400', 'Home', 80, 4.1, 45),
('Wireless Mouse', 'Ergonomic wireless mouse with silent click', 29.99, 'https://picsum.photos/seed/mouse/400/400', 'Electronics', 120, 4.3, 70),
('Yoga Mat', 'Non-slip yoga mat with carrying strap', 39.99, 'https://picsum.photos/seed/yoga/400/400', 'Sports', 60, 4.6, 55),
('Book: JavaScript Guide', 'Comprehensive guide to modern JavaScript', 39.99, 'https://picsum.photos/seed/book/400/400', 'Books', 30, 4.9, 40),
('Garden Tool Set', 'Complete garden tool set with storage bag', 59.99, 'https://picsum.photos/seed/garden/400/400', 'Home', 25, 4.0, 30);

-- ========== CREATE A TEST USER ==========
-- Password: password123
INSERT INTO users (username, email, password_hash, role) VALUES
('testuser', 'test@example.com', '$2a$10$G6VJqLzN5FZvY8sYcHZq2eLmSKvxYzWbDdNnNnNnNnNnNnNnNnO', 'user'),
('admin', 'admin@example.com', '$2a$10$G6VJqLzN5FZvY8sYcHZq2eLmSKvxYzWbDdNnNnNnNnNnNnNnO', 'admin');
