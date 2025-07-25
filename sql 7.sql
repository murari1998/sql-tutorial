use sakila;

show tables;

SELECT * FROM ACTOR;

SELECT actor_id, first_name FROM actor;


select actor_id*10,first_name from actor;

-- we can perform some action --

select actor_id, actor_id*10,first_name from actor;

-- logical operator--

select *
from actor 
where actor_id=1; 

select *
from actor
where first_name='ed';

select *
from actor
where first_name='jon';

select *
from actor
where first_name='ed' and actor_id > 100;

select *
from actor
where first_name='ed' or actor_id > 100;

select *
from actor
where actor_id > 10 and actor_id <25;

-- using between operator

select *
from actor
where actor_id between 10 and 25;


select actor_id,first_name
from actor
where actor_id=5;


select first_name 
from actor
where actor_id=5;

select *
from actor
where actor_id in (2,5);

select *
from actor
where actor_id not in (2,5);

-- like operator-----------pattern par kam karega
-- like operator => % [zero or more charcter],   _ [only one charcter]

select *
from actor
where first_name like 'nick';

select *
from actor
where first_name like '%n';  -- name ke last ma n aata handler

select *
from actor
where first_name like 'n%'; --  name ke first ma n aata ha

select *
from actor
where first_name like 's%t'; -- first charcter s ho or last charcter t ho

select *
from actor
where first_name like '%ic%';-- name ke middel ma ni ata ha wahio naam


select *
from actor
where first_name like '_n';  -- second position par n charcter hona chahiya

select *
from actor
where first_name like '_d'; -- second charcter d ho

select * from actor;

select *
from actor
where first_name like 'E_';  -- ONLY 2 charcter ho or pahle charcter e ho

select *
from actor
where first_name like '__'; -- only 2 charcter ho

select *
from actor
where first_name like '_A%';  -- second charcter a ho or baad ma kitne bhi ho sakte ha.


-- que-- i need to get all details from actor table where actor_id 3,5 or 7 ho
-- que2--i need to get those deatile where actor id either from 7 to 3;
-- quue3--  i need to get those first_name where actor id do not belong 3 to 100;
-- que 4 --  get me the first name those user second char e and last r .
-- que 5 --  nn persent have any palace in the first name 
-- que 6-- get the first name and last name where the minimum char of 2 and last thired char s in the last name  
-- que 7  get me the first name where first name shold be 5 char

select *
from actor
where actor_id in (3,5,7);

select *
from actor
where actor_id between 3 and 7;

select first_name,actor_id 
from actor
where actor_id not between 3 and 100;

select first_name 
from actor 
where first_name like '_E%R';

select first_name 
from actor
where first_name like '%NN%';

select first_name,last_name 
from actor
where last_name like '%s__' ;

select first_name 
from actor
where first_name like '_____';



-- sql query -----------------------

-- sql query => statment question DBMS  =>mysql

select *
from actor
where first_name not like '%A%';

-- distinct and count --------------------------

select distinct(first_name) from actor;

select count(first_name) as totol from actor;

select count(*) from actor;

select count(distinct(first_name)) from actor;  -- count different value on a columns.


-- ------function--------------------

-- code reuseable
-- string function
-- scaler function
-- multi-row function

-- 1 row => apply => result for each row

select first_name,lower(first_name) from actor;

select first_name,lower(first_name),upper(lower(first_name)) ,length(first_name) from actor;  -- neated  function

select first_name,length(first_name) from actor;


# substr (col,index,total charcter)

select first_name,substr(first_name,2) from actor;

select first_name, substr(first_name,2),substr(first_name,2,3) from actor;

select first_name,substr(first_name,2),substr(first_name,3,4),
substr(first_name,-3,4) from actor;

select first_name,instr(first_name, 'E') from actor;

select first_name,last_name,concat(first_name,"-",last_name) from actor;



-- string function--
-- date number--

-- dual table --

select 9*1547 from dual;

--  now()--   

select curdate(),curtime(),now() from dual;


select now(),adddate(now(),2) from dual;   -- add 2 day after date

select now(),adddate(now(),interval 2 month) from dual;   -- add 2 month

select now(),adddate(now(), interval 2 year) from dual;

select now(),adddate(now(), interval 2 week) from dual;

select datediff('2025-08-30' , '2025-09-30') from dual;


-- number function 

select 24.324 ,round(24.324) from dual;

select round(24.567) from dual;

select round(24.567),round(24.567,1) from dual;



select round(24.567),round(24.567,2) from dual;

select round(24.32,-1) from dual;

select round(25.32,-1) from dual;

select round(24.32,-2) from dual;

select round(50.00,-2) from dual;

select round(364.26,1),truncate(364.26,1) from dual;

select * from actor;

-- ----------------------------------------

select first_name,actor_id*10 from actor where first_name='nick';

-- if(conduction, true,false)

-- if(condiction,true,if(condiction,true,false))

select first_name,actor_id, if(first_name='nick',actor_id*10,'no value')from actor;

