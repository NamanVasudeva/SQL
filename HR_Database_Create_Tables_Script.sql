Create database Company;
use company;
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS JOB_HISTORY;
DROP TABLE IF EXISTS JOBS;
DROP TABLE IF EXISTS DEPARTMENTS;
DROP TABLE IF EXISTS LOCATIONS;



CREATE TABLE employees (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(30) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );
select * from employees;
select f_name,L_name from employees where address like '%Elgin,IL';
select f_name, l_name from employees where b_date like '%197%';
select f_name, l_name from employees where dep_id='5' and salary between 60000 and 70000;
select dep_id,f_name, l_name from employees order by dep_id;
select f_name, L_name, dep_id from employees order by dep_id desc , l_name desc;
select dep_id, count(dep_id) from employees group by dep_id;
select dep_id, avg(salary) as AVG_SALARY,count(dep_id) as NUM_EMPLOYEES from employees group by dep_id;
select dep_id, avg(salary) as AVG_SALARY,count(dep_id) as NUM_EMPLOYEES from employees group by dep_id order by AVG_SALARY;
select dep_id, avg(salary) as AVG_SALARY,count(dep_id) as NUM_EMPLOYEES from employees group by dep_id having NUM_EMPLOYEES <="3";
-- select average salary of all employees
select avg(salary) from employees;
-- select average salary of all employees with salary less than average salary
select * from employees where salary<(select avg(salary) from employees);
-- select employee id, salary and the maximum salary
select emp_id, salary, (select max(salary) as MAX_SALARY from employees) from employees;
-- select all columns except senitive info
select * from (select emp_id, f_name,L_name, job_id,manager_id,dep_id from employees) as emp_info;
-- select all records in employees and jobs
select * from employees, jobs;
-- select employees which have corresponding data in jobs table
select * from employees e, jobs j where e.job_id=j.job_ident;
-- select employee id, employee name and job title of employees which have corresponding data in jobs table
select e.emp_id, e.f_name, e.l_name, j.job_title from employees e, jobs j where e.job_id=j.job_ident;