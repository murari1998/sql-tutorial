use sakila;

select * from actor;
select * from film_actor;

-- natural 



-- inner join  
-- where 
-- on
-- using

-- 1>
select a.actor_id,a.first_name,fa.film_id from actor as a
join film_actor as fa where a.actor_id=fa.actor_id;

-- 2>

select a.actor_id,a.first_name,fa.film_id from actor as a
inner join film_actor as fa on a.actor_id=fa.actor_id;

-- 3>

select a.actor_id,a.first_name,fa.film_id from actor as a
inner join film_actor as fa using (actor_id);

-- ------------------------
select a.first_name,count(fa.film_id) from actor as a
join film_actor as fa where a.actor_id=fa.actor_id
group by a.first_name;

--  

select * from actor;
select * from film_actor;
select * from film;

select a.actor_id,a.first_name,fa.film_id,f.title from actor as a
inner join film_actor as fa
on a.actor_id = fa.actor_id 
inner join film as f
on fa.film_id=f.film_id;

select a.actor_id,a.first_name,fa.film_id,f.title from actor as a
join film_actor as fa
join film as f
where a.actor_id = fa.actor_id and fa.film_id=f.film_id;



use world;

select * from city;
select * from country;

select name,district from city
where district not like '%noord%';


SELECT district, COUNT(city) FROM city
GROUP BY district
HAVING COUNT(city) > 2;

select * from city;
select * from country;

select c.name,c.countrycode,co.name
from city as c
inner join country as co 
on c.countrycode = co.code where co.population>50000;

select co.name, c.district , SUM(co.population) from
country AS co
inner join
city as c on c.countrycode = co.code
group by co.name, c.district;


select continent,count(*) from country where indepyear > 1920
group by continent;


-- avg  surface ,totoal population , avg(life expactancy),total continent



-- focus on self join ,outer join(left join)

-- genrel function

use world;

-- if else 
  
select code,name,
if(name="aruba","terror country", if(name="angola","terrorist","turism")),
indepyear from country;


select code,name,
 case
    when name="aruba" then "terror country"
    when name="angola" then "terrorist"
 else "turism" 
 end as "status"
 from country;
 
 -- que> country ka naam a se start hoga (countrry with a ) s(countrry wwith s )
 
 select code,name,
 case
    when name like 'a%' then "country with s"
    when name like 's' then "country with s"
 else "country with another name" 
 end as "status"
 from country;
 
 
 
 -- ifnull----------
 
 select name,indepyear,ifnull(indepyear,0) from country;
 
 select count(indepyear),count(ifnull(indepyear,0)) from country;
 
-- nullif

select name,continent,nullif(length(name),length(continent)) from country;


select name,population,
  case 
      when population >200000 then "developed country" 
      when population >100000 then "developing country"
  else "under country"
  end as countrystaus
  from country;
  
  
  -- subquery --
  -- query( subquery ))
  
  
  use world;
  select population from city where name="batna";
  select name,population from city where population > 183377;
  
  -- subquery==
  
    select name,population from city where population >(select population from city where name ="batna");
 
 
 
 -- get the name of the city where the district is same as of the district aamstrerdam
 
 select district from city where name="amsterdam";
 
 select name, district from city where district ='Noord-Holland' ;
 
 select name, district from city where district =(select district from city where name="amsterdam"); 
 
 
 
 select * from country;
 
 
 -- get the country code and country name where the continenct match with continect of albania

-- get the continect the name of the country where the life expentancy matches with the life expentancy if the country with the cook island

 #QUE--3 get the country code and the continent an gnp value for the countries where the region does nto match wtih the region of the country name is benin
select code, continent, gnp from country
where region <> (
    select region
    from country
    where name = 'Benin'
);


-- nested qquery / subquery
-- single row query

-- multi row subquery--

select * from country;
-- i need to get the country name and the population for all the countrys available in the continent name as europe.

select name from country where continent = "europe";

select name,population,continent from country where name in (select name from country where continent = "europe");


-- i need to get the country name and code where the lifeexpentancy match with the lifeexpantact of country name as bahamas;

select * from country;

select name,code from country where lifeexpectancy in (select lifeexpectancy from country where name ="bahmaas");


