--Create a new tables for six csv tables
--Remember to specify data types, primary keys, foreign keys, and other constraints.
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM departments;

CREATE TABLE dept_emp (
	emp_no INT FOREIGN KEY,
	dept_no VARCHAR
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR FOREIGN KEY,
	emp_no INT FOREIGN KEY
);

SELECT * FROM dept_manager;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR FOREIGN KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

SELECT * FROM employees;

CREATE TABLE salaries (
	emp_no INT FOREIGN KEY,
	salary INT
);

SELECT * FROM salaries;

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM titles;

--1)List the following details of each employee: employee number, last name, first name, sex, and salary.

------FIRST JOIN dept_emp TO salaries ON dept_no
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
	INNER JOIN salaries 
	ON Salaries.emp_no=employees.emp_no
;

--2)List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/01/1986' AND '12/31/1986' 

--3)List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
	INNER JOIN dept_manager 
	ON dept_manager.dept_no=departments.dept_no
		INNER JOIN employees
		ON employees.emp_no=dept_manager.emp_no;

--4)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no=dept_emp.emp_no
		INNER JOIN departments
		ON departments.dept_no=dept_emp.dept_no;

--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
	WHERE employees.first_name LIKE 'Hercules' 
	AND employees.last_name LIKE 'B%';
	
	
--6)List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no=dept_emp.emp_no
		INNER JOIN departments
		ON departments.dept_no=dept_emp.dept_no
			WHERE departments.dept_name LIKE 'Sales';


--7)List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no=dept_emp.emp_no
		INNER JOIN departments
		ON departments.dept_no=dept_emp.dept_no
			WHERE departments.dept_name LIKE 'Development' 
			OR departments.dept_name LIKE 'Sales';


--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name) AS "Last_name_count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last_name_count" DESC;

