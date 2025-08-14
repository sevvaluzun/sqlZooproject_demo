-- 1.
-- List the films where the yr is 1962 and the budget is over 2000000 [Show id, title]
-- 1962 yılı olup bütçesi 2.000.000'dan büyük olan filmleri listeleyin [id ve başlık gösterin].

SELECT id, title
 FROM movie
 WHERE yr=1962


-- 2.
-- Give year of 'Citizen Kane'.
-- 'Citizen Kane' filminin yılını verin.

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';


-- 3.
-- List all of the Star Trek movies, include the id, title and yr (all of these movies start with the words Star Trek in the title). Order results by year.
-- Tüm Star Trek filmlerini id, başlık ve yıl ile listeleyin (başlığı 'Star Trek' ile başlar). Sonuçları yıla göre sıralayın.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;


-- 4.
-- What id number does the actor 'Glenn Close' have?
-- 'Glenn Close' adlı oyuncunun id numarasını bulun.

SELECT id FROM actor WHERE name = 'Glenn Close'


-- 5.
-- What is the id of the 1942 film 'Casablanca'
-- 1942 yapımı 'Casablanca' filminin id'si nedir?

SELECT id FROM movie WHERE title='Casablanca'


-- 6.
-- Obtain the cast list for 1942's 'Casablanca'.
-- 1942 yapımı 'Casablanca' filminin oyuncu listesini alın. (movieid=11768 kullanın)
---YANLIŞ CEVAP

SELECT
  actor.name
FROM movie
JOIN casting
  ON movie.id = casting.movieid
JOIN actor
  ON casting.actorid = actor.id
WHERE
  movie.title = 'Casablanca' AND movie.yr = 1942;


-- 7.
-- Obtain the cast list for the film 'Alien'
-- 'Alien' filminin oyuncu listesini alın.

SELECT
  actor.name
FROM movie
JOIN casting
  ON movie.id = casting.movieid
JOIN actor
  ON casting.actorid = actor.id
WHERE
  movie.title = 'Alien';

-- 8.
-- List the films in which 'Harrison Ford' has appeared
-- 'Harrison Ford'un oynadığı filmleri listeleyin.

SELECT title FROM casting
JOIN actor ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id WHERE actor.name='Harrison Ford'


-- 9.
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- ('ord=1' başrol demektir; başrol değilse listeleyin.)

SELECT movie.title
FROM casting
JOIN actor ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford'
 AND casting.ord <> 1;


-- 10.
-- List the films together with the leading star for all 1962 films.
-- 1962 yılındaki tüm filmler için film ve başrol oyuncusunu listeleyin.

SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movie.yr = 1962 AND casting.ord = 1;


-- 11.
-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
-- 'Rock Hudson' için en yoğun yılları (yılda 2'den fazla film olanlar) yıl ve film sayısı ile gösterin.

SELECT movie.yr, COUNT(*) AS movie_count
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(*) > 2;


-- 12.
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
-- 'Julie Andrews'un oynadığı tüm filmler için film adı ve başrolü listeleyin.

SELECT DISTINCT m.title, a2.name
FROM movie m
JOIN casting c1 ON m.id = c1.movieid
JOIN actor a1 ON c1.actorid = a1.id
JOIN casting c2 ON m.id = c2.movieid
JOIN actor a2 ON c2.actorid = a2.id
WHERE a1.name = 'Julie Andrews'
  AND c2.ord = 1;


-- 13.
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
-- En az 15 başrolü olan oyuncuları alfabetik sırayla listeleyin.

SELECT actor.name
FROM actor 
JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15
ORDER BY actor.name;


-- 14.
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
-- 1978'de çıkan filmleri, oyuncu sayısına göre (azalan), sonra başlığa göre sıralayın.

SELECT m.title, COUNT(*) AS actor_count
FROM casting c
JOIN movie m ON c.movieid = m.id
WHERE m.yr = 1978
GROUP BY m.id, m.title
ORDER BY actor_count DESC, m.title;


-- 15.
-- List all the people who have worked with 'Art Garfunkel'.
-- 'Art Garfunkel' ile birlikte çalışmış tüm kişileri listeleyin.

SELECT DISTINCT a2.name
FROM actor a1
JOIN casting c1 ON a1.id = c1.actorid
JOIN casting c2 ON c1.movieid = c2.movieid
JOIN actor a2 ON c2.actorid = a2.id
WHERE a1.name = 'Art Garfunkel'
  AND a2.name <> 'Art Garfunkel';


