# 💳 Credit Risk Analysis using Machine Learning

An end-to-end **Credit Risk Modeling** project that predicts whether a customer is likely to default on a loan using machine learning techniques. This project covers data exploration, preprocessing, feature engineering, model development, and evaluation using industry-standard metrics such as **ROC-AUC**, **Gini Coefficient**, and **Rank Ordering**.

---

## 📌 Project Overview

Credit risk assessment is one of the most critical tasks for banks and financial institutions. Incorrect lending decisions can lead to significant financial losses. This project aims to build a machine learning model that classifies customers into **Good Credit** and **Bad Credit** categories based on their historical demographic, account, and enquiry information.

The project demonstrates a complete data science workflow, from raw data preparation to model evaluation.

---

## 🎯 Business Problem

Banks process thousands of loan applications every day. Identifying high-risk customers before loan approval helps reduce default risk and improves lending decisions.

The objective of this project is to develop a predictive model that estimates the probability of customer default using historical customer data.

---

## 🎯 Project Objectives

- Perform Exploratory Data Analysis (EDA)
- Clean and preprocess the dataset
- Handle missing values and categorical variables
- Build multiple classification models
- Compare model performance
- Evaluate models using ROC-AUC, Gini Coefficient, and Rank Ordering
- Establish a baseline credit risk prediction model

---

## 📂 Dataset Summary

| Description | Value |
|------------|------:|
| Total Records | 23,896 |
| Original Features | 90 |
| Features After Preprocessing | 82 |
| Final Feature Matrix | 3,914 |
| Training Samples | 19,116 |
| Testing Samples | 4,780 |

---

## 📁 Project Structure

```text
GoodCredit-Credit-Risk-Analysis/
│
├── 01_SQL_Data_Preparation.sql
├── 02_EDA_and_Model_Building.ipynb
├── dataset/
│   └── GoodCredit_Final_Dataset_2.csv
├── README.md
└── requirements.txt
```

---

## ⚙️ Project Workflow

```
Load Dataset
      │
      ▼
Data Understanding
      │
      ▼
Exploratory Data Analysis (EDA)
      │
      ▼
Data Preprocessing
      │
      ▼
Feature Engineering
      │
      ▼
Train-Test Split
      │
      ▼
Model Building
(Logistic Regression,
Decision Tree,
Random Forest)
      │
      ▼
Model Evaluation
      │
      ▼
ROC-AUC
Gini Coefficient
Rank Ordering
```

---

## 🔍 Exploratory Data Analysis (EDA)

The following analyses were performed:

- Dataset overview
- Data types and structure
- Missing value analysis
- Duplicate record detection
- Statistical summary
- Target variable distribution
- Numerical feature analysis
- Categorical feature analysis
- Correlation analysis
- Outlier detection

### Key Findings

- The dataset contained multiple missing values across several features.
- High-cardinality categorical variables required dimensionality reduction.
- The target variable was highly imbalanced:
  - **Good Customers:** 95.8%
  - **Bad Customers:** 4.2%
- Extensive preprocessing was required before model training.

---

## 🛠 Data Preprocessing

The following preprocessing steps were applied:

- Removed duplicate records
- Handled missing values
- Dropped irrelevant features
- Converted date columns
- Encoded categorical variables
- Reduced high-cardinality features
- Created the final feature matrix
- Split the dataset into training and testing sets

---

## 🤖 Machine Learning Models

The following classification models were trained and evaluated:

- Logistic Regression
- Decision Tree
- Random Forest

---

## 📊 Model Performance

| Model | Accuracy | ROC-AUC | Gini |
|--------|---------:|--------:|------:|
| Logistic Regression | **94.44%** | **0.6002** | **20.04%** |
| Random Forest | 95.80% | 0.5915 | 18.29% |
| Decision Tree | 92.36% | 0.5035 | 0.70% |

---

## 📈 Model Evaluation

The models were evaluated using:

- Accuracy
- Precision
- Recall
- F1-Score
- ROC-AUC
- Gini Coefficient
- Rank Ordering (Decile Analysis)

### Benchmark Comparison

| Metric | Value |
|--------|-------:|
| Benchmark Gini | 37.9% |
| Best Model Gini | 20.04% |

Although the benchmark Gini score was not achieved, the project successfully established a baseline credit risk prediction model. The relatively low Gini score can be attributed to the significant class imbalance, where only **4.2%** of customers belonged to the default class.

---

## 🧰 Tools & Technologies

| Category | Tools |
|-----------|-------|
| Database | MySQL |
| Programming | Python |
| Libraries | Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn |
| Machine Learning | Logistic Regression, Decision Tree, Random Forest |
| Visualization | Matplotlib, Seaborn |
| IDE | Jupyter Notebook |

---

## ✅ Key Outcomes

- Completed an end-to-end Credit Risk Modeling workflow.
- Performed comprehensive EDA and data preprocessing.
- Built and compared multiple machine learning models.
- Evaluated model performance using industry-standard metrics.
- Conducted Rank Ordering analysis to assess customer risk segmentation.
- Established a baseline model for future credit risk improvement.

---

## 🚀 Future Improvements

Potential enhancements include:

- Apply SMOTE or other class-balancing techniques.
- Perform hyperparameter tuning using Grid Search or Random Search.
- Implement advanced feature engineering.
- Evaluate Gradient Boosting models such as XGBoost, LightGBM, and CatBoost.
- Improve the Gini Coefficient through advanced modeling techniques.

---

## 👨‍💻 Author

**Souri Sarkar**

Aspiring Data Analyst | SQL | Python | Power BI | Machine Learning