select first_name,actor_id,if(first_name='nick',actor_id*10,if(first_name='ed',actor_id*20,'invalid')) from actor;

select first_name,actor_id,if(actor_id%2=0,concat(first_name,last_name),concat_ws('$',first_name,last_name)) from actor;

-- using case--------------------------

select actor_id,first_name,
case
   when mod(actor_id,2)=0 then concat(first_name,last_name)
   when mod(actor_id,2)!=0 then concat_ws('#',first_name,last_name)
   else 'no'
end
from actor;   

select actor_id,first_name,
case
    when mod(actor_id,2)=0 then 'yyes'
    when actor_id=5 then '##########yes###'
    else 'NO'
end
from actor;   


-- order by ,alias ,multi row function--------------aggreigate function

select * from actor order by first_name, actor_id desc;

-- alias ---   nickname of columns

select actor_id,actor_id+10 as "newactor"from actor;

-- multi row function -- that are apply on mulyiple row and give output in a value;

-- sum(),count(),avg(),min(),max()

select * from payment;

select distinct(customer_id) from payment;

select count(distinct(customer_id)) from payment;

select count(customer_id) from payment;

select count(customer_id),count(distinct(customer_id)) as all_customer from payment;

select count(amount) from payment;

select avg(amount) from payment;

select sum(amount) from payment;

select max(amount) from payment;

select min(amount) from payment;

-- ggroup by -----------------------
-- similar value ka group --

select sum(amount) from payment where customer_id=1;

select sum(amount),customer_id from payment group by customer_id;

select * from payment;

select count(amount),customer_id,sum(amount) from payment group by customer_id;

select customer_id,count(amount) from payment
group by customer_id;

select count(amount),amount from payment
group by amount;

select staff_id,sum(rental_id),sum(amount),max(rental_id) from payment
group by staff_id;

select extract(month from payment_date),count(customer_id),
max(rental_id),min(rental_id),avg(amount)
from payment
group by extract(month from payment_date);

-- group by ---------------------------------
-- similar data  - grouping
-- aggrigate function ke saath group by use karte ha----alter

-- joins -----------------------------------------------------

use sakila;

select * from address; 


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_name, email, order_date, total_amount) VALUES
(101, 'John Doe', 'john.doe@gmail.com', '2024-12-10', 250.00),
(102, 'Alice Smith', 'alice@yahoo.com', '2024-12-15', 300.00),
(103, 'John Doe', 'john.doe@gmail.com', '2025-01-20', 450.00),
(104, 'Bob Lee', 'bob.lee@hotmail.com', '2025-02-01', 150.00),
(105, 'Alice Smith', 'alice@yahoo.com', '2025-02-10', 200.00),
(106, 'Jane Miller', 'jane.miller@gmail.com', '2025-03-05', 400.00),
(107, 'Sam Wilson', 'sam.wilson@gmail.com', '2025-01-15', 180.00),
(108, 'Emily Davis', 'emily_davis@yahoo.com', '2025-02-18', 220.00),
(109, 'Michael Chen', 'michael.chen@outlook.com', '2025-03-22', 340.00),
(110, 'Rachel Green', 'rachel.green@gmail.com', '2025-03-28', 190.00),
(111, 'John Doe', 'john.doe@gmail.com', '2025-04-05', 310.00),
(112, 'Alice Smith', 'alice@yahoo.com', '2025-04-12', 270.00),
(113, 'Jane Miller', 'jane.miller@gmail.com', '2025-05-03', 380.00),
(114, 'Sam Wilson', 'sam.wilson@gmail.com', '2025-06-14', 500.00),
(115, 'Bob Lee', 'bob.lee@hotmail.com', '2025-07-01', 420.00),
(116, 'Michael Chen', 'michael.chen@outlook.com', '2025-08-19', 610.00),
(117, 'Emily Davis', 'emily_davis@yahoo.com', '2025-09-10', 275.00),
(118, 'Rachel Green', 'rachel.green@gmail.com', '2025-10-05', 195.00),
(119, 'John Doe', 'john.doe@gmail.com', '2025-11-21', 330.00),
(120, 'Jane Miller', 'jane.miller@gmail.com', '2025-12-25', 490.00);

select * from orders;

-- How many orders has each customer placed?

select customer_name,count(order_id) from orders
group by customer_name;

-- Show each customer's name and the username part of their email (before the @).

select substr("tushargoyal@gmail.com",1,instr("tushargoyal@gmail.com","@")-1) as username from dual;

-- How many orders were placed in each month of 2025?
SELECT MONTH(order_date) AS month_number,
       COUNT(*) AS total_orders
FROM orders
WHERE YEAR(order_date) = 2025
GROUP BY MONTH(order_date)
ORDER BY month_number;


             -- select extract(month from order_date),count(order_id) from orders
			-- group by extract(month from order_date);

select month(order_date),count(order_id)
from orders where year(order_date)=2025
group by month(order_date);

