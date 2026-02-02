-- Q1. How much revenue has the retail business generated in total?
SELECT 
    SUM(total_amount) AS total_revenue
FROM retail_sales;

-- Q2. What is the average value of a single transaction?
SELECT 
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales;

-- Q3. How does revenue change month over month?
SELECT 
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY month;

-- Q4. Which product categories generate the most revenue?
SELECT 
    product_category,
    SUM(total_amount) AS category_revenue
FROM retail_sales
GROUP BY product_category
ORDER BY category_revenue DESC;

-- Q5. Which categories sell the most units?
SELECT 
    product_category,
    SUM(quantity) AS total_quantity_sold
FROM retail_sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC;

-- Q6. Which categories sell higher-priced products on average?
SELECT 
    product_category,
    ROUND(AVG(price_per_unit), 2) AS avg_price
FROM retail_sales
GROUP BY product_category
ORDER BY avg_price DESC;

-- Q7. Which gender contributes more to total revenue?
SELECT 
    gender,
    SUM(total_amount) AS gender_revenue
FROM retail_sales
GROUP BY gender;

-- Q8. Which age groups are the most valuable customers?
SELECT
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,
    SUM(total_amount) AS total_revenue
FROM retail_sales
GROUP BY age_group
ORDER BY total_revenue DESC;

-- Q9. How much does an average customer spend overall?
SELECT 
    customer_id,
    ROUND(SUM(total_amount), 2) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Q10. Which transactions are High-Value Transactions (above the average order value)? 
SELECT *
FROM retail_sales
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM retail_sales
)
ORDER BY total_amount DESC;


