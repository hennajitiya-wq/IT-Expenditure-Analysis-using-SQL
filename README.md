Data Loading & Cleansing 

(a) Table Creation:
A structured table IT_Expenditure is created to store IT finance data with fields like:
Date (Month)
Business Area
Region, Country
IT Sub Area, IT Area
Cost Elements (Name, Group, Subgroup)
Financial metrics: Actual, Forecast, Plan

(b) CSV Import:
You load raw data from a CSV file using LOAD DATA INFILE.

(c) Data Cleaning:
To avoid import errors caused by blank numeric fields (''), you sanitize them:

SET Actual = NULLIF(@Actual, ''), Forecast = NULLIF(@Forecast, ''), Plan = NULLIF(@Plan, '');
This ensures empty values become NULL instead of failing, fixing the error:
Incorrect decimal value: '' for column 'Actual'

Variance Analysis — Key Insights Extracted
You compute variance between:

Actual vs Forecast → measures operational deviations
Actual vs Plan → measures budget deviation (Variance = Actual – Forecast/Plan)
The script analyzes variance across multiple business dimensions.

* Analysis Breakdown:
(A). Variance by Month + Business Area + Country + IT Area + Cost Element

This query gives a detailed multi-dimensional report:
Actual spend
Forecast spend
Planned budget
Actual vs Forecast variance
Actual vs Plan variance

Used to identify:
Overspending categories
Cost elements that drive deviations
Country-wise or business-area breakdowns

(B). Monthly Variance Overview:
Aggregates IT spending month-wise.

Purpose:
Identify months with over/underspend trends
Analyze seasonal or operational spending spikes

(C). Variance by Business Area:
Shows financial performance at the business area level.

Helps identify:
Which departments over/under-spent the most
Budget accuracy and forecast reliability by function

(D). Variance by Country:
Rolls up financial performance by geographical region.

Useful for:
Regional budgeting
Global IT finance comparisons
Country-based cost drivers

(E). Variance by IT Area

Provides insights into:
Which IT domains (Infra, Security, Digital, Planning, etc.) are causing budget deviations
Areas where optimization is required

(F). Variance by Cost Element
Breaks down at the deepest cost hierarchy:
Cost Element Name
Cost Group
Cost Subgroup

Great for:
Identifying cost categories blowing up the budget
Vendor/service-specific overspend
Detailed allocation analysis

(G). Identify Months With Highest Deviation
Sorts months by how much they deviated from the Plan.

Highlights:
Highest overspend/underspend months
Financial risk periods

(H). Identify Business Areas With Largest Overspend

Filters only departments where:
SUM(Actual) > SUM(Plan)

This reveals:
Top overspending business units
Where financial governance or planning needs improvement

* What This Entire Analysis Provides:
  
✔ Complete multi-dimensional cost variance analysis
By Month, Country, Business Area, IT Area, Cost Element.

✔ Supports budgeting, forecasting accuracy review
Shows where the forecast and plan differ from reality.

✔ Identifies cost leakages and overspend areas ✔ Enables root cause analysis
At the cost element level, helping find specific expense contributors.
