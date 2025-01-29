INSERT INTO tblATMTransactions (ATMTransactionID, AccountID, TransactionType, TransactionDate, TransactionAmount, ATMNumber)
VALUES
-- Main Department (ATM_Main1, ATM_Main2)
    (1, 1, 'Withdraw', '2023-03-01', 500.00, 'ATM_Main1'),
    (2, 1, 'Deposit', '2023-03-02', 1000.00, 'ATM_Main2'),
    (3, 4, 'Withdraw', '2023-03-03', 700.00, 'ATM_Main1'),
    (4, 4, 'Deposit', '2023-03-04', 800.00, 'ATM_Main2'),
    (5, 4, 'Bill Payment', '2023-03-05', 400.00, 'ATM_Main1'),
    (6, 5, 'Withdraw', '2023-03-06', 600.00, 'ATM_Main2'),
    (7, 5, 'Deposit', '2023-03-07', 1500.00, 'ATM_Main1'),
    (8, 5, 'Bill Payment', '2023-03-08', 300.00, 'ATM_Main2'),
    (9, 5, 'Withdraw', '2023-03-09', 800.00, 'ATM_Main1'),
    (10, 5, 'Deposit', '2023-03-10', 500.00, 'ATM_Main2'),

-- London Department (ATM_London1, ATM_London2)
    (11, 7, 'Withdraw', '2023-03-01', 450.00, 'ATM_London1'),
    (12, 7, 'Deposit', '2023-03-02', 600.00, 'ATM_London2'),
    (13, 9, 'Withdraw', '2023-03-03', 700.50, 'ATM_London1'),
    (14, 9, 'Deposit', '2023-03-04', 1000.00, 'ATM_London2'),
    (15, 9, 'Bill Payment', '2023-03-05', 350.00, 'ATM_London1'),
    (16, 10, 'Withdraw', '2023-03-06', 800.00, 'ATM_London2'),
    (17, 10, 'Deposit', '2023-03-07', 900.00, 'ATM_London1'),
    (18, 10, 'Bill Payment', '2023-03-08', 400.00, 'ATM_London2'),
    (19, 10, 'Withdraw', '2023-03-09', 750.00, 'ATM_London1'),
    (20, 10, 'Deposit', '2023-03-10', 1000.00, 'ATM_London2'),

-- Manchester Department (ATM_Manchester1, ATM_Manchester2)
    (21, 13, 'Withdraw', '2023-03-01', 500.00, 'ATM_Manchester1'),
    (22, 13, 'Deposit', '2023-03-02', 1200.00, 'ATM_Manchester2'),
    (23, 14, 'Withdraw', '2023-03-03', 700.00, 'ATM_Manchester1'),
    (24, 14, 'Deposit', '2023-03-04', 900.00, 'ATM_Manchester2'),
    (25, 14, 'Bill Payment', '2023-03-05', 450.00, 'ATM_Manchester1'),
    (26, 16, 'Withdraw', '2023-03-06', 850.00, 'ATM_Manchester2'),
    (27, 16, 'Deposit', '2023-03-07', 1000.00, 'ATM_Manchester1'),
    (28, 16, 'Bill Payment', '2023-03-08', 500.00, 'ATM_Manchester2'),
    (29, 16, 'Withdraw', '2023-03-09', 400.00, 'ATM_Manchester1'),
    (30, 16, 'Deposit', '2023-03-10', 700.00, 'ATM_Manchester2'),

-- Bristol Department (ATM_Bristol1, ATM_Bristol2)
    (31, 17, 'Withdraw', '2023-03-01', 600.00, 'ATM_Bristol1'),
    (32, 17, 'Deposit', '2023-03-02', 500.00, 'ATM_Bristol2'),
    (33, 19, 'Withdraw', '2023-03-03', 450.00, 'ATM_Bristol1'),
    (34, 19, 'Deposit', '2023-03-04', 300.00, 'ATM_Bristol2'),
    (35, 19, 'Bill Payment', '2023-03-05', 750.00, 'ATM_Bristol1'),
    (36, 20, 'Withdraw', '2023-03-06', 850.00, 'ATM_Bristol2'),
    (37, 20, 'Deposit', '2023-03-07', 1000.00, 'ATM_Bristol1'),
    (38, 20, 'Bill Payment', '2023-03-08', 400.00, 'ATM_Bristol2'),
    (39, 20, 'Withdraw', '2023-03-09', 750.00, 'ATM_Bristol1'),
    (40, 20, 'Deposit', '2023-03-10', 1000.00, 'ATM_Bristol2'),

-- Oxford Department (ATM_Oxford1, ATM_Oxford2)
    (41, 21, 'Withdraw', '2023-03-01', 400.00, 'ATM_Oxford1'),
    (42, 21, 'Deposit', '2023-03-02', 700.00, 'ATM_Oxford2'),
    (43, 22, 'Withdraw', '2023-03-03', 600.00, 'ATM_Oxford1'),
    (44, 22, 'Deposit', '2023-03-04', 800.00, 'ATM_Oxford2'),
    (45, 22, 'Bill Payment', '2023-03-05', 350.00, 'ATM_Oxford1'),
    (46, 23, 'Withdraw', '2023-03-06', 750.00, 'ATM_Oxford2'),
    (47, 23, 'Deposit', '2023-03-07', 900.00, 'ATM_Oxford1'),
    (48, 23, 'Bill Payment', '2023-03-08', 450.00, 'ATM_Oxford2'),
    (49, 23, 'Withdraw', '2023-03-09', 1000.00, 'ATM_Oxford1'),
    (50, 23, 'Deposit', '2023-03-10', 500.00, 'ATM_Oxford2');

-- Continue with the rest of the branches following the same format

