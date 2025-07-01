-- 1. list the name of all products in the table product.
select name from product;

-- 2. list the names and prices of all products in the table product.
select name, price from product;

-- 3. list all columns of the table product.
select * from product;

-- 4. list the product names, the price in euros and the price in us dollars (usd).
select name, price as euros, price * 1.15 as usd from product;

-- 5. list the product names, the price in euros and the price in us dollars. use the following aliases for the columns: product name, euros, us dollars.
select name as product_name, price as euros, price * 1.15 as us_dollars from product;

-- 6. list the names and prices of all products in the table product, converting the names to uppercase.
select upper(name) as name_uppercase, price from product;

-- 7. list the names and prices of all products in the table product, converting the names to lowercase.
select lower(name) as name_lowercase, price from product;

-- 8. list the name of all manufacturers in one column, and in another column show in uppercase the first two characters of the manufacturer name.
select name, upper(left(name, 2)) as first_two_uppercase from manufacturer;

-- 9. list the names and prices of all products in the table product, rounding the price.
select name, round(price) as price_rounded from product;

-- 10. list the names and prices of all products in the table product, truncating the price to show it without decimals.
select name, truncate(price, 0) as price_truncated from product;

-- 11. list the codes of manufacturers that have products in the table product.
select distinct manufacturer_code from product;

-- 12. list the codes of manufacturers that have products in the table product, removing duplicate codes.
select distinct manufacturer_code from product;

-- 13. list the names of manufacturers in ascending order.
select name from manufacturer order by name asc;

-- 14. list the names of manufacturers in descending order.
select name from manufacturer order by name desc;

-- 15. list the product names ordered first by name ascending and second by price descending.
select name, price from product order by name asc, price desc;

-- 16. return a list with the first 5 rows of the table manufacturer.
select * from manufacturer limit 5;

-- 17. return a list with 2 rows starting from the fourth row of the table manufacturer. the fourth row must also be included in the result.
select * from manufacturer limit 2 offset 3;

-- 18. list the name and price of the cheapest product. (use only order by and limit clauses).
select name, price from product order by price asc limit 1;

-- 19. list the name and price of the most expensive product. (use only order by and limit clauses).
select name, price from product order by price desc limit 1;

-- 20. list the name of all products from the manufacturer whose code is 2.
select name from product where manufacturer_code = 2;

-- 21. return a list with the product name, price and manufacturer name of all products in the database.
select p.name as product_name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code;

-- 22. return a list with the product name, price and manufacturer name of all products in the database. order the result by manufacturer name alphabetically.
select p.name as product_name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
order by m.name asc;

-- 23. return a list with the product code, product name, manufacturer code and manufacturer name of all products in the database.
select p.code as product_code, p.name as product_name, p.manufacturer_code, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code;

-- 24. return the product name, its price and its manufacturer name of the cheapest product.
select p.name as product_name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
order by p.price asc limit 1;

-- 25. return the product name, its price and its manufacturer name of the most expensive product.
select p.name as product_name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
order by p.price desc limit 1;

-- 26. return a list of all products from the manufacturer lenovo.
select p.name, p.price
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name = 'lenovo';

-- 27. return a list of all products from the manufacturer crucial with a price greater than 200 €.
select p.name, p.price
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name = 'crucial' and p.price > 200;

-- 28. return a list with all products from the manufacturers asus, hewlett-packard and seagate. without using the in operator.
select p.name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name = 'asus' or m.name = 'hewlett-packard' or m.name = 'seagate';

-- 29. return a list with all products from the manufacturers asus, hewlett-packard and seagate. using the in operator.
select p.name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name in ('asus', 'hewlett-packard', 'seagate');

-- 30. return a list with the name and price of all products from manufacturers whose name ends with vowel 'e'.
select p.name, p.price
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name like '%e';

-- 31. return a list with the name and price of all products from manufacturers whose name contains the character 'w'.
select p.name, p.price
from product p
join manufacturer m on p.manufacturer_code = m.code
where m.name like '%w%';

-- 32. return a list with the product name, price and manufacturer name of all products with price greater than or equal to 180 €. order the result first by price (descending) and then by name (ascending).
select p.name, p.price, m.name as manufacturer_name
from product p
join manufacturer m on p.manufacturer_code = m.code
where p.price >= 180
order by p.price desc, p.name asc;

-- 33. return a list with the code and name of the manufacturer, only of those manufacturers who have products associated in the database.
select distinct m.code, m.name
from manufacturer m
join product p on m.code = p.manufacturer_code;

-- 34. return a list of all manufacturers that exist in the database, together with the products each one has. the list must also show those manufacturers with no associated products.
select m.name as manufacturer_name, p.name as product_name
from manufacturer m
left join product p on m.code = p.manufacturer_code;

-- 35. return a list showing only those manufacturers who have no associated products.
select m.name
from manufacturer m
left join product p on m.code = p.manufacturer_code
where p.code is null;

-- 36. return all products from the manufacturer lenovo. (without using inner join).
select name, price
from product
where manufacturer_code = (
  select code from manufacturer where name = 'lenovo'
);

-- 37. return all data of products with the same price as the most expensive product from lenovo. (without using inner join).
select *
from product
where price = (
  select max(price) from product
  where manufacturer_code = (
    select code from manufacturer where name = 'lenovo'
  )
);

-- 38. list the name of the most expensive product from lenovo.
select name
from product
where manufacturer_code = (
  select code from manufacturer where name = 'lenovo'
)
order by price desc limit 1;

-- 39. list the name of the cheapest product from hewlett-packard.
select name
from product
where manufacturer_code = (
  select code from manufacturer where name = 'hewlett-packard'
)
order by price asc limit 1;

-- 40. return all products in the database with price greater than or equal to the most expensive product from lenovo.
select *
from product
where price >= (
  select max(price) from product
  where manufacturer_code = (
    select code from manufacturer where name = 'lenovo'
  )
);

-- 41. list all products from the manufacturer asus with price higher than the average price of all its products.
select *
from product
where manufacturer_code = (
  select code from manufacturer where name = 'asus'
) and price > (
  select avg(price) from product
  where manufacturer_code = (
    select code from manufacturer where name = 'asus'
  )
);
