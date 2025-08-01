use sakila;
select * from language;
select * from customer;
select * from inventory;
select * from film;

select f.title,l.name from film as f 
join language as l
on f.language_id=l.language_id;

select s.staff_id,s.first_name,s.last_name from staff as s
join store as s2
on s.store_id=s2.store_id;

select f.title,i.inventory_id from film as f
join inventory as i
on i.film_id=f.film_id;

--  2 --

select * from city;
select * from address;


select a.address,c.city from city as c
join address as a
on c.city_id=a.city_id;


--  3 --------------
select a.first_name,f.title,l.name from film as f
join film_actor as fa
on f.film_id=fa.film_id
join actor as a
on fa.actor_id=a.actor_id
join language as l on f.language_id=l.language_id;

-- 4 ----------------
SELECT s.staff_id, s.first_name,a.address, c.city, co.country
FROM staff s
JOIN store st ON s.store_id = st.store_id
JOIN address a ON st.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id;

select f.title,l.language from language as l
join film as f
on f.language_id=l.language_id;

-- customer name ,rental id ,payment id,

 -- -----------------------------------
-- left join 




-------------------------------------

-- q1>= list all the customer withe therie rantal and payment include null

-- q2= find all field in the inventory item withe rental detail fill display all the inverntory and no rental include

-- q3 =display customer teire rental and count total payment amount

-- q4= list all staff memmber and payment 

select c.customer_id,c.first_name,c.last_name,r.rental_id from customer as c
left join rental as r
on c.customer_id=r.rental_id;
-- ----------------
select i.inventory_id,r.rental_id from inventory as i
left join rental as r
on i.inventory_id=r.inventory_id;

-- ---------------------------------
select c.first_name,r.rental_id,p.amount from customer as c
left join rental as r
on c.customer_id=r.customer_id
left join payment as p
on r.rental_id=p.rental_id;

-- ---------------------------------

SELECT p.payment_id, p.amount, s.staff_id, s.first_name, s.last_name
FROM payment p
LEFT JOIN staff s ON p.staff_id = s.staff_id;

-- -----------------------------------

-- paymnet,coustomer,payment
-- customer_name,count(rental),sum(amount)

select first_name,count(r.rental_id),sum(p.amount) from customer as c
left join rental as r on r.customer_id=c.customer_id
left join payment as p on r.rental_id=p.rental_id
group by c.first_name;



-- cross join ----------
 
 select * from t1;
 select * from t2;
 
 select * from t1
 cross join t2;
 
 select count(t1.id) from t1
 cross join t2;
 
 -- display all possible actor and language 
 
 select * from actor
 cross join language;
 
 select count(actor.actor_id) from actor
 cross join language;
 
 -- country citry=> show all the country and citry
 
 select cu.country,ci.city from country cu
 cross join city ci
 group by cu.country,ci.city ;
 
 -- self join ------------------
 -------------------------
 
 select * from employee1;

-- q1=>  display list of staff member and their manager use customer table .
-- q2=>  find the customer living in the same city .

select * from customer;

select * from city;
select * from city as c1
join  city as c2
on c1.city_id=c2.country_id;



