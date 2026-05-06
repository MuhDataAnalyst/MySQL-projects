
# MySQL Projects

A collection of SQL projects focused on data cleaning and exploratory data analysis (EDA) using MySQL.

---

## 1. Data Cleaning — Tech Layoffs Dataset
Cleaned a real-world dataset of tech company layoffs before performing analysis.

**What I did:**
- Removed duplicate records using ROW_NUMBER() with window functions
- Handled NULL and blank values in industry and country columns
- Standardized inconsistent text entries (e.g. "Crypto Currency" → "Crypto", "United States." → "United States")
- Converted date column from text format to proper DATE type using STR_TO_DATE()
- Used self-joins to fill in missing industry values from matching company records

---

## 2. Layoff EDA — Tech Layoffs Dataset
Exploratory analysis on the cleaned layoffs dataset to find patterns in who got laid off and when.

**What I explored:**
- Companies and countries with the highest total layoffs
- Year-by-year layoff trends from 2020 to 2023
- Companies that laid off 100% of their workforce
- Monthly rolling total of layoffs over time using a CTE + window function
- Top 5 companies by layoffs per year using DENSE_RANK()

---

## 3. Auto Sales EDA — Global Auto Sales Dataset
Exploratory analysis on an auto sales dataset covering orders, revenue, and cancellations across multiple countries.

**What I explored:**
- Total revenue and revenue breakdown by year, month, country, and order status
- Shipped orders account for ~85% of total revenue
- Monthly sales trends to identify seasonal patterns
- Cancellation rate by country using CASE statements and CTEs
- Date format standardization using STR_TO_DATE()

---

**Tools used:** MySQL Workbench
**Skills demonstrated:** Window functions, CTEs, aggregations, joins, data type conversion, data cleaning
