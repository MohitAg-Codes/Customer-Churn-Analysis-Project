# 📊 Customer Churn Analysis – Data Analytics Project

## 🔍 Overview
This project focuses on analyzing customer churn by building a complete end-to-end data analytics workflow. It includes loading raw customer data into MySQL, performing Exploratory Data Analysis (EDA), cleaning and transforming data, running analytical SQL queries, and finally creating an interactive Power BI dashboard to uncover churn drivers and business insights.

The goal is to help businesses identify churn patterns, understand customer behavior, and support data-driven decision-making.

---

## 📁 Dataset
The dataset contains customer-level information such as:
- Demographics  
- Geographic details  
- payment information  
- Services used  
- Revenue & account metrics  
- Churn status, churn category & churn reason  


---

## 🛠 Tools & Technologies
- **MySQL** – Data loading, cleaning & SQL analysis  
- **SQL** – EDA & transformations  
- **Power BI** – Interactive dashboard & report building  
- **Excel/CSV** – Initial data understanding  
- **ETL Approach** – Data extraction, transformation & load into production table  

---

## 🔄 Project Steps
### 1. **Load Data into SQL**
- Create database and table in MySQL  
- Load raw dataset into `customer_data` table

### 2. **EDA & Data Quality Checks**
- Identified missing values  
- Checked for inconsistent entries  
- Performed descriptive analysis  
- Verified customer & revenue distributions  

### 3. **Data Cleaning & Transformation**
- Replaced blanks with meaningful labels  
- Standardized categorical values  
- Created production table `prod_churn` with clean data  
- Ensured ready-to-use analytical structure

### 4. **SQL Analysis**
Key SQL analyses include:
- Gender distribution  
- Contract-wise customers  
- Revenue by customer status  
- State-wise share  
- Churn category breakdown  
- Null value profiling  

### 5. **Power BI Dashboard**
Developed an interactive dashboard covering:
- Total customers  
- Total churn & churn rate  
- New joiners  
- Churn by gender, age group, state, tenure, internet type  
- Churn reasons & categories  
- Service-wise churn comparison  

### 6. **Insights & Reporting**
A Power BI report summarizes:
- Top churn-driving states  
- Customer segments with highest churn risk  
- Services most associated with churn  
- Payment methods influencing customer behavior  
- Demographic patterns influencing loyalty  

---

## 📊 Dashboard Preview
Below is the dashboard used in the project:

![Dashboard](./Churn%20Analysis.png)

---

## ✅ Results & Key Findings
- **Overall churn rate:** 27%  
- Churn is highest among **Fiber Optic users**, **short-tenure customers**, and **older age groups**  
- **Mailed check** payment customers show the highest churn tendency  
- Majority churn reason falls under **Competitor**, **Attitude**, and **Dissatisfaction**  
- Service add-ons significantly reduce churn likelihood  