use sakila;

select * from payment;
-- find the payment id ,customer name,amount where amount iss same of payment id =5;

select amount from payment where payment_id=5;

select payment_id,customer_id,amount from payment where amount=(select amount from payment where payment_id=5);

-- multirow ssubquery

select payment_id,customer_id,amount from payment where amount in (select amount from payment where payment_id=2 or payment_id=3);

select payment_id,customer_id,amount from payment where amount =any (select amount from payment where payment_id=2 or payment_id=3);

-- >any == grether then the minimum value of subquery

select payment_id,customer_id,amount from payment where amount >any (select amount from payment where payment_id=2 or payment_id=3);

select payment_id,customer_id,amount from payment where amount <any (select amount from payment where payment_id=2 or payment_id=3);

 select payment_id,customer_id,amount from payment where amount <all (select amount from payment where payment_id=2 or payment_id=3);
 
 select payment_id,customer_id,amount from payment where amount >all (select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);
 
 
 -- get teh name of the country whose population is > the population among the continent name america.
 use world;
 select * from world.country;
 
 select name from country where population >all (select population from country where continent='north america');
 
 -- gget the countrycode the name of the country whose lifeexpatnacy same as for the country from europe.
 
 select code ,name from country where lifeexpectancy =any (select lifeexpectancy from country where continent='europe');
 
 -- get the name and continent for the country who have got there independence near by the independence year of the country from asia.
 
 select name,continent from country where indepyear >any (select indepyear from country where continent='asia');
 
  select continent,count(*) from country where indepyear >any (select indepyear from country where continent='asia')
  and continent!='asia'
  group by continent;
  
  
select name,population ,(select population from country where name='anguilla') from country;

select name,population ,(select population from country where name='anguilla'),
(population/(select population from country where name='anguilla'))*100 from country;

use regex1;
select * from departments;
select * from employees;


select empid,empname,deptid,salary from employees
where (salary,deptid) in 
          (select avg(salary),deptid from employees group by deptid );


-- using join

select e1.empid,e1.empname,e1.deptid,e1.salary from employees as e1
where e1.salary  >
                    (select avg(salary) from employees as e2 where e1.deptid=deptid);
	
    
-- ------------------------------------------------------------------------------
use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);
 
 
 select * from students;
 select * from courses;
 select * from enrollments;
 
 select s.studentid,s.studentname,s.department,c.coursename from students as s
 join enrollments as e
 on s.studentid=e.studentid
 join courses as c
 on e.courseid=c.courseid;
 
 --
 
 select s.studentname,avg(e.grade) from students as s
 join enrollments as e
 on s.studentid=e.studentid
 group by s.studentname;
 
 -- 
 use sakila;
 select * from payment;
select * from customer;
 -- get the paymentid.customer name,the month the last working day of month where thee amount spend by the customer is greter 
 -- then the avg(amount) spended by the user itself only after the year 2004
 
 
 use sakila;
 
-- -------------------------------------------------------

-- ddl statement with constraints
-- constraints
-- rule apply to table -- accuratre  -- invalis restrict

-- not null constaraint-- -----------

use regex1;

create table test1(id int,salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null);  -- error here
insert into test1 values(null,4520);

select * from test1;

-- ----------------------
-- default--    

create table test2(id int default 0,salary int not null);
insert into test2 values(10,900);
insert into test2(salary) values(1881);

-- unique ---------------------------------

create table test3(id int, salary int default 100 unique);
insert into test3 values(10,900);
insert into test3 values(11,900);   -- error here 
insert into test3(id) values(199999991);

insert into test3(id) values(20012);

select * from test3;


-- primary constraint-- ----------------

create table test4(id int primary key, salary int);
insert into test4 values(10,900);
insert into test4 values(10,900);   -- error here 
insert into test4(id) values(null);  -- error

select * from test4;

-- foreign key-- --------

create table courses1(course_id int primary key,cname varchar(20));
insert into courses1 values(10,"dsa"),(11,"python");
select * from courses1;


create table studentinfo(id int primary key, sname varchar(20),
courseid int,
foreign key (courseid) references courses1(course_id));

