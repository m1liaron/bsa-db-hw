SELECT 
	m.id AS ID
	m.title as 'Title'
	m.realease_date as 'Release date'
	m.duration as 'Duration'
	m.description as 'Description'
	m.poster as 'Poster'
	m.director as 'Director'
FROM 
	moivie m
WHERE
	m.country = 'USA'
	AND m.realease_date >= '2022-01-01'
	AND EXTRACT(EPOCH FROM m.duration) > EXTRACT(EPOCH FROM INTERVAL '2 hours 15 minutes'])
	ADD EXISTS(
		SELECT 1
		FROM jsonb_array_elements(m.genres) AS gengre
		WHERE genre->>'name' IN ('Action', 'Drama')
	)