-- Insert into file table
INSERT INTO file (file_name, mime_type, file_key, url) VALUES
('poster1.jpg', 'image/jpeg', 'key1', 'http://example.com/poster1.jpg'),
('poster2.jpg', 'image/jpeg', 'key2', 'http://example.com/poster2.jpg'),
('avatar1.jpg', 'image/jpeg', 'key3', 'http://example.com/avatar1.jpg'),
('avatar2.jpg', 'image/jpeg', 'key4', 'http://example.com/avatar2.jpg'),
('photo1.jpg', 'image/jpeg', 'key5', 'http://example.com/photo1.jpg'),
('photo2.jpg', 'image/jpeg', 'key6', 'http://example.com/photo2.jpg');

-- Insert into country table
INSERT INTO country (name) VALUES 
('USA'), 
('Canada'), 
('Ukraine');

-- Insert into genre table
INSERT INTO genre (name) VALUES
('Action'), 
('Drama'), 
('Comedy'), 
('Horror');

-- Insert into person table (directors and actors)
INSERT INTO person (first_name, last_name, biography, date_of_birth, gender, country_id, avatar_image_id) VALUES
('John', 'Doe', 'A renowned director...', '1970-01-01', 'male', 1, 3),
('Jane', 'Smith', 'An experienced actor...', '1980-02-02', 'female', 2, 4),
('Alex', 'Johnson', 'A versatile actor...', '1990-03-03', 'man', 3, 5),
('Emily', 'Davis', 'An upcoming star...', '1995-04-04', 'woman', 1, 6);

-- Insert into movie table
INSERT INTO movie (title, description, budget, release_date, duration, poster_id, director_id, country_id) VALUES
('The Last Adventure', 'A dramatic tale of a hero''s last journey...', 5000000, '2022-05-01', '02:30:00', 1, 1, 1),
('The Great Battle', 'An action-packed story...', 7500000, '2023-07-15', '02:45:00', 2, 1, 1),
('Comedy Nights', 'A hilarious comedy...', 3000000, '2021-10-10', '01:50:00', 1, 2, 2);

-- Insert into movie_genre table
INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1, 2), -- Drama
(2, 1), -- Action
(3, 3); -- Comedy

-- Insert into character table
INSERT INTO character (name, description, role, person_id, movie_id) VALUES
('Hero', 'The main protagonist', 'leading', 2, 1),
('Villain', 'The main antagonist', 'supporting', 3, 1),
('Sidekick', 'The hero''s sidekick', 'supporting', 4, 2),
('Comedian', 'The funny character', 'leading', 4, 3);

-- Insert into user table
INSERT INTO "user" (username, first_name, last_name, email, password, avatar_id) VALUES
('user1', 'Alice', 'Brown', 'alice@example.com', 'password1', 3),
('user2', 'Bob', 'White', 'bob@example.com', 'password2', 4);

-- Insert into favorite_movies table
INSERT INTO favorite_movies (user_id, movie_id) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Insert into person_photos table
INSERT INTO person_photos (person_id, file_id) VALUES
(1, 5),
(2, 6),
(3, 5),
(4, 6);