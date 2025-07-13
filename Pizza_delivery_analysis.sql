create table pizza(
pizza_id int,
order_id int,
pizza_name_id VARCHAR(50),
quantity int,
order_date date,
order_time time,
unit_price float,
total_price float,
pizza_size VARCHAR(50),
pizza_category VARCHAR(50),
pizza_ingredients VARCHAR(200),
pizza_name  VARCHAR(50)
);
select * from pizza;

----------------- Query 01. Total Revenue ----
select sum(total_price) as total_Revenue
from pizza;

----------------Query 02. Average order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM pizza;

------------Query 03. Total Pizzas Sold
Select (sum(total_price)/ Count(distinct order_id)) as Avg_order_value
from pizza;

-----------Query 04. total orders 
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;

-----------Query 05. Average Pizzas Per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza;

-----------query 06. Daily Trend for totasl orders

SELECT TO_CHAR(order_date, 'FMDay') AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY TO_CHAR(order_date, 'FMDay')
ORDER BY total_orders DESC;


------------- MOnthly trend for orders
select to_char(order_date , 'FMMonth') as Month_Name, 
COUNT(DISTINCT order_id) as Total_Orders
from pizza
GROUP BY to_char(order_date, 'FMMonth');


---------------% of sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_category;


----------------Query 09 . % of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size;


----------------- Query 10. total Pizzas Sold by pizza Category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size;

---------------Query 11. Top 5 pizzas by revenue

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;
-------------Query 12. bottom 5 pizza by revenue

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;

----------Query 13. Top 5 pizzas by Quantity

select pizza_name, sum(quantity) as total_Pizzas_sold
from pizza
group by pizza_name
order by total_Pizzas_sold desc
limit 5;

-------------- Query 14. Bottom 5 pizzas by Quantity

select pizza_name , sum(quantity) as Total_Pizzas_Sold
from pizza
group by pizza_name
order by Total_Pizzas_Sold asc
limit 5;

------------ Query 15. Top 5 pizzas by total orders
select pizza_name, count(distinct order_id) as total_orders
from pizza
group by pizza_name
order by total_orders desc
limit 5;

---------- Query 16. Bottom 5 pizzas by total_users
select pizza_name, count(distinct order_id) as total_orders
from pizza
group by pizza_name
order by total_orders asc
limit 5;



SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
limit 5;

