INSERT INTO tblStaff (StaffID, DepartmentID, FirstName, LastName, IDNumber, BirthDate, Gender, Position, Salary, StartDate)
VALUES
-- Main Department (DepartmentID = 1)
    (1, 1, 'John', 'Doe', '12345678901', '1985-03-15', 'Male', 'Department Manager', 12000.00, '2015-05-01'),
    (2, 1, 'Emma', 'Smith', '12345678902', '1990-07-10', 'Female', 'Bank Clerk', 8000.00, '2018-03-15'),
    (3, 1, 'William', 'Johnson', '12345678913', '1987-09-15', 'Male', 'Cashier', 7500.00, '2020-02-01'),
    (4, 1, 'James', 'Williams', '12345678925', '1995-04-12', 'Male', 'Bank Clerk', 8200.00, '2021-07-01'),
    (5, 1, 'Sophia', 'Brown', '12345678926', '1998-06-18', 'Female', 'Cashier', 7600.00, '2022-09-01'),

-- London Department (DepartmentID = 2)
    (6, 2, 'David', 'Miller', '12345678903', '1982-11-25', 'Male', 'Department Manager', 12500.00, '2012-11-20'),
    (7, 2, 'Olivia', 'Davis', '12345678904', '1988-09-12', 'Female', 'Bank Clerk', 8000.00, '2019-08-12'),
    (8, 2, 'Ava', 'Wilson', '12345678914', '1993-04-05', 'Female', 'Cashier', 7000.00, '2021-08-01'),
    (9, 2, 'Liam', 'Moore', '12345678927', '1994-02-17', 'Male', 'Bank Clerk', 8100.00, '2022-05-01'),
    (10, 2, 'Isabella', 'Taylor', '12345678928', '1996-11-10', 'Female', 'Cashier', 7500.00, '2023-01-15'),

-- Manchester Department (DepartmentID = 3)
    (11, 3, 'Ethan', 'Anderson', '12345678915', '1984-06-12', 'Male', 'Department Manager', 12000.00, '2016-07-15'),
    (12, 3, 'Mason', 'Thomas', '12345678905', '1995-02-05', 'Male', 'Bank Clerk', 7500.00, '2021-06-01'),
    (13, 3, 'Charlotte', 'Martinez', '12345678924', '1997-08-10', 'Female', 'Cashier', 7500.00, '2022-06-01'),
    (14, 3, 'Jackson', 'Garcia', '12345678929', '1993-09-15', 'Male', 'Bank Clerk', 8000.00, '2020-12-01'),
    (15, 3, 'Amelia', 'Rodriguez', '12345678930', '1998-01-20', 'Female', 'Cashier', 7200.00, '2023-04-01'),

-- Bristol Department (DepartmentID = 4)
    (16, 4, 'Madison', 'Hernandez', '12345678906', '1992-01-30', 'Female', 'Department Manager', 13000.00, '2017-10-01'),
    (17, 4, 'Sebastian', 'Lopez', '12345678916', '1990-11-10', 'Female', 'Bank Clerk', 8000.00, '2019-05-15'),
    (18, 4, 'Lily', 'Gonzalez', '12345678918', '1995-01-25', 'Female', 'Cashier', 7000.00, '2021-10-01'),
    (19, 4, 'Daniel', 'Nelson', '12345678931', '1988-03-28', 'Male', 'Bank Clerk', 7800.00, '2020-01-01'),
    (20, 4, 'Ava', 'Garcia', '12345678932', '1994-12-10', 'Female', 'Cashier', 7200.00, '2023-06-01'),

-- Oxford Department (DepartmentID = 5)
    (21, 5, 'Henry', 'Martinez', '12345678907', '1987-12-17', 'Male', 'Department Manager', 8500.00, '2020-01-10'),
    (22, 5, 'Elijah', 'Perez', '12345678917', '1989-12-20', 'Male', 'Bank Clerk', 8000.00, '2020-06-10'),
    (23, 5, 'Grace', 'Sanchez', '12345678923', '1993-02-20', 'Female', 'Cashier', 7500.00, '2021-01-15'),
    (24, 5, 'Lucas', 'Roberts', '12345678933', '1995-05-15', 'Male', 'Bank Clerk', 7700.00, '2021-10-01'),
    (25, 5, 'Maya', 'Johnson', '12345678934', '1997-03-05', 'Female', 'Cashier', 7100.00, '2022-08-01'),

