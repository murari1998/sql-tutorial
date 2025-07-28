use employees;
show tables;

select * from employees;

-- q1=>-- get those employee information whosse year of hirning is same as hiring year of employee number 1002
-- q2=>-- get the employee number ,birth date full name of the person whose birth date is > birth date among all
--  the birth date of the employee 1003 to 10006

select year(hire_date) from employees where emp_no = 10002;

select * from employees where year(hire_date)=(select year(hire_date) from employees where emp_no = 10002); 
--                   
select * from employees;
select * from titles;
select * from departments;


-- q=> -- get the emp_no first name and title for all those emp who are currentiy working on the senior enginneer position==title
-- q=> -- get the emp name and birh date for a person who has started working in 1986.
-- q=> -- get all the emp informatio only for that emp who have work on more 3 and more position
-- q=> -- 


SELECT a.emp_no, a.first_name, b.title
FROM employees AS a
JOIN titles AS b ON a.emp_no = b.emp_no
WHERE b.title = 'Senior Engineer'
  AND b.to_date = '9999-01-01';
  
  select emp_no,first_name,birth_date from employees
  where year(hire_date)=1986;
  
 SELECT a.*
FROM employees AS a
JOIN (
    SELECT emp_no
    FROM titles
    GROUP BY emp_no
    HAVING COUNT(DISTINCT title) > 3
) AS t ON a.emp_no = t.emp_no;


-- -------- ---- --- --- ---- -- ----------------

select * from employees;
select * from dept_emp;
select * from departments;

-- que=> get the employee number and first_name and depy_no for the employee from employee table and dept_emp;

select a.emp_no,a.first_name,b.dept_no from employees as a 
join dept_emp as b
on a.emp_no =b.emp_no;

select * from salaries;

-- ccorrelated subqoueries ----------------------
select * from salaries as sal
where salary > (select avg(salary) from salaries as s 
           where sal.emp_no=s.emp_no);
           
           
           SELECT s.emp_no
FROM salaries s
JOIN (
    SELECT emp_no, AVG(salary) AS avg_salary
    FROM salaries
    GROUP BY emp_no
    HAVING AVG(salary) > 10001
) AS avg_salaries ON s.emp_no = avg_salaries.emp_no
WHERE s.salary > avg_salaries.avg_salary;



create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);


--  find employee who earn more then the avg salary of their salary
select * from employees;

select * from employees as emp1
where salary > 
(select avg(salary) from employees as emp2 where emp1.deptid=emp2.deptid);

-- list department where at lest one employee earn more then 60000.
select * from Departments;

select  deptid,deptname from Departments as d
where exists (select deptid from employees as e where d.deptid=e.deptid and e.salary >60000);

-- find employee who have the highest salary in their ddepartment..alter

select * from employees as e
where salary >= (select max(salary)from employees as inn where e.deptid=inn.deptid);




-- -------------------------------------------------------------------
-- DQL --=> WINDDOW FUNCTION 
-- -----------------------------

use sakila;

select * from payment;

select customer_id,customer_id,amount from payment;

select avg(amount) from payment;


select customer_id,payment_id,amount,
avg(amount) over() from payment;

select payment_id,customer_id,amount,
avg(amount) over(),
avg(amount) over(partition by customer_id) from payment;

select customer_id,payment_id,amount,
avg(amount) over(),
sum(amount) over(),
avg(amount) over(partition by customer_id) from payment;

-- runing sum------------------


select customer_id,payment_id,amount,
sum(amount) over(order by  customer_id) from payment;

select customer_id,payment_id,amount,
sum(amount) over(order by  customer_id) from payment;




use employees;
select * from salaries;

-- get the emp_no ,the salary,the total salay and avg salary and the total sum of salary
-- grt the emp_no,year of hiring,salary,along with the avg salary of emp from salaries table
-- get the emp_no salay and the running salary ffor each customer from the salary table

select emp_no,salary,
sum(salary) over(),
avg(salary) over(),
from salaries;


  




