## Sales Seasonality & Revenue Impact Analysis


-- This query identifies seasonal trends in sales performance by analyzing revenue fluctuations across months and across different sectors


SELECT 
  T2.sector,
  MONTH(T1.close_date) AS month,
  SUM(T1.close_value) AS total_revenue,
  COUNT(*) AS deals_closed
FROM sales_pipe T1
JOIN accounts T2 ON T1.account = T2.account
WHERE T1.deal_stage = 'Won'
GROUP BY T2.sector, MONTH(T1.close_date)
ORDER BY T2.sector, month;




