-- Drop the PETRESCUE table in case it exists
create database PETS;
use pets;
drop table if exists PETRESCUE;
-- Create the PETRESCUE table 
create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);
-- Insert sample data into PETRESCUE table
insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;
select * from petrescue;
-- select sum of all costs
select sum(cost) from petrescue;
select sum(cost) as SUM_OF_COST from petrescue;
-- maximum quantitied rescued
select max(quantity) from petrescue;
-- average cost of rescues
select avg(cost) from petrescue;
-- average cost of recsuing dogs
select avg(cost/quantity) from petrescue where animal='dog';
-- round cost 
select round(cost) from petrescue;
-- length of name
select length(animal) from petrescue;
-- uppercase name
select ucase(animal) from petrescue;
-- uppercase without duplicates
select ucase(animal) from petrescue group by animal;
-- all columns related to cats and cat in lowercase
select * from petrescue where lcase(animal)='cat';
-- display days of the month when cats have been rescued
select day(rescuedate) from petrescue where animal='cat';
-- number of rescues in the month of may
select sum(quantity) from petrescue where month(rescuedate)=5;
-- number of rescue on 14th day of the month
select sum(quantity) from petrescue where day(rescuedate)=14;
-- display date to see the vet ie three days after rescue
select day(rescuedate)+3 from petrescue;

