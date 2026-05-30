SELECT * 
FROM emp_att;

# EmployeeCount DailyRate HourlyRate EmployeeNumber MonthlyRate Over18 StandardHours 
alter table emp_att 
	drop column EmployeeCount,
	drop column DailyRate,
	drop column HourlyRate,
	drop column EmployeeNumber,
	drop column MonthlyRate,
	drop column Over18,
	drop column StandardHours
    ;

# KPI 
select 
count(Attrition) as Total_Employees, 
(select count(Attrition) from emp_att where attrition = 'yes' ) as Total_Leavers, 
(select count(Attrition) from emp_att where attrition = 'yes' ) / count(Attrition) * 100 as Attrition_Rate
from emp_att
;

# Attrition By Job Level 

select 
JobLevel,
count(Attrition) as JobLevel_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100 ,1)  as JobLevel_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel
order by JobLevel
; 

# Attrition By Job Level & salary avg 

select 
JobLevel,
round(avg(MonthlyIncome)),
count(Attrition) as JobLevel_emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100 ,1)  as JobLevel_emp_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel
order by JobLevel
; 

# all emp By Job Level & salary avg 

select 
JobLevel,
round(avg(MonthlyIncome)),
count(Attrition) as JobLevel_emp_count, 
round(count(*) / (select count(Attrition) from emp_att  ) *100 ,1)  as JobLevel_emp_Rate

from emp_att 
group by JobLevel
order by JobLevel
; 



# Attrition By Job Involvement 

 select 
JobInvolvement,
count(Attrition) as JobInvolvement_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100 ,1 ) as JobInvolvement_Rate

from emp_att 
where attrition = 'yes'
group by JobInvolvement
order by JobInvolvement
; 


# Attrition By WLB 

 select 
WorkLifeBalance,
count(Attrition) as WLB_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as WLB_Rate

from emp_att 
where attrition = 'yes'
group by WorkLifeBalance
order by WorkLifeBalance
; 


# Attrition By currentRole 

 select 
YearsInCurrentRole,
count(Attrition) as role_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as role_Rate

from emp_att 
where attrition = 'yes'
group by YearsInCurrentRole
order by YearsInCurrentRole
; 


# Attrition By yearswithmanager 

 select 
YearsWithCurrManager,
count(Attrition) as same_manager_empcount, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as same_manager_empRate
from emp_att 
where attrition = 'yes'
group by YearsWithCurrManager
order by YearsWithCurrManager
; 


# Attrition By joblevel & involvement 

 select 
JobLevel,
JobInvolvement,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel, JobInvolvement
order by JobLevel
; 


# Attrition By yearswithmanager & involvement 

 select 
YearsWithCurrManager,
JobInvolvement,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate

from emp_att 
where attrition = 'yes'
group by YearsWithCurrManager, JobInvolvement
order by YearsWithCurrManager
; 

# Attrition By joblevel & involvement & WLB

 select 
JobLevel,
WorkLifeBalance,
JobInvolvement,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel, JobInvolvement, WorkLifeBalance
order by emp_count desc

; 

# Attrition By joblevel & involvement & WLB & manager

 select 
JobLevel,
WorkLifeBalance,
JobInvolvement,
YearsWithCurrManager,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel, JobInvolvement, WorkLifeBalance, YearsWithCurrManager
order by emp_count desc
; 

# Attrition By joblevel & involvement & salary AVG & manager

 select 
JobLevel,
round(avg(monthlyincome)),
JobInvolvement,
YearsWithCurrManager,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate

from emp_att 
where attrition = 'yes'
group by JobLevel, JobInvolvement, WorkLifeBalance, YearsWithCurrManager
having JobInvolvement (2 , 3 )
order by emp_count desc
; 

# Attrition By joblevel & salary AVG & manager

 select 
JobLevel,
round(avg(monthlyincome)),
YearsWithCurrManager,
count(Attrition) as emp_count, 
round(count(*) / (select count(Attrition) from emp_att where attrition = 'yes' ) *100, 1 ) as emp_Rate
from emp_att 
where attrition = 'yes'
group by JobLevel,  WorkLifeBalance, YearsWithCurrManager
order by emp_count desc
; 


















