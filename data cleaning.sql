-- data cleaning

use world_layoffs;

select * from layoffs;

-- Remove duplicates
-- Standardize data 
-- Null, blanks values
-- Remove any columns 

Create Table layoffs_staging 
like layoffs;

select * from layoffs_staging;


insert layoffs_staging
select * from layoffs;

-- Remove duplicates

with duplicate_cte as (
select *, row_number() over (partition by company, location ,total_laid_off, 'date', percentage_laid_off, industry, stage, funds_raised, country, date_added) as row_num
 from layoffs_staging)

select * from duplicate_cte
where row_num>1;

select * from layoffs_staging
where company='Zymergen';


with duplicate_cte as (
select *, row_number() over (partition by company, location ,total_laid_off, 'date', percentage_laid_off, industry, stage, funds_raised, country, date_added) as row_num
 from layoffs_staging)

select * from duplicate_cte
where row_num>1;

select * from layoffs_staging
where company='Zymergen';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` double DEFAULT NULL,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





insert into layoffs_staging2
select *, row_number() over (partition by company, location ,total_laid_off, 'date', percentage_laid_off, industry, stage, funds_raised, country ) as row_num
 from layoffs_staging;

select * from layoffs_staging2
where row_num>1
order by company;

SET SQL_SAFE_UPDATES = 0;

delete from layoffs_staging2
where row_num>1;


select * from layoffs_staging2
where row_num>1
order by company;



-- Standardize data 

use world_layoffs;

select * from layoffs_staging2;


update layoffs_staging2
set company= trim(company);


select distinct industry from layoffs_staging2
order by 1;

select distinct location from layoffs_staging2
order by 1;



update layoffs_staging2
set location= trim(replace(location,', Non-U.S.',''))
where location like '%, Non-U.S.';



select distinct country from layoffs_staging2
order by 1;


update layoffs_staging2
set country= 'United Arab Emirates'
where country like 'UAE';


update layoffs_staging2
 set date = str_to_date(date,'%m/%d/%Y'), date_added= str_to_date(date_added ,'%m/%d/%Y');
 
 
 Alter table layoffs_staging2
 MODIFY column date date;
 
  Alter table layoffs_staging2
 MODIFY column date_added date;
 
 use  world_layoffs;
 select * from layoffs_staging2
where percentage_laid_off = '';


 select * from layoffs_staging2
 where  industry is null or industry='';
 
 use world_layoffs;
 
 
SELECT * FROM  layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;




select * from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null ;

delete 
from layoffs_staging2
where total_laid_off is null 
and percentage_laid_off is null;

select * from layoffs_staging2;

Alter table layoffs_staging2
Drop column row_num;




select * from layoffs_staging2;


