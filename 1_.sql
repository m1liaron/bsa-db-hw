SELECT
    actor.id AS "ID",
    actor.first_name AS "First name",
    actor.last_name AS "Last name",
    COALESCE(SUM(m.budget), 0) AS "Total movies budget"
FROM
    movie m,
    JSONB_ARRAY_ELEMENTS(m.actors) AS actor_data,
    LATERAL (
        SELECT
            actor_data->>'id' AS id,
            actor_data->>'first_name' AS first_name,
            actor_data->>'last_name' AS last_name
    ) AS actor
GROUP BY
    actor.id, actor.first_name, actor.last_name
ORDER BY
    actor.id;
