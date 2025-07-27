## Average Deal Closing Time by Industry

SELECT T2.sector,round(AVG(DATEDIFF(T1.close_date,T1.engage_date)),2) as avg_deal_close_time
FROM sales_pipe AS T1
JOIN accounts AS T2
ON T1.account=T2.account
WHERE T1.deal_stage='Won'
GROUP BY T2.sector;