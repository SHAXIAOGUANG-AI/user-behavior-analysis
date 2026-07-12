import pandas as pd


VALID_EVENT_TYPES = {"view", "cart", "purchase"}


def clean_events(events: pd.DataFrame) -> pd.DataFrame:
    """Return valid, deduplicated events with parsed timestamps."""
    result = events.copy()
    result["event_time"] = pd.to_datetime(result["event_time"], utc=True, errors="coerce")
    result = result.drop_duplicates()
    result = result.dropna(subset=["user_id", "event_type", "price", "event_time"])
    result = result[result["event_type"].isin(VALID_EVENT_TYPES)]
    result = result[result["price"] > 0]
    return result.reset_index(drop=True)


def funnel_metrics(events: pd.DataFrame) -> dict[str, float | int]:
    """Calculate distinct-user funnel volumes and stage conversion rates."""
    stage_counts = {
        event_type: events.loc[events["event_type"] == event_type, "user_id"].nunique()
        for event_type in ("view", "cart", "purchase")
    }

    view_users = stage_counts["view"]
    cart_users = stage_counts["cart"]
    purchase_users = stage_counts["purchase"]

    def rate(numerator: int, denominator: int) -> float:
        return round(numerator / denominator * 100, 2) if denominator else 0.0

    return {
        "view_users": view_users,
        "cart_users": cart_users,
        "purchase_users": purchase_users,
        "view_to_cart_rate_pct": rate(cart_users, view_users),
        "cart_to_purchase_rate_pct": rate(purchase_users, cart_users),
        "view_to_purchase_rate_pct": rate(purchase_users, view_users),
    }
