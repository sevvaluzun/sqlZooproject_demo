-- 1.
-- Change the query shown so that it displays Nobel prizes for 1950.
-- Sorguyu, 1950 yılına ait Nobel ödüllerini gösterecek şekilde değiştirin.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;


-- 2.
-- Show who won the 1962 prize for literature.
-- 1962 yılı Edebiyat ödülünü kazanan kişiyi gösterin.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';


-- 3.
-- Show the year and subject that won 'Albert Einstein' his prize.
-- 'Albert Einstein'ın ödül aldığı yıl ve dalı gösterin.

SELECT yr, subject 
FROM nobel 
WHERE winner = 'Albert Einstein';


-- 4.
-- Give the name of the 'peace' winners since the year 2000, including 2000.
-- 2000 yılı ve sonrasında (2000 dahil) Barış ödülü kazananların isimlerini gösterin.

SELECT winner
FROM nobel
WHERE subject = 'Peace'
  AND yr >= 2000;


-- 5.
-- Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
-- 1980–1989 yılları (her iki yıl dahil) arasındaki Edebiyat ödülü kazananların tüm bilgilerini gösterin.

SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'Literature'
  AND yr BETWEEN 1980 AND 1989;


-- 6.
-- Show all details of the presidential winners:
-- Theodore Roosevelt, Thomas Woodrow Wilson, Jimmy Carter, Barack Obama
-- Bu başkanların tüm Nobel ödülü bilgilerini gösterin.

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                 'Thomas Woodrow Wilson',
                 'Jimmy Carter',
                 'Barack Obama');


-- 7.
-- Show the winners with first name John.
-- Adı John ile başlayan kazananları gösterin.

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';


-- 8.
-- Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
-- 1980 yılı Fizik ödülü kazananları ile 1984 yılı Kimya ödülü kazananlarını birlikte gösterin.

SELECT yr, subject, winner
FROM nobel
WHERE (yr = 1980 AND subject = 'Physics')
   OR (yr = 1984 AND subject = 'Chemistry');


-- 9.
-- Show the year, subject, and name of winners for 1980 excluding chemistry and medicine.
-- 1980 yılı kazananları içinde Kimya ve Tıp dalını hariç tutarak listeleyin.

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
  AND subject <> 'Chemistry'
  AND subject <> 'Medicine';


-- 10.
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
-- together with winners of a 'Literature' prize in a later year (after 2004, including 2004).
-- 1910 öncesi (1910 hariç) Tıp ödülü kazananları ile 2004 sonrası (2004 dahil) Edebiyat ödülü kazananlarını gösterin.

SELECT yr, subject, winner
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine')
   OR (yr >= 2004 AND subject = 'Literature');



-- 11.
-- Find all details of the prize won by PETER GRÜNBERG.
-- PETER GRÜNBERG tarafından kazanılan ödülün tüm ayrıntılarını bulun.

-- Non-ASCII characters
SELECT * 
FROM nobel 
WHERE winner = 'PETER GRÜNBERG';