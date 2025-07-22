
# Optical Store Database – Exercise 2 (MongoDB)

This project models the optical store "Cul d’Ampolla" for Exercise 2.

---

## Model Overview

The data is organized into five collections:
- glasses: Stores all technical and commercial details of each glasses model, including brand, prescription for each eye, frame type and color, color of each lens, price, and a reference to the supplier.
- suppliers: Holds the full details of each supplier, including complete address, phone, fax, and NIF.
- clients: Stores all personal and contact information for each client, including a reference to the client who made the referral, if applicable.
- sales: Records each transaction, referencing the client, the glasses sold, the responsible employee, and the date and time of the sale.
- employees: Stores the identification and contact information of each employee responsible for sales.

---

## The structure

- From a glasses (óculos) document:
  - Display all its details (brand, prescription, frame type/color, lens colors, price).
  - Retrieve the supplier's full details via `supplier_id`.
  - Find all sales of this glasses model in the `sales` collection (where `glasses_id` matches).
  - For each sale, retrieve the client who bought it via `client_id` and display their full profile.
  - For each sale, retrieve the employee responsible via `employee_id` (if needed).

- From a client document:
  - Display all personal/contact data and registration info.
  - Track who referred the client (if any).

- From a supplier document:
  - Display all supplier details when requested (e.g., via the magnifying glass icon in the interface).

---

## Example Query Flows

- To display the glasses details and who bought them:
  1. Find the glasses by its `_id` in `glasses.json`.
  2. Retrieve the supplier using `supplier_id` from `suppliers.json`.
  3. Find all sales in `sales.json` where `glasses_id` matches.
  4. For each sale, get the client from `clients.json` using `client_id`.
  5. For each sale, get the employee from `employees.json` using `employee_id` (if needed).

- To display a client profile when clicking a name:
  - Retrieve the client by `_id` from `clients.json` and show all their details.

- To display supplier details when clicking the magnifying glass:
  - Retrieve the supplier by `_id` from `suppliers.json` and show all their details.

---

## Files

- `glasses.json` – Glasses data
- `suppliers.json` – Suppliers data
- `clients.json` – Clients data
- `sales.json` – Sales transactions
- `employees.json` – Employees data