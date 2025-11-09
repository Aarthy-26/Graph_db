// Source: supply_chain_metadata/carriers.csv
// Generated: 2025-01-27
// Description: Creates Carrier nodes with uniqueness constraints and loads carrier data

// Create uniqueness constraint for carrier_id
CREATE CONSTRAINT carrier_id_unique IF NOT EXISTS FOR (c:Carriers) REQUIRE c.carrier_id IS UNIQUE;

// Load Carrier data from CSV
LOAD CSV WITH HEADERS FROM 'file:///carriers.csv' AS row
CREATE (c:Carriers {
  carrier_id: row.carrier_id,
  name: row.name,
  service_level: row.service_level,
  phone: row.phone
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///carriers.csv' AS row
// MERGE (c:Carriers {carrier_id: row.carrier_id})
// SET c.name = row.name,
//     c.service_level = row.service_level,
//     c.phone = row.phone;

// Verify data load
// MATCH (c:Carriers) RETURN count(c) as total_carriers;