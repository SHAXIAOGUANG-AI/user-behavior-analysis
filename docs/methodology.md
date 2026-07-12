# Analysis methodology

## Data scope

- Dataset: `2019-Nov.csv`, an e-commerce event log used for this personal project.
- Unit of analysis: a user behavior event.
- Key fields: `user_id`, `event_type`, `product_id`, `category_id`, `brand`, `price`, `event_time`, and `user_session`.
- The raw dataset is not uploaded because of file size. Place it in `data/2019-Nov.csv` before running the notebook.

## Metric definitions

| Metric | Definition |
| --- | --- |
| View users | Distinct users with at least one `view` event |
| Cart users | Distinct users with at least one `cart` event |
| Purchase users | Distinct users with at least one `purchase` event |
| View-to-cart rate | Cart users / view users |
| Cart-to-purchase rate | Purchase users / cart users |
| Purchase conversion rate | Purchase users / view users |
| Monetary value | Sum of purchase-event prices per user |
| RFM | Recency, Frequency, and Monetary value calculated from purchase events |

## Data quality rules

1. Parse `event_time` as a timestamp before time-based analysis.
2. Remove records duplicated across all source fields.
3. Exclude records with missing `user_id`, invalid event type, missing timestamp, or non-positive price from metric calculations.
4. Keep missing brands as `Unknown` rather than dropping those records.
5. Treat all findings as observations from this project dataset, not as results of a production experiment.

## Power BI dashboard specification

1. **Overview**: event volume, view users, cart users, purchase users, and overall purchase conversion.
2. **Funnel**: view-to-cart and cart-to-purchase conversion, with category or brand filters.
3. **Product and price**: price-band conversion and brand traffic-versus-conversion comparison.
4. **Customer value**: RFM segment count, revenue contribution, and suggested retention actions.

This repository contains a dashboard specification only. It does not claim that a `.pbix` file exists.
