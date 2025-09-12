use murari;

CREATE TABLE EmployeeSales (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO EmployeeSales VALUES
(1, 'Alice', 'Sales', 5000, '2025-01-05'),
(2, 'Bob', 'Sales', 7000, '2025-01-12'),
(3, 'Charlie', 'HR', 4500, '2025-01-07'),
(4, 'David', 'HR', 6000, '2025-01-10'),
(5, 'Eva', 'IT', 8000, '2025-01-15'),
(6, 'Frank', 'IT', 7500, '2025-01-20'),
(7, 'Grace', 'Sales', 6500, '2025-01-22'),
(8, 'Hank', 'IT', 9000, '2025-01-25'),
(9, 'Ivy', 'HR', 5000, '2025-01-28'),
(10, 'Jack', 'Sales', 7200, '2025-01-30');


select * from employeesales;
-- quection on window function  :

-- (1).Find each employee’s salary rank within their department.

select *,
rank() over(partition by department order by sale_amount desc) from employeesales;

-- (2).Find running total (cumulative sales) per department ordered by sale_date.

select *,
sum(sale_amount) over(partition by department order by sale_date) from employeesales; 

-- (3).-Find department-wise highest sale amount (show against every employee).

select *,
max(sale_amount) over(partition by department ) from employeesales;

-- (4).-Find difference between employee’s sale and department average sale.

select *,
sale_amount-avg(sale_amount) over(partition by department) from employeesales;


-- (5)-Find 2nd highest sale in each department.

with ccte as
(select *,
rank() over(partition by department order by sale_amount desc)as `rnk` from employeesales)

select * from ccte where rnk=2;


-- (6)-Show previous employee’s sale in same department (using LAG).

select *,
lag(sale_amount) over(partition by department order by sale_date) from employeesales; 


-- (7)-Show next employee’s sale in same department (using LEAD).

select *,
lead(sale_amount) over(partition by department order by sale_amount) from employeesales;


-- (8)-Find employees whose sales are above the department average.

with cte as 
(select *,
avg(sale_amount) over(partition by department) as `dep_avg` from employeesales)

select * from cte where sale_amount > dep_avg; 


-- (9)-Find total sales contribution % of each employee in their department.

select *,
round(sale_amount *100/
sum(sale_amount) over(partition by department),2) from employeesales;

