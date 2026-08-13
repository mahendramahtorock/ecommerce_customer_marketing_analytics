# E-commerce Customer & Marketing Analytics | SQL Business Analysis

## Project Overview

This project is an **end-to-end Business Analyst case study** built around a synthetic e-commerce business.

The goal was not simply to write SQL queries or build a dashboard. The project starts with a business problem, translates it into analytical questions, uses SQL to investigate the data, identifies business insights, and converts those insights into recommendations that can support better decisions.

### The thinking behind the project

**Problem → Approach → Insight → Impact**

- **Problem:** Marketing, customer, sales, and website data were available across different business areas, but there was no consolidated analytical view to support decision-making.
- **Approach:** Designed a relational data model and used MySQL to analyze sales, customers, marketing campaigns, and website funnel behavior.
- **Insight:** Identified channel efficiency, customer retention patterns, high-value/at-risk customers, product/category performance, and website funnel leakage.
- **Impact:** Converted the analytical findings into actionable recommendations for marketing, customer retention, and e-commerce teams.

> **Dataset note:** All data in this repository is synthetic and generated for portfolio demonstration. It must not be represented as real client/company data.

---

## Business Problem

An e-commerce company operates across multiple digital acquisition channels but lacks a consolidated view of:

- Sales performance
- Customer behavior
- Marketing efficiency
- Website conversion
- Product/category performance

The business wants to understand:

1. **Which marketing channels are most efficient?**
2. **Which products and categories generate the most revenue and profit?**
3. **Which customers are high-value, loyal, or at risk?**
4. **Where is the website conversion funnel losing potential customers?**
5. **What actions should management prioritize?**

The project therefore focuses on turning raw transactional data into **business decisions**, rather than only reporting numbers.

---

# Project Approach

## 1. Understand the Business Problem

Before writing SQL, the business questions were defined around four areas:

**Sales → Customers → Marketing → Website Funnel**

This helped determine what data was required and what KPIs would actually be useful to stakeholders.

## 2. Build the Analytical Data Model

The project uses the following entities:

```text
Customers
    │
    └── Orders
           │
           └── Order Items
                  │
                  └── Products

Marketing Campaigns
    │
    └── Campaign Performance

Customers
    │
    └── Website Sessions
```

## 3. Analyze Using SQL

SQL was used to answer business questions rather than create isolated technical queries.

Examples include:

- Monthly revenue and MoM growth
- Top customers by revenue
- Repeat customer rate
- Inactive customers
- Product/category performance
- Marketing channel efficiency
- RFM customer segmentation
- Website funnel performance
- Device-level conversion
- Cancellation and return rates

## 4. Convert Findings Into Recommendations

The final step is:

**Data → KPI → Finding → Business Insight → Recommendation**

For example:

> If a marketing channel has strong estimated ROAS but weak repeat behavior, management should validate customer quality before increasing budget.

This prevents the analysis from stopping at "Channel X performed best" and moves it toward **"What should the business do next?"**

---

# Dataset

| Table | Approx. Rows | Purpose |
|---|---:|---|
| `customers` | 10,000 | Customer master |
| `products` | 100 | Product master |
| `orders` | 50,000 | Order transactions |
| `order_items` | 50,000 | Product-level order data |
| `marketing_campaigns` | 60 | Campaign summary |
| `campaign_performance` | 1,800 | Campaign daily performance |
| `website_sessions` | 60,000 | Website funnel/session data |

### Dataset period

**January 2025 – June 2026**

### Currency

**INR (₹)**

---

# Key Business Questions & Analysis

## Sales Performance

- What is the monthly revenue trend?
- How is revenue changing month over month?
- Which products generate the most revenue?
- Which categories generate the most revenue and gross profit?
- What is the Average Order Value?
- What are the cancellation and return rates?

## Customer Analytics

- Who are the highest-value customers?
- What percentage of customers are repeat purchasers?
- Which customers have become inactive?
- Which acquisition channels generate customers with stronger repeat behavior?
- Which customers should be prioritized for retention?

## Marketing Analytics

- Which channels generate the most traffic?
- Which channels have the highest CTR?
- Which channels have the strongest conversion rate?
- What is the cost per conversion?
- Which channels have the strongest estimated ROAS?
- Should marketing budget allocation be reconsidered?

## Website Funnel

```text
Sessions
   ↓
Add to Cart
   ↓
Checkout
   ↓
Purchase
```

The analysis identifies where potential customers are dropping out and compares funnel performance across channels and devices.

---

# SQL Skills Demonstrated

The project demonstrates practical SQL concepts used in business analysis:

- `SELECT` / `WHERE`
- `JOIN`
- `GROUP BY`
- `HAVING`
- `CASE`
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions
- `ROW_NUMBER()`
- `RANK()`
- `NTILE()`
- `LAG()`
- Date Functions
- KPI calculations
- RFM segmentation

The purpose of using advanced SQL was to solve multi-step business questions, not simply demonstrate syntax.

---

# Key Business Outputs

The SQL analysis produces:

