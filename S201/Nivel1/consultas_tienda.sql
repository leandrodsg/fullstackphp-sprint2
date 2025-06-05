-- 01. Show all products
-- todos os produtos ok
select * 
  from producto;

-- 02. Show only product names
-- so o nome produtos ok
select nombre 
  from producto;

-- 03. Show product names and prices
-- nome e preco produtos ok
select nombre, precio 
  from producto;

-- 04. Show product names and prices ordered by name (A-Z)
-- nome e preco produtos emordem a-z ok
select nombre, precio 
  from producto
 order by nombre asc;

-- 05. Show product names and prices ordered by name (Z-A)
-- nome e preco produtos na ordem desc z-a ok
select nombre, precio 
  from producto
 order by nombre desc;

-- 06. Show product names and prices ordered by price (low to high)
-- nome e preco produtos na ordem do preco barato-caro ok
select nombre, precio 
  from producto
  order by precio asc;

-- 07. Show product names and prices ordered by price (high to low)
-- nome e preco produtos na ordem do preco caro-barato ok
select nombre, precio 
  from producto
 order by precio desc;

-- 08. Show the cheapest product
-- nome e preco do mais barato ok
select nombre, precio 
  from producto
 order by precio asc
 limit 1;

-- 09. Show products with price <= 200
-- nomes produtos com preco menor/igual a 200 ok
select nombre 
  from producto
 where precio <= 200;

-- 10. Show products with price between 60 and 120
-- nomes produtos com preco 60 - 120 ok
select nombre 
  from producto
 where precio between 60 and 120;

-- 11. Show products with price outside 200–800 range
-- produtos preco fora de 200 e 800 ok
select nombre 
  from producto
 where precio < 200 or precio > 800;

-- 12. Show products with price > 400, ordered by price
-- produtos preco +400 ok -> colocar order ok
select nombre 
  from producto
 where precio > 400
 order by precio;

-- 13. Show all manufacturers (distinct)
-- nome de todos fabricantes sem repetir ok
select distinct nombre 
  from fabricante;

-- 14. Show all manufacturers in alphabetical order
-- nomes dos fabricantes em ordem a-z ok
select nombre 
  from fabricante
 order by nombre;

-- 15. Show all manufacturers in reverse alphabetical order
-- nomes dos fabricantes em ordem Z-A ok
select nombre 
  from fabricante
 order by nombre desc;

-- 16. Show manufacturers without products
-- fabricantes sem produtos associados ok
select nombre 
  from fabricante
 where codigo not in (select distinct codigo_fabricante
                        from producto);

-- 17. Show manufacturers with products
-- fabricantes COM os produtos associados ok
select nombre 
  from fabricante
 where codigo in (select distinct codigo_fabricante 
                    from producto);

-- 18. Show manufacturers with products (no duplicates)
-- fabricantes com produtos e sem duplicar os nomes ok
select distinct f.nombre 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante;

-- 19. Show product names and prices with manufacturer names
-- nomes e preços dos produtos com fabricantes ok
select p.nombre as produto, p.precio, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo;

-- 20. Show product names and manufacturer names, ordered by manufacturer
-- produtos e nomes dos fabricantes order por nome de fabricante ok
select p.nombre as produto, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by f.nombre;

-- 21. Show product and manufacturer, ordered by price descending
-- nome do produto e nome do fabricante order pelo preco desc ok
select p.nombre as produto, f.nombre as fabricante, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by p.precio desc;

-- 22. Show the 3 most expensive products
-- nome produto, nome fabricante e preco produtos mais caros
-- mais caros como os 3 primeiros por preco ok
select p.nombre as produto, f.nombre as fabricante, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 order by p.precio desc
 limit 3;

-- 23. Show code, name, and manufacturer in uppercase\
-- código produto, nome produto, nome fabricante em maiuscula ok
select p.codigo, p.nombre as produto, f.nombre as fabricante, upper(f.nombre) as fabricante_maiusculo 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo;

-- 24. Show products above the average price
-- produtos com preço > media todos os produtos ok
select nombre, precio 
  from producto
 where precio > (select avg(precio)
                   from producto);

-- 25. Show top 3 most expensive products
-- 3 produtos mais caros ok
select nombre, precio 
  from producto
 order by precio desc
 limit 3;

-- 26. Show 3 cheapest products
-- 3 produtos mais baratos ok
select nombre, precio 
  from producto
 order by precio asc
 limit 3;

-- 27. Show the most expensive product by Lenovo
-- produto mais caro do Lenovo ok
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo'
 order by p.precio desc
 limit 1;

-- 28. Show all products from Hewlett-Packard
-- todos os produtos da hp ok
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Hewlett-Packard';

-- 29. Show products from Asus, HP, Seagate, or Xiaomi
-- todos produtos das fabricantes asus, hp, seagate, xiaomi ok
select p.nombre, f.nombre as fabricante 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate', 'Xiaomi');

-- 30. Show products starting with "Memoria"
-- produtos que nome comeca com Memoria
select nombre 
  from producto
 where nombre like 'Memoria%';

-- 31. Show products containing 'HD'
-- produtos com HD no nome ok
select nombre 
  from producto
 where nombre like '%HD%';

-- 32. Show products containing 'Monitor'
-- produtos com 'Monitor' no nome
select nombre 
  from producto
 where nombre like '%Monitor%';

-- 33. Show products containing 'Impresora'
-- produtos com Impresora no nome ok
select nombre 
  from producto
 where nombre like '%Impresora%';

-- 34. Count products per manufacturer
-- quantos produtos existem por fabricante? ok
select f.nombre as fabricante, count(p.codigo) as total_produtos 
  from fabricante f
  left join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre;

-- 35. Average price per manufacturer
-- preço medio dos produtos por fabricante ok
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre;

-- 36. Show name of manufacturer with highest average price
-- calcula a media com os produtos agrupados (precisa agrupar)
-- ordena decrescente e pegar so o primeiro ok
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre
 order by preco_medio desc
 limit 1;

-- 37. Show name of manufacturer with lowest average price
-- mesmo do anterior
-- ordenar crescente para pegar o mais barato ok
select f.nombre as fabricante, avg(p.precio) as preco_medio 
  from fabricante f
  join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre
 order by preco_medio
 limit 1;

-- 38. Show all products by Lenovo
-- todos os produtos fabricante Lenovo
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo';

-- 39. Show cheapest product from Lenovo
-- produto mais barato fabricante Lenovo ok
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Lenovo'
 order by p.precio
 limit 1;

-- 40. Show Asus products above Asus average price
-- primeiro produto acima da media da asus
select p.nombre, p.precio 
  from producto p
  join fabricante f on p.codigo_fabricante = f.codigo
 where f.nombre = 'Asus'
    -- separar os que estao acima desse select
    -- preco tem que ser acima da media
   and p.precio > (select avg(p2.precio) 
                     from producto p2
                     join fabricante f2 on p2.codigo_fabricante = f2.codigo
                    where f2.nombre = 'Asus');

-- 41. Show products with the highest price in the store
-- produtos com maior preco de todos e sao os mais caros em toda a loja ok
select nombre, precio 
  from producto
 where precio = (select max(precio)
                   from producto);