use optics;
insert into suppliers (name, street, street_number, city, zip_code, country, phone, fax, nif)
values 
('lentesvision', 'av. catalunya', '45', 'barcelona', '08001', 'spain', '+34 931234567', '+34 931234568', 'b12345678'),
('optica total', 'carrer major', '12', 'girona', '17001', 'spain', '+34 972345678', null, 'c98765432');

insert into glasses (brand, left_lens_power, right_lens_power, frame_type, frame_color, lens_color, price, supplier_id)
values 
('rayban', -1.25, -1.00, 'metallic', 'black', 'gray', 179.90, 1),
('oakley', -2.00, -2.50, 'plastic', 'blue', 'clear', 249.90, 1),
('vogue', -0.75, -0.75, 'floating', 'red', 'green', 149.00, 2);

insert into clients (name, street, city, zip_code, phone, email, registration_date)
values 
('joana silva', 'carrer de les flors, 100', 'barcelona', '08002', '+34 912345678', 'joana@email.com', '2025-06-01'),
('carlos lima', 'carrer del sol, 55', 'girona', '17002', '+34 913456789', 'carlos@email.com', '2025-06-02');

insert into referrals (client_id, referred_by)
values (2, 1);

insert into employees (name, phone, email)
values ('ana torres', '+34 914567890', 'ana@email.com');

insert into sales (sale_date, client_id, employee_id)
values ('2025-06-06', 2, 1);

insert into sale_items (sale_id, glasses_id, quantity)
values (1, 1, 1), (1, 3, 1);
