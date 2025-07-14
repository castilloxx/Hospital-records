SELECT *
FROM hospital_data_analysis;

-- Creating a staging table to work with
CREATE TABLE hospital_data_staging
LIKE hospital_data_analysis;

SELECT *
FROM hospital_data_staging;

INSERT hospital_data_staging
SELECT *
FROM hospital_data_analysis;

SELECT *
FROM hospital_data_staging;

-- checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY patient_ID, Age, Gender, `Condition`, `Procedure`, Cost, length_of_stay, outcome, satisfaction ) AS row_num
FROM hospital_data_staging ;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY patient_ID, Age, Gender, `Condition`, `Procedure`, Cost, length_of_stay, outcome, satisfaction) AS row_num
FROM hospital_data_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- No duplicates

SELECT *
FROM hospital_data_staging;

SELECT DISTINCT patient_id 
FROM hospital_data_staging
ORDER BY 1;

-- checking for number of null or missing data

SELECT
  COUNT(*) AS Total_Rows,
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
  SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
  SUM(CASE WHEN `Condition` IS NULL THEN 1 ELSE 0 END) AS Missing_Condition,
  SUM(CASE WHEN `Procedure` IS NULL THEN 1 ELSE 0 END) AS Missing_Procedure,
  SUM(CASE WHEN Cost IS NULL THEN 1 ELSE 0 END) AS Missing_Cost,
  SUM(CASE WHEN Length_of_Stay IS NULL THEN 1 ELSE 0 END) AS Missing_Stay,
  SUM(CASE WHEN Readmission IS NULL THEN 1 ELSE 0 END) AS Missing_Readmission,
  SUM(CASE WHEN Outcome IS NULL THEN 1 ELSE 0 END) AS Missing_Outcome,
  SUM(CASE WHEN Satisfaction IS NULL THEN 1 ELSE 0 END) AS Missing_Satisfaction
FROM hospital_data_staging;

-- NO Null of missing data

-- EXPLORITARY DATA ANALYSIS

SELECT *
FROM hospital_data_staging;

SELECT gender,
COUNT(*) AS NUM_Patients
FROM hospital_data_staging
GROUP BY gender;

SELECT MIN(age) AS MIN_AGE,
MAX(age) AS MAX_AGE,
ROUND(AVG(age), 1) AVG_AGE
FROM hospital_data_staging;

SELECT `condition`, COUNT(*) AS patient_count
FROM hospital_data_staging
GROUP BY `condition`
ORDER BY patient_count DESC
LIMIT 10;

SELECT `Procedure`, COUNT(*) AS Total_Times_Performed
FROM hospital_data_staging
GROUP BY `Procedure`
ORDER BY Total_Times_Performed DESC
LIMIT 10;

SELECT `Condition`, ROUND(AVG(Cost), 2) AS Avg_Cost
FROM hospital_data_staging
GROUP BY `Condition`
ORDER BY Avg_Cost DESC;

SELECT
Patient_ID,
Cost,
Length_of_Stay,
ROUND(Cost / NULLIF(Length_of_Stay, 0), 2) AS Cost_Per_Day
FROM hospital_data_staging
ORDER BY Cost_Per_Day DESC
LIMIT 10;

SELECT
  Readmission,
  COUNT(*) AS Count,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM hospital_data_staging), 2) AS Percentage
FROM hospital_data_staging
GROUP BY Readmission;

SELECT `Condition`, Outcome, COUNT(*) AS Num_Cases
FROM hospital_data_staging
GROUP BY `Condition`, Outcome
ORDER BY `Condition`, Num_Cases DESC;

SELECT `Condition`, ROUND(AVG(Satisfaction), 2) AS Avg_Satisfaction
FROM hospital_data_staging
GROUP BY `Condition`
ORDER BY Avg_Satisfaction DESC;


