select * from customers
select * from orders
select * from product

--Q What are the total sales made by each customer?

select C.customer_name , sum(sale) Total_sales
from orders O
join customers C
on O.customer_id = C.customer_id
group by C.customer_name
order by 2 desc

-- How many unique customers have placed orders?
select count(DISTINCT(customer_id))
from orders

--Which product has the highest sale price?
SELECT product_name, max(sale)
from orders
join product 
on orders.product_id = product.product_id
group by product_name
order by 2 desc
limit 1

select * from customers
select * from orders
select * from product
-- How many orders were placed in each state?
select state , count(order_id) total_order_in_state
from orders
group by state 

-- What is the total revenue generated from each product category?
select category , sum(sale)
from orders
where category is not null
group by category

select * from sellers
select * from orders


-- Which seller has the highest total sales?
select O.seller_id , seller_name , sum(sale)
from orders O
join sellers S
on S.seller_id = O.seller_id
group by O.seller_id , seller_name
order by 3 desc
limit 1

--What is the average quantity of products ordered per order?
SELECT order_id , avg(quantity)
from orders
group by order_id

-- Which customer has made the highest total purchase?
select O.customer_id , C.customer_name ,  sum(sale)
from orders O
join customers C
on O.customer_id = C.customer_id
group by O.customer_id , C.customer_name
order by 2 desc
limit 1

select * from orders
select * from order_return
-- How many returns were made for each order?
select order_id , count(return_id)
from order_return
group by order_id
order by 2 desc

-- 10.What is the total sales revenue generated per month?
select extract (month from order_date) Months , sum(sale)
from orders
group by extract (month from order_date)
order by  1, 2 desc

-- 11.Which product category has the highest average sale price?
select  category , avg(sale)
from orders
group by category
order by 2 desc
limit 1

-- 12.How many orders were placed for each sub-category?

select sub_category , count(order_id) order_placed
from orders
group by sub_category

-- 13.What is the total profit margin for each product?
select O.product_id , P.product_name, sum(sale - price_per_unit) total_profit
from orders O
join product P
on O.product_id = P.product_id
group by O.product_id , P.product_name
order by total_profit desc
select * from orders
select * from customers
-- 14.Which seller has the highest number of unique customers?






--18.How many unique products were sold?
select count(distinct(product_id))
from orders 
where product_id  is not null

--19.What is the average price per unit for each product category?
select * from orders
select category , avg(price_per_unit) average_price_unit
from orders
where category is not null
group by category
order by 2 desc

--20.Which state has the highest total sales revenue?

select state , sum(sale) Total_sales_revenue
from orders
group by state
order by 2 desc
limit 1
-- Tripura has highest sales revenue
 
--21.How many returns were made for each product category? 

select O.category , count(R.return_id)
from orders as O
join order_return R
on O.order_id = R.order_id
group by  O.category 

--22.What is the total quantity of products sold per seller?

select O.seller_id , S.seller_name , sum(quantity) total_quantity
from orders O
join sellers S
on O.seller_id = S.seller_id
group by O.seller_id , S.seller_name
order by total_quantity desc

--23.Which customer has placed the most orders?

select o.customer_id , c.customer_name , count(o.order_id) total_order
from Orders o
join customers c
on o.customer_id = c.customer_id
group by o.customer_id , c.customer_name 
order by 3 desc
 
--24.How many orders were placed for each product?

select o.product_id , p.product_name ,count(o.order_id) total_order
from orders o
join product p
on o.product_id = p.product_id
group by o.product_id , p.product_name
order by 3 desc

-- 25.What is the total profit generated from each seller?
select O.seller_id , S.seller_name , sum(O.sale - (P.cogs * O.quantity)) total_revenue
from orders O
join sellers S
on O.seller_id = S.seller_id
join Product P
on P.product_id = O.product_id
group by O.seller_id , S.seller_name
order by 3 desc

--26.Which seller has the highest average sale price?
select O.seller_id , S.seller_name , avg(sale) Average_sale
from orders O
join sellers S
on O.seller_id = S.seller_id
group by O.seller_id , S.seller_name
order by 3 desc
limit 1

-- 27.How many unique products were returned?
select * from order_return
select * from product

SELECT COUNT(DISTINCT o.product_id) AS unique_products_returned
FROM orders o
JOIN order_return r ON o.order_id = r.order_id
WHERE o.product_id IS NOT NULL;

--28.What is the total sales revenue generated per product?

select o.product_id,p.product_name , sum(sale) total_sales
from orders o
join product p
on o.product_id = p.product_id
group by o.product_id,p.product_name
order by 3 desc
ALL
-- 29.Which product category has the highest number of returns?
select o.category , count(r.return_id)
from orders o
join order_return r
on o.order_id = r.order_id
group by o.category 
order by 2 desc
limit 1

--30.How many orders were placed each month?

select * from orders

select extract (Month from order_date) order_month , count(order_id)
from orders
group by extract (Month from order_date)
order by 2 desc



