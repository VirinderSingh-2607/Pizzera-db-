DROP database Pizzera;
create database Pizzera;
Use Pizzera;

CREATE TABLE shift(
shift_id varchar(10) primary key,
day_of_week varchar(10),
start_time time,
end_time time);

CREATE TABLE staff(
staff_id varchar(10) primary key,
firstname varchar(20) not null,
lastname varchar(20) not null,
position_at varchar(20) not null,
hourly_rate decimal(5,2));

CREATE TABLE Rota(
row_id int primary key,
rota_id varchar(10) ,
date_create datetime,
shift_id varchar(20),
staff_id varchar(20),
constraint Staff_id foreign key(staff_id) references staff(staff_id),
constraint Shift_id foreign key(shift_id) references shift(shift_id));

CREATE TABLE Customers(
cust_id int primary key,
cust_firstname varchar(10) not null,
cust_lastname varchar(10) not null
);

CREATE TABLE address(
add_id int primary key,
delivery_address1 varchar(20) not null,
delivery_address2 varchar(20),
delivery_city varchar(20),
delivery_pincode varchar(10));

 CREATE TABLE ingredient(
 ing_id varchar(10) primary key,
 ing_name varchar(10) not null,
 ing_weight int not null,
 ing_means varchar(20),
 ing_price decimal(5,2) not null);
 
 
 CREATE TABLE inventory(
 inv_id int primary key,
 item_id varchar(10),
 quantity int,
 constraint Item_id foreign key(item_id) references ingredient(ing_id) );
 

 CREATE TABLE recipe (
 row_id int primary key,
 recipe_id varchar(10) unique,
 ing_id varchar(10),
 quantity int,
 constraint Ing_id foreign key(ing_id) references inventory(item_id));
 
 CREATE TABLE item(
 item_id varchar(10) primary key,
 sku varchar(10),
 item_name varchar(10),
 item_category varchar(10),
 item_size varchar(10),
 item_price int,
 constraint recipe foreign key(sku) references recipe(recipe_id));
 
 
 
 
ALTER TABLE Rota
MODIFY COLUMN date_create datetime unique;



create table Orders(
row_id  int primary key, 
order_id varchar(10),
created_at datetime,
item_id varchar(10),
quantity int,
cust_id int,
delivery varchar(5),
add_id int,
constraint Add_id foreign key(add_id) references address(add_id),
constraint Cust_id foreign key(cust_id) references Customers(cust_id),
constraint Items_id foreign key(item_id) references item(item_id),
constraint Created foreign key(created_at) references Rota(date_create)
);
show tables;
