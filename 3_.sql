SELECT 
	u.id as ID,
	u.username as "Username",
	ARRAY_AGG(fm.movie_id) AS "Favorite movie IDS"
FROM 
	"user" u
JOIN 
	favorite_movies fm ON u.id = fm.user_id
GROUP BY
	u.id, u.username