# BankDBSQL - Turkish Version

## 📌 Project Overview
This repository contains SQL scripts for managing a banking database system in Turkish. The database includes tables for customers, accounts, transactions, loans, and other banking operations.

## 📂 Project Structure
**BankDBSQL-turkish-version/** 
```bash
│── README.md                  # Project documentation
│── data/                      # Contains table data insertion scripts
│   ├── Hesap.sql              # Account management
│   ├── Iletisim.sql           # Customer contact details
│   ├── Islem.sql              # Transaction history
│   ├── KrediBasvurusu.sql     # Loan applications
│   ├── KrediKarti.sql         # Credit card details
│   ├── KrediOdeme.sql         # Loan payment records
│   ├── Musteri.sql            # Customer details
│   ├── MusteriProfil.sql      # Customer profiles
│   ├── Personel.sql           # Bank staff details
│   ├── Sigorta.sql            # Insurance data
│   ├── Sikayet.sql            # Customer complaints
│   ├── Sube.sql               # Bank branches
│
│── schema/                    # Contains database structure scripts
│   ├── alter-drop.sql         # Modify and drop tables
│   ├── create-tables.sql      # Table creation
│   ├── index.sql              # Indexes for performance
│   ├── select.sql             # Example queries to retrieve data from the database
│   ├── stored-procedure.sql   # Stored procedures
│   ├── transaction.sql        # Transaction handling
│   ├── trigger.sql            # Triggers for automation
│   ├── update-delete.sql      # SQL script to modify and delete records
│   ├── views.sql              # View definitions

```

## 🚀 How to Use
### 1. Clone the repository:
```sh
git clone https://github.com/msewal/BankDBSQL-turkish-version.git
cd BankDBSQL-turkish-version
```
### 2. Setup the database:
* Run **_create-tables.sql_** to create the required tables.
* Use scripts from the **_data/_** directory to insert sample records.
* Execute **_index.sql_** to optimize database queries.
* If needed, run **_stored-procedure.sql_** and **_trigger.sql_** for additional functionality.
### 3. Testing Queries:
* Use **_select.sql_** to execute example queries and retrieve data.
* Modify **_update-delete.sql_** to test SQL commands for updating and deleting records.

## 📌 Features
* ✅ Structured banking database schema
* ✅ SQL scripts for various banking functionalities
* ✅ Stored procedures, triggers, and transactions for automation

## 📬 Contact
🐙 GitHub: [https://github.com/msewal/BankDBSQL/tree/turkish-version](https://github.com/msewal/BankDBSQL/tree/turkish-version)
