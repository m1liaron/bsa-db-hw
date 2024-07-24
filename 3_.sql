SELECT
    u.id AS ID,
    u.username AS "Username",
    ARRAY_AGG(f.movie_id) AS "Favorite movie IDs"
FROM
    "user" u
LEFT JOIN
    favorite_movies f ON u.id = f.user_id
GROUP BY
    u.id, u.username
ORDER BY
    u.id;
