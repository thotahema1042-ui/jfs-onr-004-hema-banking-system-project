use banking_system_db;

# 1. Display all records from the Customers table.
select * from customers;

# 2. Display the name, phone number, and email of all customers.
select name, phone, email from customers;

# 3. Display all customers who are from Hyderabad.
select * from customers where address = 'Hyderabad';

# 4. Display all accounts whose account_type is Savings.
select * from accounts where account_type = 'Savings';

# 5. Display all accounts having a balance greater than ₹50,000.
select * from accounts where balance > 50000.00;

#6. Display all transactions where the transaction type is credit.
select * from transactions where type = 'credit';

#7. Display all employees whose salary is greater than ₹40,000.
select * from employees where salary > 40000.00;

# 8. Display all customers born after 1998-01-01.
select * from customers where dob > '1998-01-01';

# 9. Display all accounts in descending order of their balance.
select * from accounts order by balance desc;

#10. Find the total number of customers in the bank.
select count(*) as total_customers from customers;

#11. Find the total balance of all accounts.
select sum(balance) as total_balance from accounts;

#12. Find the average account balance.
select avg(balance) as average_balance from accounts;

# 13. Find the highest and lowest account balance.
select max(balance) as highest_balance, min(balance) as lowest_balance from accounts;

# 14. Display the number of accounts for each account_type.
select account_type, count(*) as account_count from accounts group by account_type;

#15. Display each account type and its total balance, but show only account types whose total balance is greater than ₹80,000.
select account_type, sum(balance) as total_balance from accounts group by account_type having sum(balance) > 80000.00;

#16. Display the customer name, account ID, account type, and balance using Customers and Accounts.
select c.name, a.account_id, a.account_type, a.balance 
from customers c 
join accounts a on c.customer_id = a.customer_id;

#17. Display the customer name, transaction ID, transaction amount, and transaction type using Customers, Accounts, and Transactions.
select c.name, t.transaction_id, t.amount, t.type 
from customers c 
join accounts a on c.customer_id = a.customer_id 
join transactions t on a.account_id = t.account_id;

# 18. Display the customer name, loan type, loan amount, and interest rate using Customers and Loans.
select c.name, l.loan_type, l.amount, l.interest_rate 
from customers c 
join loans l on c.customer_id = l.customer_id;

# 19. Display the employee name, designation, branch name, and branch location using Employees and Branches.
select e.name, e.designation, b.branch_name, b.location 
from employees e 
join branches b on e.branch_id = b.branch_id;

#20. Display the names of customers whose account balance is greater than the average balance of all accounts.
select distinct c.name 
from customers c 
join accounts a on c.customer_id = a.customer_id 
where a.balance > (select avg(balance) from accounts);

