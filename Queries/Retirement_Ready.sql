Retirement_Ready.sql

--Retirement_ready Query: Birth_date starting from 1956 January-December
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_ready
FROM employees AS e
JOIN titles AS t
ON (e.emp_no= t.emp_no)
WHERE (e.birth_date BETWEEN '1956-01-01' AND '1956-12-31')
ORDER BY e.emp_no;

--Retirement_ready_unique: Removing duplications: 
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO retirement_ready_unique
FROM retirement_ready
ORDER BY emp_no, to_date DESC;

--Qualified retirement_ready employees who can help mentor the next generation. 
SELECT COUNT(title) AS "count",
title
INTO retirement_ready_titles
FROM retirement_ready_unique
GROUP BY title
ORDER BY count DESC;

--Query created to find out the count for qualified mentorship_eligibility program 
SELECT COUNT(title) AS "count",
title
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;
