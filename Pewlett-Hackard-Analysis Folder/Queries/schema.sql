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
	title INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no)
);

Create Table Dept_Emp (
	dept_no INT NOT NULL,
	emp_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign Key (emp_no) References departments (dept_no),
	Primary Key (dept_no)
); 