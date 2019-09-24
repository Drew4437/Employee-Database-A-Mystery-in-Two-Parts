CREATE TABLE employees_db (
  emp_no INT NOT NULL PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR (30),
  last_name VARCHAR (30),
  gender VARCHAR (1),
  hire_date DATE
);


CREATE TABLE departments_db (
  dept_no VARCHAR NOT NULL PRIMARY KEY,
  dept_name VARCHAR (30)
);


CREATE TABLE department_emp_db (
  emp_no INT,
  dept_no VARCHAR,
  from_date DATE,
  to_date DATE
);

SELECT * FROM department_mgr_db

CREATE TABLE department_mgr_db (
  dept_no VARCHAR,
  emp_no INT,
  from_date DATE,
  to_date DATE
);

CREATE TABLE titles_db (
  emp_no INT,
  title VARCHAR (30),
  from_date DATE,
  to_date DATE
);

CREATE TABLE salaries_db (
  emp_no INT,
  salary INT,
  from_date DATE,
  to_date DATE
);

SELECT * FROM salaries_db

SELECT employees_db.emp_no, employees_db.last_name, employees_db.first_name, employees_db.gender, 
salaries_db.salary
FROM employees_db
INNER JOIN salaries_db ON employees_db.emp_no = salaries_db.emp_no;