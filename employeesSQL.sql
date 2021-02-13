--Please notice my schema.sql and my queries all together
--Tony Zhao : homework for SQL_challenge 15/02/2021

DROP TABLE IF EXISTS department

CREATE TABLE department(
	--id SERIAL PRIMARY KEY,
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY(dept_no)
);

SELECT * FROM department

DROP TABLE IF EXISTS dept_emp

CREATE TABLE dept_emp(
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY(emp_no, dept_no)
);

SELECT * FROM dept_emp

DROP TABLE IF EXISTS dept_manager

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager

DROP TABLE IF EXISTS employees

CREATE TABLE employees(
	emp_no VARCHAR NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex	VARCHAR,
	hire_date VARCHAR,
	PRIMARY KEY(emp_no, emp_title_id)	
);

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE
USING to_date(hire_date, 'MM:DD:YYYY');


SELECT * FROM employees

SELECT * FROM employees

DROP TABLE IF EXISTS salaries
CREATE TABLE salaries(
	emp_no VARCHAR NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM salaries

DROP TABLE IF EXISTS titles
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY(title_id)
);

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT s.emp_no, e.last_name, e.first_name, sex, s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';

SELECT * FROM employees

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM department d
JOIN dept_manager dm
	ON d.dept_no = dm.dept_no
	JOIN employees e
		ON dm.emp_no = e.emp_no;
		
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de 
JOIN employees e
	ON e.emp_no = de.emp_no
	JOIN department d
		ON de.dept_no = d.dept_no;
		
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, (SELECT dept_name FROM department WHERE dept_name ='Sales') AS dept
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_emp
				WHERE dept_no IN (SELECT dept_no FROM department 
								 WHERE dept_name = 'Sales'));
SELECT * FROM department	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e
	ON de.emp_no = e.emp_no
	JOIN department d
		ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS num
FROM employees
GROUP BY last_name 
ORDER BY num DESC;

