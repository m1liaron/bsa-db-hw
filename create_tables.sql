
-- User table
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
	avatar JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- File table
CREATE TABLE file (
	id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
	mime_type VARCHAR(100),
	file_key VARCHAR(255) NOT NULL,
	url TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Movie table
CREATE TABLE movie (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	description TEXT,
	budget NUMERIC,
	release_date DATE,
	country JSONB,
	duration INTERVAL,
	poster JSONB,
	director JSONB,
	actors JSONB,
	genres JSONB,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Person table
CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	biography TEXT,
	date_of_birth DATE,
	gender VARCHAR(50) CHECK (gender IN ('male', 'female', 'man', 'woman')),
	country VARCHAR(50),
	images JSONB[],
	avatar_image TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Character table
CREATE TABLE character (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description TEXT,
	role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
	person_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (person_id) REFERENCES person(id)
);

-- Favorite movies table
CREATE TABLE favorite_movies (
	user_id INT,
	movie_id INT,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id) REFERENCES "user"(id),
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Genres table
CREATE TABLE genres (
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE country (
	id SERIAL PRIMARY KEY,
	name TEXT
)