SELECT
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release date",
    m.duration AS "Duration",
    m.description AS "Description",
    json_build_object(
        'id', f.id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'file_key', f.file_key,
        'url', f.url
    ) AS "Poster",
    json_build_object(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name
    ) AS "Director"
FROM
    movie m
JOIN
    file f ON m.poster_id = f.id
JOIN
    person p ON m.director_id = p.id
JOIN
    movie_genre mg ON m.id = mg.movie_id
JOIN
    genre g ON mg.genre_id = g.id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > interval '2 hours 15 minutes'
    AND g.name IN ('Action', 'Drama')
GROUP BY
    m.id, f.id, p.id;