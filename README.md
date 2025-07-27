# 📊 Sales Optimization And Insights

This portfolio project demonstrates how data-driven insights can drive better sales strategy, agent performance, and customer retention.  
It is divided into two parts:

- ✅ **SQL Analysis** – Extracting actionable insights via analytical queries  
- 📈 **Power BI Dashboard** – Visualizing KPIs and patterns across the sales lifecycle  

---

## 🔍 Business Questions Answered

1. What drives high-value deals and who closes them?
2. Where are the bottlenecks in our sales funnel?
3. How long do deals take to close by industry?
4. Which accounts are at risk of churn?
5. How does sales performance vary by month or season?
6. Which agents, products, and industries perform best?

---

## ✅ SQL Analysis

Each section below includes:
- 🎯 SQL Objective
- 📄 Query link
- 📊 BI Visualization
- 💡 Business Insight

---

### 1. 🔍 Predicting High-Value Deals Using Revenue Percentile Analysis

**🎯 Objective:**  
Classify deals into high, mid, and low-value segments using revenue percentiles and identify which sales agents close the most high-value deals.

📄 [View SQL Query](sql/high_value_deals.sql)

🖼️ ![High Value Deals Chart](bi_dashboard/screenshots/high_value_deals.png)

**💡 Insight:**  
Highlights top-performing agents based on high-value wins — helping prioritize strategic leads and inform bonus structures.

---

### 2. 🔄 Sales Funnel Velocity & Drop-Off Analysis

**🎯 Objective:**  
Measure average time spent at each sales stage and detect where leads most commonly drop off in the funnel.

📄 [View SQL Query](sql/funnel_velocity.sql)

🖼️ ![Funnel Drop-Off Chart](bi_dashboard/screenshots/funnel_velocity.png)

**💡 Insight:**  
Bottlenecks are most common at the "Proposal → Negotiation" stage, suggesting follow-up automation or better proposal assets.

---

### 3. ⏱️ Average Deal Closing Time by Industry

**🎯 Objective:**  
Calculate the average time it takes to close a deal per industry to assess sales cycle variation.

📄 [View SQL Query](sql/avg_deal_closing_time.sql)

🖼️ ![Avg Deal Time Chart](bi_dashboard/screenshots/avg_closing_time.png)

**💡 Insight:**  
Deals in Tech and Finance sectors close ~35% faster than in Healthcare — suggesting a need for industry-specific strategies.

---

### 4. 📉 Churn Risk Analysis Based on Deal Loss Patterns

**🎯 Objective:**  
Identify accounts with a high lost-deal percentage and long gaps since their last won deal — early indicators of churn risk.

📄 [View SQL Query](sql/churn_risk_accounts.sql)

🖼️ ![Churn Risk Accounts](bi_dashboard/screenshots/churn_risk.png)

**💡 Insight:**  
Early detection of churn-prone accounts allows for proactive outreach and customer retention campaigns.

---

### 5. 📅 Sales Seasonality & Revenue Impact Analysis

**🎯 Objective:**  
Analyze monthly and yearly revenue fluctuations to detect seasonal sales trends.

📄 [View SQL Query](sql/revenue_seasonality.sql)

🖼️ ![Seasonality Chart](bi_dashboard/screenshots/revenue_seasonality.png)

**💡 Insight:**  
Consistent Q4 spikes suggest strong seasonal influence — helping improve forecasting, staffing, and campaign timing.

---


## 📊 Power BI Dashboard (3 Pages)

> Built using Power BI Desktop – includes DAX measures, calculated columns, and relationships.

### 📈 Page 1: Sales Performance Overview
- KPIs: Total Revenue, Win Count, Avg Deal Size
- Breakdown by industry, sales agent, and customer

![Sales Performance](bi_dashboard/screenshots/sales_performance.png)

---

### 📉 Page 2: Sales Funnel & Agent Performance
- Drop-off & Conversion at each funnel stage
- Agent Win Rates, Deal Count, and Revenue

![Funnel](bi_dashboard/screenshots/funnel_analysis.png)

---

### 📅 Page 3: Revenue Trends & Product Insights
- Monthly Revenue Trends with Forecast
- Top-Selling Products
- Revenue by Region & Sector

![Revenue Trends](bi_dashboard/screenshots/agent_ranking.png)

---

## 📁 Files Included

- `sql/` folder – All business queries
- `bi_dashboard/` – Power BI `.pbix` file and visual exports
- `data/` – Sample dataset to test or recreate

---

## ▶️ How to Use

1. Open Power BI Desktop
2. Connect to your local or hosted SQL DB
3. Paste queries or use `DirectQuery`
4. Customize visuals and KPIs

---

## 🌐 [Optional] Interactive Version (Power BI Service)
If you use Power BI Service, add:

[🔗 View Interactive Dashboard](https://app.powerbi.com/view?r=XXXXX)

---

## ✅ Key Skills Demonstrated

- SQL for business insights & KPIs
- Data modeling & DAX in Power BI
- Dashboard design with drilldowns, trends, comparisons
- Analytical storytelling

---

## 💡 Future Improvements
- Automate data refresh from SQL to Power BI
- Add ML scoring (propensity to churn, lead scoring)
- Add web app interface using Streamlit
