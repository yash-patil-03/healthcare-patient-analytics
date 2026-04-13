USE healthcare_db;

-- Total Patients
SELECT DISTINCT COUNT(PatientID) AS total_patients
FROM patients;

-- Total Doctors
SELECT DISTINCT COUNT(DoctorID) AS total_doctors
FROM doctors;

-- Total Visits
SELECT COUNT(VisitID) AS total_visits
FROM visits;

-- Total Lab Tests Conducted
SELECT COUNT(LabResultID) AS total_lab_tests
FROM lab_tests;

-- Total Revenue
SELECT ROUND(SUM(TreatmentCost), 2) AS total_revenue
FROM treatments;

-- Average Age of Patients
SELECT ROUND(AVG(Age)) AS avg_patient_age
FROM patients;

-- Follow-Up Rate (%)
SELECT 
    ROUND(SUM(FollowUpFlag) / COUNT(VisitID) * 100, 2) AS followup_rate_percent
FROM visits;

-- Treatment Cost Per Visit (Average)
SELECT 
    ROUND(AVG(TreatmentCost), 2) AS avg_treatment_cost_per_visit
FROM treatments;

-- Percentage of Abnormal Lab Results
SELECT
    ROUND(SUM(AbnormalFlag) / COUNT(LabResultID) * 100, 2) AS abnormal_lab_result_percent
FROM lab_tests;

-- Top 5 Diagnosed Conditions
SELECT 
    Diagnosis,
    COUNT(VisitID) AS total_patients
FROM visits
GROUP BY Diagnosis
ORDER BY total_patients DESC
LIMIT 5;

-- Doctor Workload 
-- Average Patients Per Doctor
SELECT 
    ROUND(COUNT(PatientID) / COUNT(DISTINCT DoctorID)) AS avg_patients_per_doctor
FROM visits;

-- Total Revenue by Year and Month
SELECT
    YEAR(v.VisitDate) AS year,
    MONTHNAME(MIN(v.VisitDate)) AS month,
    ROUND(SUM(t.TreatmentCost), 2) AS monthly_revenue
FROM treatments t
JOIN visits v ON t.VisitID = v.VisitID
GROUP BY YEAR(v.VisitDate), MONTH(v.VisitDate)
ORDER BY YEAR(v.VisitDate), MONTH(v.VisitDate);

-- Patients by Age Group 
SELECT 
	AgeGroup, 
	COUNT(PatientID) AS total_patients 
FROM patients 
GROUP BY AgeGroup 
ORDER BY total_patients DESC;

-- Lab Test Results Distribution
SELECT 
    TestResult,
    COUNT(LabResultID) AS total,
    ROUND(COUNT(LabResultID) / (SELECT COUNT(LabResultID) FROM lab_tests) * 100, 2) AS percentage
FROM lab_tests
GROUP BY TestResult
ORDER BY total DESC;

-- CREATED VIEW FOR THE PATIENT FULL PROFILE
CREATE VIEW vw_PatientFullProfile AS
SELECT 
    PatientID, FullName, Gender, Race, MaritalStatus, ChronicConditions, Age,
    CASE 
        WHEN ChronicConditions IS NULL THEN 'No'
        ELSE 'Yes'
    END AS HasChronicCondition
FROM patients;

SELECT * FROM vw_PatientFullProfile;

-- Data Summary
SELECT 
    p.FullName,
    v.VisitDate,
    v.ReasonForVisit,
    t.MedicationPrescribed,
    l.TestName,
    l.TestResult
FROM patients p
JOIN visits v ON p.PatientID = v.PatientID
LEFT JOIN treatments t ON v.VisitID = t.VisitID
LEFT JOIN lab_tests l ON v.VisitID = l.VisitID;