SELECT
    p.id AS ID,
    p.first_name AS "First name",
    p.last_name AS "Last name",
    COALESCE(SUM(m.budget), 0) AS "Total movies budget"
FROM
    person p
JOIN
    character c ON p.id = c.person_id
JOIN
    movie m ON EXISTS (
        SELECT 1
        FROM jsonb_array_elements(m.characters) AS character
        WHERE (character->>'id')::INT = c.id
    )
GROUP BY
    p.id, p.first_name, p.last_name
ORDER BY
    p.id;