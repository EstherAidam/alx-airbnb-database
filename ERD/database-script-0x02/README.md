# Database Seeding Script

This directory contains SQL scripts used to populate the **Airbnb database** with initial sample data.

## 📄 File: `seed.sql`

### Description
The `seed.sql` file adds realistic data for testing and development purposes.  
It includes data for all main entities — users, properties, bookings, payments, reviews, and messages.

### 📊 Tables Populated
1. **User** – Inserts host and guest users.
2. **Property** – Adds properties linked to hosts.
3. **Booking** – Includes sample bookings by users.
4. **Payment** – Adds payments related to bookings.
5. **Review** – Inserts guest reviews for properties.
6. **Message** – Demonstrates user-to-user communication.

### 🧠 Notes
- UUIDs are simplified here (e.g., `u1`, `p1`) for clarity.
- You can replace them with generated UUIDs if your database supports it.
- Run this script **after creating the schema** (`schema.sql`).

### 🧰 Usage
To populate the database, run:
```bash
psql -U <username> -d airbnb_db -f seed.sql
