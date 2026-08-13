# Business Requirements Document (BRD)
## E-commerce Customer & Marketing Analytics Platform

### 1. Document Purpose
This BRD defines the business need for an analytics solution that consolidates e-commerce sales, customer, website funnel and digital marketing data to improve marketing efficiency and customer retention.

### 2. Business Problem
The business operates across multiple acquisition and digital channels. Performance data is fragmented, making it difficult to answer:
- Which channels generate efficient customer acquisition?
- Which customers are most valuable or at risk?
- Which products and categories drive revenue and margin?
- Where is the website funnel losing potential customers?
- How should marketing investment be prioritized?

### 3. Business Objectives
1. Establish a single analytical view of sales and marketing performance.
2. Measure channel efficiency using CTR, conversion rate, CAC/cost per conversion and ROAS.
3. Segment customers using RFM principles.
4. Identify high-value, repeat and at-risk customers.
5. Identify product/category revenue and margin opportunities.
6. Quantify website funnel leakage by channel and device.
7. Convert analysis into actionable recommendations for marketing and e-commerce teams.

### 4. Stakeholders
- Business Head
- E-commerce Manager
- Performance Marketing Manager
- CRM/Retention Manager
- Data/Business Analyst
- Product/Technology Team

### 5. Scope
**In scope:** customer, order, product, marketing campaign and website-session analysis; SQL data model; KPI calculations; segmentation; business recommendations.

**Out of scope:** production CRM execution, ad-platform API integration, real-time streaming and automated campaign activation.

### 6. Key Business KPIs
- Revenue
- Orders
- Average Order Value (AOV)
- Gross Profit
- Gross Margin %
- Repeat Customer Rate
- CTR
- Conversion Rate
- Cost per Conversion
- ROAS (estimated where direct campaign-attributed revenue is unavailable)
- Website Funnel Conversion
- Bounce Rate
- RFM Segment

### 7. Business Questions
1. What is the monthly revenue trend and MoM growth?
2. Which products/categories drive revenue and profit?
3. Which marketing channels are most efficient?
4. Which customers contribute the most revenue?
5. What proportion of customers are repeat purchasers?
6. Which customers are at risk of becoming inactive?
7. Which channel brings customers with stronger repeat behavior?
8. Where is the website funnel leaking?
9. Does device type influence conversion?
10. Where should management focus its next optimization effort?

### 8. Assumptions
- Dataset is synthetic and created for portfolio demonstration.
- Delivered orders are used for revenue/profit analysis.
- Campaign ROAS is an estimate when campaign-attributed revenue is not directly available.
- Currency is INR.
- Project analysis period is Jan 2025 to Jun 2026.

### 9. Expected Business Outcomes
The solution should help stakeholders prioritize:
- Marketing channels
- Retention campaigns
- Product/category optimization
- Website funnel improvements
- High-value customer programs

### 10. Success Criteria
- All source tables can be loaded into MySQL.
- SQL queries return reproducible KPI outputs.
- Business questions are answered with measurable evidence.
- Recommendations are linked to observed metrics.
- Data model supports Power BI consumption.
