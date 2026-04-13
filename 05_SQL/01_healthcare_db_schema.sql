CREATE DATABASE healthcare_db;
USE healthcare_db;

CREATE TABLE visits (
    VisitID VARCHAR(100),
    PatientID VARCHAR(100),
    DoctorID VARCHAR(100),
    VisitDate DATE,
    Diagnosis VARCHAR(100),
    FollowUpRequired VARCHAR(100),
    VisitType VARCHAR(100),
    VisitStatus VARCHAR(100),
    DiagnosisCode VARCHAR(100),
    ReasonForVisit VARCHAR(100),
    PrescribedMedications VARCHAR(100),
    FollowUpFlag INT,
    VisitMonth INT,
    VisitYear INT
);

CREATE TABLE treatments (
    TreatmentID VARCHAR(100),
    VisitID VARCHAR(100),
    MedicationPrescribed VARCHAR(100),
    Dosage VARCHAR(100),
    Instructions VARCHAR(100),
    TreatmentCost FLOAT,
    TreatmentType VARCHAR(100),
    TreatmentName VARCHAR(100),
    Status VARCHAR(100),
    Cost FLOAT,
    Outcome VARCHAR(100),
    TreatmentDescription VARCHAR(100)
);

CREATE TABLE patients (
    PatientID VARCHAR(100),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Gender VARCHAR(100),
    DateOfBirth DATE,
    Age INT,
    PhoneNumber VARCHAR(100),
    Address VARCHAR(300),
    BloodType VARCHAR(100),
    EmergencyContact VARCHAR(100),
    InsuranceProvider VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    PolicyNumber VARCHAR(100),
    MedicalHistory VARCHAR(100),
    Race VARCHAR(100),
    Ethnicity VARCHAR(100),
    MaritalStatus VARCHAR(100),
    ChronicConditions VARCHAR(100),
    Allergies VARCHAR(100),
    ContactNumber VARCHAR(100),
    AgeGroup VARCHAR(100),
    FullName VARCHAR(100)
);

CREATE TABLE lab_tests (
    LabResultID VARCHAR(100),
    VisitID VARCHAR(100),
    TestName VARCHAR(100),
    TestDate VARCHAR(100),
    Units VARCHAR(100),
    Comments VARCHAR(100),
    TestResult VARCHAR(100),
    ReferenceRange VARCHAR(100),
    AbnormalFlag VARCHAR(100)
);

CREATE TABLE doctors (
    DoctorID VARCHAR(100),
    DoctorName VARCHAR(100),
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(100),
    YearsOfExperience INT,
    HospitalAffiliation VARCHAR(100),
    HospitalClinic VARCHAR(100),
    Email VARCHAR(100)
);