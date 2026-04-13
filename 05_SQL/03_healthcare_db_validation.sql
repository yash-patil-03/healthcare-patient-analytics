USE healthcare_db;

-- 1. DATA COUNT VALIDATION
SELECT COUNT(*) AS total_patients   FROM patients;
SELECT COUNT(*) AS total_visits     FROM visits;
SELECT COUNT(*) AS total_treatments FROM treatments;
SELECT COUNT(*) AS total_lab_tests  FROM lab_tests;
SELECT COUNT(*) AS total_doctors    FROM doctors;



-- 2. DATA COMPLETENESS CHECK
-- Identify missing or null values in key columns.
SELECT * FROM patients WHERE FirstName IS NULL OR LastName IS NULL;		-- Should return 0 rows
SELECT * FROM visits WHERE VisitType IS NULL OR VisitDate IS NULL;		-- Should return 0 rows
SELECT * FROM treatments WHERE TreatmentName IS NULL OR Status IS NULL;	-- Should return 0 rows
SELECT * FROM lab_tests WHERE TestName IS NULL OR TestResult IS NULL;	-- Should return 0 rows



-- 3. DATA CONSISTENCY CHECK
-- Verifies that foreign keys exist in the parent table
SELECT v.VisitID, v.PatientID
FROM visits v
LEFT JOIN patients p ON v.PatientID = p.PatientID
WHERE p.PatientID IS NULL;		-- Should return 0 rows

SELECT t.TreatmentID, t.VisitID
FROM treatments t
LEFT JOIN visits v ON t.VisitID = v.VisitID
WHERE v.VisitID IS NULL;		-- Should return 0 rows

SELECT l.LabResultID, l.VisitID
FROM lab_tests l
LEFT JOIN visits v ON l.VisitID = v.VisitID
WHERE v.VisitID IS NULL;		-- Should return 0 rows



-- 4. DUPLICATE RECORDS CHECK
SELECT PatientID, COUNT(*) AS count
FROM patients
GROUP BY PatientID
HAVING COUNT(*) > 1;

SELECT VisitID, COUNT(*) AS count
FROM visits
GROUP BY VisitID
HAVING COUNT(*) > 1;

SELECT TreatmentID, COUNT(*) AS count
FROM treatments
GROUP BY TreatmentID
HAVING COUNT(*) > 1;

SELECT LabResultID, COUNT(*) AS count
FROM lab_tests
GROUP BY LabResultID
HAVING COUNT(*) > 1;



-- 5. PERFORMANCE TEST (Query Execution Time)
EXPLAIN ANALYZE
SELECT * FROM visits
WHERE VisitDate BETWEEN '2023-01-01' AND '2023-12-31';