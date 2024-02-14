use assignment;
select * from employee
where salary > 3000
AND deptno = 10;


select *,
     CASE
      WHEN marks BETWEEN 40 AND 49.99 THEN 'Third Class'
            WHEN marks BETWEEN 50 AND 59.99 THEN 'First Class'
            WHEN marks BETWEEN 60 AND 79.99 THEN 'Second Class'
            WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
            ELSE 'Failed'
    END as Grade        
  from students;
  
  select *
	from (  select *,
		       CASE
			   WHEN marks BETWEEN 40 AND 49.99 THEN 'Third CLass'
			   WHEN marks BETWEEN 50 AND 59.99 THEN 'Second CLass'
			   WHEN marks BETWEEN 60 AND 79.99 THEN 'First CLass'
			   WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
			   ELSE 'Failed'
			END as Grade
		 From students ) as ss
			where ss.grade = 'First Class';
            
	select *
	from (select *,
	CASE
	WHEN marks BETWEEN 40 AND 49.99 THEN 'Third CLass'
   WHEN marks BETWEEN 50 AND 59.99 THEN 'Second CLass'
   WHEN marks BETWEEN 60 AND 79.99 THEN 'First CLass'
   WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
 ELSE 'Failed'
END as Grade
		 From students ) as ss
			where ss.grade = 'First Class';
            
            
            
select *  
from station
where id % 2 = 0;

select *,
COUNT(*) as CNT	  
from station
where id % 2 = 0
GROUP BY id, city, state, lat_n, long_w
HAVING CNT = 1;

select *	  
from station
where id % 2 = 0
GROUP BY id, city, state, lat_n, long_w
HAVING COUNT(*) = 1;
        
        
   select count(city) as 'Count of all Cities'
  from station;

select count(distinct city) as 'Count of Distinct Cities'
  from station;

select count(city) - count( distinct city) as 'Difference Between Number of Distinct and All Cities'
  from station;     
        
        
select city
  FROM station
    where city regexp '^a|^e|^i|^o|^u'
      GROUP BY city
        order by city;
        
select city
  FROM station
  where city regexp '^a|^e|^i|^o|^u' AND
city regexp 'a$|e$|i$|o$|u$'
GROUP BY city
order by city;

select city
  FROM station
    where city Not regexp '^a|^e|^i|^o|^u'
      GROUP BY city
        order by city;
        
        
select distinct city
FROM station
where city regexp '^[^aeiou]|.*[^aeiou]$';
        
        
select Concat(first_name, ' ', last_name) as Employee,
Concat(salary, '$') as 'Salary($)',
hire_date,
timestampdiff(MONTH, hire_date, current_date()) as 'Total_Months_Joined'
  from emp
    where salary > 2000
      having Total_Months_Joined < 36
        order by salary desc;  
        
select deptno,
     sum(salary) as Total_salary
  from employee
    group by deptno;
    
select name as City,
     population
  from city
    where population > 100000
      order by population desc;
      
select district,
sum(population) as Total_population
from city
where district regexp 'California'
group by district;

select district as District,
       AVG(population) as Average_Population
  from city
    group by District;
    
    select o.ordernumber, 
	o.status, 
	o.customernumber, 
	c.customername, 
	o.comments
  from customers c 
    JOIN orders o
      USING (customernumber)
        Where o.status = 'Disputed';
      
      
        
        