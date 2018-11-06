drop database if exists bmdb;
create database bmdb;
use bmdb;

create table Movie (
	id 				int 			not null		primary key		auto_increment,
	title 			varchar(100) 	not null		unique,
	rating 			varchar(5)		not null,
	year 			int				not null,
	director 		varchar(50) 	not null
);

create table genre (
	id 				int 			not null		primary key		auto_increment,
	name 			varchar(10) 	not null		unique		
);

create table Actor (
	id 				int				not null		primary key		auto_increment,
	firstName		varchar(25) 	not null		unique,
	lastName 		varchar(25) 	not null		unique,
	gender 			varchar(6)		not null,
	birthDate 		date 			not null 
);

create table MovieGenre (
	id 				int				not null		primary key		auto_increment,
	movieID			int			 	not null,
	genreID 		int			 	not null		unique,
	FOREIGN KEY (movieID)			REFERENCES genre (id),
	FOREIGN KEY (genreID)			REFERENCES movie (id)
);

create table Credits (
	id 				int				not null		primary key			auto_increment,
	movieID			int				not null,
	actorID 		int				not null,
	charName 		varchar(30)		not null,
	FOREIGN KEY (movieID)		 	REFERENCES movie (id),
    FOREIGN KEY	(actorID)			REFERENCES actor (id)
);

Insert movie (id, title, rating, year, Director) Values (1, 'What We Do In The Shadows', 'R', 2014, 'Jermaine Clement');
Insert movie (id, title, rating, year, Director) Values (2, 'Mr. Deeds', 'PG-13', 2002, 'Steven Brill');
Insert movie (id, title, rating, year, Director) Values (3, 'A League of Their Own', 'PG', 1992, 'Penny Marshall');
Insert movie (id, title, rating, year, Director) Values (4, 'The Godfather', 'R', 1972, 'Francis Ford Coppola');
Insert movie (id, title, rating, year, Director) Values (5, 'Jurassic World', 'PG-13', 2015, 'Colin Trevorrow');


Insert genre (id, name) Values (1, 'Comedy');
Insert genre (id, name) Values (2, 'Drama');
Insert genre (id, name) Values (3, 'Sci-Fi');
 

Insert actor(id, firstName, lastName, gender, birthDate) Values (1,'Taika', 'Waititi', 'M','1975-08-16');
Insert actor(id, firstName, lastName, gender, birthDate) Values (2,'Adam', 'Sandler', 'M','1966-09-09');
Insert actor(id, firstName, lastName, gender, birthDate) Values (3,'Geena', 'Davis', 'F','1956-01-21');
Insert actor(id, firstName, lastName, gender, birthDate) Values (4,'Al', 'Pacino', 'M','1940-04-25');
Insert actor(id, firstName, lastName, gender, birthDate) Values (5,'Chris', 'Pratt', 'M','1979-06-21');


Insert movieGenre (id, movieID, genreID) Values (1, 1, 3); 
Insert movieGenre (id, movieID, genreID) Values (2, 2, 1);
Insert movieGenre (id, movieID, genreID) Values (3, 3, 2); 
Insert movieGenre (id, movieID, genreID) Values (4, 4, 2); 
Insert movieGenre (id, movieID, genreID) Values (5, 5, 3);


Insert credits (id, movieID, actorID, charname) Values (1, 1, 1, 'Viago');
Insert credits (id, movieID, actorID, charname) Values (2, 2, 2, 'Longfellow Deeds');
Insert credits (id, movieID, actorID, charname) Values (3, 3, 3, 'Dottie Hinson');
Insert credits (id, movieID, actorID, charname) Values (4, 4, 4, 'Michael Corleone');
Insert credits (id, movieID, actorID, charname) Values (5, 5, 5, 'Owen Grady');


-- Define User Privileges 
CREATE USER bmdb_user@localhost
IDENTIFIED BY 'user1';
GRANT SELECT, INSERT, UPDATE, DELETE ON bmdb.* TO bmdb_user@localhost;