DROP TABLE IF EXISTS title CASCADE;
CREATE TABLE title (
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR(50)
);

DROP TABLE IF EXISTS employee CASCADE;
CREATE TABLE employee (
  employee_id INTEGER PRIMARY KEY,
  title_id VARCHAR(5),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR,
  hire_date DATE
);

DROP TABLE IF EXISTS salary CASCADE;
CREATE TABLE salary (
  employee_id INTEGER REFERENCES employee(employee_id),
  salary INTEGER
);

DROP TABLE IF EXISTS department CASCADE;
CREATE TABLE department (
  department_id VARCHAR(4) PRIMARY KEY,
  department_name VARCHAR(50)
);

DROP TABLE IF EXISTS department_employee CASCADE;
CREATE TABLE department_employee (
  employee_id INTEGER REFERENCES employee(employee_id),
  department_id VARCHAR(4) REFERENCES department(department_id)
);

DROP TABLE IF EXISTS department_manager CASCADE;
CREATE TABLE department_manager(
  department_id VARCHAR(4) REFERENCES department(department_id),
  employee_id INTEGER REFERENCES employee(employee_id)
);