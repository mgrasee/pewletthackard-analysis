select e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
--INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE 
(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') ORDER BY e.emp_no ASC

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
--INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(*) as count, title
--into retiring_titles
from unique_titles group by title order by count desc

select distinct on (e.emp_no) e.emp_no,
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
--into mentorship_eligibilty
from employees as e
left join dept_emp as de
on (e.emp_no = de.emp_no)
left join titles as t
on (e.emp_no = t.emp_no)
where de.to_date = '9999-01-01'
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') ORDER BY e.emp_no ASC