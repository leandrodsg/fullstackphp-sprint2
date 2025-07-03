-- 1. Llista el nom de tots els productes de la taula producte.
select nombre from producto;

-- 2. Llista el nom i el preu de tots els productes de la taula producte.
select nombre, precio from producto;

-- 3. Llista totes les columnes de la taula producte.
select * from producto;

-- 4. Llista el nom dels productes, el preu en euros i en dòlars americans (USD).
select nombre, precio as euros, precio * 1.15 as usd from producto;

-- 5. Llista el nom dels productes, el preu en euros i en dòlars americans. Utilitza els àlies: product name, euros, us dollars.
select nombre as nombre_producto, precio as euros, precio * 1.15 as dolares_us from producto;

-- 6. Llista el nom i el preu de tots els productes convertint el nom a majúscules.
select upper(nombre) as nombre_mayusculas, precio from producto;

-- 7. Llista el nom i el preu de tots els productes convertint el nom a minúscules.
select lower(nombre) as nombre_minusculas, precio from producto;

-- 8. Llista el nom de tots els fabricants i en una altra columna mostra en majúscules els dos primers caràcters del nom del fabricant.
select nombre, upper(left(nombre, 2)) as dos_primeres_mayuscules from fabricante;

-- 9. Llista el nom i el preu de tots els productes arrodonint el preu.
select nombre, round(precio) as precio_redondeado from producto;

-- 10. Llista el nom i el preu de tots els productes truncant el preu per mostrar-lo sense decimals.
select nombre, truncate(precio, 0) as precio_truncado from producto;

-- 11. Llista els codis dels fabricants que tenen productes a la taula producte.
select distinct codigo_fabricante from producto;

-- 12. Llista els codis dels fabricants que tenen productes a la taula producte, eliminant codis duplicats.
select distinct codigo_fabricante from producto;

-- 13. Llista el nom dels fabricants en ordre ascendent.
select nombre from fabricante order by nombre asc;

-- 14. Llista el nom dels fabricants en ordre descendent.
select nombre from fabricante order by nombre desc;

-- 15. Llista el nom dels productes ordenats per nom ascendent i preu descendent.
select nombre, precio from producto order by nombre asc, precio desc;

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricant.
select * from fabricante limit 5;

-- 17. Retorna una llista amb 2 files començant des de la quarta fila de la taula fabricant.
select * from fabricante limit 2 offset 3;

-- 18. Llista el nom i el preu del producte més barat. (Només order by i limit)
select nombre, precio from producto order by precio asc limit 1;

-- 19. Llista el nom i el preu del producte més car. (Només order by i limit)
select nombre, precio from producto order by precio desc limit 1;

-- 20. Llista el nom de tots els productes del fabricant amb codi 2.
select nombre from producto where codigo_fabricante = 2;

-- 21. Retorna una llista amb el nom, preu i nom del fabricant de tots els productes.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo;

-- 22. Retorna una llista amb el nom, preu i nom del fabricant de tots els productes ordenada pel nom del fabricant.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
order by f.nombre asc;

-- 23. Retorna una llista amb el codi i nom del producte, codi i nom del fabricant de tots els productes.
select p.codigo as codigo_producto, p.nombre as nombre_producto, p.codigo_fabricante, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo;

-- 24. Retorna el nom, preu i fabricant del producte més barat.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio asc limit 1;

-- 25. Retorna el nom, preu i fabricant del producte més car.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio desc limit 1;

-- 26. Retorna una llista de tots els productes del fabricant lenovo.
select p.nombre, p.precio
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Lenovo';

-- 27. Retorna una llista de tots els productes del fabricant crucial amb preu superior a 200 €.
select p.nombre, p.precio
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Crucial' and p.precio > 200;

-- 28. Retorna una llista amb tots els productes dels fabricants asus, hewlett-packard i seagate sense utilitzar in.
select p.nombre, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';

-- 29. Retorna una llista amb tots els productes dels fabricants asus, hewlett-packard i seagate utilitzant in.
select p.nombre, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Retorna una llista amb el nom i preu de tots els productes dels fabricants que acaben en vocal 'e'.
select p.nombre, p.precio
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre like '%e';

-- 31. Retorna una llista amb el nom i preu de tots els productes dels fabricants que contenen la lletra 'w'.
select p.nombre, p.precio
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre like '%w%';

-- 32. Retorna una llista amb el nom, preu i fabricant de tots els productes amb preu ≥ 180 € ordenats per preu descendent i nom ascendent.
select p.nombre, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where p.precio >= 180
order by p.precio desc, p.nombre asc;

-- 33. Retorna una llista amb el codi i nom del fabricant només dels que tenen productes.
select distinct f.codigo, f.nombre
from fabricante f
join producto p on f.codigo = p.codigo_fabricante;

-- 34. Retorna una llista amb tots els fabricants i els productes que tenen (inclou els que no tenen cap producte).
select f.nombre as nombre_fabricante, p.nombre as nombre_producto
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante;

-- 35. Retorna una llista només amb els fabricants que no tenen productes.
select f.nombre
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante
where p.codigo is null;

-- 36. Retorna tots els productes del fabricant lenovo (sense inner join).
select nombre, precio
from producto
where codigo_fabricante = (
  select codigo from fabricante where nombre = 'Lenovo'
);

-- 37. Retorna totes les dades dels productes amb el mateix preu que el producte més car de lenovo (sense inner join).
select *
from producto
where precio = (
  select max(precio) from producto
  where codigo_fabricante = (
    select codigo from fabricante where nombre = 'Lenovo'
  )
);

-- 38. Llista el nom del producte més car de lenovo.
select nombre
from producto
where codigo_fabricante = (
  select codigo from fabricante where nombre = 'Lenovo'
)
order by precio desc limit 1;

-- 39. Llista el nom del producte més barat de hewlett-packard.
select nombre
from producto
where codigo_fabricante = (
  select codigo from fabricante where nombre = 'Hewlett-Packard'
)
order by precio asc limit 1;

-- 40. Retorna tots els productes amb preu ≥ al producte més car de lenovo.
select *
from producto
where precio >= (
  select max(precio) from producto
  where codigo_fabricante = (
    select codigo from fabricante where nombre = 'Lenovo'
  )
);

-- 41. Llista tots els productes de asus amb preu superior a la mitjana dels seus productes.
select *
from producto
where codigo_fabricante = (
  select codigo from fabricante where nombre = 'Asus'
) and precio > (
  select avg(precio) from producto
  where codigo_fabricante = (
    select codigo from fabricante where nombre = 'Asus'
  )
);