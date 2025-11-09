// Source: supply_chain_metadata/orders.csv
// Generated: 2025-01-27
// Description: Creates Orders nodes with uniqueness constraints and loads orders data

// Create uniqueness constraint for order_id
CREATE CONSTRAINT order_id_unique IF NOT EXISTS FOR (o:Orders) REQUIRE o.order_id IS UNIQUE;

// Load Orders data from CSV
LOAD CSV WITH HEADERS FROM 'file:///orders.csv' AS row
CREATE (o:Orders {
  order_id: row.order_id,
  customer_id: row.customer_id,
  order_date: row.order_date,
  status: row.status,
  total_amount: toFloat(row.total_amount)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///orders.csv' AS row
// MERGE (o:Orders {order_id: row.order_id})
// SET o.customer_id = row.customer_id,
//     o.order_date = row.order_date,
//     o.status = row.status,
//     o.total_amount = toFloat(row.total_amount);

// Verify data load
// MATCH (o:Orders) RETURN count(o) as total_orders;