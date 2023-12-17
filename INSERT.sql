INSERT INTO albums(name_album, release_year)
	VALUES
	('WILD EA$T', '2023-04-21'),
	('Маленькие девочки', '2001-01-01'),
	('Time', '2014-07-08'),
	('NO LABEL', '2019-10-04'),
	('everything i wanted', '2019-11-13'),
	('PHUNERAL', '2018-08-23')
	
INSERT INTO collection(name_collection, release_year)
	VALUES
	('Плейлист игроков ЦСКА', '2023-09-29'),
	('Руки Вверх: лучшее', '2023-07-31'),
	('Плейлист для горящих дедлайнов', '2022-08-15'),
	('LIL KRYSTALLL: лучшее', '2023-10-09'),
	('Главное в январе 2020', '2020-01-26'),
	('PHARAOH — Творческий Путь', '2019-01-29')
	
INSERT INTO genres(title)
	VALUES
	('Хип-хоп'),
	('Поп'),
	('EDM'),
	('Альтернатива')
	
INSERT INTO musician(musician_name)
	VALUES
	('SALUKI'),
	('Руки Вверх'),
	('Mr. Kitty'),
	('LIL KRYSTALLL'),
	('Billie Eilish'),
	('PHARAOH')
	
INSERT INTO tracks(title, duration, album_id)
	VALUES
	('ОГНЕЙ', 182, 1),
	('18 мне уже', 245, 2),
	('After Dark', 261, 3),
	('Тик так', 104, 4),
	('Каждый день', 99, 4),
	('Air Force 1', 116, 4),
	('everything i wanted', 245, 5),
	('Мой кайф', 161, 6)
	
INSERT INTO genre_musician(genre_ID, musician_ID)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(1, 4),
	(4, 5),
	(1, 6)
	
INSERT INTO track_collection(track_ID, collection_ID)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 4),
	(6, 4),
	(7, 5),
	(8, 6)

INSERT INTO album_musician(album_ID, musician_ID)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6)