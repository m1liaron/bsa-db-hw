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