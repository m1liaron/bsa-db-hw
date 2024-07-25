    m.id AS ID,
    m.title AS Title,
    m.release_date AS "Release date",
    m.duration AS Duration,
    m.description AS Description,
	json_build_object(
        'id', f.id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'file_key', f.file_key,
        'url', f.url
    ) AS Poster,
	json_build_object(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name,
        'photo', json_build_object(
            'id', pf.id,
            'file_name', pf.file_name,
            'mime_type', pf.mime_type,
            'file_key', pf.file_key,
            'url', pf.url
        )
    ) AS Director,
	json_agg(
        json_build_object(
            'id', a.id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', json_build_object(
                'id', ap.id,
                'file_name', ap.file_name,
                'mime_type', ap.mime_type,
                'file_key', ap.file_key,
                'url', ap.url
            )
        )
    ) AS Actors,
	json_agg(
		json_build_object(
			'id', g.id,
			'name', g.name
		)
	) AS Genres
    -- m.poster AS Poster,
    -- m.director AS Director,
    -- m.actors AS Actors,
    -- m.genres AS Genres
FROM
    movie m
JOIN
    file f ON m.poster_id = f.id
JOIN
    person p ON m.director_id = p.id
LEFT JOIN
    person_photos pp ON p.id = pp.person_id
LEFT JOIN
    file pf ON pp.file_id = pf.id
LEFT JOIN
    character c ON m.id = c.movie_id
LEFT JOIN
    person a ON c.person_id = a.id
LEFT JOIN
    person_photos ap_p ON a.id = ap_p.person_id
LEFT JOIN
    file ap ON ap_p.file_id = ap.id
LEFT JOIN
	movie_genre mg ON mg.movie_id = m.id
LEFT JOIN
	genre g ON mg.genre_id = g.id
WHERE
    m.id = 1
GROUP BY
    m.id, f.id, p.id, pf.id;
