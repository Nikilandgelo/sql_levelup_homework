CREATE TABLE albums (
	album_ID SERIAL PRIMARY KEY,
	name_album VARCHAR(50) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE collection (
	collection_ID SERIAL PRIMARY KEY,
	name_collection VARCHAR(50) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE genres (
	genre_ID SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	UNIQUE(title)
);

CREATE TABLE musician (
	musician_ID SERIAL PRIMARY KEY,
	musician_name VARCHAR(50) NOT NULL
);

CREATE TABLE tracks (
	track_ID SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER REFERENCES albums(album_ID)
);


-- Таблицы посредники в связи многие ко многим

CREATE TABLE genre_musician (
	genre_ID INTEGER REFERENCES genres(genre_ID),
	musician_ID INTEGER REFERENCES musician(musician_ID),
	PRIMARY KEY (genre_ID, musician_ID)
);

CREATE TABLE track_collection (
	track_ID INTEGER REFERENCES tracks(track_ID),
	collection_ID INTEGER REFERENCES collection(collection_ID),
	PRIMARY KEY (track_ID, collection_ID)
);

CREATE TABLE album_musician (
	album_ID INTEGER REFERENCES albums(album_ID),
	musician_ID INTEGER REFERENCES musician(musician_ID),
	PRIMARY KEY (album_ID, musician_ID)
);