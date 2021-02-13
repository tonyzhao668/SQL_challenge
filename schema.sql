--Tony Zhao : homework for SQL_challenge 15/02/2021
--The query part in the file: employeesSQL.sql

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
