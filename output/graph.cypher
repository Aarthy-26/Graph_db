// Generated Cypher Query for Supply Chain Graph Database
// Source: supply_chain_metadata and graph_model folders
// Date: Generated automatically
// Description: Creates a comprehensive supply chain graph with nodes and relationships

// Create constraints for unique identifiers
CREATE CONSTRAINT supplier_id IF NOT EXISTS FOR (s:Supplier) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT product_id IF NOT EXISTS FOR (p:Product) REQUIRE p.id IS UNIQUE;
CREATE CONSTRAINT warehouse_id IF NOT EXISTS FOR (w:Warehouse) REQUIRE w.id IS UNIQUE;
CREATE CONSTRAINT customer_id IF NOT EXISTS FOR (c:Customer) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT order_id IF NOT EXISTS FOR (o:Order) REQUIRE o.id IS UNIQUE;

// Create Supplier nodes
CREATE (s1:Supplier {
  id: 'SUP001',
  name: 'Global Electronics Supplier',
  location: 'Shenzhen, China',
  rating: 4.5,
  established: date('2010-01-15'),
  contact_email: 'contact@globalsupplier.com',
  certification: ['ISO9001', 'RoHS']
});

CREATE (s2:Supplier {
  id: 'SUP002',
  name: 'Premium Components Ltd',
  location: 'Tokyo, Japan',
  rating: 4.8,
  established: date('2005-03-20'),
  contact_email: 'info@premiumcomp.jp',
  certification: ['ISO14001', 'OHSAS18001']
});

// Create Product nodes
CREATE (p1:Product {
  id: 'PROD001',
  name: 'Smartphone Battery',
  category: 'Electronics',
  unit_price: 25.50,
  weight: 0.15,
  dimensions: '10x5x0.5 cm',
  sku: 'BAT-SM-001'
});

CREATE (p2:Product {
  id: 'PROD002',
  name: 'LED Display Panel',
  category: 'Electronics',
  unit_price: 150.00,
  weight: 0.8,
  dimensions: '15x8x0.3 cm',
  sku: 'LED-DP-002'
});

// Create Warehouse nodes
CREATE (w1:Warehouse {
  id: 'WH001',
  name: 'Central Distribution Center',
  location: 'Los Angeles, CA',
  capacity: 50000,
  current_stock: 35000,
  manager: 'John Smith',
  operational_hours: '24/7'
});

CREATE (w2:Warehouse {
  id: 'WH002',
  name: 'East Coast Hub',
  location: 'New York, NY',
  capacity: 30000,
  current_stock: 22000,
  manager: 'Sarah Johnson',
  operational_hours: '6AM-10PM'
});

// Create Customer nodes
CREATE (c1:Customer {
  id: 'CUST001',
  name: 'TechCorp Industries',
  type: 'B2B',
  location: 'San Francisco, CA',
  credit_limit: 100000,
  payment_terms: 'Net 30',
  account_manager: 'Mike Davis'
});

CREATE (c2:Customer {
  id: 'CUST002',
  name: 'Retail Electronics Chain',
  type: 'B2B',
  location: 'Chicago, IL',
  credit_limit: 250000,
  payment_terms: 'Net 45',
  account_manager: 'Lisa Wong'
});

// Create Order nodes
CREATE (o1:Order {
  id: 'ORD001',
  order_date: datetime('2024-01-15T10:30:00'),
  status: 'Shipped',
  total_amount: 5100.00,
  shipping_address: '123 Tech Street, San Francisco, CA',
  expected_delivery: date('2024-01-20')
});

CREATE (o2:Order {
  id: 'ORD002',
  order_date: datetime('2024-01-18T14:45:00'),
  status: 'Processing',
  total_amount: 12750.00,
  shipping_address: '456 Retail Ave, Chicago, IL',
  expected_delivery: date('2024-01-25')
});

// Create relationships between entities

// Supplier supplies Product relationships
MATCH (s:Supplier {id: 'SUP001'}), (p:Product {id: 'PROD001'})
CREATE (s)-[:SUPPLIES {
  lead_time_days: 14,
  minimum_order_quantity: 100,
  price_per_unit: 23.50,
  contract_start: date('2024-01-01'),
  contract_end: date('2024-12-31')
}]->(p);

MATCH (s:Supplier {id: 'SUP002'}), (p:Product {id: 'PROD002'})
CREATE (s)-[:SUPPLIES {
  lead_time_days: 21,
  minimum_order_quantity: 50,
  price_per_unit: 140.00,
  contract_start: date('2024-01-01'),
  contract_end: date('2024-12-31')
}]->(p);

// Warehouse stores Product relationships
MATCH (w:Warehouse {id: 'WH001'}), (p:Product {id: 'PROD001'})
CREATE (w)-[:STORES {
  quantity: 500,
  reorder_level: 100,
  max_capacity: 1000,
  last_restocked: date('2024-01-10')
}]->(p);

MATCH (w:Warehouse {id: 'WH002'}), (p:Product {id: 'PROD002'})
CREATE (w)-[:STORES {
  quantity: 150,
  reorder_level: 30,
  max_capacity: 300,
  last_restocked: date('2024-01-12')
}]->(p);

// Customer places Order relationships
MATCH (c:Customer {id: 'CUST001'}), (o:Order {id: 'ORD001'})
CREATE (c)-[:PLACES {
  order_priority: 'High',
  payment_method: 'Credit',
  discount_applied: 5.0
}]->(o);

MATCH (c:Customer {id: 'CUST002'}), (o:Order {id: 'ORD002'})
CREATE (c)-[:PLACES {
  order_priority: 'Standard',
  payment_method: 'Wire Transfer',
  discount_applied: 2.5
}]->(o);

// Order contains Product relationships
MATCH (o:Order {id: 'ORD001'}), (p:Product {id: 'PROD001'})
CREATE (o)-[:CONTAINS {
  quantity: 200,
  unit_price: 25.50,
  line_total: 5100.00
}]->(p);

MATCH (o:Order {id: 'ORD002'}), (p:Product {id: 'PROD002'})
CREATE (o)-[:CONTAINS {
  quantity: 85,
  unit_price: 150.00,
  line_total: 12750.00
}]->(p);

// Warehouse ships Order relationships
MATCH (w:Warehouse {id: 'WH001'}), (o:Order {id: 'ORD001'})
CREATE (w)-[:SHIPS {
  ship_date: date('2024-01-16'),
  tracking_number: 'TRK123456789',
  carrier: 'FedEx',
  shipping_cost: 25.00
}]->(o);

// Create indexes for better query performance
CREATE INDEX supplier_name_idx IF NOT EXISTS FOR (s:Supplier) ON (s.name);
CREATE INDEX product_category_idx IF NOT EXISTS FOR (p:Product) ON (p.category);
CREATE INDEX warehouse_location_idx IF NOT EXISTS FOR (w:Warehouse) ON (w.location);
CREATE INDEX customer_type_idx IF NOT EXISTS FOR (c:Customer) ON (c.type);
CREATE INDEX order_status_idx IF NOT EXISTS FOR (o:Order) ON (o.status);
CREATE INDEX order_date_idx IF NOT EXISTS FOR (o:Order) ON (o.order_date);