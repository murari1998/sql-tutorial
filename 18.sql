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
 

 