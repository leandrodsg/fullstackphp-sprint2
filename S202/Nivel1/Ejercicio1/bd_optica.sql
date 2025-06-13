-- Database: optics
create database if not exists optics;
use optics;

-- Table: supplier
create table supplier (
    id int auto_increment primary key,
    name varchar(100) not null,
    street varchar(100),
    number varchar(10),
    floor varchar(10),
    door varchar(10),
    city varchar(50),
    postal_code varchar(15),
    country varchar(50),
    phone varchar(20),
    fax varchar(20),
    tax_id varchar(20)
);

-- Table: glasses
create table glasses (
    id int auto_increment primary key,
    brand varchar(50) not null,
    left_lens_power varchar(10),
    right_lens_power varchar(10),
    frame_type enum('rimless', 'plastic', 'metal'),
    frame_color varchar(30),
    lens_color varchar(30),
    price decimal(8,2),
    supplier_id int,
    foreign key (supplier_id) references supplier(id)
        on delete set null
        on update cascade
);

-- Table: client
create table client (
    id int auto_increment primary key,
    name varchar(100) not null,
    address varchar(150),
    phone varchar(20),
    email varchar(100),
    registration_date date
);

-- Table: referrals client who was referred by another client
create table referrals (
    client_id int,
    referred_by_id int,
    foreign key (client_id) references client(id),
    foreign key (referred_by_id) references client(id)
);

-- Table: employee
create table employee (
    id int auto_increment primary key,
    name varchar(100) not null
);

-- Table: sale
create table sale (
    id int auto_increment primary key,
    date date,
    client_id int,
    employee_id int,
    foreign key (client_id) references client(id),
    foreign key (employee_id) references employee(id)
);

-- Table: sale_glasses
create table sale_glasses (
    sale_id int,
    glasses_id int,
    foreign key (sale_id) references sale(id),
    foreign key (glasses_id) references glasses(id)
);