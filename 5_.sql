SELECT
    m.id AS ID,
    m.title AS Title,
    m.release_date AS "Release date",
    m.duration AS Duration,
    m.description AS Description,
    m.poster AS Poster,
    m.director AS Director
FROM
	movie m
WHERE
	m.country = 'USA'
	AND m.release_date >= '2022-01-01'
	 AND EXTRACT(EPOCH FROM m.duration) > EXTRACT(EPOCH FROM INTERVAL '2 hours 15 minutes')
    AND EXISTS (
        SELECT 1
        FROM jsonb_array_elements(m.genres) AS genre
        WHERE genre->>'name' IN ('Action', 'Drama')
    );