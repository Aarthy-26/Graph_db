// Complete Supply Chain Graph Database Setup
// Generated: 2025-01-27
// Description: Comprehensive Cypher script to create the entire supply chain graph database
// Source: Multiple CSV files and graph model from Aarthy-26/Graph_db repository

// ========================================
// STEP 1: CREATE CONSTRAINTS
// ========================================

// Create uniqueness constraints for all primary keys
CREATE CONSTRAINT carrier_id_unique IF NOT EXISTS FOR (c:Carriers) REQUIRE c.carrier_id IS UNIQUE;
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS FOR (c:Customers) REQUIRE c.customer_id IS UNIQUE;
CREATE CONSTRAINT inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;
CREATE CONSTRAINT invoice_id_unique IF NOT EXISTS FOR (i:Invoices) REQUIRE i.invoice_id IS UNIQUE;
CREATE CONSTRAINT event_id_unique IF NOT EXISTS FOR (le:Logistics_events) REQUIRE le.event_id IS UNIQUE;
CREATE CONSTRAINT order_id_unique IF NOT EXISTS FOR (o:Orders) REQUIRE o.order_id IS UNIQUE;
CREATE CONSTRAINT order_item_id_unique IF NOT EXISTS FOR (oi:Order_items) REQUIRE oi.order_item_id IS UNIQUE;
CREATE CONSTRAINT payment_id_unique IF NOT EXISTS FOR (p:Payments) REQUIRE p.payment_id IS UNIQUE;
CREATE CONSTRAINT product_id_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT product_sku_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.sku IS UNIQUE;
CREATE CONSTRAINT po_id_unique IF NOT EXISTS FOR (po:Purchase_orders) REQUIRE po.po_id IS UNIQUE;
CREATE CONSTRAINT receipt_id_unique IF NOT EXISTS FOR (r:Receipts) REQUIRE r.receipt_id IS UNIQUE;
CREATE CONSTRAINT route_id_unique IF NOT EXISTS FOR (r:Routes) REQUIRE r.route_id IS UNIQUE;
CREATE CONSTRAINT shipment_id_unique IF NOT EXISTS FOR (s:Shipments) REQUIRE s.shipment_id IS UNIQUE;
CREATE CONSTRAINT supplier_id_unique IF NOT EXISTS FOR (s:Suppliers) REQUIRE s.supplier_id IS UNIQUE;
CREATE CONSTRAINT warehouse_id_unique IF NOT EXISTS FOR (w:Warehouses) REQUIRE w.warehouse_id IS UNIQUE;

// ========================================
// STEP 2: LOAD NODE DATA FROM CSV FILES
// ========================================

// Load Carriers
LOAD CSV WITH HEADERS FROM 'file:///carriers.csv' AS row
CREATE (c:Carriers {
  carrier_id: row.carrier_id,
  name: row.name,
  service_level: row.service_level,
  phone: row.phone
});

// Load Customers
LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
CREATE (c:Customers {
  customer_id: row.customer_id,
  name: row.name,
  segment: row.segment,
  city: row.city,
  contact_email: row.contact_email
});

// Load Suppliers
LOAD CSV WITH HEADERS FROM 'file:///suppliers.csv' AS row
CREATE (s:Suppliers {
  supplier_id: row.supplier_id,
  name: row.name,
  country: row.country,
  contact_email: row.contact_email,
  phone: row.phone,
  lead_time_days: toInteger(row.lead_time_days)
});

// Load Warehouses
LOAD CSV WITH HEADERS FROM 'file:///warehouses.csv' AS row
CREATE (w:Warehouses {
  warehouse_id: row.warehouse_id,
  name: row.name,
  location_city: row.location_city,
  capacity_units: toInteger(row.capacity_units)
});

// Load Products
LOAD CSV WITH HEADERS FROM 'file:///products.csv' AS row
CREATE (p:Products {
  product_id: row.product_id,
  sku: row.sku,
  name: row.name,
  category: row.category,
  unit_weight_kg: toFloat(row.unit_weight_kg),
  supplier_id: row.supplier_id
});