insert into studentinfo values(1,"tushar",10);
insert into studentinfo values(2,"aman",11);
insert into studentinfo values(3,"subham",13);  -- error because couseid 13 nahi ha


select * from studentinfo;


-- ------------
create table collage(sid int,sname varchar(20),sclass int,
primary key(sid,sname));

describe collage;

-- datatypre--   ----


use regex1;



select * from yash1;

-- tiny int (1 byte) 
-- small int (2 byte)    mediumbyte(3 byte)
-- bigint(2**64)


create table yash2(name char(10));
insert into yash2 values('abc');
insert into yash2 values('a bc   ');

select name ,char_length(name) from yash2;


-- varchar ----

create table yash3(name varchar(10));
insert into yash3 values('abc');
insert into yash3 values('a bc   ');

select name ,char_length(name) from yash3;

-- date -----

create table yash4(dob date);
insert into yash4 values(curdate());
insert into yash4 values('2026-01-30');   -- yy-mm-dd
insert into yash4 values('2026-13-3');     -- innnccorrect

select * from yash4;

--
create table yash5(dob timestamp);
insert into yash5 values(now());

select * from yash5;

-- float--

create table yash6(salary float);
insert into yash6 values(10.2),(10.8527496);

select * from yash6;

create table yash7(salary double);   -- double(5,2)   = input-45.2587457   outut= 45.25 
insert into yash7 values(45.852741852);

select * from yash7;

create table yash8(salary double(5,2));   -- double(5,2)   5-total digit ,2-decimal ke baad = input-45.2587457   outut= 45.25 
insert into yash8 values(45.852741852);
insert into yash8 values(10.2);
insert into yash8 values(10.234);
insert into yash8 values(10325);
insert into yash8 values(103.4587962);

select * from yash8;

-- ------------------------------------
create database test;
use test;

– SQL query to create table
-- Create Orders Table

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
amount DECIMAL(10,2)
);
-- Insert 25 Records
INSERT INTO Orders (order_id, customer_id, order_date, amount) VALUES

(1, 101, '2024-01-05', 250.00),
(2, 102, '2024-01-15', 400.00),
(3, 101, '2024-02-10', 180.00),
(4, 103, '2024-02-12', 500.00),
(5, 102, '2024-03-01', 700.00),
(6, 101, '2024-03-05', 300.00),
(7, 104, '2024-03-20', 150.00),
(8, 103, '2024-04-01', 450.00),
(9, 105, '2024-04-15', 320.00),
(10, 101, '2024-04-20', 280.00),
(11, 106, '2024-05-02', 600.00),
(12, 102, '2024-05-10', 750.00),
(13, 104, '2024-05-15', 200.00),
(14, 103, '2024-06-01', 550.00),
(15, 105, '2024-06-10', 400.00),
(16, 106, '2024-06-20', 620.00),
(17, 101, '2024-07-05', 310.00),
(18, 102, '2024-07-10', 720.00),
(19, 104, '2024-07-20', 180.00),
(20, 103, '2024-08-01', 470.00),
(21, 105, '2024-08-15', 390.00),
(22, 106, '2024-08-25', 640.00),
(23, 101, '2024-09-05', 350.00),
(24, 102, '2024-09-10', 710.00),
(25, 104, '2024-09-20', 210.00);


select * from orders;

-- 1. Get customers who placed their first order in February 2024
select min(order_date ) from orders;

select customer_id,min(order_date) from orders where month(order_date)=2 and year(order_date)=2024 group by customer_id;

-- ----------
select customer_id,order_date from orders as o
where order_date=(select min(order_date) from orders as ot
  where o.customer_id=ot.customer_id and month(order_date)=2);

-- 2. Find orders that are greater than the average amount in March 2024
select month(order_date) from orders;

select avg(amount) from orders where month(order_date)=3 and year(order_date)=2024;
select * from orders where amount > (select avg(amount) from orders where month(order_date)=3);

----
select * from orders where order_date between '2024-03-01' and '2024-03-31' 
and amount > (select avg(amount) from orders where order_date between '2024-03-01' and '2024-03-31' );


-- 3. Get customers who spent more than the overall average spend across all months

select avg(amount),month(order_date) from orders
group by month(order_date);

