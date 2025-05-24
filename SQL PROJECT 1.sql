create database learn;
use learn;

-- Drop tables if they already exist
DROP TABLE IF EXISTS employees, departments;

-- Create Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_id INT
);

-- Insert Departments Data
INSERT INTO departments (dept_id, dept_name, manager_id) VALUES
(1, 'Technology', 201),
(2, 'Human Resources', 202),
(3, 'Marketing', 203),
(4, 'Finance', 204);

select* from departments;


-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert Employees Data
INSERT INTO employees (emp_id, name, dept_id, salary) VALUES
(101, 'Amit Sharma', 1, 80000),
(102, 'Priya Singh', 2, 60000),
(103, 'Raj Patel', 1, 75000),
(104, 'Sneha Verma', NULL, 50000),
(105, 'Kunal Joshi', 3, 70000),
(106, 'Ritika Iyer', 4, 65000),
(107, 'Aditya Mehra', NULL, 45000);
select * from departments;
select * from employees;

-- retrieve employees name along with their dept name
select * from employees
inner join departments on employees.dept_id = departments.dept_id;
-- by default inner join gets executed

select employees.emp_id, employees.name, employees.dept_id, employees.salary, departments.dept_name from employees
inner join departments on employees.dept_id = departments.dept_id;

select e.emp_id, e.name, e.dept_id, e.salary, d.dept_name from employees e
inner join departments d on e.dept_id = d.dept_id;

-- get all employees , including those without departments
select e.name,e.salary, d.dept_name from employees e
left join departments d on e.dept_id = d.dept_id;

-- show all departments even if no employee is assigned to them

select e.name, d.dept_name from employees e 
right join departments d on e.dept_id = d.dept_id;

-- get all the employees and departments even if no match exists

select e.name, d.dept_name from employees e
left join departments d on e.dept_id = d.dept_id
union all
select e.name, d.dept_name from employees e 
right join departments d on e.dept_id = d.dept_id;

-- Add manager_id column
ALTER TABLE employees ADD manager_id INT;

-- Update data with manager IDs (some dummy mappings)
UPDATE employees SET manager_id = 101 WHERE emp_id IN (102, 103);
UPDATE employees SET manager_id = 105 WHERE emp_id IN (104, 106);

select * from employees;
 -- get employees name and their manager names
 
select e.name as employee_name ,e.manager_id, m.name as manager_name
from employees e
left join employees m on e.manager_id = m.emp_id;

-- names of employees who works in the technology department
select e.name as employees_name, d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id
where d.dept_name = 'Technology';

-- find the total salary expense per department
select d.dept_name, sum(e.salary) as total_salary
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name;


-- 









