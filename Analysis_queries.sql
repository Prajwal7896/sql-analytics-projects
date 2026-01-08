SELECT o.order_date, SUM(o.total_amount) AS daily_revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY o.order_date;

WITH monthly_revenue AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           SUM(o.total_amount) AS revenue
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE p.status = 'Success'
    GROUP BY month
)
SELECT month,
       revenue,
       ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month) * 100, 2) AS growth_percent
FROM monthly_revenue;

SELECT u.name, SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 10;

SELECT u.name, COUNT(o.order_id) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING COUNT(o.order_id) > 1;

SELECT DISTINCT u.name
FROM users u
JOIN orders o ON u.user_id = o.user_id
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.status IS NULL OR p.status != 'Success';

SELECT p.name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;

SELECT p.category, SUM(o.total_amount) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN payments pay ON o.order_id = pay.order_id
WHERE pay.status = 'Success'
GROUP BY p.category;

SELECT u.name, AVG(o.total_amount) AS avg_order_value
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name;

SELECT u.name, MIN(o.order_date) AS first_purchase_date
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name;

SELECT u.name
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING MAX(o.order_date) < CURDATE() - INTERVAL 90 DAY OR MAX(o.order_date) IS NULL;

SELECT o.order_date,
       SUM(o.total_amount) AS daily_revenue,
       SUM(SUM(o.total_amount)) OVER (ORDER BY o.order_date) AS running_total
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY o.order_date;

SELECT u.name,
       SUM(o.total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Success'
GROUP BY u.name;

SELECT 
    COUNT(DISTINCT o.user_id) / COUNT(DISTINCT u.user_id) * 100 AS conversion_rate
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

SELECT 
    SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS failed_payment_rate
FROM payments;

SELECT u.city, COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.city;
