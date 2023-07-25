--SUM and COUNT Quiz

/*
	Table:bbc
	
	name			region			area		population		gdp
	Afghanistan		South Asia		652225		26000000		
	Albania			Europe			28728		3200000			6656000000
	Algeria			Middle East		2400000		32900000		75012000000
	Andorra			Europe			468			64000	
	...
*/


--1. Select the statement that shows the sum of population of all countries in 'Europe'
select sum(population) from bbc where region = "Europe";


--2. Select the statement that shows the number of countries with population smaller than 150000
select count(name) from bbc where population < 150000;

--3. Select the list of core SQL aggregate functions
avg(), count(), max(), min(),sum()

/*
	4. Select the result that would be obtained from the following code:
	SELECT region, SUM(area)
	FROM bbc 
	WHERE SUM(area) > 15000000 
	GROUP BY region
	
	Rpta: No result due to invalid use of the WHERE function
*/



--5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
select avg(population) from bbc where name in ("Poland","Germany","Denmark");

--6. Select the statement that shows the medium population density of each region
select region, sum(population)/sum(area) as density from bbc group by region;

--7. Select the statement that shows the name and population density of the country with the largest population
select name, population/area as density from bbc where population=(select max(population) from bbc);

/*
8. Pick the result that would be obtained from the following code:
	SELECT region, SUM(area) 
	FROM bbc 
	GROUP BY region 
	HAVING SUM(area)<= 20000000


Rpta: Table-D
	Americas		732240
	Middle East		13403102
	South America	17740392
	South Asia		9437710
*/


