-- 01. Show all products
select * 
  from producto;

-- 02. Show only product names
select nombre 
  from producto;

-- 03. Show product names and prices
select nombre, precio 
  from producto;

-- 04. Show product names and prices ordered by name (A-Z)
select nombre, precio 
  from producto
 order by nombre asc;

-- 05. Show product names and prices ordered by name (Z-A)
select nombre, precio 
  from producto
 order by nombre desc;

-- 06. Show product names and prices ordered by price (low to high)
select nombre, precio 
  from producto
  order by precio asc;

-- 07. Show product names and prices ordered by price (high to low)
select nombre, precio 
  from producto
 order by precio desc;

-- 08. Show the cheapest product
select nombre, precio 
  from producto
 order by precio asc
 limit 1;

-- 09. Show products with price <= 200
select nombre 
  from producto
 where precio <= 200;

-- 10. Show products with price between 60 and 120
select nombre 
  from producto
 where precio between 60 and 120;

-- 11. Show products with price outside 200–800 range
select nombre 
  from producto
 where precio < 200 or precio > 800;

-- 12. Show products with price > 400, ordered by price
select nombre 
  from producto
 where precio > 400
 order by precio;

-- 13. Show all manufacturers (distinct)
select distinct nombre 
  from fabricante;

-- 14. Show all manufacturers in alphabetical order
select nombre 
  from fabricante
 order by nombre;

-- 15. Show all manufacturers in reverse alphabetical order
select nombre 
  from fabricante
 order by nombre desc;

-- 16. Show manufacturers without products
select nombre 
  from fabricante
 where codigo not in (select distinct codigo_fabricante
                        from producto);

-- 17. Show manufacturers with products
select nombre 
  from fabricante
 where codigo in (select distinct codigo_fabricante 
                    from producto);

-- 18. Show manufacturers with products (no duplicates)
select distinct f.nombre 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante;

-- 19. Show product names and prices with manufacturer names
select p.nombre as produto, p.precio, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo;

-- 20. Show product names and manufacturer names, ordered by manufacturer
select p.nombre as produto, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by f.nombre;

-- 21. Show product and manufacturer, ordered by price descending
select p.nombre as produto, f.nombre as fabricante, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by p.precio desc;

-- 22. Show the 3 most expensive products
select p.nombre as produto, f.nombre as fabricante, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by p.precio desc
 limit 3;

-- 23. Show code, name, and manufacturer in uppercase\
select p.codigo, p.nombre as produto, f.nombre as fabricante, upper(f.nombre) as fabricante_maiusculo 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo;

-- 24. Show products above the average price
select nombre, precio 
  from producto
 where precio > (select avg(precio)
                   from producto);

-- 25. Show top 3 most expensive products
select nombre, precio 
  from producto
 order by precio desc
 limit 3;

-- 26. Show 3 cheapest products
select nombre, precio 
  from producto
 order by precio asc
 limit 3;

-- 27. Show the most expensive product by Lenovo
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo'
 order by p.precio desc
 limit 1;

-- 28. Show all products from Hewlett-Packard
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Hewlett-Packard';

-- 29. Show products from Asus, HP, Seagate, or Xiaomi
select p.nombre, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate', 'Xiaomi');

-- 30. Show products starting with "Memoria"
select nombre 
  from producto
 where nombre like 'Memoria%';

-- 31. Show products containing 'HD'
select nombre 
  from producto
 where nombre like '%HD%';

-- 32. Show products containing 'Monitor'
select nombre 
  from producto
 where nombre like '%Monitor%';

-- 33. Show products containing 'Impresora'
select nombre 
  from producto
 where nombre like '%Impresora%';

-- 34. Count products per manufacturer
select f.nombre as fabricante, count(p.codigo) as total_produtos 
  from fabricante f
  left join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre;

-- 35. Average price per manufacturer
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre;

-- 36. Show name of manufacturer with highest average price
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre
 order by preco_medio desc
 limit 1;

-- 37. Show name of manufacturer with lowest average price
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre
 order by preco_medio
 limit 1;

-- 38. Show all products by Lenovo
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo';

-- 39. Show cheapest product from Lenovo
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo'
 order by p.precio
 limit 1;

-- 40. Show Asus products above Asus average price
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Asus'
   and p.precio > (select avg(p2.precio) 
                     from producto p2
                     join fabricante f2 on p2.codigo_fabricante = f2.codigo
                    where f2.nombre = 'Asus');

-- 41. Show products with the highest price in the store
select nombre, precio 
  from producto
 where precio = (select max(precio)
                   from producto);