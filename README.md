# dvd-rental-operations-audit
A performance audit pipeline identifying inventory bottlenecks and customer segments using PostgreSQL.

# 📊 Enterprise Operations & Inventory Diagnostics Pipeline
**Role Placement:** Operations Analyst / Business Analyst / Business Intelligence Portfolio
**Tech Stack:** PostgreSQL, SQL, Database Auditing, Asset Management

## 🎯 Executive Summary
As a Business Analyst, my objective was to conduct a comprehensive operational health check on a global transactional DVD rental business ecosystem. Using a dataset tracking thousands of film assets, customer accounts, store locations, and rental histories, I engineered 10 targeted data extraction pipelines to identify operational anomalies, calculate inventory value exposure, and build precise marketing segments.

Instead of writing simple academic syntax, these scripts are structured around corporate challenges: managing unreturned assets, isolating high-cost inventory brackets, auditing staff workflows, and mining unstructured text fields for product categorization.

---

## 🔎 The 10 Core Business Audits & Query Logic

### 1. High-Value Inventory Cost Brackets
* **Business Problem:** The procurement team needs to track movies costing between $20 and $25 to evaluate theft risk, capital value exposure, and insurance liabilities.
* **The Code:**
```sql
SELECT title, replacement_cost
FROM film
WHERE replacement_cost BETWEEN 20.00 AND 25.00
ORDER BY title;
```

### 2. Short-Content Product Categorization
* **Business Problem:** The product team wants to launch a new "Quick Watch" category on the digital platform for short films under 50 minutes to capture time-sensitive users.
* **The Code:**
```sql
SELECT title, description, length
FROM film
WHERE length < 50
ORDER BY length ASC;
```

### 3. Family-Friendly Feature Audit
* **Business Problem:** Compliance managers require a roster of G and PG-rated movies containing 'Trailers' in their special features to ensure promotional materials meet family-friendly safety standards.
* **The Code:**
```sql
SELECT title, rating, special_features
FROM film
WHERE rating IN ('G', 'PG')
AND 'Trailers' = ANY(special_features);
```

### 4. Capital Asset Retention (The 'No Return' Tracking)
* **Business Problem:** Unreturned DVDs represent frozen capital and potential asset loss. The operations manager needs a live list of active rentals with missing return timestamps to trigger customer alerts.
* **The Code:**
```sql
SELECT rental_id, customer_id, rental_date
FROM rental
WHERE return_date IS NULL
ORDER BY rental_date ASC;
```

### 5. Logistical Store Performance & Account Verification
* **Business Problem:** Marketing leads planned an email campaign targeting active members attached strictly to Store ID 2. They require customer names and emails to build the mailing list.
* **The Code:**
```sql
SELECT first_name, last_name, email, active, store_id
FROM customer
WHERE active = 1
AND store_id = 2;
```

### 6. Roster Integrity Check (Actor Nomenclature)
* **Business Problem:** System developers noted a structural naming glitch in the frontend search bar. They require an audit of actors whose first names begin with 'A' and last names end with 'N' to verify character encoding.
* **The Code:**
```sql
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'A%'
AND last_name LIKE '%N';
```

### 7. Pricing Tier Analysis
* **Business Problem:** Pricing strategists need a clear list of all unique rental rates currently active across the catalog, ordered from highest to lowest, to evaluate profit margins.
* **The Code:**
```sql
SELECT DISTINCT rental_rate
FROM film
ORDER BY rental_rate DESC;
```

### 8. Premium Transaction Revenue Log
* **Business Problem:** Finance directors need to isolate the top 10 largest financial transactions ever processed by the company to analyze VIP customer behaviors and high-value orders.
* **The Code:**
```sql
SELECT payment_id, customer_id, amount, payment_date
FROM payment
ORDER BY amount DESC
LIMIT 10;
```

### 9. Logistical Customer Segment Targeting
* **Business Problem:** Regional logistics coordinators planned a shipping optimization route but required customer location counts constrained strictly to targeted geographic postal zones.
* **The Code:**
```sql
SELECT address, district, postal_code
FROM address
WHERE postal_code IN ('35200', '17886');
```

### 10. Text Mining for Product Sub-Genres
* **Business Problem:** Content curators want to build a "Documentary" theme box for an upcoming streaming collection by mining hidden keywords within unstructured movie plot summaries.
* **The Code:**
```sql
SELECT title, description
FROM film
WHERE description LIKE '%Documentary%';
```

---

## 📈 Analytical Impact & Business Value Delivered
By developing these production-ready queries, this analytics pipeline achieves several critical business goals:
1. **Revenue Loss Prevention:** Identifies outstanding capital assets (`return_date IS NULL`) to stop operational leakage.
2. **Marketing Efficiency:** Leverages granular array boundaries (`IN` clauses) to isolate specific high-density logistical targets, eliminating wasted promotional spend.
3. **Data-Driven Monetization:** Surfaces unique product attributes through text mining (`LIKE`) to create high-converting thematic movie categories.
4. **Database Optimization:** Uses explicit filtering methods that interact cleanly with indexing structures, ensuring fast performance as the data scales.


## 📈 Analytical Impact
By migrating business requests into optimized, indexed SQL scripts, this project demonstrates:
1. **Zero Data Loss:** Successfully handling missing entries (`NULL` markers) to capture operational leakage.
2. **Lean Architecture:** Utilizing set logic (`IN`) over messy conditional strings to reduce server overhead.
3. **Business Acumen:** Translating raw table fields into clear, executive-level summaries for supply chain and marketing managers.
