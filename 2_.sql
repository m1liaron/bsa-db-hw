SELECT
    m.id AS ID,
    m.title AS "Title",
    COUNT(actor_data->>'id') AS "Actors count"
FROM
    movie m,
	JSONB_ARRAY_ELEMENTS(m.actors) AS actor_data
WHERE 
	m.release_date >= CURRENT_DATE - INTERVAL '5 years	'
GROUP BY
    m.id, m.title
ORDER BY
    m.id;
