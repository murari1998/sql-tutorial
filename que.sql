
-- 2. Find each employee’s manager (if any).
-- 3. Calculate average salary per department.
-- 4. Find employees who earn more than the average salary of their department.
-- 5. Show each employee with manager name, department, and whether they earn
-- above their department average.
-- 6. Find the highest-paid employee(s) in each department using a subquery

-- answer 2  =>-- 2. Find each employee’s manager (if any).
select e.emp_name,e.emp_id,m.emp_name as manger_name,e.manager_id from employees as e
left join employees as m
on m.emp_id=e.manager_id;

-- answer3>=-- 3. Calculate average salary per department.
select d.dept_name,avg(e.salary) from departments as d 
join employees as e 
on e.dept_id=d.dept_id
group by d.dept_name;

-- nd method--
select dept_id,avg(salary) from employees
group by dept_id;

-- answer4=>-- 4. Find employees who earn more than the average salary of their department.

select emp_name from employees as e where e.salary
>  (select avg(salary) from employees as e2 where e.dept_id=e2.dept_id);

-- answer5---- 5. Show each employee with manager name, department, and whether they earn
-- above their department average.

select e.emp_name,m.emp_name as manager,d.dept_name  from employees as e
left join employees as m
on e.manager_id=m.emp_id
join departments as d
on d.dept_id=e.dept_id where e.salary > (select avg(e.salary) from employees as e2 where e.dept_id=e2.dept_id );


