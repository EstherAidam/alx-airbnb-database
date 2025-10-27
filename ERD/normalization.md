# Airbnb Database Normalization (Up to 3NF)

## 🧠 Introduction
This document explains how the Airbnb database schema was analyzed and improved to achieve **Third Normal Form (3NF)**.  
Normalization ensures data consistency, reduces redundancy, and improves database integrity.

---

## 🧩 Step 1: Review of the Original Schema
The original database schema included six main entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

Upon review, the design was functionally sound but contained a few potential normalization issues:
1. `phone_number` in the **User** table could contain multiple values (violates 1NF).  
2. `location` in the **Property** table combined multiple data points (city, country).  
3. `total_price` in **Booking** was a derived value (could be computed from price × nights, violating 3NF).

---

## ⚙️ Step 2: Applying Normalization Principles

### **1. First Normal Form (1NF)**
✅ Ensures all columns contain atomic (indivisible) values.  
✅ Removes repeating groups or multiple values in one field.  

**Changes Applied:**
- Moved `phone_number` to a new table called **UserPhone**, linked by `user_id`.
- Split `location` in **Property** into two separate columns: `city` and `country`.

---

### **2. Second Normal Form (2NF)**
✅ Ensures all non-key attributes depend on the entire primary key (no partial dependencies).  

**Changes Applied:**
- Each table now has a **single-column primary key** (UUID).  
- No attributes depend on part of a composite key (since there are none).  

---

### **3. Third Normal Form (3NF)**
✅ Removes transitive dependencies (non-key attributes depending on other non-key attributes).  

**Changes Applied:**
- Removed `total_price` from **Booking** since it can be derived from `price_per_night × duration`.  
- Ensured all non-key attributes depend **only on their primary key**.

---

## 🧱 Step 3: Final Normalized Schema (3NF)
After normalization, the following tables remain:

| Table | Key | Purpose |
|--------|-----|----------|
| **User** | user_id | Stores user account information |
| **UserPhone** | phone_id | Stores one or more phone numbers per user |
| **Property** | property_id | Stores property listings with atomic location details |
| **Booking** | booking_id | Stores booking data with start/end dates and status |
| **Payment** | payment_id | Stores payment transactions linked to bookings |
| **Review** | review_id | Stores user reviews for properties |
| **Message** | message_id | Stores messages exchanged between users |

---

## 🖼️ Step 4: View Normalized Diagram
You can view the updated (3NF) version of the Airbnb ERD here:

👉 [**View on dbdiagram.io (3NF Normalized)**](https://dbdiagram.io/d/Airbnb-Database-Normalized-to-3NF-68ffbd30357668b732dabba2)

---

## 🏁 Conclusion
After normalization:
- The database is in **Third Normal Form (3NF)**.  
- All tables are free from redundancy, update anomalies, and insertion/deletion issues.  
- Data relationships are clearly defined through foreign keys, ensuring integrity and scalability.

---

  
**Project:** ALX Airbnb Database Design  
**Status:** ✅ Normalized to 3NF
