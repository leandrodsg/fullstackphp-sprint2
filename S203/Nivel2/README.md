# Food Delivery Service Database

This project models the database for an online food delivery service, using JSON files to simulate a NoSQL database collection.

---

## Model Overview

The data is organized into five collections:
- Orders: Records each transaction, referencing the customer (`customer_id`), the store (`store_id`), the products (`products.product_id`), and the delivery person (`delivery_person_id`).
- Customers: Stores all personal and contact information for each customer.
- Products: Contains the details for all available products, such as pizzas, burgers, and drinks.
- Stores: Holds the details of each physical store.
- Employees: Stores information about employees, who can be cooks or delivery personnel.

---

## The structure

- From an `orders` document:
  - Display the core order details (order number, date, total price).
  - Retrieve the customer's full details using `customer_id` from the `customers` collection to show their name and contact number.
  - For each item in the `products` array:
    - Retrieve the product details (name, price) from the `products` collection using `product_id`.
    - Combine it with the `quantity` from the order document.
  - If it's a delivery, display the `delivery_address` embedded in the order.
  - Retrieve the delivery person's details from the `employees` collection using `delivery_person_id`.

---

## Example Query Flows

- To display the confirmed order details:
  1. Find the order by its `_id` in `orders.json`.
  2. Get the customer details from `customers.json` using the `customer_id` from the order.
  3. For each product in the order's `products` array, get the full product details from `products.json` using `product_id`.
  4. Get the delivery person's name from `employees.json` using `delivery_person_id`.
  5. Get store details from `stores.json` using `store_id` if needed.

---

## Files

- `orders.json` – Order transactions
- `customers.json` – Customer data
- `products.json` – Product data
- `stores.json` – Store data
- `employees.json` – Employee data