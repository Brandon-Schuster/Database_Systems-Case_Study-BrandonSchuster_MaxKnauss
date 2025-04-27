-- Insert Customers
INSERT INTO Customer (name, address, phone_number, email_address, date_of_birth)
VALUES
('John Doe', '123 Main St', '555-1234', 'john@example.com', '1985-06-15'),
('Jane Smith', '456 Oak Ave', '555-5678', 'jane@example.com', '1990-09-22'),
('Alice Johnson', '789 Pine Rd', '555-9012', 'alice@example.com', '1978-03-05'),
('Bob Brown', '321 Maple St', '555-3456', 'bob@example.com', '1982-11-30');

-- Insert Plans
INSERT INTO Plan (plan_type, plan_name, plan_duration, plan_cost, plan_features)
VALUES
('Prepaid', 'Freedom 10GB', 30, 29.99, '10GB Data, Unlimited Talk/Text'),
('Postpaid', 'Unlimited Plus', 30, 59.99, 'Unlimited Data, Premium Support'),
('Data Only', 'Data Boost 20GB', 30, 39.99, '20GB Data Only, No Voice'),
('Prepaid', 'Starter 5GB', 30, 19.99, '5GB Data, Unlimited Talk/Text');

-- Insert Customer_Plan relationships
INSERT INTO Customer_Plan (customer_id, plan_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4);

-- Insert Transactions
INSERT INTO Transaction (transaction_type, transaction_date, transaction_amount, customer_id, plan_id)
VALUES
('Activation', '2025-04-01', 29.99, 1, 1),
('Renewal', '2025-05-01', 29.99, 1, 1),
('Activation', '2025-04-02', 59.99, 2, 2),
('Activation', '2025-04-03', 39.99, 3, 3),
('Activation', '2025-04-04', 19.99, 4, 4);

-- Insert Call Traffic
INSERT INTO Call_Traffic (call_date, call_duration, call_type, call_cost, customer_id)
VALUES
('2025-04-10 10:15:00', 300, 'local', 2.00, 1),
('2025-04-11 14:45:00', 600, 'national', 5.00, 1),
('2025-04-12 09:00:00', 200, 'local', 1.50, 2),
('2025-04-13 20:00:00', 1200, 'international', 20.00, 2),
('2025-04-14 16:30:00', 150, 'local', 1.00, 3),
('2025-04-15 12:00:00', 500, 'national', 4.00, 4);

-- Insert Cancellation
INSERT INTO Cancellation (cancellation_date, customer_id, cancellation_reason)
VALUES
('2025-04-20', 2, 'Switching to a different provider.');
