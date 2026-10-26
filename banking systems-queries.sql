use banking_system_db;

insert into branches (branch_id, branch_name, location) values 
(1, 'State Bank of India - Ameerpet', 'Hyderabad'),
(2, 'HDFC Bank - MG Road', 'Vijayawada'),
(3, 'ICICI Bank - MVP Colony', 'Visakhapatnam'),
(4, 'Axis Bank - RTC Road', 'Chilakaluripet');

insert into employees (branch_id, name, designation, salary) values 
(1, 'Rajesh Kumar', 'Branch Manager', 75000.00),
(1, 'Priya Sharma', 'Cashier', 45000.00),
(2, 'Venkat Rao', 'Branch Manager', 82000.00),
(2, 'Anusha Reddy', 'Loan Officer', 48000.00),
(3, 'Srinivas Murthy', 'Branch Manager', 78000.00),
(3, 'Deepthi Nair', 'Clerk', 42000.00),
(4, 'Ramesh Babu', 'Branch Manager', 65000.00),
(4, 'Swathi Varma', 'Assistant', 38000.00);

-- Insert Customers (Exactly 15 Customers, auto_increment for customer_id)
insert into customers (name, address, phone, email, dob) values 
('Aarav Patel', 'Hyderabad', '9848012345', 'aarav.patel@gmail.com', '1995-04-12'),
('Ananya Rao', 'Vijayawada', '9123456789', 'ananya.rao@yahoo.com', '2001-08-22'),
('Rohan Gupta', 'Visakhapatnam', '9988776655', 'rohan.g@outlook.com', '1990-12-05'),
('Sneha Reddy', 'Chilakaluripet', '9440112233', 'sneha.reddy@gmail.com', '1999-03-15'),
('Kiran Kumar', 'Hyderabad', '9700554433', 'kiran.k@gmail.com','2002-10-30'),
('Divya Sree', 'Guntur', '9866221100', 'divya.sree@gmail.com', '2002-01-30'),
('Vikram Singh', 'Vijayawada', '9500112233', 'vikram.singh@yahoo.com', '1994-11-11'),
('Meena Kumari', 'Visakhapatnam', '9490332211', 'meena.kumari@gmail.com', '1997-06-08'),
('Arjun Das', 'Hyderabad', '9393001122', 'arjun.das@gmail.com', '2000-09-25'),
('Lakshmi Priya', 'Tirupati', '9100223344', 'lakshmi.priya@outlook.com', '1996-02-14'),
('Manoj Kumar', 'Hyderabad', '9885112233', 'manoj.kumar@gmail.com', '1998-05-18'),
('Swathi Nambiar', 'Kochi', '9744556677', 'swathi.n@gmail.com', '1992-10-03'),
('Rahul Varma', 'Vijayawada', '9642113355', 'rahul.varma@yahoo.com', '1988-12-28'),
('Pooja Hegde', 'Mumbai', '9911223344', 'pooja.hegde@gmail.com', '2003-04-05'),
('Nikhil Siddharth', 'Hyderabad', '9849005566', 'nikhil.s@gmail.com', '1993-07-21');

update customers 
set phone = '9988998899' 
where customer_id = 1;


insert into accounts (customer_id, branch_id, account_type, balance, created_at) values 
(1, 1, 'Savings', 55000.50, '2023-01-10 10:30:00'),
(2, 2, 'Current', 120000.00, '2023-02-15 11:00:00'),
(3, 3, 'Savings', 42000.00, '2023-03-20 09:15:00'),
(4, 4, 'Savings', 85000.25, '2023-04-12 14:20:00'),
(5, 1, 'Current', 25000.00, '2023-05-05 16:45:00'),
(6, 2, 'Savings', 62000.00, '2023-06-18 13:10:00'),
(7, 3, 'Savings', 95000.00, '2023-07-01 10:05:00'),
(8, 4, 'Current', 15000.50, '2023-07-22 15:30:00'),
(9, 1, 'Savings', 48000.00, '2023-08-10 11:40:00'),
(10, 2, 'Savings', 78000.00, '2023-08-25 12:00:00'),
(11, 3, 'Current', 210000.00, '2023-09-05 09:30:00'),
(12, 4, 'Savings', 31000.00, '2023-09-15 14:15:00'),
(13, 1, 'Savings', 53000.00, '2023-10-01 10:20:00'),
(14, 2, 'Savings', 99000.75, '2023-10-10 11:50:00'),
(15, 3, 'Current', 450000.00, '2023-10-20 16:10:00');

update accounts 
set balance = balance + 5000.00 
where account_id = 1;

insert into transactions (account_id, amount, type, date) values 
(1, 5000.00, 'credit', '2026-01-02 10:00:00'),
(1, 2000.00, 'debit', '2026-01-05 14:30:00'),
(2, 25000.00, 'credit', '2026-01-06 11:15:00'),
(3, 1500.00, 'debit', '2026-01-10 09:45:00'),
(4, 10000.00, 'credit', '2026-01-12 16:20:00'),
(5, 5000.00, 'debit', '2026-01-15 12:00:00'),
(6, 12000.00, 'credit', '2026-01-18 15:10:00'),
(7, 3000.00, 'debit', '2026-01-20 10:35:00'),
(8, 8000.00, 'credit', '2026-01-22 13:25:00'),
(9, 4500.00, 'debit', '2026-01-25 11:50:00');

#delete from transactions where transaction_id = 10;
start transaction;
update accounts set balance = balance - 5000.00 where account_id = 2;
update accounts set balance = balance + 5000.00 where account_id = 1;
commit;

insert into loans (customer_id, amount, loan_type, interest_rate, start_date, end_date) values 
(1, 500000.00, 'Home Loan', 8.50, '2024-01-01', '2034-01-01'),
(2, 150000.00, 'Car Loan', 9.20, '2024-02-10', '2029-02-10'),
(3, 75000.00, 'Personal Loan', 11.00, '2024-03-15', '2027-03-15'),
(4, 300000.00, 'Education Loan', 7.50, '2024-04-01', '2031-04-01'),
(5, 1200000.00, 'Home Loan', 8.25, '2024-05-12', '2044-05-12'),
(6, 200000.00, 'Gold Loan', 9.00, '2024-06-20', '2025-06-20'),
(7, 50000.00, 'Personal Loan', 12.50, '2024-07-05', '2026-07-05'),
(8, 600000.00, 'Car Loan', 8.90, '2024-08-15', '2030-08-15'),
(9, 250000.00, 'Business Loan', 10.50, '2024-09-10', '2029-09-10'),
(10, 450000.00, 'Education Loan', 7.80, '2024-10-01', '2032-10-01'),
(11, 1000000.00, 'Home Loan', 8.40, '2024-10-20', '2039-10-20'),
(12, 180000.00, 'Gold Loan', 9.10, '2024-11-05', '2025-11-05');

