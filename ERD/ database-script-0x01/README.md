# Airbnb Clone – Database Schema (SQL)

## 📘 Overview
This folder contains the SQL schema for the **Airbnb Clone Database**, designed and normalized to the **Third Normal Form (3NF)**.  
It defines tables, relationships, and constraints necessary to implement the database.

---

## 🧩 Tables
1. **users** – stores information about guests, hosts, and admins  
2. **properties** – details of rental listings posted by hosts  
3. **bookings** – captures reservation information made by guests  
4. **payments** – records transactions for bookings  
5. **reviews** – allows guests to rate and review properties  
6. **messages** – stores direct communication between users  

---

## ⚙️ Constraints
- **Primary keys:** Each table has a unique primary key (`*_id`)
- **Foreign keys:** Establish relationships between users, properties, and bookings
- **Check constraints:** Enforce valid role, booking status, and payment method values
- **Unique constraints:** Ensure unique emails and booking-payment relationships

---

## 🚀 Optimization
Indexes have been added to frequently queried columns like:
- `host_id` in `properties`
- `user_id` in `bookings`
- `property_id` in `reviews`
- `sender_id` in `messages`

---

## 🧠 Tools Used
- PostgreSQL (preferred)
- SQL (DDL – Data Definition Language)
- GitHub for version control

---


