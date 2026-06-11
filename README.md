 MySQL Projects

in this section i'm showing the files & projects that i worked on with Mysql , " will be updated by adding the new files to the top " 

1- Northwind Task SQL : 
  in this project i ltook a different approach , i tried to set an exceptional requests in a tasks form , and quiz myself into answering those quizes ,
  and then tried to set a complex and intersected quiz to get the answers from this dataset
  so as the file shows it has 4 tables and i did extract some specific info and revenues to get the insight from such a result according to the tasks i setted - enjoy checking the project. 

---

2- HR_Project : 
  in this i was mainly redo-ing a project that i already done with Tableau . 
  that was the first HR dataset that i have tested , and it was fun.  



Some Common MySQL Projects : 

Data Cleaning
Cleaned a real-world dataset of tech company layoffs before performing analysis.
- Removed duplicate records using ROW_NUMBER() with window functions
- Handled NULL and blank values in industry and country columns
- Standardized inconsistent text entries (e.g. "Crypto Currency" → "Crypto", "United States." → "United States")
- Converted date column from text format to proper DATE type using STR_TO_DATE()
- Used self-joins to fill in missing industry values from matching company records

---

Layoff EDA 
Exploratory analysis on the cleaned layoffs dataset to find patterns in who got laid off and when.
- Companies and countries with the highest total layoffs
- Year-by-year layoff trends from 2020 to 2023
- Companies that laid off 100% of their workforce
- Monthly rolling total of layoffs over time using a CTE + window function
- Top 5 companies by layoffs per year using DENSE_RANK()

---

 Auto Sales
Exploratory analysis on an auto sales dataset covering orders, revenue, and cancellations across multiple countries.
- Total revenue and revenue breakdown by year, month, country, and order status
- Shipped orders account for ~85% of total revenue
- Monthly sales trends to identify seasonal patterns
- Cancellation rate by country using CASE statements and CTEs
- Date format standardization using STR_TO_DATE()

---

Skills : Window function, CTE, aggregation, joins, data cleaning, case , altering , subquery ,..
