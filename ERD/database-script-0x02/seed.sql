-- Seed data for Airbnb Database

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('u1', 'Alice', 'Johnson', 'alice@gmail.com', 'hashed_pwd1', '233501111111', 'host', CURRENT_TIMESTAMP),
  ('u2', 'Bob', 'Mensah', 'bob1@gmail.com.com', 'hashed_pwd2', '233502222222', 'guest', CURRENT_TIMESTAMP),
  ('u3', 'Cynthia', 'Brown', 'cynthiaofori@gmail.com.com', 'hashed_pwd3', '233503333333', 'guest', CURRENT_TIMESTAMP);

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('p1', 'u1', 'Cozy Beach House', 'A beautiful beach house with ocean view', 'Takoradi', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('p2', 'u1', 'City Apartment', 'Modern apartment in the city center', 'Accra', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('b1', 'p1', 'u2', '2025-11-01', '2025-11-05', 1000.00, 'confirmed', CURRENT_TIMESTAMP),
  ('b2', 'p2', 'u3', '2025-12-10', '2025-12-15', 750.00, 'pending', CURRENT_TIMESTAMP);

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay1', 'b1', 1000.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('pay2', 'b2', 750.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('r1', 'p1', 'u2', 5, 'Amazing stay! Highly recommend.', CURRENT_TIMESTAMP),
  ('r2', 'p2', 'u3', 4, 'Great location and amenities.', CURRENT_TIMESTAMP);

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('m1', 'u2', 'u1', 'Hi Alice, is the beach house available next month?', CURRENT_TIMESTAMP),
  ('m2', 'u1', 'u2', 'Hi Bob, yes it is available for booking.', CURRENT_TIMESTAMP);
