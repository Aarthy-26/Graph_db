// Source: supply_chain_metadata/purchase_orders.csv
// Generated: 2025-01-27
// Description: Creates Purchase_orders nodes with uniqueness constraints and loads purchase orders data

// Create uniqueness constraint for po_id
CREATE CONSTRAINT po_id_unique IF NOT EXISTS FOR (po:Purchase_orders) REQUIRE po.po_id IS UNIQUE;

// Load Purchase Orders data from CSV
LOAD CSV WITH HEADERS FROM 'file:///purchase_orders.csv' AS row
CREATE (po:Purchase_orders {
  po_id: row.po_id,
  supplier_id: row.supplier_id,
  order_date: row.order_date,
  expected_delivery: row.expected_delivery,
  status: row.status,
  total_value: toFloat(row.total_value)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///purchase_orders.csv' AS row
// MERGE (po:Purchase_orders {po_id: row.po_id})
// SET po.supplier_id = row.supplier_id,
//     po.order_date = row.order_date,
//     po.expected_delivery = row.expected_delivery,
//     po.status = row.status,
//     po.total_value = toFloat(row.total_value);

// Verify data load
// MATCH (po:Purchase_orders) RETURN count(po) as total_purchase_orders;