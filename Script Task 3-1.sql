
CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	alias VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS genresartists (
	genresid INTEGER REFERENCES genres(id),
	artistsid INTEGER REFERENCES artists(id),
	CONSTRAINT pkgenresartists PRIMARY KEY (genresid, artistsid)
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	releaseyear DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS artistsalbums (
	artistsid INTEGER REFERENCES artists(id),
	albumsid INTEGER REFERENCES albums(id),
	CONSTRAINT pkartistsalbums PRIMARY KEY (artistsid, albumsid)
);

CREATE TABLE IF NOT EXISTS musicalcompositions (
	id SERIAL PRIMARY KEY,
	albumsid INTEGER NOT NULL REFERENCES albums(id),
	title VARCHAR(100) NOT NULL,
	duration INTERVAL SECOND NOT NULL
);

CREATE TABLE IF NOT EXISTS musiccollections (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	releaseyear DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS collectionscompositions (
	compositionsid INTEGER REFERENCES musicalcompositions(id),
	collectionsid INTEGER REFERENCES musiccollections(id),
	CONSTRAINT pkcollectionscompositions PRIMARY KEY (compositionsid, collectionsid)
);
