create database shelves;

create table book_copy1 (id int primary key,
year_published int,
book_id int,
publisher_id int);

create table checkout (id int,
start_time datetime,
end_time datetime,
book_copy_id int primary key,
patron_account_id int,
is_returned bit,
foreign key (id) references book_copy(id));

select *
from information_schema.key_column_usage
where table_name = 'checkout';

alter table checkout
drop constraint FK__checkout__id__4F9CCB9E;

alter table checkout
alter column id int not null;

alter table checkout
add foreign key (id) references book_copy1(id);

create table patron_account (card_number int primary key,
first_name varchar(255),
surname varchar(255),
email varchar(255),
status varchar(10));

create table hold (id int,
start_time datetime,
end_time datetime,
book_copy_id int,
patron_account_id int,
foreign key (id) references book_copy1(id),
foreign key (book_copy_id) references checkout (book_copy_id),
foreign key (patron_account_id) references patron_account(card_number));