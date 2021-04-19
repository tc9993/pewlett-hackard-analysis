--Create retirement_titles table.  Find and return all titles of retirement eligible employees.
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles as t
		ON e.emp_no=t.emp_no
WHERE
	(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY
	e.emp_no
;

--Create unique_titles table.  Find and return each retirement eligible employees most current title only.
SELECT DISTINCT ON(e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO unique_titles
FROM employees AS e
	INNER JOIN titles as t
		ON e.emp_no=t.emp_no
WHERE
	(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY
	e.emp_no, t.to_date DESC
;

--Create retiring_titles table.  Calculate and return the total number of retirement eligible employees that hold a given title.
SELECT
	COUNT(ut.title),
	ut.title
INTO retiring_titles
FROM unique_titles AS ut
Group By
	ut.title
ORDER BY
	count DESC
;

--Create mentorship eligiblity table. Find and return all current employees born in the year 1965 and their title.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	INNER JOIN titles as t
		ON de.emp_no = t.emp_no
WHERE
	(de.to_date = '9999-01-01')
	AND
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY
	e.emp_no
;