
-- Modifying Data Types of all columns 


select 
* 
from coffeeshop_sales.`coffee shop sales`;


SET SQL_SAFE_UPDATES = 0;



ALTER TABLE `coffee shop sales`
MODIFY COLUMN  transaction_date DATE;



ALTER TABLE `coffee shop sales`
ADD COLUMN new_transaction_date DATE;


UPDATE `coffee shop sales`
SET new_transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');


ALTER TABLE `coffee shop sales`
DROP COLUMN transaction_date;


ALTER TABLE `coffee shop sales`
CHANGE COLUMN new_transaction_date transaction_date DATE;


SELECT * FROM `coffee shop sales` LIMIT 1000;



UPDATE `coffee shop sales`
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');





ALTER TABLE `coffee shop sales`
modify COLUMN transaction_time  time;





-- calculate total sales for each month 


select 
distinct  month(transaction_date)
from`coffee shop sales` 
;

select 
Round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 1;                 -- total sales of january month 



select 
Round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 2;                 -- total sales of feb month 




select 
Round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 3;                 -- total sales of march month 




select 
 Round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 4;                 -- total sales of Apr month 



select 
Round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 5;                 -- total sales of may month 



select 
round (sum(transaction_qty * unit_price),2) as total_sales
from `coffee shop sales` 
where 
month(transaction_date )  = 6;                 -- total sales of jun  month 



-- we 'll compare total sales of to months 






SELECT 
    Month_per, 
    total_sales,
    (total_sales - LAG(total_sales, 1) OVER (ORDER BY Month_per)) / LAG(total_sales, 1) OVER (ORDER BY Month_per) * 100 AS increase_percentage
FROM (
    SELECT 
        MONTH(transaction_date) AS Month_per,
        ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
    FROM 
        coffeeshop_sales.`coffee shop sales`
    WHERE 
        MONTH(transaction_date) IN (4, 5)
    GROUP BY 
        Month_per
) AS monthly_sales
ORDER BY 
    Month_per;
    
    
  
  
  

  
-- calculate total  orders for each month 

select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =1;



select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =2;





select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =3;





select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =4;





select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =5;




select 
count(transaction_id) as total_orders
from `coffee shop sales`
where month(transaction_date) =6;




-- copareing total sales of 2 monthes 



SELECT 
    Month_num, 
    total_transactions,
    (total_transactions - LAG(total_transactions, 1) OVER (ORDER BY Month_num)) / LAG(total_transactions, 1) OVER (ORDER BY Month_num) * 100 AS increase_percentage
FROM (
    SELECT 
        MONTH(transaction_date) AS Month_num,
        COUNT(transaction_id) AS total_transactions
    FROM 
        coffeeshop_sales.`coffee shop sales`
    WHERE 
        MONTH(transaction_date) IN (4, 5)
    GROUP BY 
        Month_num
) AS monthly_transactions
ORDER BY 
    Month_num;







-- 

select 
concat(round(sum(unit_price * transaction_qty),1)/1000,' ','K') as total_sales ,
 sum(transaction_qty) as total_qty_sold , 
count(transaction_id)  as total_orders 
from coffeeshop_sales.`coffee shop sales`;







-- Get total sales for weekdays and week ends for each month

select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 1
group by 1;



select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 2
group by 1;







select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 3
group by 1;









select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 4
group by 1;








select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 5
group by 1;









select 
case 
when dayofweek(transaction_date) in (1,7) then 'WeekEnd' 
else 'WeekDay' 
end as Day_type , 
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 6
group by 1;




-- total sales for each location 



select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 1
group by 1;





select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 2
group by 1;



select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 3
group by 1;




select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 4
group by 1;





select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 5
group by 1;





select 
store_location,
round(sum(unit_price *transaction_qty),2) as total_sales 
from coffeeshop_sales.`coffee shop sales` 
where month(transaction_date) = 6
group by 1;







-- Average sales by each month 

select 
round( avg(total_sales ),2) as AvG_total_sales 
from
(
select 
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =5
group by transaction_date
) as internal_query ;




-- calculate daily sales for each month 


select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =1
group by 1;






select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =2
group by 1;







select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =3
group by 1;




select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =4
group by 1;




select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =5
group by 1;





select 
day(transaction_date)as day_of_month,
sum(transaction_qty*unit_price) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =6
group by 1;





-- sales status 


select 
avg_total_sales,
day_of_month,
case 
when total_sales > avg_total_sales then'Above average '
when total_sales < avg_total_sales then'below average '
else 'average' end as sales_status ,
total_sales
from
(
select 
day(transaction_date)as day_of_month ,
sum(unit_price*transaction_qty) as total_sales ,
avg(sum(unit_price*transaction_qty)) over () as avg_total_sales 
from coffeeshop_sales.`coffee shop sales`  
where  month(transaction_date)  = 5
group by 1 
) as internal_query 
order by day_of_month;






-- total sales of each category 



select 
product_category,
sum(unit_price*transaction_qty) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =5 
group by 1
order by 2 desc ;

-- by each type 

select 
product_type,
sum(unit_price*transaction_qty) as total_sales 
from coffeeshop_sales.`coffee shop sales`  
where month(transaction_date) =5 
group by 1
order by 2 desc ;


