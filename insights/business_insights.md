# Business Insights

> **Important:** This portfolio uses a synthetic dataset generated for demonstration. Metrics below are derived from the included data and should be presented to recruiters as a portfolio simulation, not as client/company results.

## Executive Snapshot
- Delivered revenue: **₹314,698,654**
- Delivered orders: **33,453**
- Average Order Value: **₹9,407**
- Repeat customer rate: **87.8%**
- Highest-revenue category: **Sports**
- Highest estimated ROAS channel: **Influencer**

## Marketing Findings
| channel    |       spend |   impressions |   clicks |   conversions |   ctr_pct |   conversion_rate_pct |   cost_per_conversion |   estimated_revenue |   estimated_roas |
|:-----------|------------:|--------------:|---------:|--------------:|----------:|----------------------:|----------------------:|--------------------:|-----------------:|
| Email      | 2.67297e+06 |   1.8873e+07  |   745091 |         81618 |      3.95 |                 10.95 |                 32.75 |         7.67796e+08 |           287.24 |
| Google Ads | 2.50237e+06 |   2.5266e+07  |   963073 |         77142 |      3.81 |                  8.01 |                 32.44 |         7.25689e+08 |           290    |
| Influencer | 2.0514e+06  |   1.89813e+07 |   685737 |         65122 |      3.61 |                  9.5  |                 31.5  |         6.12615e+08 |           298.63 |
| Meta Ads   | 1.46311e+06 |   1.35838e+07 |   479663 |         40077 |      3.53 |                  8.36 |                 36.51 |         3.77012e+08 |           257.68 |

### Interpretation
1. **Influencer** has the highest estimated ROAS in this synthetic scenario.
2. Marketing optimization should consider both acquisition efficiency and downstream repeat behavior.
3. Estimated ROAS is a proxy because campaign-level attributed order revenue is not included in the base dataset.

## Category Findings
| category       |     revenue |   gross_profit |   margin_pct |
|:---------------|------------:|---------------:|-------------:|
| Sports         | 6.65547e+07 |    2.28646e+07 |        34.35 |
| Beauty         | 6.17628e+07 |    2.11477e+07 |        34.24 |
| Accessories    | 5.45188e+07 |    1.8601e+07  |        34.12 |
| Electronics    | 4.93176e+07 |    1.69278e+07 |        34.32 |
| Fashion        | 4.16494e+07 |    1.42766e+07 |        34.28 |
| Home & Kitchen | 4.08953e+07 |    1.40163e+07 |        34.27 |

### Interpretation
- **Sports** is the leading category by revenue in the generated scenario.
- Revenue should not be evaluated alone; gross margin should be considered before increasing promotion or ad spend.

## Website Funnel
| channel    |   sessions |   add_to_cart |   checkout |   purchase |   purchase_rate_pct |
|:-----------|-----------:|--------------:|-----------:|-----------:|--------------------:|
| Affiliate  |       9821 |          2700 |       1314 |        711 |                7.24 |
| Email      |      10186 |          2785 |       1329 |        733 |                7.2  |
| Google Ads |      10003 |          2783 |       1343 |        732 |                7.32 |
| Influencer |       9968 |          2810 |       1349 |        750 |                7.52 |
| Meta Ads   |       9950 |          2797 |       1317 |        772 |                7.76 |
| Organic    |      10072 |          2820 |       1315 |        702 |                6.97 |

### Interpretation
- Compare purchase rates across channels to identify traffic-quality differences.
- Compare mobile vs desktop performance before prioritizing UX changes.

## Recommended Actions
1. Reallocate incremental budget toward channels with strong estimated ROAS **only after validating attribution**.
2. Create targeted retention journeys for high-value and at-risk RFM segments.
3. Investigate funnel leakage by channel and device.
4. Pair category revenue with gross margin when deciding promotional priorities.
5. Add campaign-attributed order revenue in a production implementation so ROAS becomes directly measurable.

## Recruiter Talking Points
- "I started from business questions rather than dashboards."
- "I designed a normalized analytical schema and wrote MySQL queries for revenue, retention, marketing efficiency and funnel analysis."
- "I used CTEs and window functions for MoM growth, latest-order analysis and RFM segmentation."
- "I converted the SQL outputs into business recommendations and documented requirements through BRD/FRD."
