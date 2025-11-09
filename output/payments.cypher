// Source: supply_chain_metadata/payments.csv
// Generated: 2025-01-27
// Description: Creates Payments nodes with uniqueness constraints and loads payments data

// Create uniqueness constraint for payment_id
CREATE CONSTRAINT payment_id_unique IF NOT EXISTS FOR (p:Payments) REQUIRE p.payment_id IS UNIQUE;

// Load Payments data from CSV
LOAD CSV WITH HEADERS FROM 'file:///payments.csv' AS row
CREATE (p:Payments {
  payment_id: row.payment_id,
  invoice_id: row.invoice_id,
  payment_date: row.payment_date,
  amount_paid: toFloat(row.amount_paid),
  method: row.method
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///payments.csv' AS row
// MERGE (p:Payments {payment_id: row.payment_id})
// SET p.invoice_id = row.invoice_id,
//     p.payment_date = row.payment_date,
//     p.amount_paid = toFloat(row.amount_paid),
//     p.method = row.method;

// Verify data load
// MATCH (p:Payments) RETURN count(p) as total_payments;