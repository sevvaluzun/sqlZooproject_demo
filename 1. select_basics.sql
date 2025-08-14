-- 1.
-- The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
-- Modify it to show the population of Germany
-- Örnek, 'France' (Fransa) ülkesinin nüfusunu göstermek için WHERE koşulunu kullanır.
-- Metinlerin tek tırnak içinde olması gerektiğine dikkat edin;
-- Bunu 'Germany' (Almanya) ülkesinin nüfusunu gösterecek şekilde değiştirin.

SELECT population FROM world
  WHERE name = 'Germany';


-- 2.
-- Checking a list The word IN allows us to check if an item is in a list.
-- The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
-- Liste kontrolü: IN ifadesi, bir öğenin bir listede olup olmadığını kontrol etmemizi sağlar.
-- Örnek, 'Brazil', 'Russia', 'India' ve 'China' ülkelerinin isim ve nüfusunu gösterir.
-- 'Sweden', 'Norway' ve 'Denmark' ülkelerinin isim ve nüfusunu gösterin.

SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway','Denmark');


-- 3.
-- Which countries are not too small and not too big?
-- BETWEEN allows range checking (range specified is inclusive of boundary values).
-- The example below shows countries with an area of 250,000-300,000 sq. km.
-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
-- Hangi ülkeler ne çok küçük ne de çok büyük?
-- BETWEEN, aralık kontrolü yapmamızı sağlar (belirtilen aralık sınır değerleri de dahil eder).
-- Aşağıdaki örnek, 250.000–300.000 km² yüzölçümüne sahip ülkeleri gösterir.
-- Bunu, yüzölçümü 200.000 ile 250.000 km² arasında olan ülkelerin isim ve alanlarını gösterecek şekilde değiştirin.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;