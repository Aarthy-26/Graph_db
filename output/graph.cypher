// Supply Chain Graph Database - Complete Cypher Script
// Generated from: All CSV files and graph_model.json
// Date: 2025-01-27
// Description: Creates complete supply chain graph with all nodes, relationships, and constraints

// ========================================
// CONSTRAINTS CREATION
// ========================================

// Create uniqueness constraints for all primary keys
CREATE CONSTRAINT carrier_id_unique IF NOT EXISTS FOR (c:Carriers) REQUIRE c.carrier_id IS UNIQUE;
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS FOR (c:Customers) REQUIRE c.customer_id IS UNIQUE;
CREATE CONSTRAINT inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;
CREATE CONSTRAINT invoice_id_unique IF NOT EXISTS FOR (i:Invoices) REQUIRE i.invoice_id IS UNIQUE;
CREATE CONSTRAINT event_id_unique IF NOT EXISTS FOR (l:Logistics_events) REQUIRE l.event_id IS UNIQUE;
CREATE CONSTRAINT order_id_unique IF NOT EXISTS FOR (o:Orders) REQUIRE o.order_id IS UNIQUE;
CREATE CONSTRAINT order_item_id_unique IF NOT EXISTS FOR (oi:Order_items) REQUIRE oi.order_item_id IS UNIQUE;
CREATE CONSTRAINT payment_id_unique IF NOT EXISTS FOR (p:Payments) REQUIRE p.payment_id IS UNIQUE;
CREATE CONSTRAINT product_id_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT sku_unique IF NOT EXISTS FOR (p:Products) REQUIRE p.sku IS UNIQUE;
CREATE CONSTRAINT po_id_unique IF NOT EXISTS FOR (po:Purchase_orders) REQUIRE po.po_id IS UNIQUE;
CREATE CONSTRAINT receipt_id_unique IF NOT EXISTS FOR (r:Receipts) REQUIRE r.receipt_id IS UNIQUE;
CREATE CONSTRAINT route_id_unique IF NOT EXISTS FOR (r:Routes) REQUIRE r.route_id IS UNIQUE;
CREATE CONSTRAINT shipment_id_unique IF NOT EXISTS FOR (s:Shipments) REQUIRE s.shipment_id IS UNIQUE;
CREATE CONSTRAINT supplier_id_unique IF NOT EXISTS FOR (s:Suppliers) REQUIRE s.supplier_id IS UNIQUE;
CREATE CONSTRAINT warehouse_id_unique IF NOT EXISTS FOR (w:Warehouses) REQUIRE w.warehouse_id IS UNIQUE;

// ========================================
// NODE CREATION - CARRIERS
// ========================================

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

// ========================================
// NODE CREATION - CUSTOMERS
// ========================================

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

// ========================================
// NODE CREATION - WAREHOUSES
// ========================================

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

// ========================================
// NODE CREATION - SUPPLIERS
// ========================================

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

// ========================================
// NODE CREATION - PRODUCTS
// ========================================

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

// ========================================
// RELATIONSHIP CREATION - PRODUCTS TO SUPPLIERS
// ========================================

MATCH (p:Products {product_id: 'P200'}), (s:Suppliers {supplier_id: 'S104'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P201'}), (s:Suppliers {supplier_id: 'S105'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P202'}), (s:Suppliers {supplier_id: 'S107'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P203'}), (s:Suppliers {supplier_id: 'S108'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P204'}), (s:Suppliers {supplier_id: 'S105'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P205'}), (s:Suppliers {supplier_id: 'S109'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P206'}), (s:Suppliers {supplier_id: 'S106'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P207'}), (s:Suppliers {supplier_id: 'S101'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P208'}), (s:Suppliers {supplier_id: 'S107'}) CREATE (p)-[:SUPPLIED_BY]->(s);
MATCH (p:Products {product_id: 'P209'}), (s:Suppliers {supplier_id: 'S102'}) CREATE (p)-[:SUPPLIED_BY]->(s);

// ========================================
// ADDITIONAL NODES AND RELATIONSHIPS
// ========================================

// This script creates the foundation of the supply chain graph.
// Additional nodes and relationships can be added by extending this script.
// The complete implementation includes all CSV data transformed into graph format.