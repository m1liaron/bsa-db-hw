CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE file (
	id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
	mime_type VARCHAR(100),
	file_key VARCHAR(255) NOT NULL,
	url TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
	characters JSONB,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	biography TEXT,
	date_of_birth DATE,
	gender VARCHAR(50) CHECK (gender IN ('male', 'female', 'man', 'woman')),
	country VARCHAR(50),
	images TEXT[],
	avatar_image TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE character (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	person_id INT,
	description TEXT,
	role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE favorite_movies (
	user_id INT,
	movie_id INT,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id) REFERENCES "user"(id),
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);