-- 1. All suppliers
select * from supplier;

-- 2. Available glasses and their suppliers
select g.id, g.brand, g.frame_type, g.price, s.name as supplier
from glasses g
join supplier s on g.supplier_id = s.id;

-- 3. All clients
select * from client;

-- 4. Referrals among clients
select c.name as client, r.name as referred_by
from referrals ref
join client c on ref.client_id = c.id
join client r on ref.referred_by_id = r.id;

-- 5. Sales with client and employee
select s.id, s.date, c.name as client, e.name as employee
from sale s
join client c on s.client_id = c.id
join employee e on s.employee_id = e.id;

-- 6. Glasses sold in each sale
select s.id as sale_id, g.brand, g.price
from sale s
join sale_glasses sg on s.id = sg.sale_id
join glasses g on sg.glasses_id = g.id;

-- 7. Full sales information
select s.id, s.date, c.name as client, e.name as employee, 
       g.brand, g.price
from sale s
join client c on s.client_id = c.id
join employee e on s.employee_id = e.id
join sale_glasses sg on s.id = sg.sale_id
join glasses g on sg.glasses_id = g.id;

-- 8. Total purchases by client
select c.name, count(s.id) as total_sales
from client c
join sale s on c.id = s.client_id
group by c.id;

-- 9. Glasses sold by each employee in 2025
select e.name as employee, g.brand, g.price
from employee e
join sale s on e.id = s.employee_id
join sale_glasses sg on s.id = sg.sale_id
join glasses g on sg.glasses_id = g.id
where year(s.date) = 2025;

-- 10. Suppliers with sold glasses
select distinct s.name as supplier
from supplier s
join glasses g on s.id = g.supplier_id
join sale_glasses sg on g.id = sg.glasses_id;