select customer_id,sum(amount) as total from orders group by customer_id
having total > (select avg(amount) from orders);

-- ------------

select * from 
(select customer_id,sum(amount) as total from orders group by customer_id) as temp
where total > (select avg(amount) from orders);

-- 4. Find orders placed on the latest order date in the table

select max(order_date) from orders;

select * from orders where order_date=(select max(order_date) from orders);
-- 5. Find orders that are placed on weekends (Saturday/Sunday).

select * from orders where dayofweek(order_date) in (1,7);

-- 6. Find the order(s) with the highest amount in each month.

select max(amount),month(order_date),year(order_date) from orders
group by month(order_date),year(order_date);



-- ------------------mock -----------------


CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
-- Insert Employees


select * from departments;
select * from employees;


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

-- 6. Find the highest-paid employee(s) in each department using a subquery

select emp_id,emp_name from employees as e where salary = (select max(salary) from employees as e2 where e.dept_id=e2.dept_id);

-- 7. Find departments where the average salary is higher than the overall company average salary.



-- fimd empname whjere salary is greter then thier department salary 
-- answer using correlated

select empname,salary,deptid from employees as oute
where salary > (select avg(salary) from employees as inn where inn.deptid=outedeptid);

-- 2 nd method 




use sakila;



-- join the actor table and the film actor table find out actorid,first name and the movie the actor has work but actor_id >10

select * from actor;
select * from film_actor;

select a.actor_id,a.first_name,film_id from actor as a
join film_actor as fa
on a.actor_id=fa.actor_id
where a.actor_id>10;

with abc as
(select * from film_actor where actor_id > 10 )
select a.actor_id,a.first_name,ab.film_id from abc as ab
join actor as a
on a.actor_id=ab.actor_id;


-- -- with cte

with ac as (
    select actor_id, count(*) as movies
    from film_actor
    group by actor_id
)
select a.first_name, ac.actor_id, ac.movies
from ac
join actor a on ac.actor_id = a.actor_id;

-- 
select * from actor;
select * from film_actor;
select * from film;

--

with faf as 
(select a.first_name,fa.film_id from actor as a
join film_actor as fa
on a.actor_id=fa.actor_id)
select f.title,faf.first_name from faf 
join film as f
on faf.film_id=f.film_id;


-- 04/09/2025



-- set operation
select * from actor where actor_id between 1 and 3
union
select * from actor where actor_id between 3 and 5;

select * from actor where actor_id between 1 and 3
union all
select * from actor where actor_id between 3 and 5;

SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
EXCEPT
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;

SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
intersect
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;






-- recursive cte ------------------------------------------


with recursive cte as
(select 1 as num
union
select num+1 from cte where num<6
)
select * from cte;


with recursive cte as
(select 1 as i,1 as factorial
union
select i+1,factorial*(i+1) from cte where i<6
)

select * from cte;


 use regex1;
drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

WITH RECURSIVE cte AS (
    -- Anchor member: top-level employees (no manager)
    SELECT 
        e.employee_id, 
        e.name, 
        e.manager_id, 
        1 AS lvl
    FROM employees e
    WHERE e.manager_id IS NULL

    UNION ALL
    
    -- Recursive member: employees reporting to the previous level
    SELECT 
        etemp.employee_id, 
        etemp.name, 
        etemp.manager_id, 
        cte.lvl + 1
    FROM employees etemp
    JOIN cte ON etemp.manager_id = cte.employee_id
)
SELECT * 
FROM cte;

select * from actor;

-- Example 5: Show each store with its total revenue
select * from payment;
select * from staff;

with cte as 
(select staff_id,sum(amount) as total_revenue from payment group by staff_id )
select s.store_id,cte.total_revenue from staff as s
join cte on s.staff_id=cte.staff_id;

with cte as (
    select st.store_id, sum(p.amount) as total_revenue
    from payment p
    join staff st on p.staff_id = st.staff_id
    group by st.store_id
)
select s.store_id, cte.total_revenue
from store s
join cte on s.store_id = cte.store_id;


-- Example 4: Show each film with its total rentals
select * from rental;
select * from inventory;

select i.film_id,f.title,count(r.rental_id) from rental as r
join inventory as i
on r.inventory_id=i.inventory_id
join film as f
on i.film_id=f.film_id
group by i.film_id;

