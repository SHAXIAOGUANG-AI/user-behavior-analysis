import unittest

import pandas as pd

from src.analysis_helpers import clean_events, funnel_metrics


class AnalysisHelpersTests(unittest.TestCase):
    def test_clean_events_removes_invalid_rows_and_parses_time(self):
        source = pd.DataFrame(
            {
                "user_id": [1, 1, None, 2],
                "event_type": ["view", "view", "purchase", "invalid"],
                "price": [10, 10, 20, 30],
                "event_time": [
                    "2019-11-01 10:00:00 UTC",
                    "2019-11-01 10:00:00 UTC",
                    "2019-11-01 11:00:00 UTC",
                    "2019-11-01 12:00:00 UTC",
                ],
            }
        )

        result = clean_events(source)

        self.assertEqual(len(result), 1)
        self.assertEqual(result.loc[0, "event_type"], "view")
        self.assertTrue(pd.api.types.is_datetime64_any_dtype(result["event_time"]))

    def test_funnel_metrics_uses_distinct_users_for_each_stage(self):
        source = pd.DataFrame(
            {
                "user_id": [1, 1, 2, 3, 3, 4],
                "event_type": ["view", "cart", "view", "view", "purchase", "purchase"],
            }
        )

        result = funnel_metrics(source)

        self.assertEqual(
            result,
            {
                "view_users": 3,
                "cart_users": 1,
                "purchase_users": 2,
                "view_to_cart_rate_pct": 33.33,
                "cart_to_purchase_rate_pct": 200.0,
                "view_to_purchase_rate_pct": 66.67,
            },
        )
