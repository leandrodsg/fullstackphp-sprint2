-- Insert customers
insert into customer (first_name, last_name, address, zip_code, city, state, phone) values
('ana', 'silva', 'rua a, 123', '01001-000', 'sao paulo', 'sp', '(11)98765-4321'),
('bruno', 'costa', 'av. b, 456', '20020-010', 'rio de janeiro', 'rj', '(21)91234-5678');

-- Insert stores
insert into store (address, zip_code, city, state) values
('rua das flores, 100', '01002-000', 'sao paulo', 'sp'),
('av. atlantica, 1500', '22010-000', 'rio de janeiro', 'rj');

-- Insert employees
insert into employee (first_name, last_name, nif, phone, role, store_id) values
('carlos', 'pereira', '12345678900', '(11)99876-5432', 'cook', 1),
('daniela', 'rocha', '98765432100', '(21)99911-2233', 'delivery', 2);

-- Insert categories
insert into category (name) values
('regular'),
('special');

-- Insert products
insert into product (name, description, image, price, type, category_id) values
('margherita', 'tomato, mozzarella, basil', '/img/margherita.jpg', 29.90, 'pizza', 1),
('portuguesa', 'ham, egg, onion', '/img/portuguesa.jpg', 34.50, 'pizza', 2),
('x-burger', 'bread, beef, cheese', '/img/xb.jpg', 18.00, 'burger', null),
('soda 350ml', 'can soda', '/img/refri.jpg', 6.00, 'drink', null);

-- Insert orders
insert into order_table (customer_id, store_id, delivery_type, order_datetime, delivery_datetime, delivery_person_id, total_price) values
(1, 1, 'pickup', '2025-06-10 12:30', null, null, 29.90),
(2, 2, 'home', '2025-06-10 13:00', '2025-06-10 13:45', 2, 40.50);

-- Insert order items
insert into order_product (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 29.90),
(2, 2, 1, 34.50),
(2, 4, 1, 6.00);