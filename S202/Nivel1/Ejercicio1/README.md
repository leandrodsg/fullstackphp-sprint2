# Exercise 1 - Optics

This project models and implements the database of an optics store called *Cul d’Ampolla*.  
The goal is to digitalize the management of clients, sales, and glasses suppliers.

---

## Modeled Entities

- **supplier**: name, street, number, floor, door, city, postal code, country, phone, fax, and tax ID  
- **glasses**: brand, left and right lens power, frame type, frame color, lens color, price, supplier  
- **client**: personal details, contact, registration date  
- **employee**: name of the employee who made the sales  
- **sale**: records of sales with client, date, and responsible employee  
- **sale_glasses**: N:M association between sales and glasses  
- **referrals**: relationship between clients (who referred whom)

---

## Relationships and Functional Requirements Met

- **"L’òptica vol saber quin és el proveïdor de cadascuna de les ulleres..."**  
  **en** The optics store wants to know which supplier provided each pair of glasses.  
  A `supplier` table was created with all required fields, and the `glasses` table includes a `supplier_id` field, implementing a 1:N relationship (supplier:glasses).

- **"De les ulleres vol saber: la marca, la graduació..."**  
  **en** The store wants to know technical and visual details of the glasses.  
  All attributes were incorporated into the `glasses` table.  
  The relationship with `supplier` is described above.

- **"Dels clients/es vol emmagatzemar..."**  
  **en** For clients, the store wants to store: name, address, phone, email, and registration date.  
  The `client` table includes all these fields. Each client is linked to their purchases through a 1:N relationship (client:sale).

- **"Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat."**  
  **en** Register who referred each new client.  
  The `referrals` table was created to represent a relationship between clients — technically, a 1:N self-referencing relationship (client:client), represented with `client_id` and `referred_by_id`.

- **"El sistema ha d'indicar qui ha sigut l'empleat..."**  
  **en** The system must record which employee sold each pair of glasses.  
  The `employee` table and the `sale` table with `employee_id` were created. The glasses sold in each sale are stored via the intermediate table `sale_glasses`, implementing the relationships:  
  - employee 1:N sale  
  - sale N:M glasses (`sale_glasses`)

- **"Definiu un període de temps de les vendes."**  
  **en** Define a time period for sales.  
  The `date` field in the `sale` table allows filtering by date range.

---

- **"Llista el total de compres d’un client/a."**  
  **en** List the total number of purchases made by a client.  
  SQL query included in `consultas_optica.sql` using `JOIN` between `client` and `sale` with `GROUP BY` by client.

- **"Llista les diferents ulleres que ha venut un empleat durant un any."**  
  **en** List the different glasses sold by an employee during a year.  
  Query implemented by combining `employee`, `sale`, `sale_glasses`, and `glasses`, with a filter by year (`YEAR(date) = 2025`).

- **"Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l’òptica."**  
  **en** List the different suppliers that provided glasses successfully sold by the optics store.  
  Query made via `JOIN` between `supplier`, `glasses`, and `sale_glasses`, using `DISTINCT`.

---

## Project File Structure

- `bd_optica.sql`  
  Contains the creation of the database and all tables with primary keys, foreign keys, and the relational structure. Represents the full model of the optics system.

- `dados_optica.sql`  
  Populates the database with fictional data: suppliers, glasses, clients, employees, and sales. Helps simulate and test the relational model.

- `consultas_optica.sql`  
  A collection of `SELECT` commands that validate the structure and relationships between tables, focusing on data intersection and real use cases.

- `der_optica.png`  
  Image generated via MySQL Workbench showing the ERD (Entity-Relationship Diagram) with all entities and relationships.

---

## How to generate the ERD in MySQL Workbench

1. Open MySQL Workbench  
2. Go to `File > New Model`  
3. Navigate to `Database > Reverse Engineer`  
4. Select the connection used for the `optica` database  
5. Follow the wizard and select all tables  
6. At the end, open the `EER Diagram` in the left panel  
7. Adjust the layout and, if needed, export via `File > Export > PNG`