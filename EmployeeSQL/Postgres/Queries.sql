-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- 2) List employees who were hired in 1986.
SELECT * 
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
CREATE TABLE join1 AS
SELECT dept_manager.dept_no, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, employees.first_name, employees.last_name
FROM employees
INNER JOIN dept_manager ON
dept_manager.emp_no=employees.emp_no;

CREATE TABLE join2 AS
SELECT join1.dept_no, departments.dept_name, join1.emp_no, join1.last_name, join1.first_name, join1.from_date, join1.to_date
FROM departments
INNER JOIN join1 ON
join1.dept_no=departments.dept_no;

SELECT * FROM join2

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE TABLE join3 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no;

SELECT * FROM join3

CREATE TABLE join4 AS
SELECT join3.emp_no, join3.last_name, join3.first_name, departments.dept_name
FROM departments
INNER JOIN join3 ON
join3.dept_no=departments.dept_no;

SELECT * FROM join4

-- 5)List all employees whose first name is "Hercules" and last names begin with "B."

CREATE TABLE Hercules1 AS
SELECT first_name, last_name
FROM employees 
WHERE first_name = 'Hercules' 

CREATE TABLE Hercules2 AS
SELECT first_name, last_name
FROM Hercules1
WHERE last_name LIKE 'B%'

SELECT * FROM Hercules2

-- 6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE TABLE sales_staff AS
SELECT emp_no, last_name, first_name, dept_name
FROM join4 
WHERE dept_name = 'Sales' 

SELECT * FROM sales_staff

-- 7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE TABLE sales_dev_staff AS
SELECT * FROM join4
WHERE dept_name IN ('Sales', 'Development')

SELECT * FROM sales_dev_staff

--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE TABLE employee_freq AS
 Select last_name, count(*)
 From employees
 Group By last_name
 ORDER BY count DESC;
 
 SELECT * FROM employee_freq

