# sql-analytics-projects
🔹 Project Title

E-Commerce SQL Analytics

🔹 Problem Statement

  Analyze e-commerce data to answer business questions related to revenue, customers, products, and retention using SQL.

🔹 Database Schema

  Tables:
  
  users
  
  products
  
  orders
  
  order_items
  
  payments
  
  (Add ER diagram if possible)

🔹 Tools Used

  PostgreSQL
  
  SQL (Joins, CTEs, Window Functions)

🔹 Business Questions Solved

  What is daily and monthly revenue?
  
  Who are top customers by spend?
  
  What is customer churn rate?
  
  Which products generate most revenue?

🔹 Key SQL Concepts Used

  INNER / LEFT JOIN
  
  GROUP BY & HAVING
  
  Window functions (RANK, ROW_NUMBER)
  
  CTEs
  
  Subqueries
  
  Date functions

🔹 Sample Query 
  WITH customer_spend AS (
      SELECT user_id, SUM(total_amount) AS total_spent
      FROM orders
      GROUP BY user_id
  )
  SELECT user_id,
         RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
  FROM customer_spend;

🔹 Insights

Top 20% users generate 65% of revenue

Repeat customers have 3× higher AOV

Payments failure rate is highest on weekends
