-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.employee_id, e.last_name, e.first_name, e.sex, s.salary 
FROM employee as e 
  JOIN salary as s on e.employee_id = s.employee_id
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986
;


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.department_id, d.department_name, e.employee_id AS "Manager ID", e.last_name, e.first_name
FROM employee e
 JOIN department_manager m ON e.employee_id = m.employee_id
 JOIN department d ON d.department_id = m.department_id
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.employee_id, e.last_name, e.first_name, d.department_name
FROM employee e
  JOIN department_employee de on e.employee_id = de.employee_id
  JOIN department d ON de.department_id = d.department_id 
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.employee_id, e.last_name, e.first_name, d.department_name
FROM employee e
  JOIN department_employee de ON e.employee_id = de.employee_id
  JOIN department d ON de.department_id = d.department_id
WHERE d.department_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.employee_id, e.last_name, e.first_name, d.department_name
FROM employee e
  JOIN department_employee de ON e.employee_id = de.employee_id
  JOIN department d ON de.department_id = d.department_id
WHERE d.department_name IN ('Sales', 'Development')
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(1) as count_last_name
FROM employee
GROUP BY last_name
ORDER BY count_last_name DESC
;
