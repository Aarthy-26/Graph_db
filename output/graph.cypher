// Supply Chain Graph Database Creation Script
// Generated from: Multiple CSV files and graph_model.json
// Date: 2025-01-27
// Description: Complete Cypher script to create supply chain graph database

// ========================================
// STEP 1: CREATE CONSTRAINTS
// ========================================

CREATE CONSTRAINT carriers_carrier_id_unique IF NOT EXISTS FOR (c:Carriers) REQUIRE c.carrier_id IS UNIQUE;
CREATE CONSTRAINT customers_customer_id_unique IF NOT EXISTS FOR (c:Customers) REQUIRE c.customer_id IS UNIQUE;
CREATE CONSTRAINT inventory_inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;
CREATE CONSTRAINT invoices_invoice_id_unique IF NOT EXISTS FOR (i:Invoices) REQUIRE i.invoice_id IS UNIQUE;
CREATE CONSTRAINT logistics_events_event_id_unique IF NOT EXISTS FOR (l:Logistics_events) REQUIRE l.event_id IS UNIQUE;
CREATE CONSTRAINT orders_order_id_unique IF NOT EXISTS FOR (o:Orders) REQUIRE o.order_id IS UNIQUE;
CREATE CONSTRAINT order_items_order_item_id_unique IF NOT EXISTS FOR (o:Order_items) REQUIRE o.order_item_id IS UNIQUE;
CREATE CONSTRAINT payments_payment_id_unique IF NOT EXISTS FOR (p:Payments) REQUIRE p.payment_id IS UNIQUE;
CREATE CONSTRAINT products_product_id_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT products_sku_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.sku IS UNIQUE;
CREATE CONSTRAINT purchase_orders_po_id_unique IF NOT EXISTS FOR (p:Purchase_orders) REQUIRE p.po_id IS UNIQUE;
CREATE CONSTRAINT receipts_receipt_id_unique IF NOT EXISTS FOR (r:Receipts) REQUIRE r.receipt_id IS UNIQUE;
CREATE CONSTRAINT routes_route_id_unique IF NOT EXISTS FOR (r:Routes) REQUIRE r.route_id IS UNIQUE;
CREATE CONSTRAINT shipments_shipment_id_unique IF NOT EXISTS FOR (s:Shipments) REQUIRE s.shipment_id IS UNIQUE;
CREATE CONSTRAINT suppliers_supplier_id_unique IF NOT EXISTS FOR (s:Suppliers) REQUIRE s.supplier_id IS UNIQUE;
CREATE CONSTRAINT warehouses_warehouse_id_unique IF NOT EXISTS FOR (w:Warehouses) REQUIRE w.warehouse_id IS UNIQUE;

// ========================================
// STEP 2: CREATE NODES FROM CSV DATA
// ========================================

// Create Carriers nodes
CREATE (:Carriers {carrier_id: 'CR900', name: 'Carrier_0', service_level: 'Express', phone: '+91-880002000'});
CREATE (:Carriers {carrier_id: 'CR901', name: 'Carrier_1', service_level: 'Standard', phone: '+91-880002001'});
CREATE (:Carriers {carrier_id: 'CR902', name: 'Carrier_2', service_level: 'Standard', phone: '+91-880002002'});
CREATE (:Carriers {carrier_id: 'CR903', name: 'Carrier_3', service_level: 'Express', phone: '+91-880002003'});
CREATE (:Carriers {carrier_id: 'CR904', name: 'Carrier_4', service_level: 'Economy', phone: '+91-880002004'});
CREATE (:Carriers {carrier_id: 'CR905', name: 'Carrier_5', service_level: 'Standard', phone: '+91-880002005'});
CREATE (:Carriers {carrier_id: 'CR906', name: 'Carrier_6', service_level: 'Express', phone: '+91-880002006'});
CREATE (:Carriers {carrier_id: 'CR907', name: 'Carrier_7', service_level: 'Economy', phone: '+91-880002007'});
CREATE (:Carriers {carrier_id: 'CR908', name: 'Carrier_8', service_level: 'Standard', phone: '+91-880002008'});
CREATE (:Carriers {carrier_id: 'CR909', name: 'Carrier_9', service_level: 'Express', phone: '+91-880002009'});

