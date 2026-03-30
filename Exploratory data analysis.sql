-- Exploratory data analysis
use world_layoffs;
select * from layoffs_staging2;

select max(total_laid_off) from layoffs_staging2;

select company, sum(total_laid_off) from layoffs_staging2
group by company
order by 2 desc;

select  min(date), max(date) from layoffs_staging2;

select industry, sum(total_laid_off) from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off) from layoffs_staging2
group by country
order by 2 desc;


select DATE_FORMAT(date,'%Y'), sum(total_laid_off) from layoffs_staging2
group by DATE_FORMAT(date,'%Y')
order by 1 ;

select DATE_FORMAT(date,'%Y/%M') as month, sum(total_laid_off) from layoffs_staging2
group by DATE_FORMAT(date,'%Y/%M')
order by 1 asc;



select stage, sum(total_laid_off) from layoffs_staging2
group by stage
order by 2 desc;



WITH rolling_total as (
select DATE_FORMAT(date,'%Y/%m') as month, sum(total_laid_off) as sum_laid_off from layoffs_staging2
group by  DATE_FORMAT(date,'%Y/%m')
order by 1 asc)



select  month, sum_laid_off, sum(sum_laid_off) over (order by month)  as rolling_total
 from rolling_total;

select company, year(date), sum(total_laid_off) from layoffs_staging2
group by company, year(date)
order by 3 desc;

WITH company_and_year (company, year, total_laid_off) as (
select company, year(date), sum(total_laid_off) from layoffs_staging2
group by company, year(date)
order by 3 desc
),  rank_table as (select *, dense_rank() over (partition by year order by total_laid_off desc) as rank_of from company_and_year
order by rank_of)

select * from rank_table
where rank_of <=3
order by year;




