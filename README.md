📊 User Behavior Analysis（用户行为分析项目）
📌 Project Overview

This project analyzes user behavior data from an e-commerce platform.
The goal is to understand user purchase patterns and provide actionable business insights to improve conversion rate and revenue.

通过对用户点击、加购、购买等行为数据进行分析，挖掘用户行为规律，并为业务决策提供数据支持。

📂 Dataset
Source: 2019-Nov.csv
Data scale: ~100,000+ user interaction records
Key fields:
user_id
event_type (view / cart / purchase)
product_id
category_id
price
timestamp
🧩 Project Structure
User-Behavior-Analysis/
│
├── data/                  # 原始数据
├── notebook/             # Jupyter分析过程
├── src/                  # 可复用代码模块
├── images/               # 可视化结果图
├── README.md             # 项目说明
🔍 Analysis Process
1️⃣ Data Cleaning
Remove missing or invalid values
Convert timestamp format
Filter abnormal records
2️⃣ Exploratory Data Analysis (EDA)
User activity distribution
Event type distribution (View / Cart / Purchase)
Top products and categories
3️⃣ Funnel Analysis
View → Cart → Purchase conversion rate
Identify drop-off points in user journey
4️⃣ RFM Analysis
Recency (最近购买时间)
Frequency (购买频率)
Monetary (消费金额)
Customer segmentation:
Champions
Loyal Users
At-risk Users
5️⃣ Business Insights
Low overall conversion rate (~1.46%)
Mid-price products (100–300) perform best
High-value users contribute most revenue
User distribution is highly concentrated
📊 Key Insights
Most users only browse, very few convert to purchase
Champion users generate majority of revenue
Mid-range products have highest conversion rate
A small group of users contributes most sales
💡 Recommendations
Improve conversion rate from view → cart
Strengthen retention for high-value users
Use promotions for at-risk users
Optimize pricing strategy for mid-range products
Increase targeted marketing for loyal customers
🛠️ Tools & Technologies
Python
Pandas
Matplotlib / Seaborn
Jupyter Notebook
👨‍💻 Author
SHAXIAOGUANG-AI
User Behavior Analysis Project
🔗 Project Link
https://github.com/SHAXIAOGUANG-AI/user-behavior-analysis
⭐ If you like this project

Feel free to ⭐ star this repository!

## 👤 Author
    熊义清