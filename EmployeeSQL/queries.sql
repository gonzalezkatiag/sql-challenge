SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employees; 
SELECT * FROM salaries; 
SELECT * FROM titles; 

-- 1. Employee number, last name, first name, sex, and salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary  
FROM employees emp
JOIN salaries sal
ON (emp.emp_no = sal.emp_no);

-- 2. First name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01/01/1986' AND hire_date <= '12/31/1986';

-- 3. Department number, department name, the manager's employee number, last name, first name
SELECT dep.dept_no, dep.dept_name, dep_mgr.emp_no, emp.last_name, emp.first_name
FROM dept_manager dep_mgr
INNER JOIN departments dep ON dep_mgr.dept_no = dep.dept_no
INNER JOIN employees emp ON dep_mgr.emp_no = emp.emp_no;

-- 4. Employee number, last name, first name, and department name
SELECT de.emp_no,emp.last_name,emp.first_name,dep.dept_name
FROM dept_emp de
INNER JOIN departments dep ON de.dept_no = dep.dept_no
INNER JOIN employees emp ON de.emp_no = emp.emp_no;

-- 5. First name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';

-- 6. All employees in the Sales department: employee number, last name, first name, and department name
SELECT dep_e.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM departments dep
INNER JOIN dept_emp dep_e ON dep.dept_no=dep_e.dept_no
INNER JOIN employees emp ON dep_e.emp_no=emp.emp_no
WHERE dep.dept_name='Sales';

-- 7. All employees in the Sales *AND* Development departments: employee number, last name, first name, and department name
SELECT dep_e.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM departments dep
INNER JOIN dept_emp dep_e ON dep.dept_no=dep_e.dept_no
INNER JOIN employees emp ON dep_e.emp_no=emp.emp_no
WHERE dep.dept_name='Development' OR dep.dept_name='Sales';

-- 8. In descending order: the frequency count of employee last names (i.e., how many employees share each last name)
SELECT last_name, COUNT(last_name) AS COUNT
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;