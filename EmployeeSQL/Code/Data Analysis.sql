--List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	emp.sex,
	sal.salary
FROM employees AS emp
JOIN salaries AS sal ON emp.emp_no = sal.emp_no;



--List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT 
	first_name, 
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '31-12-1986'
	


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	man.emp_no AS manager_emp_no,
	dep.dept_no, 
	dep.dept_name, 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name
FROM dept_manager AS man
LEFT JOIN departments AS dep ON man.dept_no = dep.dept_no
LEFT JOIN employees AS emp ON man.emp_no = emp.emp_no;



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	depe.emp_no, 
	emp.last_name, 
	emp.first_name, 
	dep.dept_no, 
	dep.dept_name
FROM dept_emp AS depe
LEFT JOIN employees AS emp ON depe.emp_no = emp.emp_no
LEFT JOIN departments AS dep ON depe.dept_no = dep.dept_no;



--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name, 
	last_name, 
	sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';



--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name
FROM employees AS emp
LEFT JOIN dept_emp AS depe ON emp.emp_no = depe.emp_no
LEFT JOIN departments AS dep ON depe.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales';
	


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	dep.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS depe ON emp.emp_no = depe.emp_no
LEFT JOIN departments AS dep ON depe.dept_no = dep.dept_no
WHERE dep.dept_name IN ('Sales', 'Development');



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name, 
	COUNT(last_name) AS repeat
FROM employees
GROUP BY last_name
ORDER BY repeat DESC;