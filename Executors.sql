create table if not exists Genre (
	Genre_id SERIAL primary key,
	Title varchar(128) not null
);

create table if not exists Executor (
	Executor_id SERIAL primary key,
	Name varchar(60) not null
);

create table if not exists GenresExecutors (
	Genre_id int references Genre(Genre_id),
	Executor_id int references Executor(Executor_id),
	constraint Genres_Executors_pk primary key(Genre_id, Executor_id)
);

create table if not exists Album (
	Album_id serial primary key,
	Title varchar(128) not null,
	Realease date not null
);

create table if not exists ExecutorsAlbums (
	Executor_id int references Executor(Executor_id),
	Album_id int references Album(Album_id),
	constraint Executors_Albums_pk primary key(Executor_id, Album_id)
);

create table if not exists Track (
	Track_id SERIAL primary key,
	Title varchar(128) not null,
	Duration numeric not null,
	Album_id int references Album(Album_id)
);

create table if not exists Collection (
	Collection_id SERIAL primary key,
	Title varchar(128) not null,
	Realease date not null
);

create table if not exists TracksCollections (
	Track_id int references Track(Track_id),
	Collection_id int references Collection(Collection_id),
	constraint Tracks_Collections_pk primary key(Track_id, Collection_id)
);

