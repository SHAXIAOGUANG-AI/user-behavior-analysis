-- E-commerce user behavior analysis
-- Expected source table: user_behavior
-- Fields: user_id, event_type, product_id, category_id, brand, price, event_time, user_session
-- Dialect: MySQL 8.0.

-- 1. Funnel: count distinct users at each behavior stage.
WITH user_events AS (
  SELECT
    user_id,
    MAX(event_type = 'view') AS viewed,
    MAX(event_type = 'cart') AS added_to_cart,
    MAX(event_type = 'purchase') AS purchased
  FROM user_behavior
  GROUP BY user_id
)
SELECT
  SUM(viewed) AS view_users,
  SUM(added_to_cart) AS cart_users,
  SUM(purchased) AS purchase_users,
  ROUND(SUM(added_to_cart) / NULLIF(SUM(viewed), 0) * 100, 2) AS view_to_cart_rate_pct,
  ROUND(SUM(purchased) / NULLIF(SUM(added_to_cart), 0) * 100, 2) AS cart_to_purchase_rate_pct,
  ROUND(SUM(purchased) / NULLIF(SUM(viewed), 0) * 100, 2) AS view_to_purchase_rate_pct
FROM user_events;

-- 2. Price-band purchase conversion: unique purchasers / unique viewers.
WITH price_events AS (
  SELECT
    user_id,
    CASE
      WHEN price < 100 THEN '0-99'
      WHEN price < 300 THEN '100-299'
      WHEN price < 500 THEN '300-499'
      ELSE '500+'
    END AS price_band,
    event_type
  FROM user_behavior
)
SELECT
  price_band,
  COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase_users,
  ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)
    / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END), 0) * 100, 2)
    AS purchase_conversion_rate_pct
FROM price_events
GROUP BY price_band
ORDER BY FIELD(price_band, '0-99', '100-299', '300-499', '500+');

-- 3. Brand performance: compare traffic, purchasers, and conversion.
SELECT
  COALESCE(brand, 'Unknown') AS brand,
  COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END) AS view_users,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase_users,
  ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END)
    / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END), 0) * 100, 2)
    AS purchase_conversion_rate_pct
FROM user_behavior
GROUP BY COALESCE(brand, 'Unknown')
HAVING view_users >= 30
ORDER BY purchase_conversion_rate_pct DESC, view_users DESC;

-- 4. RFM inputs: run this on purchase records only.
SELECT
  user_id,
  DATEDIFF((SELECT DATE(MAX(event_time)) FROM user_behavior), DATE(MAX(event_time))) AS recency_days,
  COUNT(DISTINCT user_session) AS frequency,
  ROUND(SUM(price), 2) AS monetary_value
FROM user_behavior
WHERE event_type = 'purchase'
GROUP BY user_id;
