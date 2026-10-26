create database banking_system_db;
use banking_system_db;

create table customers (
    customer_id int auto_increment primary key,
    name varchar(100) not null,
    address varchar(200),
    phone varchar(10),
    email varchar(50) unique,
    dob date
);
ALTER TABLE customers 
MODIFY COLUMN phone VARCHAR(10) NOT NULL;


create table branches (
    branch_id int primary key,
    branch_name varchar(100) not null,
    location varchar(50)
);


create table accounts (
    account_id int auto_increment primary key,
    customer_id int not null,
    branch_id int not null,
    account_type varchar(20),
    balance decimal(12,2) check (balance >= 0),
    created_at datetime,
    foreign key (customer_id) references customers(customer_id) on delete restrict,
    foreign key (branch_id) references branches(branch_id)
);

create table transactions (
    transaction_id int auto_increment primary key,
    account_id int not null,
    amount decimal(12,2) not null,
    type enum('credit', 'debit') not null,
    date datetime,
    foreign key (account_id) references accounts(account_id) on delete cascade
);

create table loans (
    loan_id int auto_increment primary key,
    customer_id int not null,
    amount decimal(12,2) not null,
    loan_type varchar(50),
    interest_rate decimal(5,2),
    start_date date,
    end_date date,
    foreign key (customer_id) references customers(customer_id) on delete cascade
);


create table employees (
    employee_id int auto_increment primary key,
    branch_id int not null,
    name varchar(100) not null,
    designation varchar(50),
    salary decimal(10,2),
    foreign key (branch_id) references branches(branch_id)
);

#alter table customers add column loyalty_points int default 0;
#alter table customers drop column loyalty_points;

#rename table loans to customer_loans;
#rename table customer_loans to loans;

#truncate table transactions;

#drop table if exists temporary_table_name;