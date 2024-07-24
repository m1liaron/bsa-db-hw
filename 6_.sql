SELECT
    m.id AS ID,
    m.title AS Title,
    m.release_date AS "Release date",
    m.duration AS Duration,
    m.description AS Description,
    m.poster AS Poster,
    m.director AS Director,
    m.actors AS Actors,
    m.genres AS Genres
FROM
    movie m
WHERE
    m.id = 1;
