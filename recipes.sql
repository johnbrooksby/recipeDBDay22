create table users(
	id serial primary key,
  user_name varchar not null,
  password varchar not null,
  email_address varchar not null
);

create table recipes(
	id serial primary key,
  user_id int not null,
  recipe_name varchar not null,
  description text
);

create table friendship(
	id serial primary key,
  user_id_one int references user(id),
  user_id_two int references user(id)
);

create table occasions(
	id serial primary key,
  name varchar not null,
  event_date date not null
);

create table ingredients(
	id serial primary key,
  name varchar not null,
  amount_in_stock integer not null,
  price float not null
);

create table shopping_list (
	id serial primary key,
  user_id int references users(id)
);

create table users_recipes(
	id serial primary key,
  user_id int references users(id),
  is_private boolean not null,
  recipes_id int references recipes(id),
  is_author boolean not null,
  rating integer,
  comment text
);

create table users_occasions(
	id serial primary key,
  user_id int references users(id),
  occasions_id int references occasions(id),
  is_host boolean not null
);

create table recipes_ingredients(
	id serial primary key,
  recipe_id int references recipes(id),
  ingredients_id int references ingredients(id),
  ingredients_quantity int not null
);

create table occasions_recipes(
	id serial primary key,
  recipes_id int references recipes(id),
  occasion_id int references occasions(id)
);
create table shopping_ingredients(
	id serial primary key,
  shopping_list_id int references shopping_list(id),
  ingredients_id int references ingredients(id),
  purchase_quantity int not null
);