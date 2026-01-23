
use world

--QUESTION 1- Count how many cities are there in each country.

--Answer--
select CountryCode,COUNT(ID) AS CityCount
from City
group by CountryCode;

--QUESTION 2-- Display all continents having more then 30 countries.
--Answer--
select Continent
from Country
group  by Continent
having COUNT(Code)>30;

--QUESTON 3--List regions whose total population exceeds 200 million.

--Answer--
from Country
group by Region 
having SUM(Population)> 200000000;

--QUESTION 4--Find the top 5 continents by average GNP per country.

--Answer--
select Continent,AVG(GNP)
group by Continent
order by AvgGNP DESC
LIMIT 5;


--QUESTION 5--Find the total number of official languages spoken in each continent.
 
--ANSWER--
SELECT c.Continent,COUNT(DISINCT) cl.Language) AS LanguageCount
from Country c
join CountryLanguage cl on c.Code= cl.CountryCode
where cl.lsOfficial='T'
group by c.Continent;
 
--QUESTION 6-- Find the maximum and minimum GNP for each continent.
--ANSWER--
SELECT Continent,MAX(GNP) AS MAXGNP,MIN(GNP) AS MinGNP
FROM Country
group  by Continent;

--QUESTION 7-- Find  the country with the highest average city population.
--ANSWER--
SELECT c.CountryCode,AVG(ci.Population)as AvgCityPopulatiion
from Country c
join City ci on c.Code = ci.CountryCode
group by c.CountryCode
order by AvgCityPopulation DESC
LIMIT 1;

--Question 8--List continents where the average city population is greater than 2000,000.
select c.Continent
from Coountry c
join City ci on c.Code= ci.CountryCode
group by c.Continent
Having avg(ci.Population)>200000;

--Question 9-- Find the total population and average life expectancy for each continent, ordered by average life 
expectancy descending.
--ANSWER--

SELECT Continent,SUM(Population) as TotalPopulation, AVG(LifeExpectancy) as AvgLifeExpectancy
from Country
group by Continent
order by Continent
order by AvgLifeExpectancy desc;

--QUESTION 10-- Find the top 3 continents with the highest average life expectancy,but only include those where the total
population is over 200 million.

--answer--
select Continent, AVG(LifeExpectancy) as AvgLifeExpectaancy
from Country
group by Continent
HAVING SUM(Population)>200000000
order by AvgLifeExpectancy desc
limit 3;


