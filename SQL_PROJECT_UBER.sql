#                                                   SQL PROJECT:- 2

create database project2;

create table project2.table1_emp
(
emp_id int,
emp_name varchar(20),
Salary int,
dept_id int
);

insert into project2.table1_emp
values
  (1, 'Jim', 9989, 1),
  (2, 'Kim', 9770, 2),
  (3, 'Lim', 4061, 2),
  (4, 'Tim', 6053, 3),
  (5, 'Vim', 2730, 1),
  (6, 'Jay', 6354, 1),
  (7, 'Kay', 6498, 3),
  (8, 'Raj', 1702, 3),
  (9, 'Ram', 5069, 1),
  (10, 'Sam', 6244, 2),
  (11, 'Ali', 4890, 1),
  (12, 'Joe', 4813, 3),
  (13, 'Rim', 8926, 2),
  (14, 'Doug', 1595, 2);
  
  create table project2.table2_dept
  (
  dept_id  int,
  dept_name varchar(20)
  );
  
  insert into project2.table2_dept
  values
(1, "IT"),
(2, "Fin"),
(3, "Sales");

/*Q1: Write a query to find the top 3 earner by department. Refer to EMP 
and DEPT table to print the output.*/

SELECT DISTINCT Department, Employee, Salary 
FROM ( 
SELECT 
 d.dept_name as Department, 
 e.emp_name as Employee, 
 e.Salary as Salary, 
 DENSE_RANK() OVER (PARTITION BY d.dept_name ORDER BY e.Salary DESC) as sal_rank 
FROM project2.table1_emp as e JOIN project2.table2_dept as d 
ON e.dept_id = d.dept_id 
 ) t 
WHERE sal_rank <= 3;

/*Q2: Uber rides table contains the mileage and the purpose of the rides.
Write the query logic to find business purposes that generate the most 
miles driven for passengers that use Uber for their business 
transportation. Find the top 3 business purpose categories by total 
mileage.*/

/*select purpose,round(sum(miles),1) as total_miles from project.uber 
where category='Business' AND purpose IS NOT NULL 
group by purpose 
order by total_miles Desc 
Limit 3;*/

/*Q3: Write a query to find the data of 3rd highest miles from Uber rides table.

Select * from project.uber 
order by miles desc 
Limit 2,1; */

/*Q4: Write a query to find the rides that have the duration >40 min
SELECT *,TIMESTAMPDIFF(MINUTE,start_date,end_date) AS duration_minutes 
FROM project.uber 
WHERE TIMESTAMPDIFF(MINUTE,start_date,end_date) > 40 
ORDER BY duration_minutes DESC;*/

 
/*Q5: Sticks table (table 4 above) has 3 columns S1, S2, and S3. Columns 
S1, S2, and S3 has length of sticks stored in them. Write a query logic to 
get the desired output with the 4th column (stick_len).*/

/*Select S1,S2,S3, 
(case 
 when S1=S2 and S1=S3 then "Same len" 
 when S1!=S2 and S2!=S3 and S1!=S3 then "Different len" 
 else "2 sticks have same len" 
 end ) stick_len 
from project.sticks;*/


  
  