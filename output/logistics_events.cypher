// Source: supply_chain_metadata/logistics_events.csv
// Generated: 2025-01-27
// Description: Creates Logistics_events nodes with uniqueness constraints and loads logistics events data

// Create uniqueness constraint for event_id
CREATE CONSTRAINT event_id_unique IF NOT EXISTS FOR (le:Logistics_events) REQUIRE le.event_id IS UNIQUE;

// Load Logistics Events data from CSV
LOAD CSV WITH HEADERS FROM 'file:///logistics_events.csv' AS row
CREATE (le:Logistics_events {
  event_id: row.event_id,
  shipment_id: row.shipment_id,
  event_time: row.event_time,
  event_type: row.event_type,
  location: row.location
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///logistics_events.csv' AS row
// MERGE (le:Logistics_events {event_id: row.event_id})
// SET le.shipment_id = row.shipment_id,
//     le.event_time = row.event_time,
//     le.event_type = row.event_type,
//     le.location = row.location;

// Verify data load
// MATCH (le:Logistics_events) RETURN count(le) as total_logistics_events;