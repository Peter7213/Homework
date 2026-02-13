--Задание 2


SELECT duration, name											--Название и продолжительность самого длительного трека.
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks)
LIMIT 1;

SELECT duration, name											--Название треков, продолжительность которых не менее 3,5 минут.
FROM tracks
WHERE duration >= 3.5
ORDER by duration;

SELECT name														--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
FROM collections
WHERE issue_date BETWEEN '2018-01-01' AND '2020-01-01';

SELECT name														--Исполнители, чьё имя состоит из одного слова.
FROM singers 
WHERE name NOT LIKE '% %';


SELECT name														--Название треков, которые содержат слово «мой» или «my».
FROM tracks t 
WHERE name LIKE '%my%';


--Задание 3

SELECT name, COUNT(singer_id)									--Количество исполнителей в каждом жанре.
FROM genres g 
LEFT JOIN singer_genre sg ON g.genre_id = sg.genre_id 
GROUP BY name;

SELECT COUNT(t.track_id )													--Количество треков, вошедших в альбомы 2019–2020 годов.
FROM tracks t 
JOIN albums a ON t.album_id = a.album_id 
WHERE a.issue_date >= '2019-01-01' AND a.issue_date <= '2020-01-01'

SELECT a."name" , AVG(duration)											--Средняя продолжительность треков по каждому альбому.
FROM albums a 
JOIN tracks t ON a.album_id = t.album_id                              --Понял, что тип данных тут скорее должен быть interval чем float, но менять уже не решаюсь
GROUP BY a."name"; 

SELECT s."name" 														--Все исполнители, которые не выпустили альбомы в 2020 году.
FROM singers s 
JOIN album_singer t  ON s.singer_id = t.singer_id 
JOIN albums a ON t.album_id = a.album_id 
WHERE a.issue_date NOT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY s."name"; 

SELECT DISTINCT c."name" 												--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
from collections c 
JOIN track_collection tc ON c.collection_id = tc.collection_id 
JOIN tracks t ON tc.track_id = t.track_id 
JOIN albums a ON t.album_id = a.album_id 
JOIN album_singer t2 ON a.album_id = t2.album_id 
JOIN singers s ON t2.singer_id = s.singer_id
WHERE s.singer_id = 1;

--Задание 4

SELECT a."name"															--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
FROM albums a 
JOIN album_singer t ON a.album_id = t.album_id
JOIN singers s ON t.singer_id = s.singer_id
JOIN singer_genre sg ON s.singer_id = sg.singer_id
GROUP BY a."name" 
HAVING (SELECT COUNT(s.singer_id) >= 2);

SELECT t."name"															--Наименования треков, которые не входят в сборники.
FROM tracks t 
FULL JOIN track_collection tc ON t.track_id = tc.track_id
WHERE tc.collection_id IS NULL
GROUP BY t."name" 

SELECT s."name" 														--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
FROM singers s 
JOIN album_singer t ON s.singer_id = t.singer_id 
JOIN albums a ON t.album_id = a.album_id
JOIN tracks t2 ON a.album_id = t2.album_id 
WHERE duration = (SELECT MIN(duration) FROM tracks) 

--Решение четвертой задачи нагуглил, но сломал себе голову пытаясь применить. Just beyond me.




