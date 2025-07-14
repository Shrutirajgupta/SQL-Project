CREATE database learn2;
use learn2;


select *from titanic;

 /*how many total records*/
select count(*)
from titanic;

/*find the count names in the dataset*/
select count(distinct(name))
from titanic;

/*sort passengers by fare in descending order and find top5*/

select * from titanic
order by fare desc limit 5;

/*find the second highest fare */

select* from titanic
order by fare desc limit 1 offset 1;


/*find the sum of passengers fare and an additional tax of 5*/

select name, fare, (fare+5) as fire_with_tax 
from titanic;


/*double the fare of first class passengers*/
select name, fare,(fare - 5) as fare_with_discount
from titanic;

select * from titanic;

select name , fare , (fare * 2) as double_fare_of_firstclass
from titanic
where pclass = 1 ;

/*find the number of female passengers*/

select  count(distinct(name)) from titanic
where sex = 'female';


/*find the no of female passenger who are from pclass 1 and 3*/

select count(distinct(name)) from titanic 
where sex = 'female' and pclass = (1 or 3);

/*find the no of female passengers who are not from pclass 2*/

select count(distinct(name)) from titanic
where sex = 'female' and pclass!= 2;

/* find the passengers who are male and older than 30*/

select name , age from titanic 
where sex = 'male' and age> 30;

/*find  passengers who are between age 20 and 40*/

select * from titanic
where age between 20 and 40;

/*find passengers whose fare is greater than all recorder fares from 3rd class*/

select max(fare) as 3_max_fare 
from titanic where pclass = 3;

select *  from titanic 
where fare > (select max(fare) as 3_max_fare 
from titanic where pclass = 3);

/*find passengers who are not in first class*/
select * from titanic 
where pclass != 1;


/*find passengers who are either female or first class*/
select* from titanic
where sex = 'female' or pclass = 1;

/* find passengers whose age is not recorder*/
select * from titanic 
where age is null;
/*find the passengers whose name starts with 'c'*/
select * from titanic
where name like 'C%';

/*find the passengers whose name doesn't start with c*/
select * from titanic
where name not like 'C%';

/*find the passengers whose name starts with A or B*/

select * from titanic 
where name regexp '^[AB]';

/*find the name of passengers which contains 'dr' in it*/
select * from titanic 
where name like '%dr%';

/*find the name ends with 'aina'*/

select* from titanic 
where name regexp 'aina$';

/*find the name have two vowels in it*/

select* from titanic 
where name regexp '[aeiou]{2}';

/*add the survival stutas woth name*/

select  name, survived , concat(name, '>>survived' , survived) as summary
from titanic;


/* convert the name to uppercase*/
select upper(name) from titanic;

/*convert the name to lower*/
select lower(name) from titanic;

/*replcae mr with sir*/

select name , replace(name , 'Mr' , 'Sir') from titanic;

use learn2;
select * from titanic;


/*Extract the first letter of passenger names*/
select name ,left(name,1) as first_name from titanic;

/*covert the name case*/
select name,upper(name) from titanic;

select name , lower(name) from titanic;

/*replace mr with sir*/

select name, replace(name, 'Mr', 'Sir') as new_name
from titanic;

/*extract the first name*/
select name, substring_index(name, ',', -1  ) as first_name
from titanic;

/* extract the last name*/

select name , substring_index(name, ',' , 1) as last_name
from titanic;
/*count the total number of passengers*/
select count(*) from titanic;

/*find the average fare*/
select avg(fare) from titanic;

/*find the variance of fare*/
select variance(fare) from titanic;

/*find max fare*/
select max(fare) from titanic;

/*find min fare*/
select min(fare) from titanic;

/*round the fare column*/
 select fare, round(fare,2)
 from titanic;
 
 
/*replace missing age value with average*/
select name, coalesce(age, (select avg(age) from titanic))
from titanic;

/*find length of passenger name*/
select name,length(name) from titanic;
  /*find the square root of fare*/
  select fare,sqrt(fare) from titanic;
  
  /*round age to nearest integer*/
  select name,age, round(age) from titanic;
  
  
/*categorize passenger on age*/
select  name, age ,
case
when age <18 then 'child'
when age >= 60 then 'senior_citizen' 
else 'adult'
end as age_group from titanic;

/*categorize  passenger basen on fare*/
select name, fare,
case
when fare <10 then 'low fare'
when fare between 10 and 50 then 'medium fare '
 else 'high fare'
 end as fare_category
 from titanic;
 
  /*how many passengers survived in each class*/
  select pclass , count(pclass)
 from titanic 
 group by pclass;
 
 -- find the total fare collected for each class
 
 select pclass , sum(fare) as total_fare
 from titanic
 group by pclass
 order by pclass;
 -- find the survival rate for each gender
 select sex , avg(survived) as survival_rate
 from titanic
 group by sex;
 -- find the avg age of survivors vs non survivors
 select survived , avg(age) as avg_age
 from titanic
 group by survived;
 
 -- find the gender class combination with highest survivors
 select sex, pclass , count(*) as survival_rate
 from titanic
 where survived = 1
 group by sex , pclass order by survival_rate desc;
 
 
 -- find the class with most survivors
 select pclass , count(*) as survivor_counts
 from titanic 
 where survived = 1
 group by pclass
 order by survivor_counts desc limit 1;
 