-- Count how many orders come from each email domain (e.g., gmail.com, yahoo.com).

select distinct(email),count(order_id) from orders
group by email;


-- For each customer, show the total amount spent per year.

SELECT customer_name,YEAR(order_date),SUM(total_amount) 
FROM orders
GROUP BY customer_name,YEAR(order_date) 
ORDER BY customer_name,YEAR(order_date);





                            -- select distinct(customer_name),sum(total_amount) from orders
                            -- group by customer_name;

select customer_name,year(order_id),count(order_id),sum(total_amount) from orders
group by customer_name,year(order_id);

-- Winter (Dec-Feb), Spring (Mar-May), Summer (Jun-Aug), Autumn (Sep-Nov)


-- What is the most recent order date for each customer?
              -- select extract(date from order_date) from orders 
              -- group by customer_name;SELECT customer_name,
SELECT customer_name,MAX(order_date)
FROM orders
GROUP BY customer_name;



--  ----------------------------------joins--------------------------------------------
              
use sakila;

select * from actor;
select * from film_actor;
select * from film;
select * from actor
join film_actor
on actor.actor_id=film_actor.actor_id;

--------------------------
use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- find out actor id ,film id and movie name donr by each actor;

select a.actor_id,a.film_id,b.title from film_actor as a
join film as b
on a.film_id = b.film_id;



-- find out the actro id the movie name only for those movie which has length>100.
select a.actor_id,b.title from film_actor as a
join film as b
on a.film_id = b.film_id
where length >100;

-- get the actor id and the number of movie he has done all career .
select actor_id,count(title) from film_actor as a
join film as b
on a.film_id = b. film_id
group by actor_id;
 
-- get the title and the film id for the movies  who rating is nc-17 and sort all thesee movie based on desc of film id. 

select film_id,title,rating from film 
where rating='nc-17'
order by film_id desc;


--  self join ---------------------
use sakila;

create table employee1(eid int, ename varchar(20),manager_id int);
insert into employee1 values (10,'tushar',null),(11,'aman',12),(12,'adi',10),(13,'sakshi',11);


select * from employee1;

select emp.eid,emp.ename,emp.manager_id,manager.eid,manager.ename from employee1 as emp
join employee1 as manager
on emp.manager_id=manager.eid; 

-- -------------------------------------------------------------------
use sakila;
select * from payment;

select customer_id,count(payment_id) from payment group by customer_id having count(payment_id)>30;

select customer_id,count(payment_id) from payment where customer_id not in (2,3,5) group by customer_id having count(payment_id)>35;

select * from payment;

-- get the number of payments for each amount. 

select  amount,count(payment_id) from payment 
group by amount;

-- count the total number of customer who have done the payment for each amount accept amount 2.99 and 0.99.

select count(customer_id),amount from payment where amount in (2.99,0.99)
group by amount;

-- get the sum of rental id and the total amount of payment only for amount 2.99,0.99,5.99 and the sum of rental id >1000.alter

select amount, sum(rental_id),sum(amount) from payment where amount in (2.99,0.99,5.99)
group by amount having sum(rental_id) > 1000;
-- ------

select * from actor;
select * from film actor;

-- 

select a.actor_id,a.first_name,b.film_id from actor as a
join film_actor as b on 
a.actor_id=b.actor_id;

select a.actor_id,count(film_id) from actor as a
join film_actor as b on 
a.actor_id=b.actor_id
group by actor_id;

select b.film_id,count(a.actor_id) from actor as a
join film_actor as b on 
a.actor_id=b.actor_id
group by b.film_id;

select a.actor_id,count(film_id) from actor as a
join film_actor as b on 
a.actor_id=b.actor_id
group by actor_id
having count(film_id)>25;

-- datatype in sql -------------------------------
-- datatype --
--           -- number (int,flot,duble)
             -- char   (char,varchar,string)
             -- date,  timestemp
             

-- create statement---

create table test(id int);
insert into test values(10);
select * from test;

create table test2(id tinyint);
insert into test2 values(127);
select * from test2;

-- unsigned-- 
create table test3(id tinyint unsigned);
insert into test3 values(255);
select * from test3;

create table test4(iid decimal(5,2));
insert into test4 values (845);
insert into test4 values(845.74125);
insert into test4 values(8457.2);-- wwill give error
select * from test4;


-- subqueries 
-- querie within a querie--------------------------

select payment_id,amount from payment;

select amount from payment where payment_id=15; -- 1st queries

select * from payment where amount=2.99;        -- 2nd quueries

select * from payment where amount=(select amount from payment where payment_id=15); -- this is subqueries

--
select * from payment;

-- get the payment id ,customer id ,staff id ,rentl id and amount only for those payment where the staff id is = rental id 1,4,2,2

select payment_id,customer_id,staff_id,rental_id,amount from payment;

select staff_id from payment where rental_id =1422;

select payment_id,customer_id,staff_id,rental_id,amount from payment where staff_id=(select staff_id from payment where rental_id =1422);

