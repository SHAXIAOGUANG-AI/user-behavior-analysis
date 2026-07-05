# 📊 User Behavior Analysis (用户行为分析项目)

## 📌 Project Overview
This project analyzes user behavior data from an e-commerce platform to understand customer purchasing patterns and provide data-driven business insights. The goal is to improve conversion rate, user retention, and revenue performance.

本项目基于电商用户行为数据，对用户的浏览、加购和购买行为进行分析，并通过用户分群与转化分析提供商业决策支持。

---

## 📁 Dataset
- **Source:** 2019-Nov.csv  
- **Scale:** ~100,000+ user interaction records  

### 📌 Key Fields:
- user_id
- event_type (view / cart / purchase)
- product_id
- category_id
- price
- timestamp

---

## 🗂 Project Structure
User-Behavior-Analysis/
│
├── data/ # Raw dataset (not uploaded to GitHub)
├── notebook/ # Jupyter analysis process
├── src/ # Reusable code modules
├── images/ # Visualization results
├── README.md # Project description
---

## 🔍 Analysis Workflow

### 1️⃣ Data Cleaning
- Remove missing or invalid values
- Convert timestamp format
- Filter abnormal records

---

### 2️⃣ Exploratory Data Analysis (EDA)
- User activity distribution
- Event type distribution (View / Cart / Purchase)
- Top products and categories

---

### 3️⃣ Funnel Analysis
- View → Cart → Purchase conversion funnel
- Identify drop-off points in user journey

---

### 4️⃣ RFM Analysis
- **Recency:** Last purchase time  
- **Frequency:** Purchase frequency  
- **Monetary:** Total spending  

Customer segmentation:
- Champions
- Loyal Users
- At-risk Users

---

## 📊 Key Insights

- Overall conversion rate is low (~1.4%)
- Most users only browse without purchasing
- A small group of “Champion users” contributes most revenue
- Mid-price products (100–300) perform best in conversion
- User value distribution is highly concentrated

---

## 💡 Business Recommendations

- Improve conversion from view → cart stage
- Strengthen retention strategies for high-value users
- Optimize pricing strategy for mid-range products
- Launch targeted promotions for at-risk users

---

## 🛠 Tools & Technologies
- Python
- Pandas
- Matplotlib / Seaborn
- Jupyter Notebook

---

## 👨‍💻 Author
**SHAXIAOGUANG-AI**

🔗 Project Link:  
https://github.com/SHAXIAOGUANG-AI/user-behavior-analysis

---

⭐ If you like this project, please consider giving it a star!