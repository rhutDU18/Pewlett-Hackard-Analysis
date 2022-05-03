
-- Number of titles retiring
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS ce
	INNER JOIN titles AS ti
		ON(ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ce.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title 
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no DESC;

--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table
SELECT r.emp_no,
	r.first_name,
	r.last_name,
	r.title,
	r.to_date
INTO rec_emp_title
FROM retirement_titles AS r

-- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM rec_emp_title
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;


-- Write another query to retrieve the number of employees by their most recent job title who are about to retire First, retrieve the number of titles from the Unique Titles table.
SELECT u.emp_no,
	u.title
--INTO retiring_titles
FROM unique_titles AS u

-- Group the table by title, then sort the count column in descending order.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;



-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON(e.emp_no = de.emp_no)
		INNER JOIN titles AS ti
		ON(e.emp_no = ti.emp_no)
WHERE (de.to_date ='9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;