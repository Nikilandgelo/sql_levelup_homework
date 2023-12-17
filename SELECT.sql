-- самый длительный трек 1 вариант
SELECT 
	title, (SELECT MAX(duration) FROM tracks) AS longest_track_sec
FROM
	tracks
WHERE
	duration = (SELECT MAX(duration) FROM tracks)
	
-- самый длительный трек 2 вариант (возможно медленнее)
SELECT 
	title, duration
FROM
	tracks
ORDER BY
	duration DESC
LIMIT 1

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT
	title
FROM
	tracks
WHERE
	duration >= 210
	
-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT
	name_collection
FROM
	collection
WHERE
	release_year BETWEEN '2018-01-01' AND '2021-01-01'
	
-- Исполнители, чьё имя состоит из одного слова
SELECT 
	musician_name
FROM
	musician
WHERE 
	musician_name NOT LIKE '% %'
	
-- Название треков, которые содержат слово «мой» или «my»
SELECT
	title
FROM 
	tracks
WHERE 
	(LOWER(title) LIKE '%мой%') OR (LOWER(title) LIKE '%my%')
	
-- Количество исполнителей в каждом жанре
SELECT
	genres.title, COUNT(*)
FROM 
	genre_musician
INNER JOIN 
	genres ON genre_musician.genre_id = genres.genre_id
GROUP BY 
	genres.title
	
-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT 
	COUNT(*) AS count_tracks_2019_2020
FROM 
	tracks
INNER JOIN 
	albums ON tracks.album_id = albums.album_id
WHERE 
	albums.release_year BETWEEN '2019-01-01' AND '2021-01-01'
	
-- Средняя продолжительность треков по каждому альбому
SELECT 
	albums.name_album, AVG(tracks.duration) AS AVG_track_sec
FROM 
	tracks
INNER JOIN 
	albums ON tracks.album_id = albums.album_id
GROUP BY albums.name_album

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT 
	musician.musician_name 
FROM 
	album_musician
INNER JOIN 
	albums ON album_musician.album_id = albums.album_id
INNER JOIN
	musician ON album_musician.musician_id = musician.musician_id
WHERE 
	albums.release_year NOT BETWEEN '2020-01-01' AND '2021-01-01'
	
-- Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT 
	collection.name_collection, musician.musician_name
FROM
	track_collection
INNER JOIN 
	tracks ON track_collection.track_id = tracks.track_id
INNER JOIN
	collection ON track_collection.collection_id = collection.collection_id
INNER JOIN 
	album_musician ON tracks.album_id = album_musician.album_id
INNER JOIN 
	musician ON album_musician.musician_id = musician.musician_id 
WHERE 
	musician.musician_name = 'SALUKI'
	
-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT 
	musician.musician_name, tracks.title, tracks.duration
FROM
	tracks
INNER JOIN
	album_musician ON tracks.album_id = album_musician.album_id 
INNER JOIN 
	musician ON album_musician.musician_id = musician.musician_id
WHERE 
	tracks.duration = (SELECT MIN(duration) FROM tracks)