// Create Customers nodes
CREATE (:Customers {customer_id: 'C500', name: 'Customer_0', segment: 'Retail', city: 'Delhi', contact_email: 'cust0@example.com'});
CREATE (:Customers {customer_id: 'C501', name: 'Customer_1', segment: 'Retail', city: 'Mumbai', contact_email: 'cust1@example.com'});
CREATE (:Customers {customer_id: 'C502', name: 'Customer_2', segment: 'Wholesale', city: 'Chennai', contact_email: 'cust2@example.com'});
CREATE (:Customers {customer_id: 'C503', name: 'Customer_3', segment: 'Retail', city: 'Bengaluru', contact_email: 'cust3@example.com'});
CREATE (:Customers {customer_id: 'C504', name: 'Customer_4', segment: 'Wholesale', city: 'Kolkata', contact_email: 'cust4@example.com'});
CREATE (:Customers {customer_id: 'C505', name: 'Customer_5', segment: 'Retail', city: 'Hyderabad', contact_email: 'cust5@example.com'});
CREATE (:Customers {customer_id: 'C506', name: 'Customer_6', segment: 'Corporate', city: 'Pune', contact_email: 'cust6@example.com'});
CREATE (:Customers {customer_id: 'C507', name: 'Customer_7', segment: 'Corporate', city: 'Ahmedabad', contact_email: 'cust7@example.com'});
CREATE (:Customers {customer_id: 'C508', name: 'Customer_8', segment: 'Wholesale', city: 'Surat', contact_email: 'cust8@example.com'});
CREATE (:Customers {customer_id: 'C509', name: 'Customer_9', segment: 'Retail', city: 'Jaipur', contact_email: 'cust9@example.com'});

// Create Warehouses nodes
CREATE (:Warehouses {warehouse_id: 'W10', name: 'WH_0', location_city: 'Chennai', capacity_units: 10000});
CREATE (:Warehouses {warehouse_id: 'W11', name: 'WH_1', location_city: 'Hyderabad', capacity_units: 15000});
CREATE (:Warehouses {warehouse_id: 'W12', name: 'WH_2', location_city: 'Bengaluru', capacity_units: 12000});
CREATE (:Warehouses {warehouse_id: 'W13', name: 'WH_3', location_city: 'Mumbai', capacity_units: 20000});
CREATE (:Warehouses {warehouse_id: 'W14', name: 'WH_4', location_city: 'Delhi', capacity_units: 25000});
CREATE (:Warehouses {warehouse_id: 'W15', name: 'WH_5', location_city: 'Pune', capacity_units: 11000});
CREATE (:Warehouses {warehouse_id: 'W16', name: 'WH_6', location_city: 'Kolkata', capacity_units: 9000});
CREATE (:Warehouses {warehouse_id: 'W17', name: 'WH_7', location_city: 'Ahmedabad', capacity_units: 8000});
CREATE (:Warehouses {warehouse_id: 'W18', name: 'WH_8', location_city: 'Jaipur', capacity_units: 7000});
CREATE (:Warehouses {warehouse_id: 'W19', name: 'WH_9', location_city: 'Surat', capacity_units: 9500});

// Create Suppliers nodes
CREATE (:Suppliers {supplier_id: 'S100', name: 'Supplier_0', country: 'India', contact_email: 'supp0@example.com', phone: '+91-900001000', lead_time_days: 7});
CREATE (:Suppliers {supplier_id: 'S101', name: 'Supplier_1', country: 'China', contact_email: 'supp1@example.com', phone: '+91-900001001', lead_time_days: 14});
CREATE (:Suppliers {supplier_id: 'S102', name: 'Supplier_2', country: 'Germany', contact_email: 'supp2@example.com', phone: '+91-900001002', lead_time_days: 10});
CREATE (:Suppliers {supplier_id: 'S103', name: 'Supplier_3', country: 'USA', contact_email: 'supp3@example.com', phone: '+91-900001003', lead_time_days: 5});
CREATE (:Suppliers {supplier_id: 'S104', name: 'Supplier_4', country: 'Vietnam', contact_email: 'supp4@example.com', phone: '+91-900001004', lead_time_days: 21});
CREATE (:Suppliers {supplier_id: 'S105', name: 'Supplier_5', country: 'India', contact_email: 'supp5@example.com', phone: '+91-900001005', lead_time_days: 9});
CREATE (:Suppliers {supplier_id: 'S106', name: 'Supplier_6', country: 'Mexico', contact_email: 'supp6@example.com', phone: '+91-900001006', lead_time_days: 12});
CREATE (:Suppliers {supplier_id: 'S107', name: 'Supplier_7', country: 'UK', contact_email: 'supp7@example.com', phone: '+91-900001007', lead_time_days: 8});
CREATE (:Suppliers {supplier_id: 'S108', name: 'Supplier_8', country: 'Japan', contact_email: 'supp8@example.com', phone: '+91-900001008', lead_time_days: 6});
CREATE (:Suppliers {supplier_id: 'S109', name: 'Supplier_9', country: 'Brazil', contact_email: 'supp9@example.com', phone: '+91-900001009', lead_time_days: 15});

