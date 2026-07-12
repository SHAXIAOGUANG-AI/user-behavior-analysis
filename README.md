# E-commerce User Behavior Analysis

Personal data-analysis project based on 100,000+ e-commerce user behavior records. The project uses Python to clean event data, analyze conversion and price performance, segment customer value with RFM, and turn findings into business recommendations.

## At a glance

| Item | Result |
| --- | --- |
| Dataset | 100,000+ sampled records from `2019-Nov.csv` |
| User journey | `view → cart → purchase` |
| Overall purchase conversion | about 1.46% of viewing users in this project sample |
| Key drop-off | from product view to add-to-cart |
| Highest-converting price band | 100–300 in this project sample |
| Customer analysis | RFM segmentation for retention and reactivation |

> Findings are based on this project's sampled public event data. They are not results from a production experiment.

## Business questions

1. Which stage loses the most users in the view-to-purchase journey?
2. How do conversion rates differ by price band and brand?
3. Which customer segments should receive retention or reactivation actions?

## Data and quality rules

- Source file: `2019-Nov.csv`; raw data is not included because of its size.
- Place the CSV in `data/2019-Nov.csv` before running the notebook.
- The analysis removes duplicate rows, invalid event types, missing user IDs or timestamps, and non-positive prices.
- Metric definitions and dashboard design are documented in [docs/methodology.md](docs/methodology.md).

## Key insights and actions

| Evidence | Insight | Suggested action |
| --- | --- | --- |
| Funnel conversion | The largest loss is before users add an item to cart. | Improve product detail pages, recommendations, and add-to-cart prompts. |
| Price-band conversion | The 100–300 band has the highest conversion in the sample. | Prioritize merchandising and promotion tests in this band. |
| RFM segments | Champion and Loyal users have stronger value; At Risk users need attention. | Offer loyalty benefits to high-value users and targeted reminders or coupons to At Risk users. |
| Brand comparison | High traffic and high conversion are not always the same. | Evaluate advertising allocation with both traffic and conversion. |

## Visualizations

| Funnel | Price conversion |
| --- | --- |
| ![User behavior funnel](images/behavior_funnel.png) | ![Price range conversion](images/price_range_conversion.svg) |

| RFM customer segments | Brand purchase rate |
| --- | --- |
| ![RFM customer segmentation](images/rfm_segments.png) | ![Brand purchase rate](images/brand_purchase_rate.png) |

## Reproduce the analysis

```bash
python -m pip install -r requirements.txt
jupyter notebook notebook/analy.ipynb
```

The notebook uses reusable helpers in `src/analysis_helpers.py` and supports launching Jupyter from either the project root or the `notebook/` directory. Run its regression checks with:

```bash
python -m unittest tests/test_analysis_helpers.py -v
```

## SQL and dashboard evidence

- [sql/analysis_queries.sql](sql/analysis_queries.sql): MySQL 8.0 queries for funnel, price-band, brand, and RFM inputs.
- [docs/methodology.md](docs/methodology.md): data scope, metric definitions, quality rules, and a Power BI dashboard specification.

The repository does **not** claim that a Power BI `.pbix` file exists. Add the actual dashboard file and screenshots before listing Power BI as a project deliverable.

## Project structure

```text
user-behavior-analysis/
├── docs/                  # Metric definitions and dashboard specification
├── images/                # Analysis visualizations
├── notebook/              # Jupyter analysis notebook and RFM output
├── sql/                   # Reproducible MySQL analysis queries
├── src/                   # Reusable cleaning and funnel helpers
├── tests/                 # Regression checks for core calculations
├── requirements.txt
└── README.md
```

## Tools

- Python: Pandas, Matplotlib, Jupyter Notebook
- SQL: MySQL 8.0 query scripts
