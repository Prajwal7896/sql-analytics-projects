INSERT INTO users (name, email, city, signup_date) VALUES
('Amit Sharma', 'amit.sharma@gmail.com', 'Mumbai', '2024-01-10'),
('Priya Verma', 'priya.verma@gmail.com', 'Pune', '2024-01-15'),
('Rahul Patil', 'rahul.patil@gmail.com', 'Kolhapur', '2024-02-01'),
('Sneha Kulkarni', 'sneha.k@gmail.com', 'Nagpur', '2024-02-10'),
('Rohit Deshmukh', 'rohit.d@gmail.com', 'Nashik', '2024-02-18'),
('Anjali Joshi', 'anjali.j@gmail.com', 'Mumbai', '2024-03-05'),
('Karan Mehta', 'karan.m@gmail.com', 'Ahmedabad', '2024-03-12'),
('Neha Singh', 'neha.s@gmail.com', 'Delhi', '2024-03-20'),
('Arjun Rao', 'arjun.r@gmail.com', 'Bengaluru', '2024-04-01'),
('Pooja Nair', 'pooja.n@gmail.com', 'Kochi', '2024-04-08');

INSERT INTO products (name, category, price) VALUES
('iPhone 14', 'Electronics', 69999),
('Samsung Galaxy S23', 'Electronics', 74999),
('OnePlus Nord CE 3', 'Electronics', 24999),
('MacBook Air M2', 'Electronics', 114999),
('Dell Inspiron 15', 'Electronics', 58999),
('Sony WH-1000XM5', 'Electronics', 29999),
('Boat Rockerz 550', 'Electronics', 1999),
('Nike Air Max', 'Footwear', 8999),
('Adidas Ultraboost', 'Footwear', 10999),
('Puma Running Shoes', 'Footwear', 5999),
('Levis Men Jeans', 'Clothing', 2999),
('Allen Solly Shirt', 'Clothing', 2499),
('H&M T-Shirt', 'Clothing', 1499),
('IKEA Study Table', 'Furniture', 7999),
('Nilkamal Chair', 'Furniture', 3499),
('Prestige Pressure Cooker', 'Home Appliances', 2499),
('Philips Mixer Grinder', 'Home Appliances', 3999),
('LG 260L Refrigerator', 'Home Appliances', 27999),
('Tata Tea Gold', 'Groceries', 499),
('Fortune Sunflower Oil', 'Groceries', 799);

INSERT INTO orders (user_id, order_date, total_amount) VALUES
(1, '2024-02-05', 74999),
(2, '2024-02-12', 24999),
(3, '2024-02-20', 5999),
(4, '2024-03-01', 29999),
(5, '2024-03-10', 3999),
(6, '2024-03-15', 10999),
(7, '2024-03-18', 1499),
(8, '2024-03-22', 7999),
(9, '2024-04-05', 114999),
(10, '2024-04-10', 27999);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 10, 1),
(4, 6, 1),
(5, 17, 1),
(6, 9, 1),
(7, 13, 1),
(8, 14, 1),
(9, 4, 1),
(10, 18, 1);

INSERT INTO payments (order_id, status, payment_date) VALUES
(1, 'Success', '2024-02-05'),
(2, 'Success', '2024-02-12'),
(3, 'Failed', '2024-02-20'),
(4, 'Success', '2024-03-01'),
(5, 'Success', '2024-03-10'),
(6, 'Success', '2024-03-15'),
(7, 'Failed', '2024-03-18'),
(8, 'Success', '2024-03-22'),
(9, 'Success', '2024-04-05'),
(10, 'Success', '2024-04-10');
