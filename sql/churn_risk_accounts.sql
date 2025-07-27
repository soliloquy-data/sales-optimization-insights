##  Churn Risk Analysis Based on Deal Loss and Recency

-- This SQL query flags accounts likely to churn based on high deal loss rates and long gaps since their last win.

-- it identifies accounts that are both frequently losing deals and not recently closed any wins i.e churn risk.

WITH CTE AS (SELECT account, COUNT(*) WN_CT FROM sales_pipe
WHERE deal_stage='Won'
GROUP BY account),

CTE1 AS (SELECT account, COUNT(*) LS_CT FROM sales_pipe
WHERE deal_stage='Lost'
GROUP BY account),

CTE3 AS (
SELECT T1.account,ROUND((T2.LS_CT * 1.0 / (T1.WN_CT + T2.LS_CT)) * 100, 2) AS lst_deal_perc
FROM CTE AS T1
JOIN CTE1 AS T2
ON T1.account=T2.account
WHERE ROUND((T2.LS_CT * 1.0 / (T1.WN_CT + T2.LS_CT)) * 100, 2) >= 35
ORDER BY lst_deal_perc DESC),

-- SELECT * FROM CTE3;

-- SELECTING ACCOUNTS WITH LOST DEAL PERCENTAGE GREATER THAN 35% --

WON_DEALS AS (SELECT *, DENSE_RANK() OVER(partition by account,deal_stage ORDER BY close_date DESC ) AS RK
FROM sales_pipe 
WHERE account IN ( SELECT account FROM CTE3) AND 
deal_stage in ('Won')),


LOST_DEALS AS (SELECT *, DENSE_RANK() OVER(partition by account,deal_stage ORDER BY close_date DESC ) AS RK1
FROM sales_pipe 
WHERE account IN ( SELECT account FROM CTE3) AND 
deal_stage in ('Lost')),

CTE4 AS (
SELECT T1.account , DATEDIFF(T1.close_date,T2.close_date) AS num_days_since_last_won 
FROM WON_DEALS as T1
JOIN LOST_DEALS AS T2
ON T1.account=T2.account
WHERE RK=1 AND RK1=1)

SELECT T1.account,T1.lst_deal_perc,T2.num_days_since_last_won
FROM CTE3 AS T1
JOIN CTE4 AS T2
ON T1.account=T2.account
ORDER BY  lst_deal_perc DESC ;
