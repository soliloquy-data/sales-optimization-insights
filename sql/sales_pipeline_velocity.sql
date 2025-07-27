### Sales Pipeline Velocity Analysis

-- CONSIDEING DEALS WHICH HAVE START AND END TIME, PROPSPECTING AND ENGAGING DOES NOT HAVE STRICT END DATE & ALSO NOT CONSIDERING ACCOUNTG WITH NO NAME 

WITH CTE AS (
SELECT account,deal_stage, round(AVG(datediff(close_date,engage_date)),2) AS avg_deal_time
FROM sales_pipe
WHERE account !='' AND deal_stage in ('Won', 'Lost')
group by account,deal_stage
ORDER BY account, deal_stage asc),

CTE1 as (SELECT deal_stage AS deal_info,round(AVG(avg_deal_time),2) AS avg_time FROM CTE 
GROUP BY deal_stage),


CTE2 AS (
SELECT *
FROM CTE AS T1
LEFT JOIN CTE1 AS T2
ON T1.deal_stage=T2.deal_info),

CTE3 AS (
SELECT * ,
CASE 
WHEN deal_stage = 'Won' AND avg_deal_time>avg_time THEN 'RED_WFLAG'
WHEN deal_stage = 'Lost' AND avg_deal_time>avg_time THEN 'RED_LFLAG' 
WHEN deal_stage = 'Won' AND avg_deal_time<avg_time THEN 'GREEN_WFLAG'
ELSE 'GREEN_LFLAG'
END AS STATUS
FROM CTE2)

SELECT account,deal_stage, avg_deal_time,avg_time,STATUS
FROM CTE3
WHERE STATUS='RED_LFLAG' OR STATUS= 'RED_WFLAG'
ORDER BY STATUS asc, avg_deal_time desc;

-- Showing only accounts where lost deals (/RED_LFLAG) took longer than average, which might mean slow and inefficient losses.

-- Showing only accounts where WON deals (/RED_WFLAG) took longer than average, which might mean DEAL COULD HAVE BEEN COMPLETED WITH BETTER TIME

-- ARRANGED IN DESCENDING TO SEE WHICH ACCOUNTS ARE TAKING TOO LONG