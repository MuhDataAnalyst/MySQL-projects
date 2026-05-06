
create table Auto_sales 
as  
select * 
from auto_sales_data; 

select * 
from auto_sales_data;

select * 
from auto_sales; 


select  max(sales) , min(sales) 
from auto_sales;

select  max(orderdate) , min(orderdate) 
from auto_sales;

select * 
from auto_sales;

select *, 
row_number() over(partition by ordernumber, quantityordered, 
	priceeach, orderlinenumber, sales, orderdate, days_since_lastorder, 
		`status` , productline , msrp , productcode , customername, phone, addressline1 , 
			city , postalcode, country, contactlastname , contactfirstname, dealsize) as row_num
from auto_sales; 

with duplicates_check as (
select *, 
row_number() over(partition by ordernumber, quantityordered, 
	priceeach, orderlinenumber, sales, orderdate, days_since_lastorder, 
		`status` , productline , msrp , productcode , customername, phone, addressline1 , 
			city , postalcode, country, contactlastname , contactfirstname, dealsize) as row_num
from auto_sales 
) 
select * 
from duplicates_check 
where row_num > 1; 

select distinct ORDERNUMBER , sales
from auto_sales
order by sales desc
;

select orderdate , str_to_date(orderdate , '%d/%m/%Y')
from auto_sales
; 

update  auto_sales 
set orderdate = str_to_date(orderdate , '%d/%m/%Y') ; 

alter table auto_sales
modify column ORDERDATE date ; 

select *
from auto_sales
where orderdate is null 
; 

select max(ORDERDATE) , min(ORDERDATE) 
from auto_sales; 

select *
from auto_sales
where `status` = 'shipped' 
order by sales desc 
limit 5 ; 


select distinct `status` 
from auto_sales ;

 
 -- total revenue 
select sum(sales) 
from auto_sales; 

-- revenue by year 

select year(orderdate) , sum(sales)
from auto_sales 
group by year(orderdate) ; 

-- revenue by status 
-- which shows the major revenue is from the shipped with almost 85% 
select `status` , sum(sales) 
from auto_sales 
group by `status` ; 

-- revenue by status 
-- showing percentage of true "shipped"sales compared with the false sales "others" 

create temporary table sum_all 
select sum(sales) as sum_all_sales 
from auto_sales ;

drop table sum_all;
 
select sum_all_sales
from sum_all ; 


with status_cte as (
    select `status` , sum(sales) as status_sum 
	from auto_sales 
	group by `status` ) 
    select `status` ,  status_sum , round(( status_sum / sum_all.sum_all_sales ) * 100, 2)  as percentage_sum
    from status_cte 
    join sum_all ; 
    

SELECT 
    `status`,
    SUM(sales) AS revenue,
    round(SUM(sales) * 1.0 / SUM(SUM(sales)) OVER (), 3) AS percentage
FROM auto_sales
GROUP BY status;


-- percentage of shipped revenue by country
select 
country ,
sum(sales) as country_revenue , 
round(
(sum(sales) * 1.0 / sum(sum(sales))  over()) * 100,
 2)  as percentage 
from auto_sales 
where `status` = 'shipped'
group by country ;


-- monthely trend 

select year(orderdate) , month(orderdate), sum(sales) as sum_sales
from auto_sales 
group by year(orderdate),  month(orderdate) 
order by sum_sales  ; 

-- revenue by country
select country , sum(sales) 
from auto_sales 
group by country 
order by sum(sales)  desc ;

-- revenue by country + status

select country , `status`, sum(sales) 
from auto_sales 
group by country , `status`
order by sum(sales)  desc ;

select year(orderdate) , sum(sales) 
from auto_sales 
where `status` = 'shipped' 
group by year(orderdate) ; 

select country , sum(sales) 
from auto_sales 
where `status` = 'shipped' 
group by country
order by 1 desc ; 

select country, count(*) as total_orders, 
		sum( case when `status` = 'cancelled' then 1 else 0 end) as cancelled_orders 
from auto_sales 
group by country ; 

select country, count(*) as total_orders, 
		sum( case when `status` = 'cancelled' then 1 else 0 end) as cancelled_orders, 
        (sum( case when `status` = 'cancelled' then 1 else 0 end) ) / (count(*)  ) as cancellation_rate
from auto_sales 
group by country ; 


with count_cancelled as ( 
select country, count(*) as total_orders, 
		sum( case when `status` = 'cancelled' then 1 else 0 end) as cancelled_orders
        from auto_sales 
        group by country 
        ) , cancellation_rate as
        ( 
select *, cancelled_orders / total_orders 
from count_cancelled )
select *
from cancellation_rate	
order by 4 desc
;


WITH count_cancelled AS ( 
    SELECT 
        country, 
        COUNT(*) AS total_orders,
        SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_orders
    FROM auto_sales
    GROUP BY country
)

SELECT 
    country,
    total_orders,
    cancelled_orders,
    cancelled_orders * 1.0 / total_orders AS cancellation_rate
FROM count_cancelled
ORDER BY cancellation_rate DESC;

























