create database project;
select * from superstoree;

show columns from superstoree;
-- number of rows
select count(*) FROM superstoree;

-- get the unique ship mode >> similar to unique value in pandas
select distinct `Ship Mode` from superstoree;

-- count how many orders were placed
select  count(distinct `Order ID`) FROM superstoree;

-- show total sales per categorry
select Category, sum(Sales)
from superstoree
group by Category;

-- list all customers from california
select  distinct `Customer Name` from superstoree
where State = 'California';

-- find the total no of unique customers
select count(distinct `Customer Name`) 
from superstoree;

-- what is the total profit for the chairs sub-category
select sum(Profit) from superstoree
where `Sub-Category` = 'Chairs';

-- show top 5 products by sales
select `Product Name` , sum(Sales) as total_sales from superstoree
group by `Product Name`
order by total_sales desc limit 5;

-- find the earliest and latest order date
select min(`Order Date`)  as earliesr_order_date ,
max(`Order Date`)  as latest_order_date from superstoree;

-- avg discount per region
select
 Region , avg(Discount) 
from superstoree
group by Region;

-- state with the highest total sales
select State, sum(Sales) as highest_total_sales
from superstoree
group by State
order by highest_total_sales desc limit 1;

-- total quantity of products sold per sub-category
select `Sub-Category` , sum(Quantity) as total_quantity
from superstoree 
group by `Sub-Category`;

-- number of orders shipped using 'Second Class'
select count(distinct `Order ID`) as no_of_orders, `Ship Mode`
from superstoree
group by `Ship Mode`
having `Ship Mode` = 'Second Class';

-- list customers with more than two orders
select `Customer Name`, `Customer ID` , count(distinct `Order ID`) as no_orders
from superstoree
group by `Customer Name`,`Customer ID`
having no_orders >2;


-- top 3 sub- categories by profit in each category
select * from(select Category, `Sub-Category`, sum(Profit) as total_profits,
rank() over (partition by Category order by sum(Profit) desc) as rk
from superstoree
group by Category, `Sub-Category`)
as ranked_subs
where rk <= 3;

-- find the orders with negative profit
select Profit from superstoree
where Profit like '-%';

select `Order ID`, `Product Name`, Profit
from superstoree
where Profit <0;

-- citites where more than 10000 of sales happened
select City, sum(Sales) as city_sales
from superstoree
group by City 
having city_sales >10000;


-- find the product with zero but non-zer sales
select `Product Name` , Profit , Sales 
from superstoree
where Profit = 0  and Sales >0;

-- sub-category where discoutn was always 0
select `Sub-Category` , Discount 
from superstoree
where Discount = 0;

select * from superstoree;

-- rank customers by profit in each region
select * from (select `Customer Name` , sum(Profit) as total_profit, Region,
rank() over(partition by Region order by sum(Profit) ) as rk
from superstoree
group by `Customer Name`,Region ) as ranked_region;


-- write a cte to find the most profitable product in each sub-category
with product_profit as (
select `Sub-Category`, `Product Name` , sum(Profit) as total_profit, 
rank() over (partition by `Sub-Category` order by sum(Profit) desc) as rk
from superstoree
group by `Sub-Category` , `Product Name`)
select * from product_profit where rk=1;

































