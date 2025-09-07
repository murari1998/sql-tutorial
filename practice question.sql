-- pectice quection of my ssql-----

select * from employees;

-- (1). You have to find the second highest salary from employee table using subquerry.

select max(salary) from employees where salary < (select max(salary) from employees);

-- ---------- 2nd method -- -----

select emp_name,salary from employees
order by salary desc
limit 1 offset 1; 


-- (2).You have to find the thired highest salary from employee table using subquerry.

select max(salary) from employees where salary < (select max(salary) from employees where salary < (select max(salary) from employees));

-- -----------    2nd method

select * from employees 
order by salary desc
limit 1 offset 2;

-- -----------------------------------------------------------------------------------------
-- (3).List the titles of all films and the names of the actors who acted in them.

select * from actor;
select * from film;
select * from film_actor;

select f.title,a.first_name from actor as a
join film_actor as fa
on a.actor_id=fa.actor_id
join film as f
on f.film_id=fa.film_id;

-- (4).Find the names of customers and the titles of the films they rented.

select * from customer;
select * from rental;
select * from film;
select * from inventory;

select c.first_name,f.title,r.rental_id from customer as c
join rental as r
on c.customer_id=r.customer_id
join inventory as i
on r.inventory_id=i.inventory_id
join film as f 
on i.film_id=f.film_id;

-- (5).Show the names of stores and the cities they are located in.

select * from city;
select * from address;
select * from store;

select s.store_id,c.city from city as c 
join address as a 
on c.city_id=a.city_id
join store as s
on s.address_id=a.address_id;

-- (6).Find the names of staff members and the stores they work at.

select * from staff;
select * from store;

select concat(s1.first_name," ",s1.last_name) as full_name ,s2.store_id from staff as s1
join store as s2
on s1.store_id=s2.store_id;

-- (7).List all customers along with the total number of rentals they have made.

select * from customer;
select * from rental;

select concat(c.first_name," ",c.last_name) as full_name,count(rental_id) as total_rental from customer as c
join  rental as r 
on c.customer_id=r.customer_id
group by full_name
order by total_rental asc;


-- ------------------------------------------------------------------------------

-- 1. Average Quantity Sold per Product
