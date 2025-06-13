use pizzaria;

-- 1. Orders with customer, store, and delivery type
select o.id as order_id, concat(c.first_name, ' ', c.last_name) as customer,
       s.city as store_city, o.delivery_type, o.order_datetime
from order_table o
join customer c on o.customer_id = c.id
join store s on o.store_id = s.id
order by o.order_datetime desc;

-- 2. Order items and subtotal
select op.order_id, p.name as product, op.quantity, op.unit_price,
       (op.quantity * op.unit_price) as subtotal
from order_product op
join product p on op.product_id = p.id
where op.order_id = 2;

-- 3. Total deliveries per delivery person
select e.first_name, e.last_name, count(*) as total_deliveries
from employee e
join order_table o on e.id = o.delivery_person_id
where e.role = 'delivery' and o.delivery_type = 'home'
group by e.id;

-- 4. Total drinks sold per city
select s.city, sum(op.quantity) as total_drinks
from order_product op
join product p on op.product_id = p.id
join order_table o on op.order_id = o.id
join store s on o.store_id = s.id
where p.type = 'drink'
group by s.city;

-- 5. Revenue per store
select s.city, sum(o.total_price) as revenue
from order_table o
join store s on o.store_id = s.id
group by s.id, s.city;