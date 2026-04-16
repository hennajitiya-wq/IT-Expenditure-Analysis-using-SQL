CREATE TABLE IT_Expenditure (
    Date VARCHAR(20),
    BusinessArea VARCHAR(100),
    Region VARCHAR(100),
    Country VARCHAR(100),
    ITSubArea VARCHAR(100),
    ITArea VARCHAR(100),
    CostElementName VARCHAR(255),
    CostElementGroup VARCHAR(100),
    CostElementSubGroup VARCHAR(100),
    Actual DECIMAL(15,2),
    Forecast DECIMAL(15,2),
    Plan DECIMAL(15,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/IT.csv'
INTO TABLE IT_Expenditure
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Date, BusinessArea, Region, Country, ITSubArea, ITArea,
 CostElementName, CostElementGroup, CostElementSubGroup,
 @Actual, @Forecast, @Plan)
SET 
 Actual   = NULLIF(@Actual, ''),
 Forecast = NULLIF(@Forecast, ''),
 Plan     = NULLIF(@Plan, '');

-- Variance Analysis (Actual vs Forecast vs Plan)
SELECT
    Date AS Month,
    BusinessArea,
    Country,
    ITArea,
    CostElementName,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY
    Date, BusinessArea, Country, ITArea, CostElementName
ORDER BY
    Date, BusinessArea, Country;

-- Variance by Month
SELECT
    Date AS Month,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY Date
ORDER BY Date;

-- Variance by Business Area
SELECT
    BusinessArea,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY BusinessArea
ORDER BY BusinessArea;

-- Variance by Country
SELECT
    Country,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY Country
ORDER BY Country;

-- Variance by IT Area
SELECT
    ITArea,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY ITArea
ORDER BY ITArea;

--  Variance by Cost Element
SELECT
    CostElementName,
    CostElementGroup,
    CostElementSubGroup,
    SUM(Actual) AS TotalActual,
    SUM(Forecast) AS TotalForecast,
    SUM(Plan) AS TotalPlan,
    (SUM(Actual) - SUM(Forecast)) AS Variance_Actual_vs_Forecast,
    (SUM(Actual) - SUM(Plan)) AS Variance_Actual_vs_Plan
FROM IT_Expenditure
GROUP BY
    CostElementName,
    CostElementGroup,
    CostElementSubGroup
ORDER BY CostElementName;

-- Identify Months With Highest Deviation
SELECT
    Date AS Month,
    ABS(SUM(Actual) - SUM(Plan)) AS DeviationFromPlan
FROM IT_Expenditure
GROUP BY Date
ORDER BY DeviationFromPlan DESC;


-- Identify Business Areas with Largest Overspend
SELECT
    BusinessArea,
    (SUM(Actual) - SUM(Plan)) AS Overspend
FROM IT_Expenditure
GROUP BY BusinessArea
HAVING SUM(Actual) > SUM(Plan)
ORDER BY Overspend DESC;
  