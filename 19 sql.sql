use sakila;

-- table creation (ddl,dml)

-- object  --- int,float,double,string[varchar,char]

create table studentaccess(id int,sname varchar(20));   -- ddl
insert into studentaccess values(9,'abc');     -- dml (method1)  x

insert into studentaccess(id,sname) values (19,'abc');      -- method 2

-- problems ----
insert into studentaccess values(11);

-- solution--
 insert into studentaccess(id) values (22);
 insert into studentaccess(sname) values ('nikil');
 select * from studentaccess;
 

 
 
 drop table studentaccess; -- ddl
 
 create table studentaccess(id int,sname varchar(20));   -- ddl
  insert into studentaccess(id) values (22);
 insert into studentaccess(sname) values ('nikil');
 
 
  -- dml (update)
 
 update studentaccess set sname='raj';
 select * from studentaccess;
 
 -- 1 row update with where clause
 
 update studentaccess set sname='abhisek' where id=22;
 select * from studentaccess;
 
 
 drop table studentaccess;
 
  create table studentaccess(id int,sname varchar(20));   -- ddl
    insert into studentaccess(id,sname) values (21,'aman');
    insert into studentaccess(id,sname) values (23,'naina');
    
    select * from studentaccess;
    
    -- delete
    
    delete from studentaccess where id between 20 and 22;
    
     
     -- merge is dml statement
     
     -- merge into table using referenceble
     -- when condiction then statement  (inser/update/delete)
	 
      drop table studentaccess;
      
	truncate table studentaccess;
    select * from studentaccess;
    
    
    
create table test18 (id tinyint);
insert into test18  values(10);
insert into test18  values(-128);

insert into test18  values(-129);    -- size is smaller 1 byte 2*8 =256 (-128 to 127

select * from test18;

create table test19 (id tinyint unsigned); -- all number positive(255)
insert into test19  values(10);
insert into test19  values(-128);

insert into test19 values(250);

select * from test19;
-- small int, mediumint, int, bigint



     
     
     