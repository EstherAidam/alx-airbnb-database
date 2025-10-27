# Airbnb Database Specification

## 🧩 Overview
This document outlines the database design for the **Airbnb Clone Project**.  
It includes the entity–relationship structure, key attributes, and relationships between users, properties, bookings, payments, reviews, and messages.

---

## 🧱 Entities and Attributes

### 1. User
- **user_id** (PK, UUID, Indexed)
- **first_name** (VARCHAR, NOT NULL)
- **last_name** (VARCHAR, NOT NULL)
- **email** (VARCHAR, UNIQUE, NOT NULL)
- **password_hash** (VARCHAR, NOT NULL)
- **phone_number** (VARCHAR, NULL)
- **role** (ENUM: guest, host, admin, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. Property
- **property_id** (PK, UUID, Indexed)
- **host_id** (FK → User.user_id)
- **name** (VARCHAR, NOT NULL)
- **description** (TEXT, NOT NULL)
- **location** (VARCHAR, NOT NULL)
- **pricepernight** (DECIMAL, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **updated_at** (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. Booking
- **booking_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- **start_date** (DATE, NOT NULL)
- **end_date** (DATE, NOT NULL)
- **total_price** (DECIMAL, NOT NULL)
- **status** (ENUM: pending, confirmed, canceled, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. Payment
- **payment_id** (PK, UUID, Indexed)
- **booking_id** (FK → Booking.booking_id)
- **amount** (DECIMAL, NOT NULL)
- **payment_date** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **payment_method** (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. Review
- **review_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- **rating** (INTEGER, CHECK rating BETWEEN 1 AND 5, NOT NULL)
- **comment** (TEXT, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. Message
- **message_id** (PK, UUID, Indexed)
- **sender_id** (FK → User.user_id)
- **recipient_id** (FK → User.user_id)
- **message_body** (TEXT, NOT NULL)
- **sent_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## 🔗 Relationships

| Relationship | Description | Type |
|---------------|--------------|------|
| User → Property | A host can own many properties | 1 → M |
| User → Booking | A guest can make many bookings | 1 → M |
| Property → Booking | A property can have many bookings | 1 → M |
| Booking → Payment | Each booking has one payment | 1 → 1 |
| Property → Review | A property can have many reviews | 1 → M |
| User → Review | A user can write many reviews | 1 → M |
| User (sender) → Message | A user can send many messages | 1 → M |
| User (recipient) → Message | A user can receive many messages | 1 → M |

---

## ⚙️ Constraints and Indexing
### Constraints
- **Unique:** `User.email`
- **Foreign Keys:** Ensure referential integrity across entities
- **Check Constraints:** `Review.rating` must be between 1 and 5
- **Non-null Constraints:** Applied to required fields

### Indexing
- Primary keys are automatically indexed
- Additional indexes on:
  - `email` (User)
  - `property_id` (Property, Booking)
  - `booking_id` (Booking, Payment)

---

## 🖼️ ER Diagram
You can view the full entity–relationship diagram below:  
🔗 [View on dbdiagram.io](https://dbdiagram.io/d/Airbnb-ER-diagram-68ffad89357668b732d88d8c)


