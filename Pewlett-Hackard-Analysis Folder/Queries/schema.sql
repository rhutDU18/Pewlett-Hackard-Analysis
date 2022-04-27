-- Creating tables for PH-EmployeeDB
 Create Table departments (
 	dept_no VARCHAR(4) Not NUll,
	 dept_name VARCHAR(40) Not NULL,
	 Primary Key (dept_no),
	 UNIQUE (dept_name)
);

Create Table employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	Primary Key (emp_no)
);


Create Table dept_manager (
dept_no VARCHAR(4) NOT NUll,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) References employees (emp_no),
FOREIGN KEY (dept_no) References departments (dept_no),
	Primary key (emp_no, dept_no)
);
select * from employees 


Create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no) 
);

select * from departments; 

Create Table Titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no, title, from_date)
);

Create Table Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign Key (dept_no) References departments (dept_no),
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (dept_no, emp_no)
);



SELECT * FROM titles; --completed
SELECT * FROM dept_emp; -- completed
SELECT * FROM salaries; -- completed
SELECT * FROM departments; --completed
SELECT * FROM employees; --completed
SELECT * FROM dept_manager; --completed 

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT count(*)
FROM Salaries

-- Retirement eligibility
SELECT COUNT(first_name)
FROM  employees
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-1' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT * FROM retirement_info;

