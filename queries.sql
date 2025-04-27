-- Query 1: Customer Summary
SELECT 
    c.customer_id,
    c.name,
    p.plan_name,
    p.plan_type,
    cp.plan_id,
    ca.cancellation_date,
    ca.cancellation_reason
FROM 
    Customer c
LEFT JOIN Customer_Plan cp ON c.customer_id = cp.customer_id
LEFT JOIN Plan p ON cp.plan_id = p.plan_id
LEFT JOIN Cancellation ca ON c.customer_id = ca.customer_id
ORDER BY c.customer_id;

-- Query 2: Customer Call Log
SELECT 
    c.customer_id,
    c.name,
    ct.call_date,
    ct.call_duration,
    ct.call_type,
    ct.call_cost
FROM
    Customer c
JOIN Call_Traffic ct ON c.customer_id = ct.customer_id
ORDER BY c.customer_id, ct.call_date;

-- Query 3: Plan Revenue Report
SELECT 
    p.plan_id,
    p.plan_name,
    t.payment_method,  -- 🔥 Now showing how the plan was paid
    SUM(t.transaction_amount) AS total_revenue
FROM 
    Plan p
JOIN Transaction t ON p.plan_id = t.plan_id
WHERE 
    t.transaction_type IN ('Activation', 'Renewal')  -- only counting purchases
GROUP BY 
    p.plan_id, p.plan_name, t.payment_method
ORDER BY 
    total_revenue DESC;
