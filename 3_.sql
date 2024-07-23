CREATE TABLE movie (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	description TEXT,
	budget NUMERIC,
	release_date DATE,
	duration INTERVAL,
	genres TEXT[],
	director_name VARCHAR(255),
	country VARCHAR(100),
	poster_url TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);