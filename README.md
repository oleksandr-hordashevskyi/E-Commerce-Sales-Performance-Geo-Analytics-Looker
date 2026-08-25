# 🛒 E-Commerce Sales Performance & Geo-Analytics Dashboard

[![Looker Studio](https://img.shields.io/badge/Google_Looker_Studio-Interactive_Dashboard-4285F4?logo=google)](https://datastudio.google.com/s/vKfrVKzK0l8)
[![SQL Extraction](https://img.shields.io/badge/SQL-Data_Pipeline-CC292B?logo=postgresql)](sql/ecommerce_sales_extraction.sql)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📌 Executive Summary
An interactive Business Intelligence dashboard developed in **Google Looker Studio**, backed by custom **SQL extraction pipelines**, designed to evaluate multi-channel retail performance, geographical demand distribution, customer age demographics, and product revenue concentration.

* **Live Dashboard:** [Google Looker Studio Report](https://datastudio.google.com/s/vKfrVKzK0l8)
* **Dataset Scope:** 475 transactions across 15 active cities and 50 unique customer profiles.

---

## 📊 Visualizations & Dashboard Overview

![E-Commerce Sales Performance Dashboard](images/01_ecommerce_sales_dashboard.png)

---

## 🛠 Technical Architecture & Methodology

* **SQL Aggregation & Data Extraction:** Extracted normalized transactional records joining orders, customers, payment logs, and product catalogs into an analytics-ready dimensional table.
* **KPI Metrics Layer:** Standardized executive KPIs (Total Revenue, Total Orders, Average Order Value, Active Cities, Unique Customers).
* **Multi-Dimensional Segmentation:** Configured interactive control filters (`Date Range`, `Payment Method`, `Payment Status`, `Customer Age`, `Sales Channel`) for rapid slicing.
* **Geo-Spatial Clustering:** Visualized regional revenue density using map layers to pinpoint core geographic markets.

---

## 📈 Key Business Findings

* **Revenue Concentration:** Generated **₴31.38M** across 475 orders with an average revenue per active city exceeding **₴2.09M**.
* **Channel Parity:** Online and Offline sales channels demonstrate synchronized revenue spikes throughout Q1, with prominent sales surges exceeding **₴600K/day**.
* **Demographic Segmentation:** The **34-year-old** customer cohort represents the single largest individual revenue contributor (~₴9.4M), outpacing other individual age brackets.
* **Geographic Core:** Regional demand is heavily centered around major metropolitan logistics hubs across Ukraine, driving over 75% of cumulative order value.

---

## 💡 Strategic Recommendations

1. **Targeted Demographic Campaigns:** Tailor promotional bundles and loyalty rewards specifically toward the 29–35 age demographic to maximize high-ticket conversion.
2. **Channel-Specific Promotional Calendars:** Align marketing spend with historical mid-month surges to amplify peak online transaction volumes.
3. **Regional Inventory Optimization:** Concentrate inventory buffering and next-day delivery partnerships within high-volume metropolitan centers identified in geo-mapping.

---

## 🗂 Project Structure & Deliverables

```text
E-Commerce-Sales-Performance-Geo-Analytics-Looker/
├── LICENSE
├── README.md
├── sql/
│   └── ecommerce_sales_extraction.sql   # Custom SQL query for BI layer
└── images/
    └── 01_ecommerce_sales_dashboard.png # High-resolution dashboard view
```
---
