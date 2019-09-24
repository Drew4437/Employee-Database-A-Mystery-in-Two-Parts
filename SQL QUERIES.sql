--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name, employees_db.gender, 
salaries_db.salary
FROM employees_db
INNER JOIN salaries_db ON employees_db.emp_no = salaries_db.emp_no;

--2. List employees who were hired in 1986.
SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name
FROM employees_db
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--To prove right amount was returned:
SELECT COUNT(emp_no) FROM employees_db
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--Selected only active managers
SELECT * FROM departments_db
SELECT * FROM department_mgr_db
SELECT * FROM employees_db

SELECT departments_db.dept_no, departments_db.dept_name, 
department_mgr_db.emp_no,
employees_db.last_name, employees_db.first_name, 
department_mgr_db.from_date, department_mgr_db.to_date
FROM departments_db
INNER JOIN department_mgr_db ON departments_db.dept_no = department_mgr_db.dept_no
INNER JOIN employees_db ON employees_db.emp_no = department_mgr_db.emp_no
WHERE department_mgr_db.to_date = '9999-01-01';

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM department_emp_db
SELECT * FROM employees_db
SELECT * FROM departments_db

SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name, 
departments_db.dept_name
FROM employees_db
INNER JOIN department_emp_db ON employees_db.emp_no = department_emp_db.emp_no
INNER JOIN departments_db ON department_emp_db.dept_no = departments_db.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees_db.emp_no, employees_db.first_name, employees_db.last_name
FROM employees_db
WHERE employees_db.first_name = 'Hercules' AND employees_db.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name, 
departments_db.dept_name
FROM employees_db
INNER JOIN department_emp_db ON employees_db.emp_no = department_emp_db.emp_no
INNER JOIN departments_db ON department_emp_db.dept_no = departments_db.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name, 
departments_db.dept_name
FROM employees_db
INNER JOIN department_emp_db ON employees_db.emp_no = department_emp_db.emp_no
INNER JOIN departments_db ON department_emp_db.dept_no = departments_db.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*)
FROM employees_db
GROUP BY last_name;