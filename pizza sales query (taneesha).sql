select * from pizza_sales;


#TOTAL REVENUE
select cast(sum(total_price) as decimal(10,2))as Total_Revenue  from pizza_sales; 


#AVERAGE ORDER VALUE
select cast((sum(total_price)/count(distinct order_id)) as decimal(10,2)) as Average_order_value from pizza_sales; 


#TOTAL PIZZAS SOLD
select sum(quantity) as Total_pizzas_sold from pizza_sales;


#TOTAL ORDERS
select count(distinct order_id) as Total_orders from pizza_sales;


#AVERAGE PIZZAS PER ORDER
select (sum(quantity)/count(distinct order_id)) as Avg_pizzas_per_order from pizza_sales;


#DAILY TRENDS FOR TOTAL ORDERS
select dayname(order_date) as Day_name, count(distinct order_id) as Total_orders
from pizza_sales
group by dayname(order_date);


#MONTHLY TREND FOR TOTAL ORDERS
select monthname(order_date) as Month_name, count(distinct order_id) as Total_orders
from pizza_sales
group by monthname(order_date);


#PERCENTAGE OF SALES BY PIZZA CATEGORY
select pizza_category, cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as perc_of_sales
from pizza_sales
group by pizza_category;


#PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size, cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as perc_of_sales
from pizza_sales
group by pizza_size
order by pizza_size;


#TOTAL PIZZAS SOLD BY PIZZA CATEGORY
select pizza_category, sum(quantity) as Pizzas_sold
from pizza_sales
group by pizza_category
order by Pizzas_sold desc;


#TOP 5 PIZZAS BY REVENUE
select pizza_name , sum(total_price) as total_revenue 
from pizza_sales
group by pizza_name 
order by total_revenue desc
limit 5;


#BOTTOM 5 PIZZA BY REVENUE
select pizza_name , sum(total_price) as total_revenue 
from pizza_sales
group by pizza_name 
order by total_revenue
limit 5;


#TOP 5 PIZZAS BY QUANTITY
select pizza_name , sum(quantity) as total_pizzas 
from pizza_sales
group by pizza_name 
order by total_pizzas desc
limit 5;


#BOTTOM 5 PIZZAS BY QUANTITY
select pizza_name , sum(quantity) as total_pizzas 
from pizza_sales
group by pizza_name 
order by total_pizzas
limit 5;


#TOP 5 PIZZAS BY TOTAL ORDERS
select pizza_name , count(distinct order_id) as total_pizzas_order 
from pizza_sales
group by pizza_name 
order by total_pizzas_order desc
limit 5;


#BOTTOM 5 PIZZAS BY TOTAL ORDERS
select pizza_name , count(distinct order_id) as total_pizzas_order 
from pizza_sales
group by pizza_name 
order by total_pizzas_order 
limit 5;


#BOTTOM 5 PIZZAS BY TOTAL ORDERS FOR ONLY CLASSIC CATEGORY
select pizza_name , count(distinct order_id) as total_pizzas_order 
from pizza_sales
where pizza_category = "classic"
group by pizza_name 
order by total_pizzas_order 
limit 5;