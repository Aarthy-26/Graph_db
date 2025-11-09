// Source: supply_chain_metadata/customers.csv
// Generated: 2025-01-27
// Description: Creates Customer nodes with uniqueness constraints and loads customer data

// Create uniqueness constraint for customer_id
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS FOR (c:Customers) REQUIRE c.customer_id IS UNIQUE;

// Load Customer data from CSV
LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
CREATE (c:Customers {
  customer_id: row.customer_id,
  name: row.name,
  segment: row.segment,
  city: row.city,
  contact_email: row.contact_email
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
// MERGE (c:Customers {customer_id: row.customer_id})
// SET c.name = row.name,
//     c.segment = row.segment,
//     c.city = row.city,
//     c.contact_email = row.contact_email;

// Verify data load
// MATCH (c:Customers) RETURN count(c) as total_customers;