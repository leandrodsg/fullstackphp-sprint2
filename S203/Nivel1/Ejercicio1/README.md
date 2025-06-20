
# Optical Store Database in MongoDB

This project implements the data structure of the optical store *Cul d’Ampolla*, using MongoDB as a document-oriented database. The goal is to digitalize the management of clients, sales, glasses, and suppliers.

---

## Collections

- suppliers: name, full address, phone, fax, NIF  
- glasses: brand, left and right prescription, frame type, frame color, lens color, price, supplier  
- clients: personal information, contact, registration date, referred by  
- sales: client, glasses, responsible employee, date and time  

---

## Functional Requirements and Relationships Covered

- **"L’òptica vol saber quin és el proveïdor de cadascuna de les ulleres..."**  
  Each glasses document contains the field `supplier_id`, which holds the `ObjectId` of the respective supplier. The `suppliers` collection stores detailed information about suppliers.

- **"De les ulleres vol saber: la marca, la graduació..."**  
  The `glasses` collection contains all technical attributes of the products, including left and right prescription, frame type and color, lens color, and price.

- **"Dels clients/es vol emmagatzemar..."**  
  The `clients` collection stores name, address, phone, email, registration date (`ISODate`), and a field indicating who referred the client.

- **"Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat."**  
  The field `referred_by` is used as free text (person's name). In future implementations, this could be improved by cross-referencing the clients collection itself.

- **"El sistema ha d'indicar qui ha sigut l'empleat..."**  
  Each document in the `sales` collection records the name of the responsible employee and links client and glasses using `ObjectId`.

- **"Definiu un període de temps de les vendes."**  
  Each sale has the field `sale_datetime` as `ISODate`, enabling filtering by date or period in the future.

---

## Project File Structure

- `01_suppliers.js`  
  Creates the `optica` database and inserts a supplier with all required information.

- `02_glasses.js`  
  Inserts a glasses model (Rayban) with all attributes, referencing an existing supplier.

- `03_clients.js`  
  Registers a client with basic information and referral source.

- `04_sales.js`  
  Records a complete sale including client, glasses, employee, and date/time.
