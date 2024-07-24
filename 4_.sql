SELECT
    d.id AS "Director ID",
    d.name AS "Director name",
    AVG(m.budget) AS "Average budget"
FROM
    movie m
    CROSS JOIN LATERAL (
        SELECT
            (director->>'id')::INT AS id,
            CONCAT(director->>'first_name', ' ', director->>'last_name') AS name
    ) d
GROUP BY
    d.id, d.name
ORDER BY
    d.id;