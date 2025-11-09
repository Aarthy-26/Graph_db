// Source: supply_chain_metadata/order_items.csv
// Generated: 2025-01-27
// Description: Creates Order_items nodes with uniqueness constraints and loads order items data

// Create uniqueness constraint for order_item_id
CREATE CONSTRAINT order_item_id_unique IF NOT EXISTS FOR (oi:Order_items) REQUIRE oi.order_item_id IS UNIQUE;

// Load Order Items data from CSV
LOAD CSV WITH HEADERS FROM 'file:///order_items.csv' AS row
CREATE (oi:Order_items {
  order_item_id: row.order_item_id,
  order_id: row.order_id,
  product_id: row.product_id,
  quantity: toInteger(row.quantity),
  unit_price: toFloat(row.unit_price)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///order_items.csv' AS row
// MERGE (oi:Order_items {order_item_id: row.order_item_id})
// SET oi.order_id = row.order_id,
//     oi.product_id = row.product_id,
//     oi.quantity = toInteger(row.quantity),
//     oi.unit_price = toFloat(row.unit_price);

// Verify data load
// MATCH (oi:Order_items) RETURN count(oi) as total_order_items;