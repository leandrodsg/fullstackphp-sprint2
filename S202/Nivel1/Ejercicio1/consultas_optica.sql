use optics;

-- total amount spent by a client
select clients.name, sum(glasses.price * sale_items.quantity) as total_amount
from sales
join clients on sales.client_id = clients.client_id
join sale_items on sales.sale_id = sale_items.sale_id
join glasses on sale_items.glasses_id = glasses.glasses_id
where clients.client_id = 2
group by clients.name;

-- glasses sold by an employee in 2025
select employees.name, glasses.brand, count(distinct glasses.glasses_id) as total_models
from employees
join sales on employees.employee_id = sales.employee_id
join sale_items on sales.sale_id = sale_items.sale_id
join glasses on sale_items.glasses_id = glasses.glasses_id
where year(sales.sale_date) = 2025 and employees.employee_id = 1
group by employees.name, glasses.brand;

-- suppliers who provided sold glasses
select distinct suppliers.name as supplier_name
from suppliers
join glasses on suppliers.supplier_id = glasses.supplier_id
join sale_items on glasses.glasses_id = sale_items.glasses_id;

-- list all clients with who referred them
select clients.name as client, ref.name as referred_by
from referrals
join clients on referrals.client_id = clients.client_id
join clients ref on referrals.referred_by = ref.client_id;

-- all sales with client and employee
select sales.sale_id, sales.sale_date, clients.name as client, employees.name as employee
from sales
join clients on sales.client_id = clients.client_id
join employees on sales.employee_id = employees.employee_id;

-- glasses sold in each sale
select sales.sale_id, glasses.brand, glasses.price
from sales
join sale_items on sales.sale_id = sale_items.sale_id
join glasses on sale_items.glasses_id = glasses.glasses_id;

-- full sales info with supplier
select sales.sale_id, sales.sale_date, clients.name as client, employees.name as employee, glasses.brand, glasses.price, suppliers.name as supplier
from sales
join clients on sales.client_id = clients.client_id
join employees on sales.employee_id = employees.employee_id
join sale_items on sales.sale_id = sale_items.sale_id
join glasses on sale_items.glasses_id = glasses.glasses_id
join suppliers on glasses.supplier_id = suppliers.supplier_id;

-- how many clients do not have a referral
select count(*) as clients_without_referral
from clients
left join referrals on clients.client_id = referrals.client_id
where referrals.client_id is null;

-- total models by each supplier
select suppliers.name as supplier, count(glasses.glasses_id) as total_models
from suppliers
left join glasses on suppliers.supplier_id = glasses.supplier_id
group by suppliers.name;

-- total sales amount by employee in 2025
select employees.name, sum(glasses.price * sale_items.quantity) as total_sales
from employees
join sales on employees.employee_id = sales.employee_id
join sale_items on sales.sale_id = sale_items.sale_id
join glasses on sale_items.glasses_id = glasses.glasses_id
where year(sales.sale_date) = 2025
group by employees.name;
