create database banking_managementdb;

use banking_managementdb;

create table Customers(
customer_id int primary key,
firstName varchar(50),
lastName varchar(50),
gender varchar(10),
city varchar(20),
phone varchar(15)
);

INSERT INTO Customers
(customer_id, firstName, lastName, gender, city, phone)
VALUES
(1, 'Arun', 'Kumar', 'Male', 'Chennai', '9876501001'),
(2, 'Priya', 'Sharma', 'Female', 'Madurai', '9876501002'),
(3, 'Karthik', 'Raj', 'Male', 'Coimbatore', '9876501003'),
(4, 'Divya', 'Lakshmi', 'Female', 'Trichy', '9876501004'),
(5, 'Sanjay', 'Kumar', 'Male', 'Salem', '9876501005'),
(6, 'Meena', 'Devi', 'Female', 'Tirunelveli', '9876501006'),
(7, 'Rahul', 'Das', 'Male', 'Chennai', '9876501007'),
(8, 'Nisha', 'Rani', 'Female', 'Erode', '9876501008'),
(9, 'Vignesh', 'Babu', 'Male', 'Madurai', '9876501009'),
(10, 'Anitha', 'Mary', 'Female', 'Vellore', '9876501010');

create table Accounts(
account_id int primary key,
customer_id int,
accountType varchar(20),
balance decimal(12,2),
branchName varchar(20),
accountStatus varchar(20),
foreign key (customer_id) references Customers(customer_id));

INSERT INTO Accounts
(account_id, customer_id, accountType, balance, branchName, accountStatus)
VALUES
(101, 1, 'Savings', 25000.00, 'Chennai Main', 'Active'),
(102, 2, 'Current', 75000.00, 'Madurai Main', 'Active'),
(103, 3, 'Savings', 18000.00, 'Coimbatore', 'Active'),
(104, 4, 'Savings', 32000.00, 'Trichy Main', 'Active'),
(105, 5, 'Current', 90000.00, 'Salem Main', 'Active'),
(106, 1, 'Fixed Deposit', 50000.00, 'Chennai Main', 'Active'),
(107, 6,  'Savings', 12000.00, 'Tirunelveli', 'Active'),
(108, 7, 'Savings', 45000.00, 'Chennai Main', 'Inactive'),
(109, 8, 'Current', 60000.00, 'Erode Main', 'Active'),
(110, 3, 'Savings', 22000.00, 'Coimbatore', 'Active');

create table Transactions(
transaction_id int primary key,
account_id int,
transactionType varchar(20),
amount decimal(12,2),
transactionDate date,
description varchar(100),
foreign key (account_id) references Accounts(account_id)
);

INSERT INTO Transactions
(transaction_id, account_id, transactionType, amount,
 transactionDate, description)
VALUES
(1001, 101, 'Deposit', 5000.00, '2026-10-01', 'Salary deposit'),
(1002, 101, 'Withdrawal', 2000.00, '2026-10-02', 'ATM withdrawal'),
(1003, 102, 'Deposit', 15000.00, '2026-10-03', 'Business income'),
(1004, 103, 'Withdrawal', 3000.00, '2026-10-04', 'Shopping'),
(1005, 104, 'Deposit', 8000.00, '2026-10-05', 'Cash deposit'),
(1006, 105, 'Withdrawal', 10000.00, '2026-10-06', 'Supplier payment'),
(1007, 106, 'Deposit', 20000.00, '2026-10-07', 'Fixed deposit'),
(1008, 107, 'Withdrawal', 1500.00, '2026-10-08', 'Personal expenses'),
(1009, 101, 'Deposit', 2500.00, '2026-10-09', 'Additional savings'),
(1010, 110, 'Withdrawal', 4000.00, '2026-10-10', 'Online payment');

-- Customers: missing last name and phone
INSERT INTO Customers
(customer_id, firstName, lastName, gender, city, phone)
VALUES
(11, 'Suresh', NULL, 'Male', 'Chennai', NULL);

-- Accounts: missing balance and branch name
INSERT INTO Accounts
(account_id, customer_id, accountType, balance, branchName, accountStatus)
VALUES
(111, 11, 'Savings', NULL, NULL, 'Active');

-- Transactions: missing amount and description
INSERT INTO Transactions
(transaction_id, account_id, transactionType, amount,
 transactionDate, description)
VALUES
(1011, 111, 'Deposit', NULL, '2026-10-11', NULL);

select * from Customers;
select * from Accounts;
select * from Transactions;

-- INNER JOIN
select
	Accounts.account_id,
    Accounts.accountType,
    Customers.firstName,
    Customers.lastName
from Accounts
inner join Customers
	on Accounts.customer_id = Customers.customer_id;

-- LEFT JOIN

select
	Accounts.account_id,
    Accounts.accountType,
    Customers.firstName,
    Customers.lastName
from Accounts
left join Customers
	on Accounts.customer_id = Customers.customer_id;

-- RIGHT JOIN

select
	Accounts.account_id,
    Accounts.accountType,
    Customers.firstName,
    Customers.lastName
from Accounts
right join Customers
	on Accounts.customer_id = Customers.customer_id;
    
-- FULL JOIN

select
	Accounts.account_id,
    Accounts.accountType,
    Customers.firstName,
    Customers.lastName
from Accounts
left join Customers
	on Accounts.customer_id = Customers.customer_id

UNION

select
	Accounts.account_id,
    Accounts.accountType,
    Customers.firstName,
    Customers.lastName
from Accounts
right join Customers
	on Accounts.customer_id = Customers.customer_id;

-- SELF JOIN

select 
	s.accountType as savings,
    c.accountType as current
from Accounts s
left join Accounts c 
	on s.account_id = c.account_id;
	
-- CROSS JOIN

select
	Customers.firstName,
	Customers.lastName,
    Accounts.accountType
from Customers
cross join Accounts;



