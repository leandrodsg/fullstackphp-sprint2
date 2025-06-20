# S203 - Food Order System (MongoDB)

This project implements Sprint S203 focused on modeling an online food order system using MongoDB.  
The goal is to create a simple and functional database structure to manage customers, products, orders, stores, and employees.

All data was organized to allow understanding and querying:
- Who are the registered customers
- What are the available products (pizza, burger, drink)
- How the orders are composed and who placed them
- Which store and employee are associated with each order

---

## Modeled Collections

- **customers**  
  Stores customer basic information.  
  Includes: first_name, last_name, address, zip, city, state, phone

- **products**  
  Contains the items that can be ordered.  
  Includes: type, name, description, image, price, and category (only for pizza)

- **stores**  
  Represents the physical stores handling the orders.  
  Includes: address, zip, city, state

- **employees**  
  Stores employee data.  
  Includes: first_name, last_name, cpf, phone, role, and linked store

- **orders**  
  Main document linking customer, store, products, and delivery person.  
  Includes: customer_id, store_id, product list, total_price, delivery_type, notes, delivery_person_id, delivery_date

---

## Model Rules

- Each order belongs to a customer and a store
- An order can have one or more products
- If the order is for delivery, the delivery person and delivery date are registered
- An employee can be a cook or a delivery person but works in only one store
- Products can be pizza, burger, or drink with common fields
- Pizza category is embedded inside the product document

---

## File Structure

- `customers.json`  
  Contains two customers with address and contact details

- `products.json`  
  Contains three products with type, description, image, price, and category (if applicable)

- `stores.json`  
  Contains two stores with location details

- `employees.json`  
  Contains two employees linked to stores with defined roles

- `orders.json`  
  Contains one order with two products, linked to the customer, store, and delivery person

---

## Notes

This project was created as a practical exercise to consolidate the basic concepts of data modeling in MongoDB.  
All data is fictional, and the focus is on structural coherence and data integrity.