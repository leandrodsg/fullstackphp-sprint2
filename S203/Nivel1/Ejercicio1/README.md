# Optical Store Database – Exercise 1 (MongoDB)

This project models the optical store "Cul d’Ampolla" for Exercise 1.

---

## Model Overview

The data is organized into five collections:
- Clients: Stores all personal and contact information for each client, including a reference to the client who made the referral, if applicable.
- Glasses: Stores all technical and commercial details of each glasses model, including brand, prescription for each eye, frame type and color, color of each lens, price, and a reference to the supplier (`supplier_id`).
- Suppliers: Holds the full details of each supplier, including complete address, phone, fax, and NIF.
- Sales: Records each transaction, referencing the client (`client_id`), the glasses sold (`glasses_id`), the responsible employee (`employee_id`), and the date and time of the sale.
- Employees: Stores the identification and contact information of each employee responsible for sales.

---

## The structure

- From a client document:
  - Display all personal/contact data and registration info.
  - Track who referred the client (if any).
  - Find all sales for this client in the sales collection (where `client_id` matches).
  - For each sale, retrieve the glasses bought (using `glasses_id`) and display their details.
  - For each sale, retrieve the employee responsible (using `employee_id`, if needed).

- From a glasses document:
  - Display all its details (brand, prescription, frame type/color, lens colors, price).
  - Retrieve the supplier's full details via `supplier_id`.

- From a supplier document:
  - Display all supplier details when requested.

---

## Example Query Flows

- To display the client details and their purchase history:
  1. Find the client by its `_id` in clients.json.
  2. Find all sales in sales.json where `client_id` matches.
  3. For each sale, get the glasses from glasses.json using `glasses_id`.
  4. For each sale, get the employee from employees.json using `employee_id` (if needed).

- To display a glasses profile:
  - Retrieve the glasses by `_id` from glasses.json and show all their details.

- To display supplier details:
  - Retrieve the supplier by `_id` from suppliers.json and show all their details.

---

## Files

- clients.json – Clients data
- glasses.json – Glasses data
- suppliers.json – Suppliers data
- sales.json – Sales transactions
- employees.json – Employees data
