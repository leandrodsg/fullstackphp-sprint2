# Exercise 2 - Pizzeria

This project models and implements the database of a pizzeria with both dine-in and delivery services.  
The goal is to manage customers, orders, products, stores, and employees in a structured way.

---

## Modeled entities

- customer: first name, last name, full address, zip code, city, state, and phone
- store: full address, city, state, and zip code
- employee: first name, last name, NIF, phone, role (cook or delivery), and store assignment
- category: name of the pizza category (e.g., Regular, Special)
- product: name, description, image, price, type (pizza, burger or drink), category (only if pizza)
- order: date, customer, store, delivery type (pickup or home), delivery person (if applicable), and total amount
- order_product: products and quantities included in each order

---

## Relationships and functional requirements met

- **"Each customer can place orders..."**  
  1:N relationship between customer and order (`customer_id` in the `order` table).

- **"Each order must be linked to a store and register if it's pickup or delivery..."**  
  `store_id` and `delivery_type` fields in the `order` table. If delivery, `delivery_person_id` is also recorded.

- **"Available products: pizzas, burgers, and drinks. Pizzas belong to a category."**  
  The `type` field defines the product type.  
  The `category_id` is used only for products of type `pizza`.

- **"Each order can include multiple products with their quantities and prices."**  
  N:M relationship implemented via the `order_product` table, which stores `quantity` and `unit_price`.

- **"Employees can be cooks or delivery personnel, and are assigned to a store."**  
  `role` (ENUM) and `store_id` fields in the `employee` table.

---

- **"List all orders with customer, store and delivery type data."**  
  Query implemented using `JOIN` between `order`, `customer`, and `store`, ordered by `order_datetime`.

- **"Show items of a specific order, including subtotal."**  
  Query uses `JOIN` with `order_product` and `product`, including the calculation `quantity * unit_price`.

- **"Number of deliveries made by each delivery person."**  
  Filters `employee` by role 'delivery' and includes only orders with `delivery_type = 'home'`.

- **"Number of drinks sold per store city."**  
  Filters products of type `drink`, sums quantities, and groups by `store.city`.

- **"Total revenue per store."**  
  Sums `total_price` of orders grouped by `store`.

---

## Project file structure

- `bd_pizzaria.sql`  
  Creates the database, tables, and relationships with primary and foreign keys.

- `dados_pizzaria.sql`  
  Populates the database with sample data for customers, products, stores, orders, and employees.

- `consultas_pizzaria.sql`  
  Set of `SELECT` commands with table joins that meet the project requirements.

---

## How to generate the ER diagram in MySQL Workbench

1. Open MySQL Workbench
2. Go to `File > New Model`
3. Click on `Database > Reverse Engineer`
4. Connect to the `pizzaria` database
5. Continue and select all tables
6. Open the `EER Diagram` in the side panel
7. Adjust the layout and export via `File > Export > PNG`

---
