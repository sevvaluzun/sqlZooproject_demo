-- 1.
-- How many stops are in the database.
-- Veritabanında kaç durak (stop) var?

SELECT COUNT(*) AS total_stops
FROM stops;


-- 2.
-- Find the id value for the stop 'Craiglockhart'.
-- 'Craiglockhart' adlı durağın id değerini bulun.

SELECT id
FROM stops
WHERE name = 'Craiglockhart';


-- 3.
-- Give the id and the name for the stops on the '4' 'LRT' service.
-- '4' numaralı LRT hattının geçtiği durakların id ve isimlerini verin.

SELECT stops.id, stops.name
FROM route
JOIN stops ON route.stop = stops.id
WHERE route.num = '4' 
  AND route.company = 'LRT';


-- 4.
-- The query counts routes visiting London Road (149) or Craiglockhart (53).
-- Add HAVING to restrict to routes that visit BOTH stops.
-- London Road (149) ve Craiglockhart (53) duraklarına uğrayan hatları (her ikisi de) gösterin.

SELECT company, num, COUNT(*)
FROM route
WHERE stop IN (149, 53)
GROUP BY company, num
HAVING COUNT(DISTINCT stop) = 2;


-- 5.
-- Self-join shows where you can go from Craiglockhart without changing routes.
-- Show services from Craiglockhart (53) to London Road (149).
-- Craiglockhart’tan (53) London Road’a (149) giden hatları gösterin.

SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b 
  ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 
  AND b.stop = 149;


-- 6.
-- Join two copies of stops so you can filter by names rather than ids.
-- Show services between 'Craiglockhart' and 'London Road'.
-- İsimle filtreleyerek 'Craiglockhart' ile 'London Road' arasındaki hatları gösterin.

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
JOIN route b 
  ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' 
  AND stopb.name = 'London Road';


-- 7.
-- List all services which connect stops 115 and 137 ('Haymarket' and 'Leith').
-- 115 (Haymarket) ve 137 (Leith) duraklarını birbirine bağlayan hatları listeleyin.

SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b 
  ON a.company = b.company AND a.num = b.num
WHERE a.stop = 115 
  AND b.stop = 137;


-- 8.
-- List the services which connect 'Craiglockhart' and 'Tollcross'.
-- 'Craiglockhart' ile 'Tollcross' duraklarını bağlayan hatları listeleyin.

SELECT a.company, a.num
FROM route a
JOIN stops s ON a.stop = s.id
WHERE s.name IN ('Craiglockhart', 'Tollcross')
GROUP BY a.company, a.num
HAVING COUNT(DISTINCT s.name) = 2;


-- 9.
-- Distinct list of stops reachable from 'Craiglockhart' by taking one LRT bus (include 'Craiglockhart' itself).
-- Include company and bus number for the services.
-- 'Craiglockhart'tan tek otobüsle (LRT) ulaşılabilen durakların listesini (kendi durağı dahil) firma ve hat numarasıyla verin.

SELECT DISTINCT s2.name, r2.company, r2.num
FROM stops s1
JOIN route r1 ON s1.id = r1.stop
JOIN route r2 ON r1.company = r2.company AND r1.num = r2.num
JOIN stops s2 ON r2.stop = s2.id
WHERE s1.name = 'Craiglockhart' 
  AND r1.company = 'LRT';


  -- 10.
-- Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.
-- Craiglockhart'tan Lochend'e 2 aktarma ile gidilebilen güzergâhları bulun.
-- İlk otobüsün numarası/firması, aktarma durağının adı, ikinci otobüsün numarası/firmasını gösterin.

SELECT DISTINCT
    r1.num AS bus1_num,
    r1.company AS bus1_company,
    s2.name AS transfer_stop,
    r2.num AS bus2_num,
    r2.company AS bus2_company
FROM route r1
JOIN route rA ON (r1.num = rA.num AND r1.company = rA.company)
JOIN stops s1 ON r1.stop = s1.id
JOIN stops s2 ON rA.stop = s2.id
JOIN route rB ON rB.stop = s2.id
JOIN route r2 ON (rB.num = r2.num AND rB.company = r2.company)
JOIN stops s3 ON r2.stop = s3.id
WHERE s1.name = 'Craiglockhart'
  AND s3.name = 'Lochend'
ORDER BY bus1_num, transfer_stop, bus2_num;
