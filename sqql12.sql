create database company;
use company;

create table employee(
id int not null,
name varchar(50),
salary int,
city varchar(50)
);

insert into employee
(id,name,salary,city)
 values
 (101,"jon",25000,"jaipur"),
 (102,"boby",30000,"mumbai"),
 (103,"sam",50000,"manali"),
 (104,"murari",60000,"kolkata");
 
 insert into employee(id,name,city)values(106,"sekhar","jhunjhunu");


insert into employee values(105,"karan",20000,"jammu");

select * from employee;

select * from employee where salary>50000;

select * from employee where salary=50000;

select name from employee where salary <>50000;


select 12*2 as sum;

select 12-10 as sub;

select 12*5 as mul;

select name,salary from employee where salary >50000 and salary < 90000



