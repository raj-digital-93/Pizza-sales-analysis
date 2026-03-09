select * from pizza_sales;

-- % of Sales by Pizza category
select distinct pizza_category,round(category_Sales,2) as Total_sales,
concat(round((category_sales/total_sales)*100,2),'%') as pizza_category_percent from
(
select pizza_category,
sum(total_price) over() as total_Sales,
sum(total_price) over(partition by pizza_category) as category_Sales
from pizza_sales)tt
order by Total_sales desc;

-- % of sales by pizza size
select pizza_size,
round(sum(total_price),2) as totalsales,
concat(round((sum(total_price))/(select sum(total_price) from pizza_sales)*100,2),'%') as percent
from pizza_sales
group by pizza_size
order by percent desc

-- Total Pizzas Sold by Pizza Category monthwise
select date_format(str_to_date(order_date,'%d-%m-%Y'),'%M') as Monthname,pizza_category,
sum(quantity) as totalquantity
from pizza_sales
group by pizza_category,date_format(str_to_date(order_date,'%d-%m-%Y'),'%M')

-- Top 5 Best Sellers by Total Pizzas Sold
select pizza_name,
sum(quantity) as pizzas_sold 
from pizza_sales
group by pizza_name
order by pizzas_sold desc
limit 5;


-- Bottom 5 Best Sellers by Total Pizzas Sold
select pizza_name,
sum(quantity) as pizzas_sold 
from pizza_sales
group by pizza_name
order by pizzas_sold
limit 5;