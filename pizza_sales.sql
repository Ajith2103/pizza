CREATE DATABASE pizza;

USE pizza;

DESC pizza_sales;

SELECT * FROM pizza_sales;

-- Q1: Calculate the average order value:
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

-- Q2: Calculate the total pizzas sold:
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

-- Q3. Determine total orders placed:
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;


-- Q4: Determine average pizzas per order:
SELECT CAST(
           CAST(SUM(quantity) AS DECIMAL(10, 2)) / 
           CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) 
       AS DECIMAL(10, 2)) AS Avg_Pizza_Per_Order
FROM pizza_sales;


-- Q5. Observe Daily Trends for Total Orders:
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);


-- Q6. Observe Monthly Trends for Total Orders:
SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date);


-- Q7: Total Orders placed Monthly in descending order:
SELECT MONTHNAME(order_date) AS Month_Name, 
       COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY Total_orders DESC;


-- Q8. Determine percentage of sales by pizza category
SELECT pizza_category, 
       SUM(total_price) AS Total_Sales, 
       (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;



-- Q9. Top 5 Best Sellers by Revenue:
SELECT pizza_name, 
       SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;






