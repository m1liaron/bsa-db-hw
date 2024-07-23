SELECT
    m.id AS ID,
    m.title AS "Title",
    COUNT(DISTINCT c.id) AS "Actors count"
FROM
    movie m
JOIN
    LATERAL jsonb_array_elements(m.characters) AS character ON TRUE
JOIN
    character c ON (character->>'id')::INT  = c.id
WHERE 
	m.release_date >= CURRENT_DATE - INTERVAL '5 years	'
GROUP BY
    m.id, m.title
ORDER BY
    m.id;
