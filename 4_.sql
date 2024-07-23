SELECT
    p.id AS ID,
    CONCAT(p.first_name, ' ', p.last_name) AS "Name",
    COALESCE(AVG(m.budget), 0) AS "Average budget"
FROM
    movie m
JOIN
    person p ON p.id = (m.director->>'id')::INT
GROUP BY
    p.id, p.first_name, p.last_name
ORDER BY
    p.id;