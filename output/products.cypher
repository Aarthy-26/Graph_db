// Source: supply_chain_metadata/products.csv
// Generated: 2025-01-27
// Description: Creates Products nodes with uniqueness constraints and loads products data

// Create uniqueness constraints for product_id and sku
CREATE CONSTRAINT product_id_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT product_sku_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.sku IS UNIQUE;

// Load Products data from CSV
LOAD CSV WITH HEADERS FROM 'file:///products.csv' AS row
CREATE (p:Products {
  product_id: row.product_id,
  sku: row.sku,
  name: row.name,
  category: row.category,
  unit_weight_kg: toFloat(row.unit_weight_kg),
  supplier_id: row.supplier_id
});

// Alternative: Using MERGE to avoid duplicates
// LOAD CSV WITH HEADERS FROM 'file:///products.csv' AS row
// MERGE (p:Products {product_id: row.product_id})
// SET p.sku = row.sku,
//     p.name = row.name,
//     p.category = row.category,
//     p.unit_weight_kg = toFloat(row.unit_weight_kg),
//     p.supplier_id = row.supplier_id;

// Verify data load
// MATCH (p:Products) RETURN count(p) as total_products;