-- find the average fare paid by each passenger class and
-- embarcation point  but  only groups include groups where total  
--  no of passenger in that group is more than 20 and consider 
-- only passenger who are adults(>= 18 ) and padi more than 10

select pclass, embarked , avg(fare) as avg_class_fare,
count(*) as passenger_count
from titanic
where  age >=18 and fare >10
group by pclass, embarked
having passenger_count >20
order by avg_class_fare desc;

-- date time

-- current date
select curdate() as curr_date;
 -- current time
 
 select current_time() as curr_time;
 
 -- current date and time
 select  now() as current_date_time;
 
 -- extract month, year, and day from date column
 
 

-- get the full date in human readable format

select date_format('2025-04-23', '%W %D %M %Y') AS format;

-- find the 7 days after and 7 days before '2025-04-23'
select date_add('2025-04-23' , interval 7 day) as after_7day,
date_sub('2025-04-23' , interval 7 day) as before_7day;

-- find the no of days between '2025-04-13' and '2025-05-31'
select datediff( '2025-05-31', '2025-04-13');

-- find last day of given month

select last_day('2025-04-13') as last_day_of_month;

-- find the weekday for '2025-04-13'
select dayname('2025-04-13') as weekday_name;
 
 -- convert '2025-04-13' to a proper date format
 select str_to_date('22-March-2025' , '%d-%M-%Y') as formatt;
 
 -- diff between two time stamps
 select timediff('2025-04-13 14:30:45' , '2025-04-13 10:00:00') as time_diff;
 
 -- find hour, minute, second part from data
 select 
 hour('2025-04-13 14:30:45') as hourr,
minute('2025-04-13 14:30:45') as minn,
second('2025-04-13 14:30:45') as secc;

-- find quarter of '2025-04-13 14:30:45'
select quarter('2025-04-13') as quarter_part;

-- find the next monday after a given date
select date_add('2025-04-13' , interval ( 7 - weekday('2025-04-13')) day) as next_mon;

-- age form dob

select timestampdiff( year , '2002-05-31' , curdate()) as age;

SELECT DATE_FORMAT('2025-03-22', '%D %M, %Y') AS formatted_date;


-- window function
use empdb;
select * from employee;
-- for each dept what is avg salary
select dept_name, avg(salary) as avg_salary
from employee
group by dept_name;
-- if you want any other column in above result it show error

select * , avg(salary)
over(partition by dept_name)
from employee;

-- over is used to define window


-- rank, dense rank , row_number

-- find salary in desc order
select * from employee
order by salary desc;


-- rank
-- rank employess based on salary
select * , rank() over(order by salary desc) as rank_position
from employee;


-- dense_rank
-- assign rank , skipping numbers if salaries are tied

select * , dense_rank() over(order by salary desc) as dense_rank_position
from employee;

-- row_number >> unlike rank , does not skip ranks for duplicate enteries
select * , row_number() over(order by salary desc) as row_number_position
from employee;

-- all use one time

select * , rank() over(order by salary desc) as rank_position,
row_number() over(order by salary desc) as row_number_position,
dense_rank() over(order by salary desc) as dense_rank_position
from employee;

-- find top 3 highest paid employees in each department
select  * from (select emp_id, employee_name, dept_name, salary, 
rank() over(partition by dept_name  order by salary desc ) as top_3_salary
from employee) t
where t.top_3_salary <4;

-- get the highest paid employee in per dept

select emp_id, employee_name, dept_name, salary,
first_value(employee_name) over(partition by dept_name order by salary desc) as salary_per_dept
from employee;


-- get the lowest paid employee in per dept
select emp_id, employee_name, dept_name, salary,
last_value(employee_name) over(partition by dept_name order by salary desc
rows between unbounded preceding and unbounded following ) as lowest_paid
from employee;
 
-- get the 3 highest salary in each dept

select emp_id, employee_name, dept_name, salary,
nth_value(employee_name , 3) over(partition by dept_name order by salary desc) as 3_highest_salary
from employee;

-- lag
-- compare each employees salary with previous employee in each dept

select emp_id, employee_name, dept_name, salary,
lag(salary) over(partition by dept_name order by salary desc) as previous_salary
from employee;

-- lead
select emp_id, employee_name, dept_name, salary,
lead(salary) over(partition by dept_name order by salary desc) as forward_salary
from employee;

-- use case >> very impotant to compare any value with previous or next values
-- time series data

-- common table expression (cte)
-- a common table expression is a temporary result set that you can reference within a sql query
-- it improved the code readebility and aviod subquery repititon 

-- syntax : with cte name as(
--          your query 
--           )
--          select * from cte_name;



select  * from (select emp_id, employee_name, dept_name, salary, 
rank() over(partition by dept_name  order by salary desc ) as top_3_salary
from employee) t
where t.top_3_salary <4;

with ranked as (select emp_id, employee_name, dept_name, salary, 
rank() over(partition by dept_name  order by salary desc ) as top_3_salary
from employee) 
select * from ranked where top_3_salary <4;




























select    Year('2025-04-23') as year,   month('2025-04-23') as month,   day('2025-04-23') as day,   dayname('2025-04-13')  as weekday, dayofweek('2025-04-23') as week LIMIT 0, 1000
