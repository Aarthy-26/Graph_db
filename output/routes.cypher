// Source: supply_chain_metadata/routes.csv
// Generated: 2025-01-27
// Description: Creates Routes nodes with uniqueness constraints and loads routes data

// Create uniqueness constraint for route_id
CREATE CONSTRAINT route_id_unique IF NOT EXISTS FOR (r:Routes) REQUIRE r.route_id IS UNIQUE;

// Load Routes data from CSV
LOAD CSV WITH HEADERS FROM 'file:///routes.csv' AS row
CREATE (r:Routes {
  route_id: row.route_id,
  origin_warehouse: row.origin_warehouse,
  destination_city: row.destination_city,
  distance_km: toInteger(row.distance_km),
  estimated_time_hours: toFloat(row.estimated_time_hours)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///routes.csv' AS row
// MERGE (r:Routes {route_id: row.route_id})
// SET r.origin_warehouse = row.origin_warehouse,
//     r.destination_city = row.destination_city,
//     r.distance_km = toInteger(row.distance_km),
//     r.estimated_time_hours = toFloat(row.estimated_time_hours);

// Verify data load
// MATCH (r:Routes) RETURN count(r) as total_routes;