// Source: supply_chain_metadata/warehouses.csv
// Generated: 2025-01-27
// Description: Creates Warehouses nodes with uniqueness constraints and loads warehouses data

// Create uniqueness constraint for warehouse_id
CREATE CONSTRAINT warehouse_id_unique IF NOT EXISTS FOR (w:Warehouses) REQUIRE w.warehouse_id IS UNIQUE;

// Load Warehouses data from CSV
LOAD CSV WITH HEADERS FROM 'file:///warehouses.csv' AS row
CREATE (w:Warehouses {
  warehouse_id: row.warehouse_id,
  name: row.name,
  location_city: row.location_city,
  capacity_units: toInteger(row.capacity_units)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///warehouses.csv' AS row
// MERGE (w:Warehouses {warehouse_id: row.warehouse_id})
// SET w.name = row.name,
//     w.location_city = row.location_city,
//     w.capacity_units = toInteger(row.capacity_units);

// Verify data load
// MATCH (w:Warehouses) RETURN count(w) as total_warehouses;