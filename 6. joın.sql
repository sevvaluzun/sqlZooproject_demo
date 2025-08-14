-- 1.
-- Modify it to show the matchid and player name for all goals scored by Germany.
-- Almanya'nın attığı tüm gollerde maç kimliği ve oyuncu adını gösterin.

SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';


-- 2.
-- Show id, stadium, team1, team2 for just game 1012.
-- 1012 numaralı maçın id, stadyum, team1 ve team2 bilgilerini gösterin.

SELECT id, stadium, team1, team2 
FROM game 
WHERE id = 1012;


-- 3.
-- Show the player, teamid, stadium and mdate for every German goal.
-- Almanya'nın attığı her gol için oyuncu, takım id'si, stadyum ve maç tarihini gösterin.

SELECT player, teamid, stadium, mdate
FROM goal
JOIN game ON goal.matchid = game.id
WHERE teamid = 'GER';


-- 4.
-- Show the team1, team2 and player for every goal scored by a player called Mario.
-- İsmi 'Mario' ile başlayan oyuncuların attığı gollerde takım1, takım2 ve oyuncu adını gösterin.

SELECT team1, team2, player 
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE player LIKE 'Mario%';


-- 5.
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
-- İlk 10 dakikada atılan gollerde oyuncu, takım id, teknik direktör ve gol zamanını gösterin.

SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;


-- 6.
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- 'Fernando Santos' teknik direktörü olduğunda (team1) maç tarihlerini ve takım adını listeleyin.

SELECT mdate, teamname 
FROM game 
JOIN eteam ON game.team1 = eteam.id 
WHERE coach = 'Fernando Santos';


-- 7.
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
-- Stadyumu 'National Stadium, Warsaw' olan maçlarda gol atan oyuncuları listeleyin.

SELECT player 
FROM goal 
JOIN game ON goal.matchid = game.id 
WHERE stadium = 'National Stadium, Warsaw';


-- 8.
-- Show the name of all players who scored a goal against Germany.
-- Almanya’ya karşı gol atan tüm oyuncuların adını listeleyin.

SELECT DISTINCT player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER') 
  AND teamid <> 'GER';


-- 9.
-- Show teamname and the total number of goals scored.
-- Takım adını ve atılan toplam gol sayısını gösterin.

SELECT teamname, COUNT(*) AS goals
FROM eteam
JOIN goal ON goal.teamid = eteam.id
GROUP BY teamname;


-- 10.
-- Show the stadium and the number of goals scored in each stadium.
-- Her stadyumda atılan gol sayısını gösterin.

SELECT stadium, COUNT(*) AS goals
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;


-- 11.
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
-- 'POL' takımıyla oynanan her maç için maç id, tarih ve atılan toplam gol sayısını gösterin.

SELECT 
  game.id AS matchid,
  game.mdate,
  COUNT(goal.gtime) 
FROM game
JOIN goal ON goal.matchid = game.id
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY game.id, game.mdate;


-- 12.
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
-- 'GER' takımının gol attığı her maç için maç id, tarih ve 'GER'in attığı gol sayısını gösterin.

SELECT
  goal.matchid,
  game.mdate,
  COUNT(*)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid, game.mdate;