-- Liverpool Department (DepartmentID = 6)
    (26, 6, 'Ella', 'Lopez', '12345678908', '1993-04-20', 'Female', 'Department Manager', 7500.00, '2021-05-01'),
    (27, 6, 'Oliver', 'Davis', '12345678920', '1991-03-15', 'Male', 'Bank Clerk', 7500.00, '2022-03-01'),
    (28, 6, 'Jack', 'Miller', '12345678921', '1988-05-30', 'Male', 'Bank Clerk', 7800.00, '2021-02-01'),
    (29, 6, 'Sophia', 'Wilson', '12345678935', '1995-11-25', 'Female', 'Cashier', 7100.00, '2022-11-01'),
    (30, 6, 'Liam', 'Moore', '12345678936', '1994-02-14', 'Male', 'Bank Clerk', 7300.00, '2023-04-01'),

-- Sheffield Department (DepartmentID = 7)
    (31, 7, 'Ethan', 'Clark', '12345678909', '1980-10-08', 'Male', 'Department Manager', 14000.00, '2010-03-12'),
    (32, 7, 'Daniel', 'Baker', '12345678919', '1982-07-15', 'Male', 'Bank Clerk', 13500.00, '2008-04-20'),
    (33, 7, 'James', 'Adams', '12345678911', '1985-08-10', 'Male', 'Bank Clerk', 8100.00, '2021-08-01'),
    (34, 7, 'Megan', 'Scott', '12345678937', '1990-06-15', 'Female', 'Cashier', 7400.00, '2023-03-01'),
    (35, 7, 'Emily', 'Garcia', '12345678938', '1996-09-25', 'Female', 'Cashier', 7000.00, '2022-10-01'),

-- Birmingham Department (DepartmentID = 8)
    (36, 8, 'Charlotte', 'Harris', '12345678912', '1991-03-18', 'Female', 'Department Manager', 13500.00, '2020-12-01'),
    (37, 8, 'Madeline', 'Clark', '12345678922', '1996-09-05', 'Female', 'Bank Clerk', 8000.00, '2021-12-15'),
    (38, 8, 'Joshua', 'Martinez', '12345678939', '1989-07-10', 'Male', 'Bank Clerk', 8100.00, '2021-05-01'),
    (39, 8, 'Avery', 'Young', '12345678940', '1993-08-12', 'Female', 'Cashier', 7300.00, '2022-07-01'),
    (40, 8, 'Mason', 'Allen', '12345678941', '1995-01-10', 'Male', 'Cashier', 7200.00, '2023-02-01'),

-- Brighton Department (DepartmentID = 9)
    (41, 9, 'Henry', 'Wright', '12345678942', '1981-04-18', 'Male', 'Department Manager', 12500.00, '2018-01-10'),
    (42, 9, 'Abigail', 'King', '12345678943', '1990-11-22', 'Female', 'Bank Clerk', 7800.00, '2021-09-01'),
    (43, 9, 'Thomas', 'Garcia', '12345678944', '1987-03-05', 'Male', 'Bank Clerk', 7700.00, '2022-05-01'),
    (44, 9, 'Megan', 'Martinez', '12345678945', '1992-08-30', 'Female', 'Cashier', 7300.00, '2023-03-01'),
    (45, 9, 'Joshua', 'Perez', '12345678946', '1995-05-12', 'Male', 'Cashier', 7200.00, '2022-12-01'),

-- Cambridge Department (DepartmentID = 10)
    (46, 10, 'Gabriel', 'Morris', '12345678947', '1983-12-07', 'Male', 'Department Manager', 13000.00, '2019-08-01'),
    (47, 10, 'Catherine', 'Lee', '12345678948', '1992-02-27', 'Female', 'Bank Clerk', 7900.00, '2020-09-01'),
    (48, 10, 'Ryan', 'Wilson', '12345678949', '1986-06-15', 'Male', 'Bank Clerk', 8000.00, '2021-04-01'),
    (49, 10, 'Chloe', 'Jackson', '12345678950', '1994-01-25', 'Female', 'Cashier', 7400.00, '2023-02-01'),
    (50, 10, 'Zoe', 'Davis', '12345678951', '1996-03-14', 'Female', 'Cashier', 7100.00, '2022-11-01');

