select * from hr;

alter table hr
change column ï»؟id emp_id varchar (20) null;

describe hr;



update hr
set hire_date = case 
when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y') ,'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y') ,'%Y-%m-%d')
else null
end;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

select hire_date from hr;


UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr add column age int;

update hr
set age = timestampdiff(YEAR,birthdate,CURDATE());

select birthdate, age from hr;

select count(*) from hr where age < 18;

select min(age) as youngest,
max(age) as oldest from hr;

