CREATE TABLE favorite_movies (
	user_id INT,
	movie_id INT,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id) REFERENCES "user"(id),
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);