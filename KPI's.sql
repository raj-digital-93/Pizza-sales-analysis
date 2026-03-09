select * from pizza_sales;

-- Total revenue
select sum(total_price) as Total_Revenue from pizza_sales;

-- Average Order Value (AOV)
select (sum(total_price) /count(distinct(order_id))) as AOV from pizza_sales;

-- Total pizzas sold
select sum(quantity) as Total_pizzas_sold from pizza_sales;

-- Total orders
select count(distinct(order_id)) as Total_orders from pizza_sales;

-- Average pizzas per order
select round(sum(quantity)/count(distinct(order_id)),2) as Avg_pizza_per_order from pizza_sales;

create view kpi as
select 
sum(total_price) as Total_Revenue,
sum(total_price) /count(distinct(order_id)) as AOV,
sum(quantity) as Total_pizzas_sold,
count(distinct(order_id)) as Total_orders,
round(sum(quantity)/count(distinct(order_id)),2) as Avg_pizza_per_order
from pizza_sales

select * from kpi