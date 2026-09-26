# Delivery Delay Analysis — Set A
**Student Name:** Devanshi Kanthariya  
**Student ID:** 8409
**Set:** A  

## Business Objective
1. Which service type has the greatest delivery delay burden?
2. Which hub needs priority attention?

## Dataset
| File | Description | Rows |
|---|---|---|
| data/raw/deliveries.csv | Fact table | 13 (12 after cleaning) |
| data/raw/routes.csv | Lookup table | 4 |

## Data Dictionary
| Column | Type | Description |
|---|---|---|
| record_id | Integer | Unique delivery record |
| month | Text | Month of delivery (Jan/Feb/Mar) |
| route_id | Text | Route identifier |
| hub | Text | Delivery hub city |
| promised_days | Integer | Promised delivery days |
| actual_days | Integer | Actual delivery days |
| delay_days | Integer | MAX(actual-promised, 0) |
| service_type | Text | Express or Standard |

## Cleaning Steps
- Removed exact duplicate row (record_id 12) from deliveries data
- Before: 13 rows, After: 12 rows
- delay_days = MAX(actual_days − promised_days, 0)
- Delay incidence rate = % of rows where actual_days > promised_days

## Tools Used
- Microsoft Excel 365
- MySQL 8.0
- Python 3.13 (pandas, matplotlib)
- Power BI Desktop

## Project Structure

delivery-delay-analysis/
├── data/raw/
├── excel/
├── sql/
├── python/
├── powerbi/
└── outputs/
└── sql/


## SQL Setup
1. Run sql/setup.sql first
2. Run sql/queries.sql second

## Python Setup
```bash
pip install -r requirements.txt
python python/analysis.py
```

## Excel Guide
- Raw: Original 13-row data
- Lookup: Routes reference data
- Clean: Deduplicated data with XLOOKUP and delay_days
- Summary: SUMIFS hub table, PivotTable, chart

## Power BI Refresh
After cloning, open dashboard.pbix and update the CSV path in Power Query to your local data/raw/ folder.

## Findings
1. Standard service type has 22 total delay days vs Express 12 — almost double
2. Mumbai is the top hub with 15 delay days, followed by Delhi with 14

## Recommendation
Prioritize route R4 (Rural Feeder) on Standard service — it alone accounts for 41.18% of all delay days.

## Cross-Tool Reconciliation
Standard service type total delay days = 22 across all four tools:
- Excel PivotTable: 22
- SQL S2a query: 22
- Python summary: 22
- Power BI bar chart: 22

## Video
URL: https://drive.google.com/file/d/1kbyl42NboerSTTZmaZDy5lBYJr3llDBh/view?usp=sharing 
