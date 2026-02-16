CREATE TABLE IF NOT EXISTS Genres(
Genre_id SERIAL PRIMARY KEY,
G_name VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS Singers(
Singer_id SERIAL PRIMARY KEY,
S_name VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS Singer_Genre(
Genre_id INTEGER REFERENCES Genres(Genre_id),
Singer_id INTEGER REFERENCES Singers(Singer_id),
CONSTRAINT PR_K PRIMARY KEY (Genre_id, Singer_id));

CREATE TABLE IF NOT EXISTS Albums(
Album_id SERIAL PRIMARY KEY,
A_name VARCHAR(120) NOT NULL,
A_issue_date DATE,
CONSTRAINT chk_date CHECK (A_issue_date >= '2000-01-01'));

CREATE TABLE IF NOT EXISTS Album_Singer(
Singer_id INTEGER REFERENCES Singers(Singer_id),
Album_id INTEGER REFERENCES Albums(Album_id),
CONSTRAINT PK PRIMARY KEY (Singer_id, Album_id));

CREATE TABLE IF NOT EXISTS Collections(
Collection_id SERIAL PRIMARY KEY,
C_name VARCHAR(120) NOT NULL,
C_issue_date DATE,
CONSTRAINT chk_d CHECK (C_issue_date  >= '2000-01-01'));

CREATE TABLE IF NOT EXISTS Tracks(
Track_id SERIAL PRIMARY KEY,
Album_id INT NOT NULL REFERENCES Albums(Album_id) ,
T_name VARCHAR(60) NOT NULL,
duration TIME NOT NULL);

CREATE TABLE IF NOT EXISTS Track_Collection(
Track_id INTEGER REFERENCES Tracks(Track_id),
Collection_id INTEGER REFERENCES Collections(Collection_id),
CONSTRAINT PK_2 PRIMARY KEY (Track_id, Collection_id));
