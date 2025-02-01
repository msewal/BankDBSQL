CREATE TABLE tblAccount (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber NVARCHAR(20) UNIQUE,
    AccountType NVARCHAR(30),
    Balance DECIMAL(18,2),
    CreationDate DATETIME,
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblATMTransactions (
    ATMTransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType NVARCHAR(50),
    TransactionDate DATETIME,
    TransactionAmount DECIMAL(18,2),
    ATMNumber NVARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES tblAccount(AccountID)
);

CREATE TABLE tblComplaint (
    ComplaintID INT PRIMARY KEY,
    CustomerID INT,
    ComplaintDate DATETIME,
    ComplaintSubject NVARCHAR(255),
    ComplaintStatus NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblContact (
    ContactID INT PRIMARY KEY,
    CustomerID INT,
    Subject NVARCHAR(100),
    Message NVARCHAR(1000),
    SendDate DATETIME,
    Status NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblCreditCard (
    CreditCardID INT PRIMARY KEY,
    CustomerID INT,
    CardNumber NVARCHAR(16) UNIQUE,
    CardType NVARCHAR(50),
    ExpiryDate DATETIME,
    CVV NVARCHAR(3),
    CreditLimit DECIMAL(18,2),
    AvailableCreditLimit DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblCustomer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    IDNumber NVARCHAR(11) UNIQUE,
    BirthDate DATE,
    Gender NVARCHAR(10),
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(15),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    PostalCode NVARCHAR(10),
    Nationality NVARCHAR(50),
    AccountStatus NVARCHAR(20)
);

CREATE TABLE tblCustomerProfile (
    ProfileID INT PRIMARY KEY,
    CustomerID INT,
    IncomeInformation DECIMAL(18,2),
    Occupation NVARCHAR(50),
    MaritalStatus NVARCHAR(20),
    MonthlyExpenses DECIMAL(18,2),
    AnnualIncome DECIMAL(18,2),
    Description NVARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    PhoneNumber NVARCHAR(15)
);

CREATE TABLE tblStaff (
    StaffID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    IDNumber NVARCHAR(11),
    BirthDate DATE,
    Gender NVARCHAR(10),
    Position NVARCHAR(50),
    Salary DECIMAL(18,2),
    StartDate DATETIME,
    FOREIGN KEY (DepartmentID) REFERENCES tblDepartment(DepartmentID)
);

CREATE TABLE tblInsurance (
    InsuranceID INT PRIMARY KEY,
    CustomerID INT,
    InsuranceType NVARCHAR(50),
    StartDate DATETIME,
    EndDate DATETIME,
    PremiumAmount DECIMAL(18,2),
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblLoanApplication (
    ApplicationID INT PRIMARY KEY,
    CustomerID INT,
    ApplicationDate DATETIME,
    LoanAmount DECIMAL(18,2),
    Term INT,
    InterestRate DECIMAL(5,2),
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES tblCustomer(CustomerID)
);

CREATE TABLE tblLoanPayment (
    PaymentID INT PRIMARY KEY,
    ApplicationID INT,
    PaymentDate DATETIME,
    PaymentAmount DECIMAL(18,2),
    RemainingDebt DECIMAL(18,2),
    FOREIGN KEY (ApplicationID) REFERENCES tblLoanApplication(ApplicationID)
);

CREATE TABLE tblTransaction (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType NVARCHAR(50),
    TransactionAmount DECIMAL(18,2),
    TransactionDate DATETIME,
    Description NVARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES tblAccount(AccountID)
);