--Deliverable 1-Query#1: Titles of employees whose birth_date is between 1952-1955
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no= t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Query #2: Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Query #3: retiring_titles: 
SELECT COUNT(title) AS "count",
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Deliverable #2: Employees Eligible for Mentorship Program: 
--Mentorship-eligibility table that holds the current employees birth_date 1965 and 1965.
SELECT DISTINCT ON(e.emp_no)
e.emp_no,
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_employees AS de
		ON (e.emp_no= de.emp_no)
	INNER JOIN titles AS t
		ON(e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND(t.to_date = '9999-01-01')
ORDER BY e.emp_no;


