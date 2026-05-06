create table layoff_eda as select * from layoffstart2; 

select * 
from layoff_eda ; 

select  max(total_laid_off) , max(percentage_laid_off)
from layoff_eda;  

select * 
from layoff_eda 
where percentage_laid_off = 1 
order by total_laid_off desc  ; 

select * 
from layoff_eda 
where percentage_laid_off = 1 
order by funds_raised_millions desc  ; 



select  company , sum(total_laid_off)
from layoff_eda 
group by company 
order by 2 desc ; 


select  min(`date`) , max(`date`)
from layoff_eda;

select  country , sum(total_laid_off)
from layoff_eda 
group by country 
order by 2 desc ; 

select  *
from layoff_eda ;


select  year(`date`) , sum(total_laid_off)
from layoff_eda 
group by  year(`date`) 
order by 1 desc ; 

select  stage , sum(total_laid_off)
from layoff_eda 
group by stage
order by 2 desc ; 


select substring(`date`,1,7) as `month` , sum(total_laid_off)
from layoff_eda 
where substring(`date`,1,7) is not null 
group by `month`
order by 1 asc	;

with cte as (
select substring(`date`,1,7) as `month` , sum(total_laid_off) as sum
from layoff_eda 
where substring(`date`,1,7) is not null 
group by `month`
order by 1 asc) 
select `month` ,sum_total_laid ,  sum(sum) over(order by `month`) as rolling_total
from cte 
; 



select  company, year(`date`), sum(total_laid_off)
from layoff_eda 
group by company , year(`date`)
order by 3 desc
  ; 


with company_year as 
(
select  company, year(`date`) years, sum(total_laid_off) total_laid
from layoff_eda 
group by company , year(`date`) 
) ,
company_year_rank as 
(
select * , 
dense_rank() over ( partition by years order by total_laid desc ) as D_rank
from company_year 
where years is not null 
) 
select * 
from company_year_rank 
where d_rank <= 5 
; 

















