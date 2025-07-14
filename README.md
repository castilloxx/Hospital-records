# 🏥 Hospital Data Analysis Project

A data-driven exploration of hospital patient records focused on healthcare insights such as cost analysis, patient satisfaction, readmission rates, and treatment outcomes. This project showcases the use of SQL for data cleanimg and exploration and Tableau for visualization.

---

## 📊 Project Objective

The objective of this project is to:
- Clean and explore hospital records using SQL
- Identify patterns in patient outcomes, costs, satisfaction, and readmissions
- Build a professional, interactive dashboard using Tableau
- Simulate real-world analysis and reporting in a healthcare context

<img width="1366" height="768" alt="Screenshot (2)" src="https://github.com/user-attachments/assets/684f25db-5bb6-44f0-850a-925ceffcf840" />

---

## 📁 Dataset Description

**File:** `hospital_data_analysis.csv`  
**Records:** 984 patients  
**Columns include:**
- `Patient_ID`: Unique identifier
- `Age`: Patient age (integer)
- `Gender`: Male/Female
- `Condition`: Primary medical condition
- `Procedure`: Medical procedure performed
- `Cost`: Total treatment cost in USD
- `Length_of_Stay`: Number of days admitted
- `Readmission`: Yes/No
- `Outcome`: Recovered / Not Recovered / Deceased
- `Satisfaction`: Patient satisfaction score (1–10)

---

## 🛠️ Tools Used

| Tool       | Purpose                          |
|------------|----------------------------------|
| **MySQL**  | Data import, cleaning, EDA       |
| **Tableau**| Data visualization, dashboard    |

---

## 🧹 Data Cleaning (SQL)

Key tasks performed:
- Checked for missing values per column
- Verified uniqueness of `Patient_ID`
- Handled NULLs using `CASE` statements
- Ensured correct data types for each field

Sample SQL for missing values:
```sql
SELECT
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
  ...
FROM hospital_data_staging;`
```
## 🔍 Data Exploration

- Distribution of gender, conditions and outcomes
- Average cost by procedure and condition
- Readmission rate
- Average Satisfaction
- Length of stay
- Top conditions by patient count and cost

## 📈 Tableau visualization

- Top 5 conditions by count
- Readmission rate
- Length of stay vws cost
- Patient count by gender
- Satisfaction by oucome
- Average cost per condition

## 📊 Tableau Dashboard Preview

🔗 [View Dashboard on Tableau Public](https://public.tableau.com/app/profile/favour.chukwudozie.ndu.arinze/vizzes) 

## 🔍 Key insight
- Readmission was higher among patients with cardiac and respiratory condition
- Neurology and orthopedics had the highest average treatment costs
- General Medicine had a lower cost range but the highest patient volume
- Slight majority of patients were female (524), but males had slightly higher costs on average, particularly in surgical procedures.
- Top 3 most frequent conditions: General Medicine, Orthopedics, and Cardiology.

## Recomendations
- Add more staffs or spaces to departments like general medicine that hae many patients
- Reduce readmissions by improving follow-up care after patients are discharged.
- Look into expensive treatments in Neurology and Orthopedics to find ways to cut costs.
- Shorten hospital stays where possible to lower overall treatment costs.
- Improve patient care for those who don’t recover to boost satisfaction scores.










