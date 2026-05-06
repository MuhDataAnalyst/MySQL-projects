select * 
from layoffs; 

create table layoffstart 
like layoffs; 

select * 
 from layoffstart; 
 
 insert into layoffstart 
 select * 
 from layoffs; 
 
 select * 
 from layoffstart ; 
 
 select * 
 from layoffstart 
 where total_laid_off is null and percentage_laid_off is null ; 
 
 delete
 from layoffstart 
 where total_laid_off is null and percentage_laid_off is null ;  
 
  select * , row_number() over (partition by company , location, industry, total_laid_off, percentage_laid_off , `date` , stage, country, funds_raised_millions)
 from layoffstart ; 
 
 
 with duplicates_cte as (
select *,  row_number() over (partition by company , location, industry, total_laid_off, percentage_laid_off , `date` , stage, country, funds_raised_millions) row_num 
from layoffstart
 )  
select * 
from duplicates_cte 
 
; 
  
 CREATE TABLE `layoffstart2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL, 
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 
 insert into layoffstart2 
 with duplicates_cte as (
select *,  row_number() over (partition by company , location, industry, total_laid_off, percentage_laid_off , `date` , stage, country, funds_raised_millions) row_num 
from layoffstart
 )  
select * 
from duplicates_cte ;  
 
 
 select * 
from layoffstart2 
where row_num >= 2 ;
 
delete 
from layoffstart2 
where row_num >= 2 ;
 
  
 select * 
from layoffstart2
;


 select distinct  industry
from layoffstart2
order by 1
;

 select industry 
from layoffstart2
where industry like 'crypto%' 
;

update layoffstart2
set industry = 'Crypto' 
where industry like 'crypto%'   
; 

 select distinct  country
from layoffstart2
order by 1
;

 select country 
from layoffstart2
where country like 'United State%' 
;

update layoffstart2
set country = 'United States' 
where country like 'United State%'  
; 


 select * 
from layoffstart2;


 select   industry
from layoffstart2
where industry is null or industry = ''
;

 select industry 
from layoffstart2
where industry like '' 
;

update layoffstart2
set industry = null 
where industry like ''   
; 

select  t1.company , t1.industry , t2.company , t2.industry 
from layoffstart2 t1 
join layoffstart2 t2 
	on t1.company = t2.company 
where t1.industry is null  and t2.industry is not null ; 


update layoffstart2 t1 
join layoffstart2 t2 
	on t1.company = t2.company  
set t1.industry = t2.industry 
where (t1.industry is null  and t2.industry is not null) and t1.company = t2.company ; 


 select `date`, str_to_date(`date`,'%m/%d/%Y') 
from layoffstart2;

alter table  layoffstart2 drop column row_num ; 


update layoffstart2 
set `date` = str_to_date(`date`,'%m/%d/%Y') 
;

 
 select * 
from layoffstart2;
 
 alter table layoffstart2 
 modify column `date` date ; 