// Source: graph_model/graph_model.json
// Generated: 2025-01-27
// Description: Creates complete graph structure with relationships based on the graph model schema

// ========================================
// RELATIONSHIPS CREATION
// ========================================
// This script creates all relationships defined in the graph model
// Run this AFTER loading all the node data from CSV files

// 1. PLACES_ORDER: Customers -> Orders (one-to-many)
MATCH (c:Customers), (o:Orders)
WHERE c.customer_id = o.customer_id
MERGE (c)-[:PLACES_ORDER]->(o);

// 2. CONTAINS_ITEM: Orders -> Order_items (one-to-many)
MATCH (o:Orders), (oi:Order_items)
WHERE o.order_id = oi.order_id
MERGE (o)-[:CONTAINS_ITEM]->(oi);

// 3. ITEM_OF_PRODUCT: Order_items -> Products (many-to-one)
MATCH (oi:Order_items), (p:Products)
WHERE oi.product_id = p.product_id
MERGE (oi)-[:ITEM_OF_PRODUCT]->(p);

// 4. GENERATES_INVOICE: Orders -> Invoices (one-to-one)
MATCH (o:Orders), (i:Invoices)
WHERE o.order_id = i.order_id
MERGE (o)-[:GENERATES_INVOICE]->(i);

// 5. PAYS_INVOICE: Payments -> Invoices (many-to-one)
MATCH (p:Payments), (i:Invoices)
WHERE p.invoice_id = i.invoice_id
MERGE (p)-[:PAYS_INVOICE]->(i);

// 6. SHIPS_ORDER: Shipments -> Orders (many-to-one)
MATCH (s:Shipments), (o:Orders)
WHERE s.order_id = o.order_id
MERGE (s)-[:SHIPS_ORDER]->(o);

// 7. HANDLED_BY_CARRIER: Shipments -> Carriers (many-to-one)
MATCH (s:Shipments), (c:Carriers)
WHERE s.carrier_id = c.carrier_id
MERGE (s)-[:HANDLED_BY_CARRIER]->(c);

// 8. SHIPS_FROM_WAREHOUSE: Shipments -> Warehouses (many-to-one)
MATCH (s:Shipments), (w:Warehouses)
WHERE s.warehouse_id = w.warehouse_id
MERGE (s)-[:SHIPS_FROM_WAREHOUSE]->(w);

// 9. TRACKS_SHIPMENT: Logistics_events -> Shipments (many-to-one)
MATCH (le:Logistics_events), (s:Shipments)
WHERE le.shipment_id = s.shipment_id
MERGE (le)-[:TRACKS_SHIPMENT]->(s);

// 10. SUPPLIED_BY: Products -> Suppliers (many-to-one)
MATCH (p:Products), (s:Suppliers)
WHERE p.supplier_id = s.supplier_id
MERGE (p)-[:SUPPLIED_BY]->(s);

// 11. ORDERS_FROM_SUPPLIER: Purchase_orders -> Suppliers (many-to-one)
MATCH (po:Purchase_orders), (s:Suppliers)
WHERE po.supplier_id = s.supplier_id
MERGE (po)-[:ORDERS_FROM_SUPPLIER]->(s);

// 12. RECEIVES_PURCHASE_ORDER: Receipts -> Purchase_orders (many-to-one)
MATCH (r:Receipts), (po:Purchase_orders)
WHERE r.po_id = po.po_id
MERGE (r)-[:RECEIVES_PURCHASE_ORDER]->(po);

// 13. RECEIVES_PRODUCT: Receipts -> Products (many-to-one)
MATCH (r:Receipts), (p:Products)
WHERE r.product_id = p.product_id
MERGE (r)-[:RECEIVES_PRODUCT]->(p);

// 14. RECEIVED_AT_WAREHOUSE: Receipts -> Warehouses (many-to-one)
MATCH (r:Receipts), (w:Warehouses)
WHERE r.warehouse_id = w.warehouse_id
MERGE (r)-[:RECEIVED_AT_WAREHOUSE]->(w);

// 15. STORES_INVENTORY: Inventory -> Warehouses (many-to-one)
MATCH (i:Inventory), (w:Warehouses)
WHERE i.warehouse_id = w.warehouse_id
MERGE (i)-[:STORES_INVENTORY]->(w);

// 16. INVENTORY_OF_PRODUCT: Inventory -> Products (many-to-one)
MATCH (i:Inventory), (p:Products)
WHERE i.product_id = p.product_id
MERGE (i)-[:INVENTORY_OF_PRODUCT]->(p);

// 17. ORIGINATES_FROM_WAREHOUSE: Routes -> Warehouses (many-to-one)
MATCH (r:Routes), (w:Warehouses)
WHERE r.origin_warehouse = w.warehouse_id
MERGE (r)-[:ORIGINATES_FROM_WAREHOUSE]->(w);

// ========================================
// VERIFICATION QUERIES
// ========================================
// Uncomment these to verify the relationships were created successfully

// Count all relationships
// MATCH ()-[r]->() RETURN type(r) as relationship_type, count(r) as count ORDER BY count DESC;

// Verify specific relationship counts
// MATCH (c:Customers)-[:PLACES_ORDER]->(o:Orders) RETURN count(*) as customer_orders;
// MATCH (o:Orders)-[:CONTAINS_ITEM]->(oi:Order_items) RETURN count(*) as order_items;
// MATCH (s:Shipments)-[:HANDLED_BY_CARRIER]->(c:Carriers) RETURN count(*) as shipment_carriers;

// Sample complex query to test the graph
// MATCH (c:Customers)-[:PLACES_ORDER]->(o:Orders)-[:CONTAINS_ITEM]->(oi:Order_items)-[:ITEM_OF_PRODUCT]->(p:Products)-[:SUPPLIED_BY]->(s:Suppliers)
// RETURN c.name as customer, o.order_id, p.name as product, s.name as supplier
// LIMIT 10;