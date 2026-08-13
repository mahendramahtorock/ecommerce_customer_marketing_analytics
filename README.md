# E-commerce Customer & Marketing Analytics | SQL Business Analysis

## Project Overview
An end-to-end SQL business analytics case study for an e-commerce company. The project evaluates customer behavior, sales performance, digital marketing efficiency and website funnel performance.

The project is designed to demonstrate **Business Analyst skills** including:
- Business problem framing
- SQL analytics
- KPI definition
- Customer segmentation
- Marketing funnel analysis
- Requirements documentation
- Business recommendations
- Power BI-ready data modeling

> **Dataset note:** All data in this repository is synthetic and generated for portfolio demonstration. It must not be represented as real client/company data.

## Business Problem
The company operates across multiple digital acquisition channels but lacks a consolidated analytical view of sales, customers, marketing performance and website conversion.

The objective is to answer:
1. Which channels are most efficient?
2. Which products/categories drive revenue and profit?
3. Which customers are high-value or at risk?
4. Where is the website funnel leaking?
5. What actions should management prioritize?

## Dataset
| Table | Approx. Rows | Purpose |
|---|---:|---|
| customers | 10,000 | Customer master |
| products | 100 | Product master |
| orders | 50,000 | Order transactions |
| order_items | 50,000 | Product-level order data |
| marketing_campaigns | 60 | Campaign summary |
| campaign_performance | 1,800 | Campaign daily performance |
| website_sessions | 60,000 | Website funnel |

## Tech Stack
**MySQL 8.0+ | SQL | Power BI | Excel/CSV | Business Analysis**

## SQL Concepts Demonstrated
- SELECT / WHERE
- JOINs
- GROUP BY / HAVING
- CASE statements
- CTEs
- Subqueries
- Window functions
- ROW_NUMBER
- RANK / NTILE
- LAG
- Date functions
- KPI calculations
- RFM segmentation


## Key Business Outputs
The SQL layer produces:
- Monthly revenue and MoM growth
- Top customers
- Repeat customer rate
- Inactive customer identification
- Product/category revenue and margin
- Marketing CTR and conversion rate
- Cost per conversion
- Estimated ROAS
- RFM segmentation
- Channel repeat behavior
- Website funnel analysis
- Device conversion analysis
- Cancellation/return rates

## Business Recommendation Framework
The project follows:

**Data → KPI → Finding → Business Insight → Recommendation**

Example:
> If a channel has strong estimated ROAS but weak repeat behavior, management should validate customer quality before increasing budget.

## Documentation
- [Business Requirements Document](docs/BRD.md)
- [Functional Requirements Document](docs/FRD.md)
- [Business Insights](insights/business_insights.md)
- [Power BI Build Guide](powerbi/POWER_BI_BUILD_GUIDE.md)

## Portfolio Disclaimer
This is a **synthetic portfolio case study** created to demonstrate SQL, business analysis and analytics documentation skills. No confidential or proprietary company data is included.
