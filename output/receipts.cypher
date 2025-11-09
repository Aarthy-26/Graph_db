// Source: supply_chain_metadata/receipts.csv
// Generated: 2025-01-27
// Description: Creates Receipts nodes with uniqueness constraints and loads receipts data

// Create uniqueness constraint for receipt_id
CREATE CONSTRAINT receipt_id_unique IF NOT EXISTS FOR (r:Receipts) REQUIRE r.receipt_id IS UNIQUE;

// Load Receipts data from CSV
LOAD CSV WITH HEADERS FROM 'file:///receipts.csv' AS row
CREATE (r:Receipts {
  receipt_id: row.receipt_id,
  po_id: row.po_id,
  product_id: row.product_id,
  quantity_received: toInteger(row.quantity_received),
  received_date: row.received_date,
  warehouse_id: row.warehouse_id
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///receipts.csv' AS row
// MERGE (r:Receipts {receipt_id: row.receipt_id})
// SET r.po_id = row.po_id,
//     r.product_id = row.product_id,
//     r.quantity_received = toInteger(row.quantity_received),
//     r.received_date = row.received_date,
//     r.warehouse_id = row.warehouse_id;

// Verify data load
// MATCH (r:Receipts) RETURN count(r) as total_receipts;