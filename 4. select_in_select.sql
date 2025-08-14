-- 1.
-- List each country name where the population is larger than that of 'Russia'.
-- 'Russia' ülkesinden daha büyük nüfusa sahip ülkelerin isimlerini listeleyin.

SELECT name 
FROM world
WHERE population > (
    SELECT population 
    FROM world
    WHERE name = 'Russia'
);


-- 2.
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- Avrupa kıtasında kişi başına düşen GSYİH'si 'United Kingdom'dan büyük olan ülkeleri gösterin.

SELECT name
FROM world
WHERE continent = 'Europe'
  AND gdp / population > (
    SELECT gdp / population
    FROM world
    WHERE name = 'United Kingdom'
  );


-- 3.
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
-- Kıtası 'Argentina' veya 'Australia' olan tüm ülkelerin isim ve kıtalarını listeleyin, ülke adına göre sıralayın.

SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name;


-- 4.
-- Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
-- Nüfusu 'United Kingdom'dan fazla, 'Germany'den az olan ülkelerin isim ve nüfusunu gösterin.

SELECT name, population
FROM world
WHERE population > (
    SELECT population FROM world WHERE name = 'United Kingdom'
)
AND population < (
    SELECT population FROM world WHERE name = 'Germany'
);


-- 5.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- Avrupa’daki her ülkenin ismini ve nüfusunu, Almanya nüfusuna oran olarak gösterin.

SELECT 
  name,
  CONCAT(ROUND(100 * population / (
    SELECT population FROM world WHERE name = 'Germany'
  )), '%') AS percentage_of_germany
FROM world
WHERE continent = 'Europe';


-- 6.
-- Which countries have a GDP greater than every country in Europe? [Give the name only.]
-- Avrupa’daki tüm ülkelerden daha yüksek GSYİH’ye sahip ülkeleri listeleyin (sadece isim).

SELECT name
FROM world
WHERE gdp > (
    SELECT MAX(gdp)
    FROM world
    WHERE continent = 'Europe'
)
AND gdp IS NOT NULL;


-- 7.
-- Find the largest country (by area) in each continent, show the continent, the name and the area.
-- Her kıtanın yüzölçümü en büyük ülkesini kıta adı, ülke adı ve alanıyla gösterin.

SELECT w.continent, w.name, w.area
FROM world w
WHERE w.area = (
    SELECT MAX(area)
    FROM world
    WHERE continent = w.continent
);


-- 8.
-- List each continent and the name of the country that comes first alphabetically.
-- Her kıtada alfabetik olarak ilk sırada gelen ülkeyi kıta adıyla birlikte listeleyin.

SELECT continent, name
FROM world w1
WHERE name = (
  SELECT MIN(name)
  FROM world w2
  WHERE w2.continent = w1.continent
);


-- 9.
-- Find the continents where all countries have a population <= 25000000. 
-- Then find the names of the countries associated with these continents. 
-- Show name, continent and population.
-- Tüm ülkeleri nüfusu 25 milyon veya daha az olan kıtaları bulun ve bu kıtalardaki ülkelerin isim, kıta ve nüfusunu gösterin.

SELECT name, continent, population
FROM world
WHERE continent IN (
  SELECT continent
  FROM world
  GROUP BY continent
  HAVING MAX(population) <= 25000000
);


--10
-- Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
-- Bazı ülkelerin nüfusları, aynı kıtadaki tüm komşularının toplamının üç katından fazladır. Bu ülkeleri ve kıtalarını verin.
--- YANLIŞ CEVAP
 SELECT
  name,
  continent
FROM world AS country1
WHERE
  country1.population > 3 * (
    SELECT MAX(population)
    FROM world AS country2
    WHERE
      country2.continent = country1.continent
      AND country2.name != country1.name
  );