--- 1 Total Revenue
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza;

--- 2 Top Best Selling Pizzas
SELECT pizza_name, 
       SUM(total_price) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

--- 3 Sales by Months
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(total_price) AS revenue
FROM pizza
GROUP BY month
ORDER BY month;

--- 4 Peak Ordering Hours
SELECT 
    EXTRACT(HOUR FROM order_time) AS hour,
    COUNT(order_id) AS orders
FROM pizza
GROUP BY hour
ORDER BY hour;

--- 5 Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT order_id, SUM(total_price) AS order_total
    FROM pizza
    GROUP BY order_id
) AS orders;

--- 6 Sales by Category
SELECT pizza_category, 
       SUM(quantity) AS total_quantity, 
       SUM(total_price) AS revenue
FROM pizza
GROUP BY pizza_category
ORDER BY revenue DESC;

--- 7 Quantity Sold by Size
SELECT pizza_size, 
       SUM(quantity) AS total_quantity
FROM pizza
GROUP BY pizza_size
ORDER BY total_quantity DESC;