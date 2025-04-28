-- Data Cleaning and Transformation 

INSERT company_list_2014
SELECT * FROM inc5000_company_list;

SELECT * FROM company_list_2014;

SELECT COUNT(*) AS total_company_list FROM company_list_2014;

ALTER TABLE company_list_2014
CHANGE COLUMN ï»¿_num row_id varchar(20) NULL;

DESCRIBE company_list_2014; 

SELECT DISTINCT * FROM company_list_2014; 

SELECT *, 
         ROW_NUMBER() OVER (PARTITION BY company, city ORDER BY id) AS row_num
  FROM company_list_2014;
 
SELECT *
FROM `company_list_2014`
WHERE company IS NOT NULL
  AND revenue IS NOT NULL
  AND growth IS NOT NULL;

ALTER TABLE `company_list_2014`
DROP COLUMN _widgetName,
DROP COLUMN _source,
DROP COLUMN _pageUrl;

SELECT 
  SUM(company IS NULL) AS null_companies,
  SUM(revenue IS NULL) AS null_revenue,
  SUM(growth IS NULL) AS null_growth
FROM company_list_2014;

ALTER TABLE company_list_2014 DROP COLUMN _resultNumber; 

SELECT * FROM company_list_2014 LIMIT 5;

-- Exploratory Data Analysis 

SELECT * FROM company_list_2014; 

-- Top 10 companies 
SELECT company, revenue
FROM company_list_2014
ORDER BY revenue DESC
LIMIT 10;
 
-- Average Growth by Industry
SELECT industry, ROUND(AVG(growth), 2) AS avg_growth
FROM company_list_2014
GROUP BY industry
ORDER BY avg_growth DESC;

-- Number of Companies by State
SELECT state_l, COUNT(*) AS total_companies
FROM company_list_2014
GROUP BY state_l
ORDER BY total_companies DESC;

-- Companies on List the longest
SELECT company, yrs_on_list
FROM company_list_2014
ORDER BY yrs_on_list DESC
LIMIT 10;

-- State-wise Industry Performance
SELECT state_l, industry,
       ROUND(AVG(revenue), 2) AS avg_revenue,
       ROUND(AVG(growth), 2) AS avg_growth
FROM company_list_2014
GROUP BY state_l, industry
ORDER BY state_l, avg_growth DESC;

-- Company count by State and Industry 
SELECT state_l, industry, COUNT(*) AS company_count
FROM company_list_2014
GROUP BY state_l, industry
ORDER BY state_l, company_count DESC;

-- Top 10 cities with most companies
SELECT city, COUNT(*) AS company_count
FROM company_list_2014
GROUP BY city
ORDER BY company_count DESC
LIMIT 10;

-- Average number of workers by industries
SELECT industry, ROUND(AVG(workers), 0) AS avg_workers
FROM company_list_2014
GROUP BY industry
ORDER BY avg_workers DESC;

-- Company Revenue Percentile Ranking by Industry
SELECT 
  industry,
  company,
  revenue,
  PERCENT_RANK() OVER (PARTITION BY industry ORDER BY revenue DESC) AS revenue_percentile
FROM company_list_2014;

-- Revenue Contribution of Each Company within Its Industry 
SELECT 
  industry,
  company,
  revenue,
  ROUND(revenue / SUM(revenue) OVER (PARTITION BY industry) * 100, 2) AS revenue_share_pct
FROM company_list_2014
ORDER BY revenue_share_pct DESC;

--  Growth Trend by Years on List
SELECT 
  CASE 
    WHEN yrs_on_list BETWEEN 0 AND 2 THEN '0–2 Years'
    WHEN yrs_on_list BETWEEN 3 AND 5 THEN '3–5 Years'
    WHEN yrs_on_list BETWEEN 6 AND 10 THEN '6–10 Years'
    ELSE '10+ Years'
  END AS yrs_group,
  ROUND(AVG(growth), 2) AS avg_growth
FROM company_list_2014
GROUP BY yrs_group
ORDER BY avg_growth DESC;

-- Top Growing Industries with Low Worker Count 
SELECT industry,
       ROUND(AVG(growth), 2) AS avg_growth,
       ROUND(AVG(workers), 0) AS avg_workers
FROM company_list_2014
GROUP BY industry
HAVING avg_growth > 10 AND avg_workers < 1000
ORDER BY avg_growth DESC; 

-- Top 3 Industries per State by Revenue
SELECT *
FROM (
    SELECT 
        state_l,
        industry,
        SUM(revenue) AS total_revenue,
        RANK() OVER (PARTITION BY state_l ORDER BY SUM(revenue) DESC) AS rank_in_state
    FROM company_list_2014
    GROUP BY state_l, industry
) AS ranked_industries
WHERE rank_in_state <= 3;

-- Growth-to-Revenue Ratio by Industry 
SELECT industry,
       ROUND(SUM(growth) / NULLIF(SUM(revenue), 0), 4) AS growth_revenue_ratio
FROM company_list_2014
GROUP BY industry
ORDER BY growth_revenue_ratio DESC;


