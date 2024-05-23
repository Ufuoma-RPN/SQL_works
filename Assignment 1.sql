--To create the database
create database bookshop;

--genres table
create table genres (genre_id int primary key,
genre varchar(255),
parent_id int);

create table book_genres (book_id int primary key,
genre_id int,
foreign key (genre_id) references genres(genre_id));

create table books (book_id int,
title varchar(255),
total_pages int,
rating float,
isbn int,
published_date date,
publisher_id int,
foreign key (book_id) references book_genres(book_id));

create table publishers (publishers_id int primary key,
name varchar(255));

create table authors (author_id int primary key,
first_name varchar(255),
middle_name  varchar(255),
last_name varchar(255));

create table book_authors (book_id int,
author_id int,
foreign key (author_id) references authors(author_id));

select *
from information_schema.key_column_usage
where table_name = 'book_genres';

select *
from information_schema.key_column_usage
where table_name = 'books';

alter table books
drop constraint FK__books__book_id__3D7E1B63;

alter table book_genres
drop constraint PK__book_gen__490D1AE16377C80F;

alter table books
alter column book_id int not null;

alter table books
add primary key (book_id);

alter table book_genres
add foreign key (book_id) references books(book_id);

alter table book_authors
add foreign key (book_id) references books(book_id);
