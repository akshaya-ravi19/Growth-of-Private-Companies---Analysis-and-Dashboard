# Growth-of-Private-Companies---Analysis-and-Dashboard

## Project Overview 

Analyzed and visualized company performance data using SQL and Power BI, delivering insights on revenue growth, industry trends, and geographic distributions.
The Inc. 5000 is Inc. Magazine’s annual list of the 5000 fastest growing private companies in the United States. The list is compiled by measuring each company's percentage revenue growth over a four-year period. This project involves end-to-end data cleaning, transformation, analysis, and visualization of this dataset using MySQL and Power BI, aiming to prepare the data for meaningful insights and present them through interactive dashboards.

1. Data Cleaning (MySQL)

- Removed duplicates based on company and id.
- Dropped irrelevant columns (_source, _widgetName, _pageUrl, url).
- Handled NULL values by: Deleting critical nulls (like missing revenue) and Replacing minor nulls (like growth) with default values.

Standardized data:

Uppercased city names.
Trimmed spaces in industry fields.

2. Data Analysis (MySQL)
Basic descriptive statistics (average growth, total revenue).

Advanced queries:

Revenue percentile rankings across industries.

Top industries by revenue in each state.

Hidden high-growth industries with fewer workers.

Years on list vs company growth analysis.

Created views to simplify recurring analysis.

3. Visualization (Power BI)
Imported cleaned MySQL data into Power BI.

Designed dashboards including:

Top industries by revenue and growth.

State-wise and city-wise company distribution.

KPI metrics for total revenue, average workers, and growth trends.

Interactive filters and drill-downs.

## Key Insights
Top Revenue Concentration: A small group of companies contributed over 40% of the total revenue.

Industry Leaders: Technology, Healthcare, and Finance had the highest growth rates.

Geographic Insights: California, New York, and Texas dominated in terms of company count and revenue.

Hidden Gems: Some industries with lower employee counts showed exceptional growth potential.

Company Lifecycle: Newer companies (0–2 years on the list) demonstrated stronger growth trends compared to older players.
