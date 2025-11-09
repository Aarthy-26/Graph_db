// Source: supply_chain_metadata/suppliers.csv
// Generated: 2025-01-27
// Description: Creates Suppliers nodes with uniqueness constraints and loads suppliers data

// Create uniqueness constraint for supplier_id
CREATE CONSTRAINT supplier_id_unique IF NOT EXISTS FOR (s:Suppliers) REQUIRE s.supplier_id IS UNIQUE;

// Load Suppliers data from CSV
LOAD CSV WITH HEADERS FROM 'file:///suppliers.csv' AS row
CREATE (s:Suppliers {
  supplier_id: row.supplier_id,
  name: row.name,
  country: row.country,
  contact_email: row.contact_email,
  phone: row.phone,
  lead_time_days: toInteger(row.lead_time_days)
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///suppliers.csv' AS row
// MERGE (s:Suppliers {supplier_id: row.supplier_id})
// SET s.name = row.name,
//     s.country = row.country,
//     s.contact_email = row.contact_email,
//     s.phone = row.phone,
//     s.lead_time_days = toInteger(row.lead_time_days);

// Verify data load
// MATCH (s:Suppliers) RETURN count(s) as total_suppliers;