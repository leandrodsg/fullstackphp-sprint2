# Database Project - Optics Shop

This repository contains the design and implementation of a MySQL database to manage the sales and inventory of an optics shop.

## Project Description

The goal is to model a relational database that stores information about clients, employees, suppliers, products (glasses), and sales. The structure is designed to ensure data integrity and meet specific business requirements.

## Database Structure

The database, named `optics`, is composed of the following tables that fulfill all business requirements:

- `suppliers`: Stores supplier information (name, address, phone, fax, NIF)
- `brands`: Centralizes glasses brands with their supplier relationships
- `glasses`: Contains glasses specifications (model, prescription powers, frame details, price)
- `clients`: Holds client data including registration date and contact information
- `referrals`: Manages client recommendations (ensuring one recommender per client)
- `employees`: Tracks sales staff
- `sales`: Records transaction headers (date, client, employee)
- `sale_items`: Enables multiple items per sale with historical pricing

## Key Design Decisions and Business Rules

1. One Supplier per Brand:
   - `UNIQUE` constraint on `brands.name`
   - Foreign key from `brands` to `suppliers`
   - Ensures each brand works with exactly one supplier

2. Client Referral System:
   - `PRIMARY KEY` on `referrals.client_id`
   - Self-referential relationship in `referrals`
   - Guarantees maximum one recommender per client

3. Sales Management:
   - Split into `sales` (headers) and `sale_items` (details)
   - Captures employee, client, and transaction date
   - Stores historical prices at time of sale
   - Enables multiple products per transaction

## SQL Scripts

The project includes three main SQL files:

1. `bd_optics.sql`: Database structure creation (DDL)
2. `dados_optics.sql`: Sample data insertion (DML)
3. `consultas_optics.sql`: Validation queries including:
   - Total purchases by client
   - Glasses sold by employee per year
   - Supplier sales analysis