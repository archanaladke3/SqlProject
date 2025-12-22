use  evsales_db;
select * from vehicle;
-- 1 Show distinct states
SELECT DISTINCT state FROM vehicle;
-- 2.Show distinct vehicle classes
select distinct Vehicle_Class from vehicle;
-- 3.count total records
select count(*)as total_record from vehicle;
-- 4 count total record per state
SELECT state, COUNT(*) as totalrecord FROM vehicle GROUP BY state;
-- 5.Show max EV sales in a single record
SELECT MAX(EV_Sales_Quantity) FROM vehicle;
-- 6 Total EV sales by state
SELECT state, SUM(EV_Sales_Quantity) AS total_sales FROM vehicle GROUP BY state
ORDER BY total_sales DESC;
-- 8  Total EV sales by Vehicle Type
select Vehicle_Type, sum(ev_sales_quantity) as Total_sales from vehicle group by vehicle_type order by total_sales desc;
-- 9 Vehicles registered in Andhra Pradesh only
select * from  vehicle where state='andhra pradesh';
-- 10 Find states with EV sales > 0
select * from vehicle;
select * from vehicle where EV_Sales_Quantity>0;
-- 11 Find states with no EV sales
SELECT state from vehicle group by state having SUM(EV_Sales_Quantity) = 0;
-- 12.Show records where vehicle class contains “BUS”
select * from vehicle where  Vehicle_Class LIKE '%BUS%';
-- 13 List states alphabetically
select state from vehicle order by state;
-- 14 Total EV sales in a specific year
select year, SUM(EV_Sales_Quantity) from vehicle where year = 2014 group by year;
-- 15 Count EV sales by both state and category
select state, Vehicle_Category, SUM(EV_Sales_Quantity) from vehicle group by  state, Vehicle_Category;
-- 16 Find the first EV sale date in dataset
select min(date) sale_date from vehicle;
-- 17 Running total of EV sales over time
select date,sum(EV_Sales_Quantity) AS daily_sales,sum(sum(EV_Sales_Quantity)) OVER (ORDER BY date) AS running_total
from vehicle group by date;
-- 18 Month-wise & State-wise EV sales matrix
select  state, month, sum(EV_Sales_Quantity)from vehicle group by state, month;
-- 19 States contributing more than 10% of EV sales
select state,sum(EV_Sales_Quantity),(sum(EV_Sales_Quantity) / (select sum(EV_Sales_Quantity) from vehicle)) * 100 AS contribution
from vehicle group by state having contribution > 10;
-- 20. Vehicle category trend across time using CTE
WITH cte AS (select date, Vehicle_Category, SUM(EV_Sales_Quantity) AS sales from vehicle
  group by date, Vehicle_Category)
SELECT * FROM cte;