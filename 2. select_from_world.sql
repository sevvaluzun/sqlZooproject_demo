-- 1.
-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
-- (Bu tablo hakkındaki notları okuyun. Tüm ülkelerin adını, kıtasını ve nüfusunu gösteren SQL komutunun sonucunu gözlemleyin.)
SELECT name, continent, population 
FROM world;


-- 2.
-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million.
-- (WHERE ile nasıl filtreleme yapılır. Nüfusu en az 200 milyon olan ülkelerin adını gösterin.)
SELECT name 
FROM world 
WHERE population >= 200000000;


-- 3.
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
-- (Nüfusu en az 200 milyon olan ülkeler için kişi başına düşen GSYİH ve ülke adını gösterin.)
SELECT name, gdp / population 
FROM world 
WHERE population >= 200000000;


-- 4.
-- Show the name and population in millions for the countries of the continent 'South America'.
-- ('South America' kıtasındaki ülkeler için isim ve milyon cinsinden nüfuslarını gösterin.)
SELECT name, population / 1000000 
FROM world 
WHERE continent = 'South America';


-- 5.
-- Show the name and population for France, Germany, Italy
-- (France, Germany ve Italy için isim ve nüfusu gösterin.)
SELECT name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy');


-- 6.
-- Show the countries which have a name that includes the word 'United'
-- (İsminde 'United' kelimesi geçen ülkeleri gösterin.)
SELECT name 
FROM world 
WHERE name LIKE '%United%';


-- 7.
-- Show the countries that are big by area or big by population. Show name, population and area.
-- (Yüzölçümü 3 milyon km²’den fazla veya nüfusu 250 milyondan fazla olan ülkeleri gösterin. Ad, nüfus ve alan dahil.)
SELECT name, population, area 
FROM world 
WHERE area > 3000000 OR population >= 250000000;


-- 8.
-- Show the countries that are big by area or big by population but not both. Show name, population and area.
-- (Yalnızca yüzölçümü ya da yalnızca nüfusu büyük olan ülkeleri gösterin. İkisi birden olanları hariç tutun.)
SELECT name, population, area 
FROM world 
WHERE (area > 3000000 AND population <= 250000000)
   OR (area < 3000000 AND population >= 250000000);


-- 9.
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- ('South America' kıtasındaki ülkeler için isim, milyon cinsinden nüfus ve milyar cinsinden GSYİH'yı iki ondalıklı gösterin.)
--SONRADAN COZULDU VERİ TİPİ HATASI
SELECT 
  name, 
  ROUND(population / 1000000.0, 2) AS population_millions,
  ROUND(gdp / 1000000000.0, 2) AS gdp_billions
FROM world
WHERE continent = 'South America';



-- 10.
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000). Round this value to the nearest 1000.
-- (GSYİH'si en az 1 trilyon olan ülkelerin kişi başına düşen GSYİH'sini en yakın 1000'e yuvarlayarak gösterin.)
SELECT name, 
       ROUND(gdp / population, -3) 
FROM world 
WHERE gdp >= 1000000000000;


-- 11.
-- Show the name and capital where the name and the capital have the same number of characters.
-- (Adı ve başkenti aynı karakter uzunluğuna sahip ülkeleri gösterin.)
SELECT name, capital 
FROM world 
WHERE LENGTH(name) = LENGTH(capital);


-- 12.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- (Ülke adı ve başkentinin ilk harfi aynı olanları gösterin. İsim ve başkent tamamen aynıysa dahil etmeyin.)
SELECT name, capital 
FROM world 
WHERE LEFT(name, 1) = LEFT(capital, 1) 
  AND name <> capital;


-- 13.
-- Find the country that has all the vowels and no spaces in its name.
-- (Adında tüm sesli harfler bulunan ve boşluk içermeyen ülkeyi bulun.)
SELECT name 
FROM world 
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';
