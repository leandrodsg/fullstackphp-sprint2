create database if not exists optics;
use optics;

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
    nif varchar(20)
);

create table glasses (
    glasses_id int auto_increment primary key,
    brand varchar(50) not null,
    left_lens_power decimal(4,2) not null,
    right_lens_power decimal(4,2) not null,
    frame_type enum('floating', 'plastic', 'metallic') not null,
    frame_color varchar(30) not null,
    lens_color varchar(30) not null,
    price decimal(8,2) not null,
    supplier_id int,
    foreign key (supplier_id) references suppliers(supplier_id)
        on delete set null
        on update cascade,
    unique (brand, supplier_id)
);

create table clients (
    client_id int auto_increment primary key,
    name varchar(100) not null,
    street varchar(100),
    city varchar(50),
    zip_code varchar(20),
    phone varchar(20),
    email varchar(100),
    registration_date date not null
);

create table referrals (
    client_id int primary key,
    referred_by int,
    foreign key (client_id) references clients(client_id)
        on delete cascade
        on update cascade,
    foreign key (referred_by) references clients(client_id)
        on delete set null
        on update cascade
);

create table employees (
    employee_id int auto_increment primary key,
    name varchar(100) not null,
    phone varchar(20),
    email varchar(100)
);

create table sales (
    sale_id int auto_increment primary key,
    client_id int,
    employee_id int,
    sale_date date not null,
    foreign key (client_id) references clients(client_id)
        on delete set null
        on update cascade,
    foreign key (employee_id) references employees(employee_id)
        on delete set null
        on update cascade
);

create table sale_items (
    sale_id int,
    glasses_id int,
    quantity int not null default 1,
    primary key (sale_id, glasses_id),
    foreign key (sale_id) references sales(sale_id)
        on delete cascade
        on update cascade,
    foreign key (glasses_id) references glasses(glasses_id)
        on delete cascade
        on update cascade
);
