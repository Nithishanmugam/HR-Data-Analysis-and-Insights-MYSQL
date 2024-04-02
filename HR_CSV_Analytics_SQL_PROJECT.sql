-- Project Title:HR Data Analysis and Insights --
/*
Project overview:
This project involves the analysis of a Human Resources dataset containing the information about employees.
The dataset is structured in a csv format and includes various attributes. 
*/

/*
Features:
The dataset contains the information about employee names,cities,blood groups,
genders,birth dates,salaries,department,satisfication levels,number of projects,average monthly hours,years spent in the company,
work accidents,promotions in the last years.
This diverse dataset provides a rich source of information for conducting indepth analysis and gaining valuable insights into employyee dempgraphics,
work patterns,and factors influencing employee satisfication and retention.
*/

/*
Objective:
The primary objective of this project is to perform a comprehensive analysis of the HR dataset using SQL queries.
The analysis aims to extract valuable insights that can be beneficial for HR professionals and management to making informed decisions regarding employee satisfication,
performance,departmental trends and more. 
*/

/*
Tools used:
MYSQL: Used for importing and querying the HR dataset.
MYSQL Workbench: Used for database management and visulaization of the data.
Excel: Used for initial data exploration and cleaning before importing into MYSQL. 
*/

create database hr_csv_project;
use hr_csv_project;
-- find the number of observations in the table --
select count(*) as num_observations from hr_csv;
-- find the count of employees by gender --
select gender,count(*) as num_employees from hr_csv
group by 1;
-- find the count of male and female employees by department --
select department,gender,count(*) as num_employees from hr_csv
group by department,gender;
-- find the average satisfication level by department --
select department,avg(Satisfaction_level) as Satisfaction_level from hr_csv
group by department;
-- find the average number of projects by department --
select department,avg(Number_Project) as Number_Project from hr_csv
group by 1;
-- find the most tenured employee in the company --
select * from hr_csv
order by 'Time_Spend_Company(years)' desc
limit 10;
-- find the count of employees who were promoted in the last five years by department and gender --
select department,gender,count(*) as num_Promotion_Last_5Years from hr_csv
where Promotion_Last_5Years=1
group by department,gender;
-- find the count of employees of city --
select city,count(*) as num_employees from hr_csv
group by city;
-- find the employees whose birthdays are tomorrow --
select * from hr_csv
where date_format(Birth_Date,'%m-%d')=date_format(date_add(curdate(),interval 1 day),'%m-5d');
-- query to categorize salaries based on the salary ranges --
select 
'Employee Name',
salary,
case
when salary < 50000 then 'low'
when salary between 50000 and 100000 then 'medium'
when salary > 100000 then 'high'
else 'unknown'
end as salary_category
from hr_csv;
-- find the percentage of employees with high salaries in the company --
select count(*)*100.0/(select count(*) from hr_csv) as percentage_high_salary
from hr_csv
where salary > 50000;
-- find the nth largest salary in the company --
select distinct salary from hr_csv
order by salary desc
limit 1 offset 0;
-- query to describe the salary percentile based on the salary --
select
'employee name',
salary,
ntile(4) over (order by salary) as quartile
from hr_csv;
-- Retrive employees in the marketing department --
select * from hr_csv where Department = 'marketing';
-- Retrive employees with name starting with J --
select * from hr_csv 
where 'Employee Name' like 'J%';

/*
conclusion:
Through this project, We aim to gain a deeper understanding of the HR dataset by leveraging SQL queries for analysis. 
These insights can be used by HR departments to develop strategies for improving employee retention and satisfication,
performance and making decisions for the company's growth and success. 
*/











