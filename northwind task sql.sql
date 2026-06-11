


# setting the joins tables 
select 
*
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID

;


select 
order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)  as revenue
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID
;


SELECT COUNT(DISTINCT OrderID) 
FROM Orders
WHERE YEAR(OrderDate) = 1997
;


SELECT COUNT(*) FROM order_details
;

# showing the avg order value and ordering by the highest value from each category, 
# "and showing the def between taking in account the nulls in the orderid can affect the result "
select 
categories.Categoryname,
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) , 2)as revenue, 
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) / COUNT(DISTINCT orders.orderid), 2) as D_order_avg
, round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) / COUNT( orders.orderid) , 2)as order_avg

from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID
group by categories.Categoryname
order by order_avg desc
;






# -x
with joining_cte as (
select * 
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID 
)
select ProductID
from joining_cte


;






select 
categories.Categoryname, products.ProductName,
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) , 2)as revenue 
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID
group by categories.Categoryname, products.ProductName

;





with allCTE as (
select 
categories.Categoryname, products.ProductName,
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) , 2)as revenue 
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID
group by categories.Categoryname, products.ProductName
) 
select 
Categoryname, ProductName, revenue, 
rank() over(partition by Categoryname order by revenue desc) as rnk

from allcte
  
order by revenue desc 
;

-- the top best sales one product "showing if there multiple products hits the same revenue"  by revenue in each category 

with allCTE as (
select 
categories.Categoryname, products.ProductName,
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) , 2)as revenue 
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
join products on products.ProductID = order_details.ProductID 
join categories on products.CategoryID = categories.CategoryID
group by categories.Categoryname, products.ProductName
), rnkcte as (
select 
Categoryname, ProductName, revenue, 
rank() over(partition by Categoryname order by revenue desc) as rnk

from allcte
  ) 
  select Categoryname, ProductName, revenue
  from rnkcte 
  where rnk = 1 
order by revenue desc 
;



--- Month on month revenue 

with allCTE as (
select 
 month(OrderDate) as num,
round(sum(order_details.UnitPrice * order_details.Quantity * ( 1 - order_details.Discount)) , 2)as revenue
from order_details
join orders on orders.orderid = order_details.orderid and  YEAR(OrderDate) = 1997 
group by month(OrderDate)
ORDER BY month(OrderDate)  
) 
select num, revenue , 
revenue - LAG(revenue) OVER ()  as mom 
from allcte 
;













