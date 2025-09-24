-- 1. Write a query to create database with name pizza_sales_analysis.
create database pizza_sales_analysis;

-- 2. Write a query to see list of all databases.
show databases;

-- 3. Write a query to create following table.
use pizza_sales_analysis;
create table pizza_order(
id int,
order_date date);

-- 4. Write a query to add column time with datatype time after date column in above order table.
alter table pizza_order
add order_time datetime;

-- 5. Write a query to rename the table order to orders.
alter table pizza_order rename to pizza_orders;

-- 6. Add primary key constraint to the column id on existing table orders
alter table pizza_orders
add primary key(id);

