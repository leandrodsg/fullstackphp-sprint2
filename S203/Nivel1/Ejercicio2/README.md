
# Optical Store Database – Exercise 2 (MongoDB)

This project is a continuation of the previous optical store database (*Cul d’Ampolla*), expanding the data with new records of suppliers, glasses, clients, and sales.

## 🗄️ Collections and Structure

- **suppliers**  
  Stores supplier details including name, full address, phone, fax, and NIF.

- **glasses**  
  Stores glasses information including brand, prescription (left and right), frame type and color, lens color, price, and supplier reference (`supplier_id`).

- **clients**  
  Stores client personal information such as name, address, phone, email, registration date, and referral source (`referred_by`).

- **sales**  
  Stores the relationship between clients and glasses, including the employee responsible for the sale and the sale date (`sale_datetime`).

---

## 🔗 Relationships

- Each **glasses** document contains a `supplier_id` referencing a document from the **suppliers** collection.
- Each **sales** document references both a **client** (`client_id`) and a **glasses** (`glasses_id`).
- The `referred_by` field in **clients** is a free-text field indicating who referred the client.

---

## 🧠 Functional Scope

- Ability to retrieve the supplier of any glasses.
- Ability to retrieve all clients who purchased a specific glasses model.
- Ability to check the employee responsible for each sale.
- Full traceability of who bought what, when, and from whom.

---

## 🗺️ Data Added in Exercise 2

- **Supplier:** Googles Associated SL
- **Glasses:** Google # with Metallic frame and Transparent lenses
- **Clients:** Client 1, Client 2, Client 3 (with referral chain)
- **Sales:** Each client bought the same glasses, sold by employees Carlos Ramos and Ana Ruiz on different dates.

---

## 💾 Files

- `clients_ex2.json` – Contains new clients' data
- `suppliers_ex2.json` – Contains new supplier data
- `glasses_ex2.json` – Contains new glasses model
- `sales_ex2.json` – Contains sales transactions linking clients and glasses

---

## ✅ Notes

- This project extends the previous Exercise 1 database without creating a new database, as recommended for real-world systems scalability.
- Collections, structure, and naming follow best practices for MongoDB and are fully in English as per the feedback received.
