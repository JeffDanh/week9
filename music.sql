-- CREATE TABLE artist(
--     id serial PRIMARY KEY,
--     name varchar
-- );

-- CREATE TABLE album(
--     id serial PRIMARY KEY,
--     name varchar,
--     release_year integer,
--     artist_id integer REFERENCES artist(id)
-- );

-- CREATE TABLE track(
--     id serial PRIMARY KEY,
--     name varchar,
--     duration integer,
--     artist_id integer REFERENCES artist(id),
--     album_id integer REFERENCES album(id)
-- );

-- CREATE TABLE song(
--     id serial PRIMARY KEY,
--     name varchar,
--     duration integer,
--     artist_id integer REFERENCES artist(id),
--     album_id integer REFERENCES album(id),
--     song_writer_id integer REFERENCES song_writer(id)
-- );

-- CREATE TABLE song_writer(
--     id serial PRIMARY KEY,
--     name varchar
-- );




-- INSERT INTO artist (name) VALUES ('Bruno Mars');
-- INSERT INTO artist (name) VALUES ('Tori Kelly');
-- INSERT INTO artist (name) VALUES ('XYLO');
-- INSERT INTO artist (name) VALUES ('Blackbear');
-- INSERT INTO artist (name) VALUES ('Klangkarussell');

-- INSERT INTO album(name, release_year, artist_id) VALUES ('Unorthodox Jukebox', 2012, 1);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('Doo-Wops & Hooligans', 2010, 1);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('Foreword', 2013, 2);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('Unbreakable Smile', 2015, 2);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('America', 2016, 3);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('Deadroses', 2015, 4);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('digital druglord', 2017, 4);
-- INSERT INTO album(name, release_year, artist_id) VALUES ('Netzwerk', 2014, 5);

-- INSERT INTO song_writer (name) VALUES ('Bruno Mars');
-- INSERT INTO song_writer (name) VALUES ('Tori Kelly');
-- INSERT INTO song_writer (name) VALUES ('XYLO');
-- INSERT INTO song_writer (name) VALUES ('Blackbear');
-- INSERT INTO song_writer (name) VALUES ('Klangkarussell');



-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Young Girls', 349, 1, 1, 1);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Moonshine', 349, 1, 1, 1);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Locked Out Of Heaven', 354, 1, 1, 1);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Grenade', 342, 1, 2, 1);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Talking to the Moon', 337, 1, 2, 1);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Rocket', 222, 2, 3, 2);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Dear No One', 318, 2, 3, 2);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('City Dove', 343, 2, 4, 2);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('L.A. Love Song', 338, 3, 5, 3);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('90210', 343, 4, 6, 4);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('i miss the old u', 331, 4, 7, 4);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Do Re Mi', 332, 4, 7, 4);
-- INSERT INTO song (name, duration, artist_id, album_id, song_writer_id) VALUES ('Sonnentanz', 600, 5, 8, 5);


-- 1
SELECT * FROM song INNER JOIN album ON song.album_id = album.id ORDER BY album.name;

--2
SELECT album FROM album INNER JOIN artist ON album.artist_id = artist.id WHERE artist.name = 'Bruno Mars';

--3
SELECT * FROM song ORDER BY duration desc LIMIT 1;

--4
SELECT * FROM album WHERE release_year >= 1960 AND release_year < 1970;
SELECT * FROM album WHERE release_year >= 1970 AND release_year < 1980;
SELECT * FROM album WHERE release_year >= 1980 AND release_year < 1980;
SELECT * FROM album WHERE release_year >= 1990 AND release_year < 2000;

--5
SELECT * FROM album INNER JOIN artist ON album.artist_id = artist.id WHERE album.release_year >= 1990 AND album.release_year < 2000 AND artist.name = 'Klangkarussell';

--6
SELECT artist.name, MAX(album.year) FROM artist INNER JOIN album ON album.artist_id = artist.id GROUP BY artist.id;

--7
SELECT * FROM artist FULL OUTER JOIN album ON artist.id = album.artist_id WHERE album.release_year = (SELECT MAX(album.release_year) FROM album WHERE album.artist_id = artist.id);

--8
SELECT album, SUM(song.duration) FROM album JOIN song WHERE album.id = song.album_id GROUP BY album.name;

--9
SELECT artist.name, COUNT(album.name) FROM artist LEFT OUTER JOIN album ON artist.id = album.artist_id ORDER BY count desc LIMIT 5;

--10
SELECT artist.name, song.name FROM artist LEFT OUTER JOIN song ON artist.id = song.artist_id WHERE artist.name = 'Blackbear';

--11?

--12?

--13?

--14
SELECT * FROM song LEFT OUTER JOIN artist ON song.artist_id = artist.id;

--15?

--16?
