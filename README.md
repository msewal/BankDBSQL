#BankDBSQL - Turkish Version   
📌 ##Project Overview

This repository contains SQL scripts for managing a banking database system in Turkish. The database includes tables for customers, accounts, transactions, loans, and other banking operations.

📂 ##Project Structure
'
**BankDBSQL-turkish-version/**
│── README.md                 # Project documentation
│── data/                     # Contains table data insertion scripts
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
│   ├── select.sql             # Query examples
│   ├── stored-procedure.sql   # Stored procedures
│   ├── transaction.sql        # Transaction handling
│   ├── trigger.sql            # Triggers for automation
│   ├── update-delete.sql      # Update and delete operations
│   ├── views.sql              # View definitions
'

🚀 ##How to Use
###1. Clone the repository:
'''
_git clone https://github.com/msewal/BankDBSQL-turkish-version.git_
_cd BankDBSQL-turkish-version_
'''

##2. Setup the database:
2.1. Run **create-tables.sql** to create the required tables.

2.2. Use scripts from the **data/** directory to insert sample records.

2.3. Execute **index.sql** to optimize database queries.

2.4. If needed, run **stored-procedure.sql** and **trigger.sql** for additional functionality.

##3. Testing Queries:
Use **select.sql** to execute example queries and retrieve data.

Modify **update-delete.sql** to test SQL commands for updating and deleting records.

📌 ##Features
✅ Structured banking database schema
✅ SQL scripts for various banking functionalities
✅ Stored procedures, triggers, and transactions for automation

📬 ##Contact
🐙 GitHub: ---https://github.com/msewal/BankDBSQL/tree/turkish-version---
