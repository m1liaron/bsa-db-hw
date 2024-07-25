-- Insert values into the country table
INSERT INTO country (name) VALUES
('USA'),
('UK');

-- Insert values into the file table
INSERT INTO file (file_name, mime_type, file_key, url) VALUES
('avatar1.jpg', 'image/jpeg', 'avatars/avatar1.jpg', 'https://example.com/avatars/avatar1.jpg'),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'https://example.com/posters/poster1.jpg'),
('photo1.jpg', 'image/jpeg', 'photos/photo1.jpg', 'https://example.com/photos/photo1.jpg'),
('photo2.jpg', 'image/jpeg', 'photos/photo2.jpg', 'https://example.com/photos/photo2.jpg');

-- Insert values into the user table
INSERT INTO "user" (username, first_name, last_name, email, password, avatar_id) VALUES
('john_doe', 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', 1),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', 2);

-- Insert values into the person table
INSERT INTO person (first_name, last_name, biography, date_of_birth, gender, country_id, avatar_image_id) VALUES
('Leonardo', 'DiCaprio', 'Leonardo DiCaprio is an American actor and producer.', '1974-11-11', 'male', 1, 3),
('Kate', 'Winslet', 'Kate Winslet is an English actress and singer.', '1975-10-05', 'female', 2, 4);

-- Insert values into the genre table
INSERT INTO genre (name) VALUES
('Drama'),
('Romance'),
('Science Fiction'),
('Thriller');

-- Insert values into the movie table
INSERT INTO movie (title, description, budget, release_date, duration, poster_id, director_id, country_id) VALUES
('Titanic', 'A love story set against the backdrop of the Titanic disaster.', 200000000, '1997-12-19', '3 hours', 2, 1, 1),
('Inception', 'A thief who enters the dreams of others to steal secrets from their subconscious.', 160000000, '2010-07-16', '2 hours 28 minutes', 1, 1, 1);

-- Insert values into the movie_genre table
INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1, 1), -- Titanic is a Drama
(1, 2), -- Titanic is a Romance
(2, 3), -- Inception is a Science Fiction
(2, 4); -- Inception is a Thriller

-- Insert values into the character table
INSERT INTO character (name, description, role, person_id, movie_id) VALUES
('Jack Dawson', 'A young artist who falls in love with Rose.', 'leading', 1, 1),
('Rose DeWitt Bukater', 'A young woman from a wealthy family who falls in love with Jack.', 'leading', 2, 1),
('Dom Cobb', 'A thief who enters the dreams of others to steal secrets from their subconscious.', 'leading', 1, 2);

-- Insert values into the person_photos table
INSERT INTO person_photos (person_id, file_id) VALUES
(1, 3), -- Leonardo DiCaprio's additional photo
(2, 4); -- Kate Winslet's additional photo

INSERT INTO favorite_movies(user_id, movie_id)
VALUES 
	(1, 1),
	(2, 2);