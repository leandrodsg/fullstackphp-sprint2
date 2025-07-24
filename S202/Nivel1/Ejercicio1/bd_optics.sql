create database if not exists optics;
use optics;

-- Tabla suppliers.
create table suppliers (
    supplier_id int auto_increment primary key,
    name varchar(100) not null,
    street varchar(100),
    street_number varchar(10),
    door varchar(10),
    city varchar(50),
    zip_code varchar(20),
    country varchar(50),
    phone varchar(20),
    fax varchar(20),
    nif varchar(20) not null unique
);

-- Tabla brands.
create table brands (
    brand_id int auto_increment primary key,
    name varchar(50) not null unique,
    supplier_id int not null,
    foreign key (supplier_id) references suppliers(supplier_id) on delete restrict on update cascade
);

-- Tabla glasses.
create table glasses (
    glasses_id int auto_increment primary key,
    model varchar(100) not null,
    brand_id int not null,
    left_lens_power decimal(4,2) not null,
    right_lens_power decimal(4,2) not null,
    frame_type enum('floating', 'plastic', 'metallic') not null,
    frame_color varchar(30) not null,
    lens_color varchar(30) not null,
    price decimal(8,2) not null,
    foreign key (brand_id) references brands(brand_id) on delete restrict on update cascade
);

-- Tabla clients.
create table clients (
    client_id int auto_increment primary key,
    name varchar(100) not null,
    street varchar(100),
    city varchar(50),
    zip_code varchar(20),
    phone varchar(20),
    email varchar(100) unique,
    registration_date date not null
);

-- Tabla referrals.
create table referrals (
    client_id int primary key,
    referred_by int null,
    foreign key (client_id) references clients(client_id) on delete cascade on update cascade,
    foreign key (referred_by) references clients(client_id) on delete set null on update cascade
);

-- Tabla employees.
create table employees (
    employee_id int auto_increment primary key,
    name varchar(100) not null
);

-- Tabla sales.
create table sales (
    sale_id int auto_increment primary key,
    sale_date date not null,
    client_id int not null,
    employee_id int not null,
    foreign key (client_id) references clients(client_id) on delete restrict on update cascade,
    foreign key (employee_id) references employees(employee_id) on delete restrict on update cascade
);

-- Tabla sale_items.
create table sale_items (
    sale_item_id int auto_increment primary key,
    sale_id int not null,
    glasses_id int not null,
    quantity int not null default 1,
    price_at_sale decimal(8,2) not null,
    foreign key (sale_id) references sales(sale_id) on delete cascade on update cascade,
    foreign key (glasses_id) references glasses(glasses_id) on delete no action on update cascade
);
