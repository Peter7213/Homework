INSERT INTO singers (S_name)
VALUES ('Michail Stasov'),('Till Deutchmann'),('Mick Round'),('Teary Mc''Cryson'), ('Shaman''ka');					
																													
INSERT INTO genres (G_name)
VALUES ('Pop'),('Heavy metal'), ('Russian shanson'), ('Emo-music'), ('Gibberish');

INSERT INTO albums (A_name, A_issue_date)
VALUES ('Lovingly love love you', '2003-05-16'),
('TEH HELLDEVIL!', '2005-06-08'),
('I''m innocent (please let me out)', '2006-12-06'),
('Tears and blood', '2019-01-30'),
('Brain cancer', '2020-03-30');

INSERT INTO collections (C_name , C_issue_date)
VALUES ('Uber collection', '2011-03-30'),
('Love collection 2013', '2013-01-01'),
('UBERDEATH metal collection', '2015-01-19'),
('Aniversary collection', '2019-12-06');

INSERT INTO tracks (Album_id, T_name, duration)
VALUES (1, 'I lost you and can''t find you', '00:03:14'),
(1, 'Something-something love-love','00:03:18'),
(1, 'The love is love love love', '00:05:13'),
(1, 'Don''t leave me with an alien', '00:04:15'),
(1, 'I''ll get diabetes from this song', '00:05:16');

INSERT INTO tracks (Album_id, T_name, duration)
VALUES (2, 'Supermetal metal track', '00:03:40'),
(2, 'Some metallic noise', '00:08:35'),
(2, 'I''ll bang in iron pot with spoon for 10H strait', '06:00:00'),
(2, 'Metal is awesome', '00:15:30'),
(2, 'Unexpectedly romantic song', '00:02:50'),
(2, 'Rust is an enemy of metal', '00:13:20');

INSERT INTO tracks (Album_id, T_name, duration)
VALUES (3, 'A thousand years in prison', '00:05:18'),
(3, 'I''ll end that judge later', '00:04:14'),
(3, 'The Woodcut', '00:05:30'),
(3, 'Don''t drink to much vodka', '00:08:00'),
(3, '''Kupols'' on my skin', '00:03:13');

INSERT INTO tracks (Album_id, T_name, duration)
VALUES (4, 'Life is suffering', '00:10:15'),
(4, 'Death and metal', '00:01:50'),
(4, 'My last song', '00:20:00'),
(4, 'No, this one is the last song', '00:30:00'),
(4, 'Pain, tears and vodka', '00:04:18');

INSERT INTO tracks (Album_id, T_name, duration)
VALUES (5, 'myself', '00:01:00'),
(5, 'by myself', '00:03:18'),
(5, 'bemy self', '00:05:18'),
(5, 'myself by', '00:07:18'),
(5, 'by myself by', '00:09:18'),
(5, 'beemy', '00:11:18'),
(5, 'premyne', '00:13:18');

INSERT INTO singer_genre (genre_id, singer_id)
VALUES (1, 1), (3, 1), (2, 2), (1, 3), (3, 3), (1, 4), (4, 4), (5, 5);

INSERT INTO ALBUM_SINGER(singer_id, album_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO track_collection (track_id, collection_id)
VALUES (4, 1), (9, 1), (14, 1), (20, 1),
(2, 2), (3, 2), (10, 2), (16, 2), (17, 2),
(6, 3), (9, 3), (15, 3), (18, 3),
(4, 4), (11, 4), (14, 4), (21, 4);


