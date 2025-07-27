## Sales Seasonality & Revenue Impact Analysis

-- This query identifies seasonal trends in sales performance by analyzing revenue fluctuations across months.


WITH CTE AS (
SELECT MONTH(close_date) AS MT,
SUM(close_value)  AS REV,
COUNT(*) AS deals_closed
FROM sales_pipe
WHERE deal_stage = 'Won'
GROUP BY account, MT
ORDER BY account, MT)

SELECT
    MT,
    SUM(REV) AS total_rev,
    COUNT(deals_closed) AS total_deals
FROM CTE
GROUP BY MT
ORDER BY MT;


