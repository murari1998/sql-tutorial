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






