###  1. Predicting High-Value Deals Using Revenue Percentile Analysis

WITH CTE1 AS (
SELECT  sales_agent,close_value,
NTILE(3) OVER(ORDER BY close_value desc) as segment
FROM sales_pipe
WHERE deal_stage='Won'),

CTE2 AS 
(SELECT sales_agent,close_value,
CASE
WHEN segment=1 THEN 'High'
WHEN segment=2 THEN 'Mid'
ELSE 'Low'
END AS SEGMENT
FROM CTE1)

SELECT sales_agent, COUNT(segment) AS high_val_deals
FROM CTE2
WHERE segment = 'High'
GROUP BY sales_agent
ORDER BY high_val_deals DESC;




