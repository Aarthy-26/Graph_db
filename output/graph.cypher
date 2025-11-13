// ===============================================
// SUPPLY CHAIN GRAPH DATABASE - CYPHER QUERIES
// Generated from repository: Aarthy-26/Graph_db
// ===============================================

// ===============================================
// CONSTRAINTS
// ===============================================

CREATE CONSTRAINT carrier_id_unique IF NOT EXISTS FOR (c:Carrier) REQUIRE c.carrier_id IS UNIQUE;
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS FOR (c:Customer) REQUIRE c.customer_id IS UNIQUE;
CREATE CONSTRAINT product_id_unique IF NOT EXISTS FOR (p:Product) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT product_sku_unique IF NOT EXISTS FOR (p:Product) REQUIRE p.sku IS UNIQUE;
CREATE CONSTRAINT warehouse_id_unique IF NOT EXISTS FOR (w:Warehouse) REQUIRE w.warehouse_id IS UNIQUE;
CREATE CONSTRAINT supplier_id_unique IF NOT EXISTS FOR (s:Supplier) REQUIRE s.supplier_id IS UNIQUE;
CREATE CONSTRAINT order_id_unique IF NOT EXISTS FOR (o:Order) REQUIRE o.order_id IS UNIQUE;
CREATE CONSTRAINT order_item_id_unique IF NOT EXISTS FOR (oi:OrderItem) REQUIRE oi.order_item_id IS UNIQUE;
CREATE CONSTRAINT invoice_id_unique IF NOT EXISTS FOR (i:Invoice) REQUIRE i.invoice_id IS UNIQUE;
CREATE CONSTRAINT payment_id_unique IF NOT EXISTS FOR (p:Payment) REQUIRE p.payment_id IS UNIQUE;
CREATE CONSTRAINT shipment_id_unique IF NOT EXISTS FOR (s:Shipment) REQUIRE s.shipment_id IS UNIQUE;
CREATE CONSTRAINT inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;
CREATE CONSTRAINT po_id_unique IF NOT EXISTS FOR (po:PurchaseOrder) REQUIRE po.po_id IS UNIQUE;
CREATE CONSTRAINT receipt_id_unique IF NOT EXISTS FOR (r:Receipt) REQUIRE r.receipt_id IS UNIQUE;
CREATE CONSTRAINT route_id_unique IF NOT EXISTS FOR (r:Route) REQUIRE r.route_id IS UNIQUE;
CREATE CONSTRAINT event_id_unique IF NOT EXISTS FOR (e:LogisticsEvent) REQUIRE e.event_id IS UNIQUE;

// ===============================================
// INDEXES
// ===============================================

CREATE INDEX carrier_service_level_idx IF NOT EXISTS FOR (c:Carrier) ON (c.service_level);
CREATE INDEX customer_segment_idx IF NOT EXISTS FOR (c:Customer) ON (c.segment);
CREATE INDEX customer_city_idx IF NOT EXISTS FOR (c:Customer) ON (c.city);
CREATE INDEX product_category_idx IF NOT EXISTS FOR (p:Product) ON (p.category);
CREATE INDEX warehouse_city_idx IF NOT EXISTS FOR (w:Warehouse) ON (w.location_city);
CREATE INDEX supplier_country_idx IF NOT EXISTS FOR (s:Supplier) ON (s.country);
CREATE INDEX order_status_idx IF NOT EXISTS FOR (o:Order) ON (o.status);
CREATE INDEX order_date_idx IF NOT EXISTS FOR (o:Order) ON (o.order_date);
CREATE INDEX invoice_status_idx IF NOT EXISTS FOR (i:Invoice) ON (i.status);
CREATE INDEX payment_method_idx IF NOT EXISTS FOR (p:Payment) ON (p.method);
CREATE INDEX event_type_idx IF NOT EXISTS FOR (e:LogisticsEvent) ON (e.event_type);

// ===============================================
// NODES CREATION
// ===============================================

