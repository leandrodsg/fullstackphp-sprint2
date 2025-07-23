# Optical Store Database – Exercise 2 (MongoDB)

This project models the optical store "Cul d’Ampolla" for Exercise 2. The data is structured to efficiently support the main application view: the product (glasses) details page.

---

## Model Overview

To ensure the product page loads quickly and efficiently, the data model includes key related information directly within each glasses document. 
The collections are organized as follows:

- glasses.json: The primary collection for this exercise. It stores all product details and includes a snapshot of the `supplier` and the complete `purchase_history`. Each entry in the history contains key details of the client and the employee involved.
- clients.json: Acts as a normalized user catalog, containing the full details for every client.
- suppliers.json: A catalog containing the full details of each supplier.
- employees.json: A catalog containing the information of each employee.

---

## How The Model Supports The Interface

With this design, displaying the product page is highly efficient:

1.  A single document is retrieved from the `glasses` collection using the product's `_id`.
2.  All the necessary data is immediately available within that one document, including the supplier's name and the list of clients who bought the product. This eliminates the need for additional database lookups.
3.  If a user wants to see a client's full profile, the `_id` stored in the purchase history can be used to query the `clients` collection. 