// Load Orders
LOAD CSV WITH HEADERS FROM 'file:///orders.csv' AS row
CREATE (o:Orders {
  order_id: row.order_id,
  customer_id: row.customer_id,
  order_date: row.order_date,
  status: row.status,
  total_amount: toFloat(row.total_amount)
});

// Load Order Items
LOAD CSV WITH HEADERS FROM 'file:///order_items.csv' AS row
CREATE (oi:Order_items {
  order_item_id: row.order_item_id,
  order_id: row.order_id,
  product_id: row.product_id,
  quantity: toInteger(row.quantity),
  unit_price: toFloat(row.unit_price)
});

// Load Invoices
LOAD CSV WITH HEADERS FROM 'file:///invoices.csv' AS row
CREATE (i:Invoices {
  invoice_id: row.invoice_id,
  order_id: row.order_id,
  invoice_date: row.invoice_date,
  amount_due: toFloat(row.amount_due),
  status: row.status
});

// Load Payments
LOAD CSV WITH HEADERS FROM 'file:///payments.csv' AS row
CREATE (p:Payments {
  payment_id: row.payment_id,
  invoice_id: row.invoice_id,
  payment_date: row.payment_date,
  amount_paid: toFloat(row.amount_paid),
  method: row.method
});

// Load Shipments
LOAD CSV WITH HEADERS FROM 'file:///shipments.csv' AS row
CREATE (s:Shipments {
  shipment_id: row.shipment_id,
  order_id: row.order_id,
  carrier_id: row.carrier_id,
  warehouse_id: row.warehouse_id,
  shipped_date: row.shipped_date,
  estimated_arrival: row.estimated_arrival
});

// Load Logistics Events
LOAD CSV WITH HEADERS FROM 'file:///logistics_events.csv' AS row
CREATE (le:Logistics_events {
  event_id: row.event_id,
  shipment_id: row.shipment_id,
  event_time: row.event_time,
  event_type: row.event_type,
  location: row.location
});

// Load Purchase Orders
LOAD CSV WITH HEADERS FROM 'file:///purchase_orders.csv' AS row
CREATE (po:Purchase_orders {
  po_id: row.po_id,
  supplier_id: row.supplier_id,
  order_date: row.order_date,
  expected_delivery: row.expected_delivery,
  status: row.status,
  total_value: toFloat(row.total_value)
});

// Load Receipts
LOAD CSV WITH HEADERS FROM 'file:///receipts.csv' AS row
CREATE (r:Receipts {
  receipt_id: row.receipt_id,
  po_id: row.po_id,
  product_id: row.product_id,
  quantity_received: toInteger(row.quantity_received),
  received_date: row.received_date,
  warehouse_id: row.warehouse_id
});

// Load Inventory
LOAD CSV WITH HEADERS FROM 'file:///inventory.csv' AS row
CREATE (i:Inventory {
  inventory_id: row.inventory_id,
  warehouse_id: row.warehouse_id,
  product_id: row.product_id,
  quantity_on_hand: toInteger(row.quantity_on_hand),
  reorder_point: toInteger(row.reorder_point),
  last_updated: row.last_updated
});

// Load Routes
LOAD CSV WITH HEADERS FROM 'file:///routes.csv' AS row
CREATE (r:Routes {
  route_id: row.route_id,
  origin_warehouse: row.origin_warehouse,
  destination_city: row.destination_city,
  distance_km: toInteger(row.distance_km),
  estimated_time_hours: toFloat(row.estimated_time_hours)
});

// ========================================
// STEP 3: CREATE RELATIONSHIPS
// ========================================

// 1. Customers place Orders
MATCH (c:Customers), (o:Orders)
WHERE c.customer_id = o.customer_id
MERGE (c)-[:PLACES_ORDER]->(o);

// 2. Orders contain Order Items
MATCH (o:Orders), (oi:Order_items)
WHERE o.order_id = oi.order_id
MERGE (o)-[:CONTAINS_ITEM]->(oi);

