use sakila;
show tables;
select * from address;

select count(address_id),count(address2),count(*) from address;

select address2,address2+50 from address;

create table product(id int,pname varchar(20),amount int);
insert into product values(10,"laptop",199),(11,"tv",200),(12,"watch",300);


create table orderss(oid int,lcation varchar(20),productid int);
insert into orderss values(888,"jaipur",10),(889,"pune",11),(890,"himachal",15),(891,"j&k",10);

select * from product;

select * from orderss;

select prod.id,prod.pname,prod.amount from product as prod;

select ord.oid,ord.lcation,ord.productid from orderss as ord;

-- inner join 

-- select col1,col2,..... from table join table2 condiction

select prod.id,prod.pname,prod.amount,ord.oid,ord.lcation,ord.productid from product as prod
join orderss as ord where prod.id=ord.productid;

select o.oid,o.lcation,p.pname from orderss as o 
join product as p
where o.productid=p.id;

select o.oid,o.lcation,p.pname from orderss as o 
left join product as p
on o.productid=p.id;

select o.oid,o.lcation,p.pname from product as p
left join orderss as o
on o.productid=p.id;

use sakila;

select * from actor;
select * from film_actor;

select a.first_name,a.last_name,fa.film_id from actor as a
join film_actor as fa
on a.actor_id=fa.actor_id;


