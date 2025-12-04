-- 1. We need a complete list of our suppliers to update our contact records. 
-- Can you pull all the information from the suppliers' table?
use northwind;
show tables;
select * from suppliers;


-- 2. Our London sales team wants to run a local promotion. Could you get a 
-- list of all customers based in London?
select * from customers  where city='london';

-- 3. For our new 'Luxury Items' marketing campaign, I need to know our top 5
-- most expensive products.
show tables;
select * from products;
select * from products order by  price desc limit 5;

-- 4. HR is planning a professional development program for our younger employees.
-- Can you provide a list of all employees born after 1965?
show tables;
select * from employees;
select * from employees where birthdate>='1965-01-01';

-- 5. A customer is asking about our 'Chef' products but can't remember the full name.
-- Can you search for all products that have 'Chef' in their title?
      show tables;
      select * from products where  productname like  '%chef%';
      
-- 6. We need a report that shows every order and which customer placed it. 
-- Can you combine the order information with the customer's name?
select * from customers;
select * from orders;
select o.orderId,o.customerId ,c.customername from orders o join 
 customers c on  c.customerId=o.customerid;

-- 7. To organize our inventory, please create a list that shows each product and the name 
-- of the category it belongs to.
show tables;
 select * from products;
 select * from categories;
 select p.productid,p.productname,c.CategoryName, c.CategoryID from products p
 join  categories c on c.CategoryID=p.CategoryID;
 

-- 8. We want to promote products sourced from the USA. Can you list all products 
-- provided by suppliers located in the USA?
select * from products;
show tables;
select * from suppliers;
select p.productname,p.price,s.country from products p join suppliers s on 
s.supplierid =p.supplierid where  s.country='USA';

-- 9. A customer has a query about their order. We need to know which employee 
-- was responsible for it. Can you create a list of orders with the corresponding employee's first and last name?
select * from customers;
select * from employees;
select * from orders;
select  c.customername,e.firstname,e.lastname from customers c join  orders o 
 on o.customerId= c.customerid join  employees e on e.employeeid=o.employeeId


-- 10. To help with our international marketing strategy, 
-- I need a count of how many customers we have in each country, sorted from most to least.
select * from customers;
select country,  count(*) as  total_customers  from customers group by country order by total_customers desc;



-- 11. Let's analyze our pricing. What is the average product price within each product category?
show tables;
select * from products;
select * from Categories;
select p.productname, avg(p.price) avg_price ,c.categoryname from products p join categories c
on c.categoryid=p.categoryid  group by  p.productname,c.categoryname;

-- 12. For our annual performance review, 
-- can you show the total number of orders handled by each employee?
show tables;
select * from orders;
select * from employees;
 
-- 13. We want to identify our key suppliers. Can you list the suppliers who provide us with more than three products? n 
select * from suppliers;
select * from products;

select p.productname,s.suppliername,s.contactname from suppliers s join products p
on s.supplierid=p.supplierid where p.unit>3;


-- 14. Finance team needs to know the total revenue for order 10250.
 select * from products;
 select * from orders;
select (p.unit*p.price) total_revenue from products p join orders o on o.ProductID=p.ProductID;
show tables;
SELECT o.OrderID,
       SUM(p.unit * p.price) AS total_revenue
FROM orders o
JOIN products p ON p.ProductID = o.ProductID
WHERE o.OrderID = 10250
GROUP BY o.OrderID;
-- 15. What are our most popular products? I need a list of the top 5 products based on the total quantity sold across all orders.
      select * from products;
      select * from categories;

-- 16. To negotiate our shipping contracts, we need to know which shipping company we use the most. Can you count the number 
-- of orders handled by each shipper?
select * from orders;
select shipperid ,count(*) as ordercount from orders group by shipperid order by shipperid desc;

	

-- 17. Who are our top-performing salespeople in terms of revenue? Please calculate the total sales amount for each employee.
show tables;
select * from shippers;
 select * from employees;
 select * from products;
 select * from orders;
 select e.employeeid,e.firstname ,sum(p.price*p.unit) as 
 total_reveune from employees e join  products p 
 on e.employeeid=p.productid group by  e.employeeid

-- 18. We are running a promotion on our 'Chais' tea. I need a list of all customers who have purchased this product before 
-- so we can send them a notification.
select * from customers;
select * from products;



-- 19. Which product categories are the most profitable? 
-- I need a report showing the total revenue generated by each category.
select * from categories;
select c.categoryname, sum(p.unit* p.price) as total_reveune from products p join categories c
on c.categoryid=p.categoryid group by c.categoryname order by total_reveune desc;

-- 20. We want to start a loyalty program for our most frequent customers. Can you find all customers who have placed more than 5 orders?

select * from customers;
select * from orderdetails;
select * from orders;
select  c.customername,c.city,c.country ,count(o.orderid)as total_order from 
customers c join orders  o on c.customerid=o.customerid group by c.customername,c.city,c.country having count(o.orderid) >5;
show tables;