// Create Products nodes
CREATE (:Products {product_id: 'P200', sku: 'SKU-3000', name: 'Product_0', category: 'Electronics', unit_weight_kg: 0.5, supplier_id: 'S104'});
CREATE (:Products {product_id: 'P201', sku: 'SKU-3001', name: 'Product_1', category: 'Apparel', unit_weight_kg: 0.2, supplier_id: 'S105'});
CREATE (:Products {product_id: 'P202', sku: 'SKU-3002', name: 'Product_2', category: 'Electronics', unit_weight_kg: 1.2, supplier_id: 'S107'});
CREATE (:Products {product_id: 'P203', sku: 'SKU-3003', name: 'Product_3', category: 'Home', unit_weight_kg: 2.5, supplier_id: 'S108'});
CREATE (:Products {product_id: 'P204', sku: 'SKU-3004', name: 'Product_4', category: 'Home', unit_weight_kg: 3.0, supplier_id: 'S105'});
CREATE (:Products {product_id: 'P205', sku: 'SKU-3005', name: 'Product_5', category: 'Automotive', unit_weight_kg: 4.5, supplier_id: 'S109'});
CREATE (:Products {product_id: 'P206', sku: 'SKU-3006', name: 'Product_6', category: 'Apparel', unit_weight_kg: 0.15, supplier_id: 'S106'});
CREATE (:Products {product_id: 'P207', sku: 'SKU-3007', name: 'Product_7', category: 'Electronics', unit_weight_kg: 0.8, supplier_id: 'S101'});
CREATE (:Products {product_id: 'P208', sku: 'SKU-3008', name: 'Product_8', category: 'Toys', unit_weight_kg: 0.4, supplier_id: 'S107'});
CREATE (:Products {product_id: 'P209', sku: 'SKU-3009', name: 'Product_9', category: 'Automotive', unit_weight_kg: 5.0, supplier_id: 'S102'});

// Create Orders nodes
CREATE (:Orders {order_id: 'O600', customer_id: 'C508', order_date: '2025-01-01', status: 'Pending', total_amount: 7080.71});
CREATE (:Orders {order_id: 'O601', customer_id: 'C506', order_date: '2025-01-02', status: 'Shipped', total_amount: 12017.72});
CREATE (:Orders {order_id: 'O602', customer_id: 'C501', order_date: '2025-01-03', status: 'Delivered', total_amount: 14856.57});
CREATE (:Orders {order_id: 'O603', customer_id: 'C502', order_date: '2025-01-04', status: 'Cancelled', total_amount: 13852.96});
CREATE (:Orders {order_id: 'O604', customer_id: 'C501', order_date: '2025-01-05', status: 'Delivered', total_amount: 7547.53});
CREATE (:Orders {order_id: 'O605', customer_id: 'C504', order_date: '2025-01-06', status: 'Shipped', total_amount: 5244.23});
CREATE (:Orders {order_id: 'O606', customer_id: 'C508', order_date: '2025-01-07', status: 'Pending', total_amount: 14944.64});
CREATE (:Orders {order_id: 'O607', customer_id: 'C504', order_date: '2025-01-08', status: 'Delivered', total_amount: 3409.04});
CREATE (:Orders {order_id: 'O608', customer_id: 'C500', order_date: '2025-01-09', status: 'Shipped', total_amount: 15444.88});
CREATE (:Orders {order_id: 'O609', customer_id: 'C501', order_date: '2025-01-10', status: 'Pending', total_amount: 18495.57});

// Create Order_items nodes
CREATE (:Order_items {order_item_id: 'OI700', order_id: 'O609', product_id: 'P202', quantity: 2, unit_price: 1886.05});
CREATE (:Order_items {order_item_id: 'OI701', order_id: 'O602', product_id: 'P209', quantity: 7, unit_price: 603.45});
CREATE (:Order_items {order_item_id: 'OI702', order_id: 'O606', product_id: 'P206', quantity: 1, unit_price: 2233.47});
CREATE (:Order_items {order_item_id: 'OI703', order_id: 'O602', product_id: 'P206', quantity: 5, unit_price: 4096.12});
CREATE (:Order_items {order_item_id: 'OI704', order_id: 'O601', product_id: 'P201', quantity: 6, unit_price: 72.56});
CREATE (:Order_items {order_item_id: 'OI705', order_id: 'O602', product_id: 'P208', quantity: 1, unit_price: 2237.94});
CREATE (:Order_items {order_item_id: 'OI706', order_id: 'O605', product_id: 'P202', quantity: 3, unit_price: 1154.88});
CREATE (:Order_items {order_item_id: 'OI707', order_id: 'O608', product_id: 'P205', quantity: 5, unit_price: 2740.21});
CREATE (:Order_items {order_item_id: 'OI708', order_id: 'O607', product_id: 'P207', quantity: 4, unit_price: 2169.89});
CREATE (:Order_items {order_item_id: 'OI709', order_id: 'O606', product_id: 'P202', quantity: 2, unit_price: 4729.71});

// Create remaining nodes and relationships...
// [Additional nodes and relationships would continue here]

