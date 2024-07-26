-- File table to store file information
CREATE TABLE file (
	id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
	mime_type VARCHAR(100),
	file_key VARCHAR(255) NOT NULL,
	url TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User table to store user profile and security information
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
	avatar_id INT REFERENCES file(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Country table to store country information
CREATE TABLE country (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

-- Person table to store information about people (actors, directors, etc.)
CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	biography TEXT,
	date_of_birth DATE,
	gender VARCHAR(50) CHECK (gender IN ('male', 'female', 'man', 'woman', 'other', 'non-binary', 'pes-patron')),
	country_id INT REFERENCES country(id),
	avatar_image_id INT REFERENCES file(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Genre table to store genre information
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

-- Movie table to store information about movies
CREATE TABLE movie (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	description TEXT,
	budget NUMERIC,
	release_date DATE,
	duration TIME,
	poster_id INT REFERENCES file(id),
	director_id INT REFERENCES person(id),
	country_id INT REFERENCES country(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Movie genres table to store many-to-many relationship between movies and genres
CREATE TABLE movie_genre (
	movie_id INT REFERENCES movie(id),
	genre_id INT REFERENCES genre(id),
	PRIMARY KEY (movie_id, genre_id),
);

-- Character table to store information about characters in movies
CREATE TABLE character (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description TEXT,
	role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
	person_id INT,
	movie_id INT REFERENCES movie(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE favorite_movies (
	user_id INT NOT NULL,
	movie_id INT NOT NULL,
	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id) REFERENCES "user"(id),
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Person photos table to store additional photos for people
CREATE TABLE person_photos (
	id SERIAL PRIMARY KEY,
	person_id INT REFERENCES person(id),
    file_id INT REFERENCES file(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);