// Source: supply_chain_metadata/invoices.csv
// Generated: 2025-01-27
// Description: Creates Invoice nodes with uniqueness constraints and loads invoice data

// Create uniqueness constraint for invoice_id
CREATE CONSTRAINT invoice_id_unique IF NOT EXISTS FOR (i:Invoices) REQUIRE i.invoice_id IS UNIQUE;

// Load Invoice data from CSV
LOAD CSV WITH HEADERS FROM 'file:///invoices.csv' AS row
CREATE (i:Invoices {
  invoice_id: row.invoice_id,
  order_id: row.order_id,
  invoice_date: row.invoice_date,
  amount_due: toFloat(row.amount_due),
  status: row.status
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///invoices.csv' AS row
// MERGE (i:Invoices {invoice_id: row.invoice_id})
// SET i.order_id = row.order_id,
//     i.invoice_date = row.invoice_date,
//     i.amount_due = toFloat(row.amount_due),
//     i.status = row.status;

// Verify data load
// MATCH (i:Invoices) RETURN count(i) as total_invoices;