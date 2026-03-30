📊 World Layoffs Data Analysis (MySQL Project)
📌 Project Overview

This project focuses on cleaning and analyzing a global layoffs dataset using MySQL. The dataset was imported from a CSV file and transformed through multiple data cleaning steps before performing exploratory data analysis (EDA).

The goal is to extract meaningful insights about layoffs across companies, industries, countries, and time.

📁 Dataset
File: layoffs.csv
Features:
Company
Location
Industry
Total Laid Off
Percentage Laid Off
Date
Stage
Funds Raised
Country
Date Added
🛠️ Tools & Technologies
MySQL
SQL (CTEs, Window Functions, Data Cleaning, Aggregations)
🧹 Data Cleaning Process
1. Staging Tables

Created staging tables to avoid modifying raw data:

layoffs_staging
layoffs_staging2
2. Removing Duplicates
Used ROW_NUMBER() with PARTITION BY to identify duplicate rows
Deleted rows where row_num > 1
3. Standardizing Data
Trimmed spaces in company names
Cleaned location column (removed ", Non-U.S.")
Standardized country names (e.g., UAE → United Arab Emirates)
4. Handling Dates
Converted date and date_added from text to DATE format using STR_TO_DATE
Updated column data types
5. Handling Missing Values
Checked null and blank values in columns
Removed rows where both total_laid_off and percentage_laid_off were NULL
6. Final Cleanup
Dropped helper column row_num after deduplication
📊 Exploratory Data Analysis (EDA)
Key Queries

Maximum layoffs

SELECT MAX(total_laid_off) 
FROM layoffs_staging2;

Top companies by layoffs

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

Layoffs by industry

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

Layoffs by country

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

Yearly trends

SELECT DATE_FORMAT(date,'%Y'), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY DATE_FORMAT(date,'%Y');

Monthly trends

SELECT DATE_FORMAT(date,'%Y/%M'), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY DATE_FORMAT(date,'%Y/%M');

Rolling total of layoffs

SUM(sum_laid_off) OVER (ORDER BY month)

Top 3 companies per year

Used DENSE_RANK() to rank companies based on layoffs per year
🚀 How to Run
Create database:
CREATE DATABASE world_layoffs;
USE world_layoffs;
Import CSV file (layoffs.csv) into MySQL
Run SQL script:
Execute data cleaning queries first
Then run EDA queries
💡 Key SQL Concepts
CTEs (WITH)
Window Functions (ROW_NUMBER, DENSE_RANK, SUM OVER)
Data Cleaning Techniques
Date Functions (STR_TO_DATE, DATE_FORMAT)
Aggregations (SUM, MAX)
📈 Project Outcome
Cleaned dataset ready for analysis
Identified trends across time, industries, countries, and companies
Prepared data for visualization tools like Power BI
🔗 Future Improvements
Build Power BI dashboard
Add predictive analysis
Automate ETL process

If you want next step, I can help you write a GitHub project description + tags + repo name to make it look even stronger for recruiters 🔥

give texttttt 

Here is the plain README.md text — just copy and paste:

📊 World Layoffs Data Analysis (MySQL Project)
📌 Project Overview

This project focuses on cleaning and analyzing a global layoffs dataset using MySQL. The dataset was imported from a CSV file and transformed through multiple data cleaning steps before performing exploratory data analysis (EDA).

The goal is to extract meaningful insights about layoffs across companies, industries, countries, and time.

📁 Dataset
File: layoffs.csv
Features:
Company
Location
Industry
Total Laid Off
Percentage Laid Off
Date
Stage
Funds Raised
Country
Date Added
🛠️ Tools & Technologies
MySQL
SQL (CTEs, Window Functions, Data Cleaning, Aggregations)
🧹 Data Cleaning Process
1. Staging Tables

Created staging tables to avoid modifying raw data:

layoffs_staging
layoffs_staging2
2. Removing Duplicates
Used ROW_NUMBER() with PARTITION BY to identify duplicate rows
Deleted rows where row_num > 1
3. Standardizing Data
Trimmed spaces in company names
Cleaned location column (removed ", Non-U.S.")
Standardized country names (e.g., UAE → United Arab Emirates)
4. Handling Dates
Converted date and date_added from text to DATE format using STR_TO_DATE
Updated column data types
5. Handling Missing Values
Checked null and blank values in columns
Removed rows where both total_laid_off and percentage_laid_off were NULL
6. Final Cleanup
Dropped helper column row_num after deduplication
📊 Exploratory Data Analysis (EDA)
Key Queries

Maximum layoffs
SELECT MAX(total_laid_off)
FROM layoffs_staging2;

Top companies by layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

Layoffs by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

Layoffs by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

Yearly trends
SELECT DATE_FORMAT(date,'%Y'), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY DATE_FORMAT(date,'%Y');

Monthly trends
SELECT DATE_FORMAT(date,'%Y/%M'), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY DATE_FORMAT(date,'%Y/%M');

Rolling total of layoffs
SUM(sum_laid_off) OVER (ORDER BY month)

Top 3 companies per year
Used DENSE_RANK() to rank companies based on layoffs per year

🚀 How to Run
Create database
CREATE DATABASE world_layoffs;
USE world_layoffs;
Import CSV file (layoffs.csv)
Run SQL script
Execute data cleaning queries first
Then run EDA queries
💡 Key SQL Concepts
CTEs (WITH)
Window Functions (ROW_NUMBER, DENSE_RANK, SUM OVER)
Data Cleaning Techniques
Date Functions (STR_TO_DATE, DATE_FORMAT)
Aggregations (SUM, MAX)
📈 Project Outcome
Cleaned dataset ready for analysis
Identified trends across time, industries, countries, and companies
Prepared data for visualization tools like Power BI
