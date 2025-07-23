# Optical Store Database – Exercise 1 (MongoDB)

This project models the optical store "Cul d’Ampolla" for Exercise 1.

---

## Model Overview

To ensure the client's page loads quickly and efficiently, the data model includes the purchase history directly within each client's document. 
This allows all necessary information for the user interface to be retrieved in a single query.

While this results in some data being stored in more than one place (e.g., product details are copied into the client's purchase history), this is a practical choice to favor read performance.

The collections are organized as follows:

- clients.json: The primary collection for this exercise. It stores all client information and includes their complete `purchase_history`. Each entry in the history contains a snapshot of the sale, including key details of the glasses and the employee involved.
- glasses.json: Acts as a normalized product catalog, containing the full details for every glasses model.
- suppliers.json: A catalog containing the full details of each supplier.
- employees.json: A catalog containing the information of each employee.

---

## How The Model Supports The Interface

1.  A single document is retrieved from the `clients` collection using the client's `_id`.
2.  All the necessary data is immediately available within that one document, including the list of items for the "Last Shoppings" section, eliminating the need for additional database lookups. 