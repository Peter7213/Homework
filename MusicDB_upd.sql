create table if not exists Genres(
id Serial primary key,
name VARCHAR(60) not null);

create table if not exists Singers(
id Serial primary key,
name VARCHAR(60) not null);

create table if not exists Singer_Genre(
Genre_id integer REFERENCES Genres(id),
Singer_id integer references Singers(id),
constraint PR_K primary key (Genre_id, Singer_id));

create table if not exists Albums(
id Serial primary key,
name VARCHAR(120) not null,
issue_date date,
constraint chk_date check (issue_date >= '2000-01-01'));

create table if not exists Album_Singer(
Singer_id integer references Singers(id),
Album_id integer references Albums(id),
constraint PK primary key (Singer_id, Album_id));

create table if not exists Collections(
id Serial primary key,
name VARCHAR(120) not null,
issue_date date,
constraint chk_d check (issue_date  >= '2000-01-01'));

create table if not exists Tracks(
id Serial PRIMARY KEY,
id int NOT NULL references Albums(id) ,
name VARCHAR(60) not null,
duration numeric not null);

create table if not exists Track_Collection(
Track_id integer references Tracks(id),
Collection_id integer references Collections(id),
constraint PK_2 primary key (Track_id, Collection_id));
