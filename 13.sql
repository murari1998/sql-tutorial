use sakila;

select count(payment_id) 
from payment 
where staff_id = 1;

select count(payment_id) 
from payment 
where staff_id = 2;

select staff_id, count(payment_id) 
from payment 
group by staff_id 
having count(payment_id) > 8000;

select * from payment;


use sakila;

-- film table has film_id(pk)

select * from film_actor;

select count(film_id),count(distinct film_id) from film_actor;

desc film;
desc film_actor;

select f.film_id,f.title,f.release_year,fa.actor_id from film as f
join film_actor as fa
on f.film_id=fa.film_id;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- Create Students table
CREATE TABLE Studentss (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');
   
   
   
INSERT INTO Studentss (StudentID, StudentName, Age, DepartmentID)
VALUES
    (101, 'Alice', 20, 1),
    (102, 'Bob', 21, 2),
    (103, 'Charlie', 22, 1),
    (104, 'Diana', 23, 3),
    (105, 'Evan', 20, NULL); -- Evan has no department assigned
   
select * from Studentss;
select * from Departments;

select s.studentid, s.studentname,  d.departmentname
from studentss as s join departments as d
  where s.departmentid = d.departmentid;

create table employeee81(eid int, ename varchar(20),managerid int);

insert into employeee81 values (10,"yash",null),(11,"aman",12),(12,"naina",10),
(13,"happy singh",11);

select  * from employeee81;
 
 -- in this table primary key is eid
 -- and mangerid is forign key
 
 
select e.eid,e.ename,e.managerid,mgr.ename from employeee81 as e
join employeee81 as mgr
on e.managerid=mgr.eid;

use murari;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    PrerequisiteCourseID INT,
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Courses (CourseID, CourseName, PrerequisiteCourseID)
VALUES
    (1, 'Intro to Programming', NULL),
    (2, 'Data Structures', 1),
    (3, 'Algorithms', 2),
    (4, 'Databases', 1),
    (5, 'Advanced Databases', 4),
    (6, 'Computer Networks', NULL),
    (7, 'Operating Systems', 2),
    (8, 'Computer Architecture', 1),
    (9, 'Machine Learning', 3),
    (10, 'Artificial Intelligence', 3),
    (11, 'Deep Learning', 9),
    (12, 'Compiler Design', 7),
    (13, 'Cloud Computing', 6),
    (14, 'Cybersecurity Fundamentals', 6),
    (15, 'Blockchain Technology', 14);


select * from courses;

