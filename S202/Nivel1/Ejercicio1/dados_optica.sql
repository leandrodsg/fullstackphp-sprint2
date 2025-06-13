-- Insert suppliers
insert into supplier (name, street, number, city, postal_code, country, phone, fax, tax_id)
values 
('LentesVision', 'Av. Catalunya', '45', 'Barcelona', '08001', 'Spain', '+34 931234567', '+34 931234568', 'B12345678'),
('Optica Total', 'Carrer Major', '12', 'Girona', '17001', 'Spain', '+34 972345678', NULL, 'C98765432');

-- Insert glasses
insert into glasses (brand, left_lens_power, right_lens_power, frame_type, frame_color, lens_color, price, supplier_id)
values 
('Rayban', '-1.25', '-1.00', 'metal', 'black', 'gray', 179.90, 1),
('Oakley', '-2.00', '-2.50', 'plastic', 'blue', 'clear', 249.90, 1),
('Vogue', NULL, NULL, 'rimless', 'red', 'green', 149.00, 2);

-- Insert clients
insert into client (name, address, phone, email, registration_date)
values 
('Joana Silva', 'Rua das Flores, 100', '+34 912345678', 'joana@email.com', '2025-06-01'),
('Carlos Lima', 'Rua do Sol, 55', '+34 913456789', 'carlos@email.com', '2025-06-02');

-- Insert referral
insert into referrals (client_id, referred_by_id)
values (2, 1);

-- Insert employee
insert into employee (name)
values ('Ana Torres');

-- Insert sale
insert into sale (date, client_id, employee_id)
values ('2025-06-06', 2, 1);

-- Insert sale_glasses
insert into sale_glasses (sale_id, glasses_id)
values (1, 1), (1, 3);