// Carriers
CREATE (:Carrier {carrier_id: 'CR900', name: 'Carrier_0', service_level: 'Express', phone: '+91-880002000'});
CREATE (:Carrier {carrier_id: 'CR901', name: 'Carrier_1', service_level: 'Standard', phone: '+91-880002001'});
CREATE (:Carrier {carrier_id: 'CR902', name: 'Carrier_2', service_level: 'Standard', phone: '+91-880002002'});
CREATE (:Carrier {carrier_id: 'CR903', name: 'Carrier_3', service_level: 'Express', phone: '+91-880002003'});
CREATE (:Carrier {carrier_id: 'CR904', name: 'Carrier_4', service_level: 'Economy', phone: '+91-880002004'});
CREATE (:Carrier {carrier_id: 'CR905', name: 'Carrier_5', service_level: 'Standard', phone: '+91-880002005'});
CREATE (:Carrier {carrier_id: 'CR906', name: 'Carrier_6', service_level: 'Express', phone: '+91-880002006'});
CREATE (:Carrier {carrier_id: 'CR907', name: 'Carrier_7', service_level: 'Economy', phone: '+91-880002007'});
CREATE (:Carrier {carrier_id: 'CR908', name: 'Carrier_8', service_level: 'Standard', phone: '+91-880002008'});
CREATE (:Carrier {carrier_id: 'CR909', name: 'Carrier_9', service_level: 'Express', phone: '+91-880002009'});

// Customers
CREATE (:Customer {customer_id: 'C500', name: 'Customer_0', segment: 'Retail', city: 'Delhi', contact_email: 'cust0@example.com'});
CREATE (:Customer {customer_id: 'C501', name: 'Customer_1', segment: 'Retail', city: 'Mumbai', contact_email: 'cust1@example.com'});
CREATE (:Customer {customer_id: 'C502', name: 'Customer_2', segment: 'Wholesale', city: 'Chennai', contact_email: 'cust2@example.com'});
CREATE (:Customer {customer_id: 'C503', name: 'Customer_3', segment: 'Retail', city: 'Bengaluru', contact_email: 'cust3@example.com'});
CREATE (:Customer {customer_id: 'C504', name: 'Customer_4', segment: 'Wholesale', city: 'Kolkata', contact_email: 'cust4@example.com'});
CREATE (:Customer {customer_id: 'C505', name: 'Customer_5', segment: 'Retail', city: 'Hyderabad', contact_email: 'cust5@example.com'});
CREATE (:Customer {customer_id: 'C506', name: 'Customer_6', segment: 'Corporate', city: 'Pune', contact_email: 'cust6@example.com'});
CREATE (:Customer {customer_id: 'C507', name: 'Customer_7', segment: 'Corporate', city: 'Ahmedabad', contact_email: 'cust7@example.com'});
CREATE (:Customer {customer_id: 'C508', name: 'Customer_8', segment: 'Wholesale', city: 'Surat', contact_email: 'cust8@example.com'});
CREATE (:Customer {customer_id: 'C509', name: 'Customer_9', segment: 'Retail', city: 'Jaipur', contact_email: 'cust9@example.com'});

// Products
CREATE (:Product {product_id: 'P200', sku: 'SKU-3000', name: 'Product_0', category: 'Electronics', unit_weight_kg: 0.5});
CREATE (:Product {product_id: 'P201', sku: 'SKU-3001', name: 'Product_1', category: 'Apparel', unit_weight_kg: 0.2});
CREATE (:Product {product_id: 'P202', sku: 'SKU-3002', name: 'Product_2', category: 'Electronics', unit_weight_kg: 1.2});
CREATE (:Product {product_id: 'P203', sku: 'SKU-3003', name: 'Product_3', category: 'Home', unit_weight_kg: 2.5});
CREATE (:Product {product_id: 'P204', sku: 'SKU-3004', name: 'Product_4', category: 'Home', unit_weight_kg: 3.0});
CREATE (:Product {product_id: 'P205', sku: 'SKU-3005', name: 'Product_5', category: 'Automotive', unit_weight_kg: 4.5});
CREATE (:Product {product_id: 'P206', sku: 'SKU-3006', name: 'Product_6', category: 'Apparel', unit_weight_kg: 0.15});
CREATE (:Product {product_id: 'P207', sku: 'SKU-3007', name: 'Product_7', category: 'Electronics', unit_weight_kg: 0.8});
CREATE (:Product {product_id: 'P208', sku: 'SKU-3008', name: 'Product_8', category: 'Toys', unit_weight_kg: 0.4});
CREATE (:Product {product_id: 'P209', sku: 'SKU-3009', name: 'Product_9', category: 'Automotive', unit_weight_kg: 5.0});