- Monthly revenue and MoM growth
- Top customers
- Repeat customer rate
- Inactive customer identification
- Product/category revenue and margin
- Marketing CTR and conversion rate
- Cost per conversion
- Estimated ROAS
- RFM customer segmentation
- Channel repeat behavior
- Website funnel analysis
- Device conversion analysis
- Cancellation/return rates

---

# RFM Customer Segmentation

Customer behavior is analyzed using:

### R — Recency
How recently did the customer purchase?

### F — Frequency
How often does the customer purchase?

### M — Monetary
How much has the customer spent?

Customers are then classified into business-oriented segments such as:

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Needs Attention

This allows the business to move from:

**"Who bought from us?"**

to:

**"Which customers should we prioritize and why?"**

---

# Business Insights

The analysis is designed to answer not only **what happened**, but also **why it matters**.

### Example insight

If one channel produces strong estimated ROAS but its customers have weak repeat behavior, increasing the channel's budget immediately may not be the best decision.

A better approach would be to:

1. Validate customer quality.
2. Compare repeat purchase behavior.
3. Evaluate customer value beyond the first order.
4. Then decide whether additional budget should be allocated.

This is the difference between **reporting a metric** and **using analytics for a business decision**.

---

# Business Recommendation Framework

The project follows:

```text
DATA
  ↓
KPI
  ↓
FINDING
  ↓
BUSINESS INSIGHT
  ↓
RECOMMENDATION
```

### Example

**Finding:** A channel has high estimated ROAS.

**Question:** Are these customers also valuable after the first purchase?

**Business insight:** High first-order efficiency does not automatically mean high long-term customer value.

**Recommendation:** Validate repeat purchase behavior and customer quality before increasing marketing spend.

---

# Power BI Dashboard

The SQL outputs are designed to feed a Power BI decision-support dashboard.

### Dashboard KPIs

- Delivered Revenue
- Delivered Orders
- Average Order Value
- Repeat Customer Rate

### Dashboard Visuals

- Monthly Delivered Revenue
- Estimated Revenue by Marketing Channel
- Revenue by Product Category
- Website Conversion Funnel
- Marketing Efficiency table

### Marketing Efficiency

The dashboard compares:

- Spend
- CTR
- Estimated ROAS

> **Important:** ROAS is an estimate because the synthetic campaign data does not contain campaign-attributed order revenue. Estimated campaign revenue is calculated using campaign conversions × overall delivered AOV.

Dashboard design reference:

`powerbi/ecommerce_marketing_dashboard_light_natural.png`

---

# Documentation

### Business Requirements Document

Defines:

- Business problem
- Objectives
- Stakeholders
- Scope
- KPIs
- Business questions
- Assumptions
- Success criteria

[View BRD](docs/BRD.md)

### Functional Requirements Document

Defines:

- Data entities
- Functional requirements
- Non-functional requirements
- Data quality rules
- Business logic
- Power BI requirements
- Acceptance criteria

[View FRD](docs/FRD.md)

### Business Insights

Detailed interpretation and recommendations from the analysis:

[View Business Insights](insights/business_insights.md)

### Power BI Build Guide

Instructions for recreating the dashboard from the supplied data:

[View Power BI Build Guide](powerbi/POWER_BI_BUILD_GUIDE.md)

---

# Tech Stack

**MySQL 8.0+ | SQL | Power BI | Excel/CSV | Business Analysis**

---

# Project Structure

```text
Ecommerce-Customer-Marketing-SQL-Analytics/
│
├── README.md
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── marketing_campaigns.csv
│   ├── campaign_performance.csv
│   └── website_sessions.csv
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_load_data.sql
│   └── 03_business_analysis.sql
│
├── docs/
│   ├── BRD.md
│   └── FRD.md
│
├── insights/
│   └── business_insights.md
│
└── powerbi/
    ├── POWER_BI_BUILD_GUIDE.md
    └── ecommerce_marketing_dashboard_light_natural.png
```

---

# How to Run the Project

## 1. Create the database

Run:

```text
sql/01_schema.sql
```

This creates the MySQL database and tables.

## 2. Load the data

Update the local CSV paths in:

```text
sql/02_load_data.sql
```

Then load the CSV files into MySQL.

## 3. Run the analysis

Execute:

```text
sql/03_business_analysis.sql
```

This contains the business analysis queries.

## 4. Review the insights

Open:

```text
insights/business_insights.md
```

## 5. Build the Power BI dashboard

Follow:

```text
powerbi/POWER_BI_BUILD_GUIDE.md
```

---

# Portfolio Learning Outcome

This project demonstrates a complete Business Analyst workflow:

```text
Business Problem
       ↓
Requirement Definition
       ↓
Data Model
       ↓
SQL Analysis
       ↓
KPI Development
       ↓
Business Insights
       ↓
Recommendations
       ↓
Power BI Communication
```

The focus is not simply on **how many SQL functions were used**.

The focus is on whether the analysis can answer:

> **What was the problem?**

> **Why was this approach chosen?**

> **What did the data tell us?**

> **What decision could the business make because of the analysis?**

---

## Disclaimer

This is a **synthetic portfolio case study** created to demonstrate SQL, Business Analysis, Power BI, requirements documentation, and analytical problem-solving skills.

No confidential, proprietary, or real client/company data is included.
