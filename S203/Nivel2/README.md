# Food Delivery Service Database

This project models the database for an online food delivery service, using JSON files to simulate a NoSQL database collection.

---

## Model Overview

The data is organized into five collections:
- Orders: Records each transaction, containing both the references to other collections (like `customer_id` and `product_id`) and a snapshot of the key information needed for display, such as customer name and product details. This optimizes the data for quick reading of the order confirmation screen.
- Customers: Stores all personal and contact information for each customer.
- Products: Contains the details for all available products, such as pizzas, burgers, and drinks.
- Stores: Holds the details of each physical store.
- Employees: Stores information about employees, who can be cooks or delivery personnel.

---

## How The Model Supports The Interface

The structure is designed to support the "Confirmed Order" screen by providing all necessary data in a single document, minimizing the need for additional queries.

- From an `orders` document:
  - All data required for the confirmation screen is available directly within the order document.
  - The `customer_snapshot` object provides the customer's name and contact number.
  - Each item in the `products` array contains its `name`, `quantity`, and `unit_price` at the time of purchase.
  - If it's a delivery, the `delivery_address` is embedded in the order.
  - Core order details (order number, date, total price) are also included.
  - References like `customer_id` and `product_id` are preserved for data integrity and more complex queries that may be needed elsewhere.

---

## Files

- `orders.json` – Order transactions
- `customers.json` – Customer data
- `products.json` – Product data
- `stores.json` – Store data
- `employees.json` – Employee data