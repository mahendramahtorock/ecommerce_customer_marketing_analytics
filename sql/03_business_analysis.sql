USE ecommerce_analytics;

-- 01. Monthly revenue and MoM growth
WITH monthly AS (
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(CASE WHEN order_status = 'Delivered' THEN revenue ELSE 0 END) AS revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
       ROUND((revenue - LAG(revenue) OVER (ORDER BY month))
             / NULLIF(LAG(revenue) OVER (ORDER BY month),0) * 100, 2) AS mom_growth_pct
FROM monthly
ORDER BY month;

-- 02. Top 10 customers by delivered revenue
SELECT c.customer_id, c.city,
       ROUND(SUM(o.revenue),2) AS total_revenue,
       COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.city
ORDER BY total_revenue DESC
LIMIT 10;

-- 03. Repeat customer rate
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
)
SELECT ROUND(
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
) AS repeat_customer_rate_pct
FROM customer_orders;

-- 04. Customers with no order in the last 90 days from the project end date
SELECT c.customer_id, c.city, c.acquisition_channel,
       MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
 AND o.order_status = 'Delivered'
GROUP BY c.customer_id, c.city, c.acquisition_channel
HAVING MAX(o.order_date) IS NULL
    OR MAX(o.order_date) < '2026-04-01';

-- 05. Top products by revenue and profit
SELECT p.product_id, p.product_name, p.category,
       ROUND(SUM(oi.revenue),2) AS revenue,
       ROUND(SUM(oi.gross_profit),2) AS gross_profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;

-- 06. Category performance
SELECT p.category,
       ROUND(SUM(oi.revenue),2) AS revenue,
       ROUND(SUM(oi.gross_profit),2) AS gross_profit,
       ROUND(SUM(oi.gross_profit)/NULLIF(SUM(oi.revenue),0)*100,2) AS margin_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- 07. Marketing channel performance
SELECT channel,
       ROUND(SUM(spend),2) AS spend,
       SUM(impressions) AS impressions,
       SUM(clicks) AS clicks,
       SUM(conversions) AS conversions,
       ROUND(SUM(clicks)*100.0/NULLIF(SUM(impressions),0),2) AS ctr_pct,
       ROUND(SUM(conversions)*100.0/NULLIF(SUM(clicks),0),2) AS conversion_rate_pct,
       ROUND(SUM(spend)/NULLIF(SUM(conversions),0),2) AS cost_per_conversion
FROM marketing_campaigns
GROUP BY channel
ORDER BY spend DESC;

-- 08. Campaign ROAS proxy using average order value
WITH campaign_metrics AS (
    SELECT channel,
           SUM(spend) AS spend,
           SUM(conversions) AS conversions
    FROM marketing_campaigns
    GROUP BY channel
),
aov AS (
    SELECT SUM(revenue)/NULLIF(COUNT(DISTINCT order_id),0) AS avg_order_value
    FROM orders
    WHERE order_status = 'Delivered'
)
SELECT cm.channel,
       ROUND(cm.spend,2) AS spend,
       cm.conversions,
       ROUND(cm.conversions * aov.avg_order_value,2) AS estimated_revenue,
       ROUND((cm.conversions * aov.avg_order_value)/NULLIF(cm.spend,0),2) AS estimated_roas
FROM campaign_metrics cm
CROSS JOIN aov
ORDER BY estimated_roas DESC;

-- 09. RFM segmentation
WITH customer_metrics AS (
    SELECT customer_id,
           DATEDIFF('2026-06-30', MAX(order_date)) AS recency_days,
           COUNT(DISTINCT order_id) AS frequency,
           SUM(revenue) AS monetary
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
           NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
           NTILE(5) OVER (ORDER BY frequency) AS f_score,
           NTILE(5) OVER (ORDER BY monetary) AS m_score
    FROM customer_metrics
)
SELECT customer_id, recency_days, frequency, ROUND(monetary,2) AS monetary,
       r_score, f_score, m_score,
       CASE
         WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
         WHEN r_score >= 3 AND f_score >= 4 THEN 'Loyal Customers'
         WHEN r_score >= 4 AND f_score <= 2 THEN 'Potential Loyalists'
         WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
         ELSE 'Needs Attention'
       END AS segment
FROM rfm_scores
ORDER BY monetary DESC;

-- 10. Channel with highest repeat-customer share
WITH customer_order_counts AS (
    SELECT c.customer_id, c.acquisition_channel,
           COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o
      ON c.customer_id = o.customer_id
     AND o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.acquisition_channel
)
SELECT acquisition_channel,
       COUNT(*) AS customers,
       SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
       ROUND(SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS repeat_rate_pct
FROM customer_order_counts
GROUP BY acquisition_channel
ORDER BY repeat_rate_pct DESC;

-- 11. Latest order per customer
WITH ranked AS (
    SELECT o.*,
           ROW_NUMBER() OVER (
             PARTITION BY customer_id ORDER BY order_date DESC, order_id DESC
           ) AS rn
    FROM orders o
)
SELECT * FROM ranked WHERE rn = 1;

-- 12. Above-average customers
WITH customer_revenue AS (
    SELECT customer_id, SUM(revenue) AS revenue
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
)
SELECT customer_id, ROUND(revenue,2) AS revenue
FROM customer_revenue
WHERE revenue > (SELECT AVG(revenue) FROM customer_revenue)
ORDER BY revenue DESC;

-- 13. Funnel conversion by channel
SELECT channel,
       COUNT(*) AS sessions,
       SUM(add_to_cart) AS add_to_cart_sessions,
       SUM(checkout) AS checkout_sessions,
       SUM(purchase) AS purchase_sessions,
       ROUND(SUM(add_to_cart)*100.0/COUNT(*),2) AS atc_rate_pct,
       ROUND(SUM(checkout)*100.0/NULLIF(SUM(add_to_cart),0),2) AS checkout_rate_pct,
       ROUND(SUM(purchase)*100.0/NULLIF(SUM(checkout),0),2) AS purchase_rate_pct
FROM website_sessions
GROUP BY channel
ORDER BY purchase_rate_pct DESC;

-- 14. Device performance
SELECT device,
       COUNT(*) AS sessions,
       ROUND(AVG(page_views),2) AS avg_page_views,
       ROUND(SUM(purchase)*100.0/COUNT(*),2) AS session_purchase_rate_pct,
       ROUND(SUM(bounce_flag)*100.0/COUNT(*),2) AS bounce_rate_pct
FROM website_sessions
GROUP BY device
ORDER BY session_purchase_rate_pct DESC;

-- 15. Cancellation and return rate
SELECT
    ROUND(SUM(order_status='Cancelled')*100.0/COUNT(*),2) AS cancellation_rate_pct,
    ROUND(SUM(order_status='Returned')*100.0/COUNT(*),2) AS return_rate_pct
FROM orders;