// 3. Order Items reference Products
MATCH (oi:Order_items), (p:Products)
WHERE oi.product_id = p.product_id
MERGE (oi)-[:ITEM_OF_PRODUCT]->(p);

// 4. Orders generate Invoices
MATCH (o:Orders), (i:Invoices)
WHERE o.order_id = i.order_id
MERGE (o)-[:GENERATES_INVOICE]->(i);

// 5. Payments pay Invoices
MATCH (p:Payments), (i:Invoices)
WHERE p.invoice_id = i.invoice_id
MERGE (p)-[:PAYS_INVOICE]->(i);

// 6. Shipments ship Orders
MATCH (s:Shipments), (o:Orders)
WHERE s.order_id = o.order_id
MERGE (s)-[:SHIPS_ORDER]->(o);

// 7. Shipments handled by Carriers
MATCH (s:Shipments), (c:Carriers)
WHERE s.carrier_id = c.carrier_id
MERGE (s)-[:HANDLED_BY_CARRIER]->(c);

// 8. Shipments ship from Warehouses
MATCH (s:Shipments), (w:Warehouses)
WHERE s.warehouse_id = w.warehouse_id
MERGE (s)-[:SHIPS_FROM_WAREHOUSE]->(w);

// 9. Logistics Events track Shipments
MATCH (le:Logistics_events), (s:Shipments)
WHERE le.shipment_id = s.shipment_id
MERGE (le)-[:TRACKS_SHIPMENT]->(s);

// 10. Products supplied by Suppliers
MATCH (p:Products), (s:Suppliers)
WHERE p.supplier_id = s.supplier_id
MERGE (p)-[:SUPPLIED_BY]->(s);

// 11. Purchase Orders from Suppliers
MATCH (po:Purchase_orders), (s:Suppliers)
WHERE po.supplier_id = s.supplier_id
MERGE (po)-[:ORDERS_FROM_SUPPLIER]->(s);

// 12. Receipts receive Purchase Orders
MATCH (r:Receipts), (po:Purchase_orders)
WHERE r.po_id = po.po_id
MERGE (r)-[:RECEIVES_PURCHASE_ORDER]->(po);

// 13. Receipts receive Products
MATCH (r:Receipts), (p:Products)
WHERE r.product_id = p.product_id
MERGE (r)-[:RECEIVES_PRODUCT]->(p);

// 14. Receipts received at Warehouses
MATCH (r:Receipts), (w:Warehouses)
WHERE r.warehouse_id = w.warehouse_id
MERGE (r)-[:RECEIVED_AT_WAREHOUSE]->(w);

// 15. Inventory stored in Warehouses
MATCH (i:Inventory), (w:Warehouses)
WHERE i.warehouse_id = w.warehouse_id
MERGE (i)-[:STORES_INVENTORY]->(w);

// 16. Inventory of Products
MATCH (i:Inventory), (p:Products)
WHERE i.product_id = p.product_id
MERGE (i)-[:INVENTORY_OF_PRODUCT]->(p);

// 17. Routes originate from Warehouses
MATCH (r:Routes), (w:Warehouses)
WHERE r.origin_warehouse = w.warehouse_id
MERGE (r)-[:ORIGINATES_FROM_WAREHOUSE]->(w);

// ========================================
// STEP 4: VERIFICATION QUERIES
// ========================================

// Count nodes by type
// MATCH (n) RETURN labels(n)[0] as node_type, count(n) as count ORDER BY count DESC;

// Count relationships by type
// MATCH ()-[r]->() RETURN type(r) as relationship_type, count(r) as count ORDER BY count DESC;

// Sample complex query to verify the graph structure
// MATCH (c:Customers)-[:PLACES_ORDER]->(o:Orders)-[:CONTAINS_ITEM]->(oi:Order_items)-[:ITEM_OF_PRODUCT]->(p:Products)-[:SUPPLIED_BY]->(s:Suppliers)
// RETURN c.name as customer, o.order_id, p.name as product, s.name as supplier, s.country
// LIMIT 10;

// Database setup complete!
// Total entities: 16 node types, 17 relationship types
// Ready for supply chain analytics and queries