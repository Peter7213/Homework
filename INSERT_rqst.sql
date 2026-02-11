insert into singers (name)
values ('Michail Stasov'),('Till Deutchmann'),('Mick Round'),('Teary Mc''Cryson');

insert into genres (name)
values ('Pop'),('Heavy metal'), ('Russian shanson'), ('Emo');

insert into albums (name, issue_date)
values ('Lovingly love love you', '2003-05-16'),
('TEH HELLDEVIL!', '2005-06-08'),
('I''m innocent (please let me out)', '2006-12-06'),
('Tears and blood', '2010-01-30');

insert into collections (name , issue_date)
values ('Uber collection', '2011-03-30'),
('Love collection 2013', '2013-01-01'),
('UBERDEATH metall collection', '2015-01-19'),
('Aniversary collection', '2016-12-06');

insert into tracks (Albums_id, name, duration)
values (1, 'I lost you and can''t find you', 3.14),
(1, 'Something-something love-love', 3.18),
(1, 'The love is love love love', 5.13),
(1, 'Don''t leave me with an alien', 4.15),
(1, 'I''ll get diabetes from this song', 5.16);

insert into tracks (Albums_id, name, duration)
values (2, 'Supermetal metal track', 3.4),
(2, 'Some metallic noise', 8.35),
(2, 'I''ll bang in iron pot with spoon for 10H strait', 600),
(2, 'Metal is awesome', 15.3),
(2, 'Unexpectedly romantic song', 2.50),
(2, 'Rust is an enemy of metal', 13.20);

insert into tracks (Albums_id, name, duration)
values (3, 'A thousand years in prison', 5.18),
(3, 'I''ll end that judge later', 4.14),
(3, 'The Woodcut', 5.30),
(3, 'Don''t drink to much vodka', 8),
(3, '''Kupols'' on my skin', 3.13);

insert into tracks (Albums_id, name, duration)
values (4, 'Life is suffering', 10.15),
(4, 'Death and metal', 1.50),
(4, 'My last song', 20),
(4, 'No, this one is the last song', 30),
(4, 'Pain, tears and vodka', 4.18);

insert into singer_genre (genre_id, singer_id)
values (1, 1), (3, 1), (2, 2), (1, 3), (3, 3), (1, 4), (4, 4);

insert into album_singer(singer_id, album_id)
values (1, 1), (2, 2), (3, 3), (4, 4);

insert into track_collection (track_id, collection_id)
values (4, 1), (9, 1), (14, 1), (20, 1),
(2, 2), (3, 2), (10, 2), (16, 2), (17, 2),
(6, 3), (9, 3), (15, 3), (18, 3),
(4, 4), (11, 4), (14, 4), (21, 4);


