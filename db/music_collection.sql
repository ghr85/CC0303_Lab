-- #Codeclan Week 03 Day 03
-- # Pair Programming available
-- # Music Collection Exercise

DROP TABLE IF EXISTS albums; --this has to go first due to dependencies
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);