// Warehouses
CREATE (:Warehouse {warehouse_id: 'W10', name: 'WH_0', location_city: 'Chennai', capacity_units: 10000});
CREATE (:Warehouse {warehouse_id: 'W11', name: 'WH_1', location_city: 'Hyderabad', capacity_units: 15000});
CREATE (:Warehouse {warehouse_id: 'W12', name: 'WH_2', location_city: 'Bengaluru', capacity_units: 12000});
CREATE (:Warehouse {warehouse_id: 'W13', name: 'WH_3', location_city: 'Mumbai', capacity_units: 20000});
CREATE (:Warehouse {warehouse_id: 'W14', name: 'WH_4', location_city: 'Delhi', capacity_units: 25000});
CREATE (:Warehouse {warehouse_id: 'W15', name: 'WH_5', location_city: 'Pune', capacity_units: 11000});
CREATE (:Warehouse {warehouse_id: 'W16', name: 'WH_6', location_city: 'Kolkata', capacity_units: 9000});
CREATE (:Warehouse {warehouse_id: 'W17', name: 'WH_7', location_city: 'Ahmedabad', capacity_units: 8000});
CREATE (:Warehouse {warehouse_id: 'W18', name: 'WH_8', location_city: 'Jaipur', capacity_units: 7000});
CREATE (:Warehouse {warehouse_id: 'W19', name: 'WH_9', location_city: 'Surat', capacity_units: 9500});

// Suppliers
CREATE (:Supplier {supplier_id: 'S100', name: 'Supplier_0', country: 'India', contact_email: 'supp0@example.com', phone: '+91-900001000', lead_time_days: 7});
CREATE (:Supplier {supplier_id: 'S101', name: 'Supplier_1', country: 'China', contact_email: 'supp1@example.com', phone: '+91-900001001', lead_time_days: 14});
CREATE (:Supplier {supplier_id: 'S102', name: 'Supplier_2', country: 'Germany', contact_email: 'supp2@example.com', phone: '+91-900001002', lead_time_days: 10});
CREATE (:Supplier {supplier_id: 'S103', name: 'Supplier_3', country: 'USA', contact_email: 'supp3@example.com', phone: '+91-900001003', lead_time_days: 5});
CREATE (:Supplier {supplier_id: 'S104', name: 'Supplier_4', country: 'Vietnam', contact_email: 'supp4@example.com', phone: '+91-900001004', lead_time_days: 21});
CREATE (:Supplier {supplier_id: 'S105', name: 'Supplier_5', country: 'India', contact_email: 'supp5@example.com', phone: '+91-900001005', lead_time_days: 9});
CREATE (:Supplier {supplier_id: 'S106', name: 'Supplier_6', country: 'Mexico', contact_email: 'supp6@example.com', phone: '+91-900001006', lead_time_days: 12});
CREATE (:Supplier {supplier_id: 'S107', name: 'Supplier_7', country: 'UK', contact_email: 'supp7@example.com', phone: '+91-900001007', lead_time_days: 8});
CREATE (:Supplier {supplier_id: 'S108', name: 'Supplier_8', country: 'Japan', contact_email: 'supp8@example.com', phone: '+91-900001008', lead_time_days: 6});
CREATE (:Supplier {supplier_id: 'S109', name: 'Supplier_9', country: 'Brazil', contact_email: 'supp9@example.com', phone: '+91-900001009', lead_time_days: 15});

// Orders
CREATE (:Order {order_id: 'O600', order_date: date('2025-01-01'), status: 'Pending', total_amount: 7080.71});
CREATE (:Order {order_id: 'O601', order_date: date('2025-01-02'), status: 'Shipped', total_amount: 12017.72});
CREATE (:Order {order_id: 'O602', order_date: date('2025-01-03'), status: 'Delivered', total_amount: 14856.57});
CREATE (:Order {order_id: 'O603', order_date: date('2025-01-04'), status: 'Cancelled', total_amount: 13852.96});
CREATE (:Order {order_id: 'O604', order_date: date('2025-01-05'), status: 'Delivered', total_amount: 7547.53});
CREATE (:Order {order_id: 'O605', order_date: date('2025-01-06'), status: 'Shipped', total_amount: 5244.23});
CREATE (:Order {order_id: 'O606', order_date: date('2025-01-07'), status: 'Pending', total_amount: 14944.64});
CREATE (:Order {order_id: 'O607', order_date: date('2025-01-08'), status: 'Delivered', total_amount: 3409.04});
CREATE (:Order {order_id: 'O608', order_date: date('2025-01-09'), status: 'Shipped', total_amount: 15444.88});
CREATE (:Order {order_id: 'O609', order_date: date('2025-01-10'), status: 'Pending', total_amount: 18495.57});