-- ----
select f.film_id, f.title,
       (select count(*)
        from rental r
        join inventory i on r.inventory_id = i.inventory_id
        where i.film_id = f.film_id) as rental_count
from film f;
-- ----
with cte as 
(select i.film_id,count(r.rental_id) as totalrental from inventory as i
join rental as r
on i.inventory_id=r.inventory_id
group by i.film_id)
select cte.film_id,f.title,cte.totalrental from cte 
join film as f
on cte.film_id=f.film_id;


--
-- --Example 3: Show customers with total number of rentals they made
select * from customer;
select * from rental;

select c.customer_id,c.first_name,count(r.rental_id) from customer as c
join rental as r
on c.customer_id=r.customer_id
group by c.customer_id,c.first_name;

-- 
select c.customer_id, c.first_name, c.last_name,
       (select count(*)
        from rental r
        where r.customer_id = c.customer_id) as rental_count
from customer c;



-- factorial using recursive cte

with recursive cte as
(select 1 as i,1 as num
union
select i+1, num*(i+1) from cte where i<6)
select * from cte;


use regex1;
select * from employees;

with recursive cte as
(select employee_id,name,manager_id,1 as level
from employees where manager_id is null
union
select etemp.employee_id,etemp.name,etemp.manager_id,level+1
from employees as etemp
join cte where etemp.manager_id=cte.employee_id
)
select * from cte;


--    5/08/2025------------------

-- view = (virtual table)

create view temp as 
(select first_name,count(*) from actor where actor_id > 10 
group by first_name order by count(*) desc) ;

select * from temp;

create view temp2 as 
(select first_name,last_name from actor);

select * from temp2;


-- 
-- ctas( create table as select)

create table factors as
(select actor_id,first_name,last_name from actor where actor_id <7);

select * from factors; 

-- crate a view on factor and run insert and update and check the views and real table ki kopi change hua ki anhi

create view saini as 
(select actor_id,first_name,last_name from actor);


update saini set last_name ='saini' where actor_id between 1 and 5; -- update value in view

 select * from saini;
 select * from actor;   -- change the data in reaal table when we can change in view;
 
 -- --------------------
 
 select * from factors;
 
create view sai as 
(select actor_id,first_name from factors );

select * from sai;


-- -------------------------08/09/2025


create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;





insert into employeesales values(12,'alice','developer','2025-06-10',5000.00);

select *,sum(saleamount) over(partition by department,employeename) from employeesales;

-- runing sum 

select *,sum(saleamount) over(order by saleamount) from employeesales;


-- runing sum in each department

select *,sum(saleamount) over(partition by department order by saleamount) from employeesales;


-- 2nd highest salary using window function

--  window function----------
-- => row_number

select *,row_number() over() from employeesales;

select *,row_number() over(partition by department) from employeesales;


-- => rank()-- 

select *,rank() over() from employeesales;

select *,rank() over(order by saleamount) from employeesales;


select *,rank() over(partition by department order by saleamount desc) from employeesales;


-- dense_rank()==>


select *,dense_rank() over(partition by department order by saleamount desc) from employeesales;


-- q=> seconh highest saleamount

with datarank as
(select *,
dense_rank() over(order by saleamount desc) as `ranks` from employeesales)

select * from datarank where ranks=2;


with datarank as
(select *,
dense_rank() over(partition by department order by saleamount desc) as `ranks` from employeesales)

select * from datarank where ranks=2;


-- leg and lead==>

select *, lead(saleamount,2) over() from employeesales;

select *, lag(saleamount,1) over() from employeesales;

insert into employeesales values(1,'Alice','sales','2025-06-2',600.00);


select *,lag(saleamount) over(partition by department,employeename),
saleamount-lag(saleamount) over(partition by department,employeename) from employeesales;

select *,
saleamount-lag(saleamount) over(partition by department,employeename order by saledate)
from employeesales where employeename='alice';


select *,
lead(saledate) over(partition by department,employeename order by saledate) as nextdate,
datediff(lead(saledate) over(partition by department,employeename order by saledate),saledate)
from employeesales where employeename='alice' and department='sales';





