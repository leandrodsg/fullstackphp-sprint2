use optics;

-- CONSULTAS REQUERIDAS

-- 1. Total compras cliente.
select 
    c.name as client_name,
    s.sale_id,
    sum(si.price_at_sale * si.quantity) as total_spent
from sales as s
join clients as c on s.client_id = c.client_id
join sale_items as si on s.sale_id = si.sale_id
where c.client_id = 1
group by s.sale_id, c.name
order by c.name, s.sale_id;

-- 2. Gafas vendidas por empleado en un ano.
select
    e.name as employee_name,
    g.model,
    b.name as brand_name,
    s.sale_date
from sales as s
join employees as e on s.employee_id = e.employee_id
join sale_items as si on s.sale_id = si.sale_id
join glasses as g on si.glasses_id = g.glasses_id
join brands as b on g.brand_id = b.brand_id
where e.employee_id = 1 and year(s.sale_date) = 2025
order by s.sale_date;

-- 3. Proveedores de gafas vendidas.
select distinct
    sup.name as supplier_name
from sales as s
join sale_items as si on s.sale_id = si.sale_id
join glasses as g on si.glasses_id = g.glasses_id
join brands as b on g.brand_id = b.brand_id
join suppliers as sup on b.supplier_id = sup.supplier_id
order by sup.name;

-- Cliente con una recomendacion.
select * from referrals where client_id = 2;

-- Marca con un proveedor.
select b.name as brand, s.name as supplier
from brands as b
join suppliers as s on b.supplier_id = s.supplier_id
where b.name = 'Ray-Ban';

-- `sale_items`.
-- Venta con multiples articulos.
select
    s.sale_id,
    s.sale_date,
    c.name as client_name,
    g.model,
    b.name as brand_name
from sales as s
join clients as c on s.client_id = c.client_id
join sale_items as si on s.sale_id = si.sale_id
join glasses as g on si.glasses_id = g.glasses_id
join brands as b on g.brand_id = b.brand_id
where s.sale_id = 3;