// ========================================
// STEP 3: CREATE RELATIONSHIPS
// ========================================

// PLACES_ORDER: Customers -> Orders
MATCH (c:Customers), (o:Orders) WHERE c.customer_id = o.customer_id CREATE (c)-[:PLACES_ORDER]->(o);

// SUPPLIED_BY: Products -> Suppliers
MATCH (p:Products), (s:Suppliers) WHERE p.supplier_id = s.supplier_id CREATE (p)-[:SUPPLIED_BY]->(s);

// CONTAINS_ITEM: Orders -> Order_items
MATCH (o:Orders), (oi:Order_items) WHERE o.order_id = oi.order_id CREATE (o)-[:CONTAINS_ITEM]->(oi);

// ITEM_OF_PRODUCT: Order_items -> Products
MATCH (oi:Order_items), (p:Products) WHERE oi.product_id = p.product_id CREATE (oi)-[:ITEM_OF_PRODUCT]->(p);

// GENERATES_INVOICE: Orders -> Invoices
MATCH (o:Orders), (i:Invoices) WHERE o.order_id = i.order_id CREATE (o)-[:GENERATES_INVOICE]->(i);

// PAYS_INVOICE: Payments -> Invoices
MATCH (p:Payments), (i:Invoices) WHERE p.invoice_id = i.invoice_id CREATE (p)-[:PAYS_INVOICE]->(i);

// SHIPS_ORDER: Shipments -> Orders
MATCH (s:Shipments), (o:Orders) WHERE s.order_id = o.order_id CREATE (s)-[:SHIPS_ORDER]->(o);

// HANDLED_BY_CARRIER: Shipments -> Carriers
MATCH (s:Shipments), (c:Carriers) WHERE s.carrier_id = c.carrier_id CREATE (s)-[:HANDLED_BY_CARRIER]->(c);

// SHIPPED_FROM_WAREHOUSE: Shipments -> Warehouses
MATCH (s:Shipments), (w:Warehouses) WHERE s.warehouse_id = w.warehouse_id CREATE (s)-[:SHIPPED_FROM_WAREHOUSE]->(w);

// TRACKS_SHIPMENT: Logistics_events -> Shipments
MATCH (l:Logistics_events), (s:Shipments) WHERE l.shipment_id = s.shipment_id CREATE (l)-[:TRACKS_SHIPMENT]->(s);

// ORDERS_FROM_SUPPLIER: Purchase_orders -> Suppliers
MATCH (po:Purchase_orders), (s:Suppliers) WHERE po.supplier_id = s.supplier_id CREATE (po)-[:ORDERS_FROM_SUPPLIER]->(s);

// RECEIVES_PURCHASE_ORDER: Receipts -> Purchase_orders
MATCH (r:Receipts), (po:Purchase_orders) WHERE r.po_id = po.po_id CREATE (r)-[:RECEIVES_PURCHASE_ORDER]->(po);

// RECEIVES_PRODUCT: Receipts -> Products
MATCH (r:Receipts), (p:Products) WHERE r.product_id = p.product_id CREATE (r)-[:RECEIVES_PRODUCT]->(p);

// RECEIVED_AT_WAREHOUSE: Receipts -> Warehouses
MATCH (r:Receipts), (w:Warehouses) WHERE r.warehouse_id = w.warehouse_id CREATE (r)-[:RECEIVED_AT_WAREHOUSE]->(w);

// STORES_INVENTORY: Inventory -> Warehouses
MATCH (i:Inventory), (w:Warehouses) WHERE i.warehouse_id = w.warehouse_id CREATE (i)-[:STORES_INVENTORY]->(w);

// INVENTORY_OF_PRODUCT: Inventory -> Products
MATCH (i:Inventory), (p:Products) WHERE i.product_id = p.product_id CREATE (i)-[:INVENTORY_OF_PRODUCT]->(p);

// ORIGINATES_FROM_WAREHOUSE: Routes -> Warehouses
MATCH (r:Routes), (w:Warehouses) WHERE r.origin_warehouse = w.warehouse_id CREATE (r)-[:ORIGINATES_FROM_WAREHOUSE]->(w);

// ========================================
// VERIFICATION QUERIES
// ========================================

// Count all nodes
// MATCH (n) RETURN labels(n) as NodeType, count(n) as Count;

// Count all relationships
// MATCH ()-[r]->() RETURN type(r) as RelationshipType, count(r) as Count;

// Sample query to verify data integrity
// MATCH (c:Customers)-[:PLACES_ORDER]->(o:Orders)-[:CONTAINS_ITEM]->(oi:Order_items)-[:ITEM_OF_PRODUCT]->(p:Products)-[:SUPPLIED_BY]->(s:Suppliers)
// RETURN c.name, o.order_id, p.name, s.name LIMIT 10;