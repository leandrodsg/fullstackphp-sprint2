create database if not exists pizzaria;
use pizzaria;

-- Customers table
create table customer (
    id int auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    address varchar(255) not null,
    zip_code varchar(10) not null,
    city varchar(100) not null,
    state varchar(100) not null,
    phone varchar(20) not null
);

-- Stores table
create table store (
    id int auto_increment primary key,
    address varchar(255) not null,
    zip_code varchar(10) not null,
    city varchar(100) not null,
    state varchar(100) not null
);

-- Employees table
create table employee (
    id int auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    nif varchar(20) not null unique,
    phone varchar(20) not null,
    role enum('cook','delivery') not null,
    store_id int not null,
    foreign key (store_id) references store(id)
);

-- Pizza categories table
create table category (
    id int auto_increment primary key,
    name varchar(100) not null
);

-- Products table (pizza, burger, drink)
create table product (
    id int auto_increment primary key,
    name varchar(100) not null,
    description text,
    image varchar(255),
    price decimal(10,2) not null,
    type enum('pizza','burger','drink') not null,
    category_id int,
    foreign key (category_id) references category(id)
);

-- Orders table
create table order_table (
    id int auto_increment primary key,
    customer_id int not null,
    store_id int not null,
    delivery_type enum('home','pickup') not null,
    order_datetime datetime not null,
    delivery_datetime datetime,
    delivery_person_id int,
    total_price decimal(10,2) not null,
    foreign key (customer_id) references customer(id),
    foreign key (store_id) references store(id),
    foreign key (delivery_person_id) references employee(id)
);

-- Order items table
create table order_product (
    order_id int not null,
    product_id int not null,
    quantity int not null,
    unit_price decimal(10,2) not null,
    primary key (order_id, product_id),
    foreign key (order_id) references order_table(id),
    foreign key (product_id) references product(id)
);