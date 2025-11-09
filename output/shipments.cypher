// Source: supply_chain_metadata/shipments.csv
// Generated: 2025-01-27
// Description: Creates Shipments nodes with uniqueness constraints and loads shipments data

// Create uniqueness constraint for shipment_id
CREATE CONSTRAINT shipment_id_unique IF NOT EXISTS FOR (s:Shipments) REQUIRE s.shipment_id IS UNIQUE;

// Load Shipments data from CSV
LOAD CSV WITH HEADERS FROM 'file:///shipments.csv' AS row
CREATE (s:Shipments {
  shipment_id: row.shipment_id,
  order_id: row.order_id,
  carrier_id: row.carrier_id,
  warehouse_id: row.warehouse_id,
  shipped_date: row.shipped_date,
  estimated_arrival: row.estimated_arrival
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///shipments.csv' AS row
// MERGE (s:Shipments {shipment_id: row.shipment_id})
// SET s.order_id = row.order_id,
//     s.carrier_id = row.carrier_id,
//     s.warehouse_id = row.warehouse_id,
//     s.shipped_date = row.shipped_date,
//     s.estimated_arrival = row.estimated_arrival;

// Verify data load
// MATCH (s:Shipments) RETURN count(s) as total_shipments;