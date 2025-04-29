# Growth-of-Private-Companies---Analysis-and-Dashboard

## Project Overview 

Analyzed and visualized company performance data using SQL and Power BI, delivering insights on revenue growth, industry trends, and geographic distributions.
The Inc. 5000 is Inc. Magazine’s annual list of the 5000 fastest growing private companies in the United States. The list is compiled by measuring each company's percentage revenue growth over a four-year period. This project involves end-to-end data cleaning, transformation, analysis, and visualization of this dataset using MySQL and Power BI, aiming to prepare the data for meaningful insights and present them through interactive dashboards.

A. Data Cleaning (MySQL)

- Removed duplicates based on company and id.
- Dropped irrelevant columns (_source, _widgetName, _pageUrl, url).
- Checked for NULL Values.
- Standardized data: Uppercased city names and trimmed spaces in industry fields.

B. Data Analysis (MySQL)

- Basic descriptive statistics (average growth, total revenue).
- Advanced queries:
1. Revenue percentile rankings across industries.
2. Top industries by revenue in each state.
3. Hidden high-growth industries with fewer workers.
4. Years on list vs company growth analysis.
5. Created views to simplify recurring analysis.

C. Visualization (Power BI)
- Imported cleaned MySQL data into Power BI.
- Designed dashboards including:
1. Top industries by revenue and growth.
2. State-wise and city-wise company distribution.
3. KPI metrics for total revenue, average workers, and growth trends.
4. Interactive filters and drill-downs.

## Key Insights
- Top Revenue Concentration: The top 10 companies generating the maximum revenue contribute to about 2 billion dollars. 
- Industry Leaders: Consumer Products and Services, Energy, and Food & Beverage had the highest growth rates.
- Geographic Insights: Texas, California and Virginia dominated in terms of company count and revenue.
- Hidden Gems: Some industries with lower employee counts showed exceptional growth potential.
- Company Lifecycle: Newer companies (0–2 years on the list) demonstrated stronger growth trends compared to older players.
