-- 1.
-- Show the total population of the world.
-- Dünyanın toplam nüfusunu gösterin.

SELECT SUM(population)
FROM world;


-- 2.
-- List all the continents - just once each.
-- Tüm kıtaları (her birini yalnızca bir kez) listeleyin.

SELECT DISTINCT continent
FROM world;


-- 3.
-- Give the total GDP of Africa.
-- Afrika kıtasının toplam GSYİH’sini gösterin.

SELECT SUM(gdp) 
FROM world 
WHERE continent = 'Africa';


-- 4.
-- How many countries have an area of at least 1000000.
-- Yüzölçümü en az 1.000.000 olan ülke sayısını bulun.

SELECT COUNT(name) 
FROM world 
WHERE area >= 1000000;


-- 5.
-- What is the total population of ('Estonia', 'Latvia', 'Lithuania').
-- 'Estonia', 'Latvia', 'Lithuania' ülkelerinin toplam nüfusunu gösterin.

SELECT SUM(population) 
FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');


-- 6.
-- For each continent show the continent and number of countries.
-- Her kıta için kıta adını ve ülke sayısını gösterin.

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;


-- 7.
-- For each continent show the continent and number of countries with populations of at least 10 million.
-- Her kıta için nüfusu en az 10 milyon olan ülkelerin sayısını gösterin.

SELECT continent, COUNT(name) 
FROM world 
WHERE population >= 10000000 
GROUP BY continent;


-- 8.
-- List the continents that have a total population of at least 100 million.
-- Toplam nüfusu en az 100 milyon olan kıtaları listeleyin.

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
