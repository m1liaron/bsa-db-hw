CREATE TABLE character (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description TEXT,
	role VARCHAR(50) CHECK (role IN ('leading', 'susupporting', 'background')),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);