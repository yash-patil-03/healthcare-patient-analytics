# Run this code in any Python IDE
# Fist run this in terminal "pip install pandas sqlalchemy pymysql openpyxl"

import pandas as pd
from sqlalchemy import create_engine

# Change "pass" to your MySQL password
engine = create_engine("mysql+pymysql://root:5269@localhost/healthcare_db")

# List of sheet names (must match both Excel sheet names and MySQL table names)
sheets = ["visits", "treatments", "patients", "lab_tests", "doctors"]

# Change the path below to your actual Excel file location
xl = pd.read_excel(r"E:\Projects\healthcare-patient-analytics\03_Master File\healthcare_master_clean.xlsx", sheet_name=None)

for sheet in sheets:
    xl[sheet].to_sql(sheet, con=engine, if_exists="append", index=False)
    print(f"{sheet} loaded")

print("All sheets loaded successfully!")