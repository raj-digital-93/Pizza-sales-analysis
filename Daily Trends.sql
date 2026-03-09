select * from pizza_sales;

-- Total orders count Day wise
SELECT 
DATE_FORMAT(str_to_date(order_date,'%d-%m-%Y'),'%W') AS Day_name,
count(distinct(order_id)) as Order_count
FROM pizza_sales
Group by DATE_FORMAT(str_to_date(order_date,'%d-%m-%Y'),'%W')
order by DATE_FORMAT(str_to_date(order_date,'%d-%m-%Y'),'%W');

-- Total orders count by Hours
select hour(order_time) as order_hours,
count(distinct(order_id)) as Order_count
FROM pizza_sales
group by hour(order_time)
order by hour(order_time)



