# Functional Requirements Document (FRD)
## E-commerce Customer & Marketing Analytics Platform

### 1. System Overview
The solution is an analytical data layer built in MySQL with Power BI-ready tables. It is designed for business users who need to evaluate e-commerce growth, customer behavior and digital marketing efficiency.

### 2. Data Entities
- Customers
- Products
- Orders
- Order Items
- Marketing Campaigns
- Campaign Performance
- Website Sessions

### 3. Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-01 | Load customer master data | High |
| FR-02 | Load product master data | High |
| FR-03 | Load order and order-item data | High |
| FR-04 | Load campaign and campaign-performance data | High |
| FR-05 | Load website funnel/session data | High |
| FR-06 | Calculate monthly revenue and MoM growth | High |
| FR-07 | Calculate product/category revenue and margin | High |
| FR-08 | Calculate channel CTR, conversion and cost per conversion | High |
| FR-09 | Estimate ROAS where campaign-attributed revenue is unavailable | Medium |
| FR-10 | Calculate repeat customer rate | High |
| FR-11 | Perform RFM customer segmentation | High |
| FR-12 | Identify inactive/at-risk customers | High |
| FR-13 | Analyze website funnel by channel | High |
| FR-14 | Analyze conversion and bounce rate by device | Medium |
| FR-15 | Produce business recommendations from analysis | High |

### 4. Non-Functional Requirements
- SQL should be compatible with MySQL 8.0+.
- Queries should be readable and modular.
- Primary/foreign keys should preserve referential integrity.
- Date fields should use ISO-compatible DATE values.
- Monetary fields should use DECIMAL rather than floating-point storage.
- Indexes should support common customer/date and campaign/date queries.
- The solution should be reproducible from the included CSV files.

### 5. Data Quality Rules
1. customer_id must be unique in customers.
2. product_id must be unique in products.
3. order_id must be unique in orders.
4. Delivered order revenue must be non-negative.
5. Campaign spend must be non-negative.
6. Clicks must not exceed impressions.
7. Conversions must not exceed clicks.
8. Foreign keys should map to valid master records.
9. Session funnel order should follow sessions >= add_to_cart >= checkout >= purchase at aggregate level.

### 6. Business Logic
**AOV**
Revenue / Delivered Orders

**CTR**
Clicks / Impressions × 100

**Conversion Rate**
Conversions / Clicks × 100

**Cost per Conversion**
Spend / Conversions

**Gross Margin**
Gross Profit / Revenue × 100

**Repeat Customer Rate**
Customers with >1 delivered order / Customers with at least one delivered order × 100

**RFM**
Recency, frequency and monetary scores using NTILE(5).

### 7. Power BI Consumption
Recommended Power BI model:
- Customers → Orders
- Products → Order Items
- Orders → Order Items
- Marketing Campaigns → Campaign Performance
- Customers → Website Sessions

Recommended report pages:
1. Executive Overview
2. Marketing Performance
3. Customer Segmentation
4. Product & Category Performance
5. Website Funnel

### 8. Acceptance Criteria
A release is considered complete when:
- All tables load successfully.
- SQL scripts execute without structural errors after local path configuration.
- Core KPIs reconcile with source data.
- RFM segmentation produces customer segments.
- Business recommendations can be traced to SQL outputs.
