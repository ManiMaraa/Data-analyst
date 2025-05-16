
#                                        SQL PROJECT – 1
create database project;
create table project.swiggy
(
 id int ,
 cust_id varchar(20),
 order_id int,
 partner_code int,
 outlet varchar(20),
 bill_amount int,
 order_date date,
 Comments varchar(20) null
 );
select * from project.swiggy;


insert into project.swiggy
values

    (1,'SW1005', 700, 50, 'KFC', 753, '2021-10-10', 'Door locked'),
    (2,'SW1006', 710, 59, 'Pizza hut', 1496, '2021-01-09', 'In-time delivery'),
    (3,'SW1005', 720, 59, 'Dominos', 990, '2021-10-12', NULL),
    (4,'SW1005', 707, 50, 'Pizza hut', 2475, '2021-11-12', NULL),
    (5,'SW1006', 770, 59, 'KFC', 1250, '2021-11-17', 'No response'),
    (6,'SW1020', 1000, 119, 'Pizza hut', 1400, '2021-11-18', 'In-time delivery'),
    (7,'SW2035', 1079, 135, 'Dominos', 1750, '2021-11-19', NULL),
    (8,'SW1020', 1083, 59, 'KFC', 1250, '2021-11-20', NULL),
    (11,'SW1020', 1100, 150, 'Pizza hut', 1950, '2021-12-24', 'Late delivery'),
    (9,'SW2035', 1095, 119, 'Pizza hut', 1270, '2021-11-21', 'Late delivery'),
    (10,'SW1005', 729, 135, 'KFC', 1000, '2021-10-09', 'Delivered'),
    (1,'SW1005', 700, 50, 'KFC', 753, '2021-10-10', 'Door locked'),
    (2,'SW1006', 710, 59, 'Pizza hut', 1496, '2021-01-09', 'In-time delivery'),
    (3,'SW1005', 720, 59, 'Dominos', 990, '2021-10-12', NULL),
    (4,'SW1005', 707, 50, 'Pizza hut', 2475, '2021-11-12', NULL);

select * from project.swiggy;

#Instruction: Use “Swiggy” table above and write SQL queries to answer these  questions

#Q1: find the count of duplicate rows in the swiggy table

Select id,count(id) from project.swiggy
Group by id
Having count(id)>1
Order by count(id) desc;

#Q2: Remove Duplicate records from the table

#Q: /*-----------------Remove Duplicate records --------------------*/

/*How would you delete duplicate records from the table*/
/*Step1 
create a new table by taking uniques record from original table*/

Create table project.swiggy1
As
Select Distinct * from project.swiggy;

/*Step 2:
Delete the original table*/
DROP table project.swiggy;

/*Step3: 
Rename the new table to original table name*/

Rename table project.swiggy1 to project.swiggy;

# Q3: Print records from row number 4 to 9

Select * from project.swiggy
limit 3,6;

# Q4: Find the latest order placed by customers. Refer to the output below

with latest_order as 
(select cust_id, outlet, order_date, 
row_number() over(partition by cust_id order by order_date desc) as latest_ord_dt
from project.swiggy) select cust_id, outlet, order_date from latest_order where latest_ord_dt = 1;

#Q5: Print order_id, partner_code, order_date, comment (No issues in place of null else 
#comment). Refer to the output below*/

Select order_id, partner_code,order_date,
(case
when comments is null then 'No issues'
else comments end) as comments
from project.swiggy;

/*Q6: Print outlet wise order count, cumulative order count, total bill_amount, cumulative 
bill_amount. Refer to the output below*/

Select a.outlet, a. order_cnt, @running_ord_count:=@running_ord_count + a.order_cnt AS 
cumulative_cnt,
a.total_sale, @running_sale:=@running_sale + a.total_sale as cum_sale
from
(Select outlet, count(order_id) as order_cnt, sum(bill_amount) as total_sale from project.swiggy 
group by outlet) a
Join (Select @running_ord_count:=0, @running_sale:=0) b
order by outlet;

#Q7: Print cust_id wise, Outlet wise 'total number of orders'. Refer to the output below

Select cust_id,
sum(if(outlet='KFC',1,0)) KFC,
sum(if(outlet='Dominos',1,0)) Dominos,
sum(if(outlet='Pizza hut',1,0)) Pizza_hut
from project.swiggy
group by 1;

/*Q8: Print cust_id wise, Outlet wise 'total sales. Refer to the output below
                      or
# Q: Create a cross tab cust_id wise outlet wise total bill amount */                  

Select cust_id,
sum(if(outlet='KFC',bill_amount,0)) KFC,
sum(if(outlet='Dominos',bill_amount,0)) Dominos,
sum(if(outlet='Pizza hut',bill_amount,0)) Pizza_hut
from project.swiggy
group by 1;
Select * from project.swiggy;









