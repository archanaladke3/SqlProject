use furniture_db;
select * from furniture;
ALTER TABLE furniture RENAME COLUMN `ï»¿productName` TO `productName`;
-- Questions
--  Aggregation
-- 1 Count total number of products
select count(*) total_product from furniture;
-- 2 Find highest price
 select max(price)highest_price from furniture ;
 -- 3 Find lowest price
 select min(price)lowest_price from furniture ;

-- 4 Find average price
select avg(price) avgprice from furniture;

-- 5 Count products per sold
select * from furniture;
 select count(sold) count_sold_product from furniture ;
 -- 6. Total revenue 
 select sum(price * sold) AS total_revenue from furniture;
 -- 7  total sale product
 select productName, sum(sold) AS total_sold FROM furniture group by  productName
 order by total_sold DESC;
-- 8.Total revenue per product
select productName, sum(price * sold) AS total_revenue from  furniture
group by productName order by total_revenue DESC;
-- 9.Products with zero sold items
select  productName from furniture where  sold = 0;
-- 10.Products sold more than 50 units
select productName, sold from  furniture where  sold > 50
order  by sold DESC;
-- 11.Top 5 best-selling products:
select productName, sold from furniture
order by sold DESC limit 5;
-- 12.Top 5 highest revenue products:
select productName, sum(price * sold) AS total_revenue from   furniture group by productName limit 5;
 
-- 13 Products with Same Price
select * from furniture;
-- 14.Products With Discount
select  productName, originalPrice, price
 from furniture where  price < originalPrice;
 -- 15 Find Discount % for Each Product
 with priceInfo AS (select productName,originalPrice,price,ROUND(((originalPrice - price) / originalPrice) * 100, 2) AS discount_percent
    from furniture)
select  * from priceInfo;
-- 16 Show only products with discount > 20%
with discounts AS (select productName,originalPrice,price,
ROUND(((originalPrice - price) / originalPrice) * 100, 2) AS discount_percent
    from furniture)
select *from discounts where discount_percent > 20;
-- 17 show only items that have orders
select f.productName,f.price from furniture f INNER JOIN  furniture o
ON f.productName = o.productName;
-- 18 Show Products Whose Total Revenue > 50000
select productName,sum(price * sold) AS total_revenue from furniture
group by  productName having  total_revenue > 5000;
-- 19 Show Products Sold More Than 100 Units
select productName,sum(sold) AS total_sold from furniture group by productName
having total_sold > 100;
-- 20 Show Shipping Types With More Than 3 Products
select Shipping, count(*) AS total_products from furniture group by Shipping
having count(*) > 3;
select * from furniture;