// OrderItems
CREATE (:OrderItem {order_item_id: 'OI700', quantity: 2, unit_price: 1886.05});
CREATE (:OrderItem {order_item_id: 'OI701', quantity: 7, unit_price: 603.45});
CREATE (:OrderItem {order_item_id: 'OI702', quantity: 1, unit_price: 2233.47});
CREATE (:OrderItem {order_item_id: 'OI703', quantity: 5, unit_price: 4096.12});
CREATE (:OrderItem {order_item_id: 'OI704', quantity: 6, unit_price: 72.56});
CREATE (:OrderItem {order_item_id: 'OI705', quantity: 1, unit_price: 2237.94});
CREATE (:OrderItem {order_item_id: 'OI706', quantity: 3, unit_price: 1154.88});
CREATE (:OrderItem {order_item_id: 'OI707', quantity: 5, unit_price: 2740.21});
CREATE (:OrderItem {order_item_id: 'OI708', quantity: 4, unit_price: 2169.89});
CREATE (:OrderItem {order_item_id: 'OI709', quantity: 2, unit_price: 4729.71});

// ===============================================
// RELATIONSHIPS
// ===============================================

// Customer-Order Relationships
MATCH (c:Customer {customer_id: 'C508'}), (o:Order {order_id: 'O600'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C506'}), (o:Order {order_id: 'O601'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C501'}), (o:Order {order_id: 'O602'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C502'}), (o:Order {order_id: 'O603'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C501'}), (o:Order {order_id: 'O604'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C504'}), (o:Order {order_id: 'O605'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C508'}), (o:Order {order_id: 'O606'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C504'}), (o:Order {order_id: 'O607'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C500'}), (o:Order {order_id: 'O608'}) CREATE (c)-[:PLACES]->(o);
MATCH (c:Customer {customer_id: 'C501'}), (o:Order {order_id: 'O609'}) CREATE (c)-[:PLACES]->(o);

// Order-OrderItem Relationships
MATCH (o:Order {order_id: 'O609'}), (oi:OrderItem {order_item_id: 'OI700'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O602'}), (oi:OrderItem {order_item_id: 'OI701'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O606'}), (oi:OrderItem {order_item_id: 'OI702'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O602'}), (oi:OrderItem {order_item_id: 'OI703'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O601'}), (oi:OrderItem {order_item_id: 'OI704'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O602'}), (oi:OrderItem {order_item_id: 'OI705'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O605'}), (oi:OrderItem {order_item_id: 'OI706'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O608'}), (oi:OrderItem {order_item_id: 'OI707'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O607'}), (oi:OrderItem {order_item_id: 'OI708'}) CREATE (o)-[:CONTAINS]->(oi);
MATCH (o:Order {order_id: 'O606'}), (oi:OrderItem {order_item_id: 'OI709'}) CREATE (o)-[:CONTAINS]->(oi);

// OrderItem-Product Relationships
MATCH (oi:OrderItem {order_item_id: 'OI700'}), (p:Product {product_id: 'P202'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI701'}), (p:Product {product_id: 'P209'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI702'}), (p:Product {product_id: 'P206'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI703'}), (p:Product {product_id: 'P206'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI704'}), (p:Product {product_id: 'P201'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI705'}), (p:Product {product_id: 'P208'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI706'}), (p:Product {product_id: 'P202'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI707'}), (p:Product {product_id: 'P205'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI708'}), (p:Product {product_id: 'P207'}) CREATE (oi)-[:REFERENCES]->(p);
MATCH (oi:OrderItem {order_item_id: 'OI709'}), (p:Product {product_id: 'P202'}) CREATE (oi)-[:REFERENCES]->(p);

// Product-Supplier Relationships
MATCH (p:Product {product_id: 'P200'}), (s:Supplier {supplier_id: 'S104'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P201'}), (s:Supplier {supplier_id: 'S105'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P202'}), (s:Supplier {supplier_id: 'S107'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P203'}), (s:Supplier {supplier_id: 'S108'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P204'}), (s:Supplier {supplier_id: 'S105'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P205'}), (s:Supplier {supplier_id: 'S109'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P206'}), (s:Supplier {supplier_id: 'S106'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P207'}), (s:Supplier {supplier_id: 'S101'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P208'}), (s:Supplier {supplier_id: 'S107'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Product {product_id: 'P209'}), (s:Supplier {supplier_id: 'S102'}) CREATE (p)-[:SUPPLIED_BY]->(s);

// ===============================================
// END OF CYPHER QUERIES
// ===============================================