// Source: supply_chain_metadata/inventory.csv
// Generated: 2025-01-27
// Description: Creates Inventory nodes with uniqueness constraints and loads inventory data

// Create uniqueness constraint for inventory_id
CREATE CONSTRAINT inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;

// Load Inventory data from CSV
LOAD CSV WITH HEADERS FROM 'file:///inventory.csv' AS row
CREATE (i:Inventory {
  inventory_id: row.inventory_id,
  warehouse_id: row.warehouse_id,
  product_id: row.product_id,
  quantity_on_hand: toInteger(row.quantity_on_hand),
  reorder_point: toInteger(row.reorder_point),
  last_updated: row.last_updated
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///inventory.csv' AS row
// MERGE (i:Inventory {inventory_id: row.inventory_id})
// SET i.warehouse_id = row.warehouse_id,
//     i.product_id = row.product_id,
//     i.quantity_on_hand = toInteger(row.quantity_on_hand),
//     i.reorder_point = toInteger(row.reorder_point),
//     i.last_updated = row.last_updated;

// Verify data load
// MATCH (i:Inventory) RETURN count(i) as total_inventory_records;