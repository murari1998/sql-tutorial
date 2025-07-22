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

