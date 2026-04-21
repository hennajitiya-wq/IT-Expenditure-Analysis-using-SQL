**Project Overview:**
This project focuses on analyzing IT expenditure data to evaluate budget performance, forecast accuracy, and cost optimization opportunities. Using SQL-based analysis, the project delivers multi-dimensional insights across business areas, regions, IT functions, and cost elements to support data-driven financial decision-making.

**Problem Statement:** 
Organizations often struggle to track actual vs forecast vs planned IT spending, leading to budget overruns and inefficient resource allocation.

**This project aims to:**
1. Identify overspending and underspending trends.
2. Evaluate forecasting accuracy.
3. Pinpoint cost drivers and leakages.

**Data Loading & Cleansing:**

**1. Table Creation:** A structured table IT_Expenditure was designed to store IT financial data, including:
(a) Time Dimension: Month (Date)
(b) Business Dimensions: Business Area, Region, Country
(c) IT Hierarchy: IT Area, IT Sub Area
(d) Cost Hierarchy: Cost Element Name, Group, Subgroup
(e) Financial Metrics: Actual, Forecast, Plan

**2. Data Import:** Imported raw CSV data using LOAD DATA INFILE for efficient bulk loading.

**3. Data Cleaning (Production-Ready Approach):** Handled data quality issues to ensure reliable analysis:

Converted blank numeric values to NULL using:
SET Actual = NULLIF(@Actual, ''),
    Forecast = NULLIF(@Forecast, ''),
    Plan = NULLIF(@Plan, '');
    
Prevented import errors like:
Incorrect decimal value: '' for column 'Actual'

**Ensured data consistency and integrity for downstream analysis:**
1. Variance Analysis
2. Key Metrics:
(A) Actual vs Forecast Variance → Measures operational deviation.
(B) Actual vs Plan Variance → Measures budget performance.
Variance = Actual – Forecast / Plan

**Analysis Breakdown:**

**(A) Multi-Dimensional Variance Analysis:**

Analyzed across:
(a) Month
(b) Business Area
(c) Country
(d) IT Area
(e) Cost Elements

Identifies:
(a) Overspending categories
(b) Cost drivers
(c) Region-wise and department-wise deviations

**(B) Monthly Variance Trends:**
Tracks spending patterns over time.
Identifies seasonal spikes and anomalies.

**(C) Business Area Analysis:**
Evaluates department-level financial performance.
Highlights top over/under-spending units.
Assesses budgeting efficiency.

**(D) Country-Level Analysis:**
Compares IT spending across regions.
Identifies geographical cost variations.
Supports global financial planning.

**(E) IT Area Analysis:**
Breaks down spending by IT domains (Infrastructure, Security, Digital, etc.)
Identifies high-cost and underperforming areas.

**(F) Cost Element Analysis (Deep Dive):**
Analyzes spending at:
(a) Cost Element Name
(b) Cost Group
(c) Cost Subgroup

Enables:
Root cause analysis.
Vendor/service-level cost tracking.
Identification of budget leakages.

**(G) High Deviation Months:**
Identifies months with maximum variance from plan.
Highlights financial risk periods.

**(H) Overspending Business Areas:**
Filters business areas where:
SUM(Actual) > SUM(Plan)

Reveals:
Departments exceeding budget.
Areas needing financial control & optimization.

**Key Insights Delivered:**
1. Multi-dimensional cost visibility across business and IT layers.
2. Identification of overspending, inefficiencies, and cost drivers.
3. Evaluation of forecast accuracy vs actual performance.
4. Detection of budget leakages at granular levels.
5. Support for data-driven financial planning and optimization.

**Business Impact:**
1. Enabled identification of high-cost areas and optimization opportunities.
2. Improved budget tracking and forecasting accuracy.
3. Provided actionable insights for cost control and strategic planning.

**Tools & Technologies:**
1. SQL (Data Cleaning & Analysis)
2. Excel / CSV (Data Source)
3. Power BI (Dashboard Visualization) (if applicable)
4. GitHub (Version Control & Project Management)

**Conclusion:**
This project demonstrates a production-ready data analytics workflow, from raw data ingestion and cleaning to advanced variance analysis and business insight generation. It reflects real-world financial analysis scenarios and showcases strong data analysis, SQL, and problem-solving skills.
