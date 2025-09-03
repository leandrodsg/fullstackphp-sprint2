use optics;

-- Inserta datos en suppliers.
insert into suppliers (name, street, street_number, city, zip_code, country, phone, fax, nif)
values 
('LuxVision Group', 'Via della Moda', '12', 'Milano', '20121', 'Italy', '+39 02 1234567', null, 'IT12345678901'),
('Global Optics Inc.', '123 Optical Ave', 'Suite 100', 'New York', '10001', 'USA', '+1 212 555 0101', null, 'US0987654321');

-- Inserta datos en brands.
insert into brands (name, supplier_id)
values
('Ray-Ban', 1),
('Oakley', 1),
('Vogue Eyewear', 1),
('Visionary', 2);

-- Inserta datos en glasses.
insert into glasses (model, brand_id, left_lens_power, right_lens_power, frame_type, frame_color, lens_color, price)
values 
('Aviator Classic', 1, -1.25, -1.00, 'metallic', 'Gold', 'Green', 155.00),
('Wayfarer', 1, -0.50, -0.75, 'plastic', 'Black', 'Gray', 143.00),
('Holbrook', 2, -2.00, -2.50, 'plastic', 'Matte Black', 'Prizm Sapphire', 186.00),
('VO5235S', 3, 0.00, 0.00, 'plastic', 'Havana', 'Brown Gradient', 99.00),
('V-101', 4, -3.00, -3.25, 'floating', 'Silver', 'Clear', 210.00);

-- Inserta datos en clients.
insert into clients (name, street, city, zip_code, phone, email, registration_date, referred_by)
values 
('Ana Costa', 'Rua das Flores, 10', 'Lisboa', '1200-199', '+351 912345678', 'ana.costa@email.com', '2024-01-15', NULL),
('Bruno Alves', 'Avenida Principal, 50', 'Porto', '4000-010', '+351 923456789', 'bruno.alves@email.com', '2024-02-20', 1);

-- Inserta datos en employees.
insert into employees (name)
values 
('Carlos Pereira'),
('Sofia Mendes');

-- Inserta datos en sales y sale_items.
insert into sales (sale_date, client_id, employee_id)
values ('2024-03-10', 1, 1);
insert into sale_items (sale_id, glasses_id, quantity, price_at_sale)
values (1, 1, 1, 155.00);

insert into sales (sale_date, client_id, employee_id)
values ('2024-03-12', 2, 2);
insert into sale_items (sale_id, glasses_id, quantity, price_at_sale)
values (2, 3, 1, 186.00);

insert into sales (sale_date, client_id, employee_id)
values ('2025-01-20', 1, 1);
insert into sale_items (sale_id, glasses_id, quantity, price_at_sale)
values 
(3, 2, 1, 143.00),
(3, 4, 1, 99.00);
