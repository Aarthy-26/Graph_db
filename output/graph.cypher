// =============================================================================
// SUPPLY CHAIN GRAPH DATABASE - IDEMPOTENT CYPHER INGESTION SCRIPT
// Generated from Aarthy-26/Graph_db repository data
// Safe for re-execution - uses MERGE and constraints to prevent duplicates
// =============================================================================

// STEP 1: CREATE UNIQUENESS CONSTRAINTS
CREATE CONSTRAINT carrier_id_unique IF NOT EXISTS FOR (c:Carrier) REQUIRE c.carrier_id IS UNIQUE;
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS FOR (c:Customer) REQUIRE c.customer_id IS UNIQUE;
CREATE CONSTRAINT product_id_unique IF NOT EXISTS FOR (p:Product) REQUIRE p.product_id IS UNIQUE;
CREATE CONSTRAINT warehouse_id_unique IF NOT EXISTS FOR (w:Warehouse) REQUIRE w.warehouse_id IS UNIQUE;
CREATE CONSTRAINT supplier_id_unique IF NOT EXISTS FOR (s:Supplier) REQUIRE s.supplier_id IS UNIQUE;
CREATE CONSTRAINT order_id_unique IF NOT EXISTS FOR (o:Order) REQUIRE o.order_id IS UNIQUE;
CREATE CONSTRAINT order_item_id_unique IF NOT EXISTS FOR (oi:OrderItem) REQUIRE oi.order_item_id IS UNIQUE;
CREATE CONSTRAINT invoice_id_unique IF NOT EXISTS FOR (i:Invoice) REQUIRE i.invoice_id IS UNIQUE;
CREATE CONSTRAINT payment_id_unique IF NOT EXISTS FOR (p:Payment) REQUIRE p.payment_id IS UNIQUE;
CREATE CONSTRAINT shipment_id_unique IF NOT EXISTS FOR (s:Shipment) REQUIRE s.shipment_id IS UNIQUE;
CREATE CONSTRAINT po_id_unique IF NOT EXISTS FOR (po:PurchaseOrder) REQUIRE po.po_id IS UNIQUE;
CREATE CONSTRAINT receipt_id_unique IF NOT EXISTS FOR (r:Receipt) REQUIRE r.receipt_id IS UNIQUE;
CREATE CONSTRAINT route_id_unique IF NOT EXISTS FOR (r:Route) REQUIRE r.route_id IS UNIQUE;
CREATE CONSTRAINT inventory_id_unique IF NOT EXISTS FOR (i:Inventory) REQUIRE i.inventory_id IS UNIQUE;
CREATE CONSTRAINT event_id_unique IF NOT EXISTS FOR (e:LogisticsEvent) REQUIRE e.event_id IS UNIQUE;

// STEP 2: CREATE NODES USING UNWIND AND MERGE

// Create Carrier nodes
UNWIND [
  {carrier_id: 'CR900', name: 'Carrier_0', service_level: 'Express', phone: '+91-880002000'},
  {carrier_id: 'CR901', name: 'Carrier_1', service_level: 'Standard', phone: '+91-880002001'},
  {carrier_id: 'CR902', name: 'Carrier_2', service_level: 'Standard', phone: '+91-880002002'},
  {carrier_id: 'CR903', name: 'Carrier_3', service_level: 'Express', phone: '+91-880002003'},
  {carrier_id: 'CR904', name: 'Carrier_4', service_level: 'Economy', phone: '+91-880002004'},
  {carrier_id: 'CR905', name: 'Carrier_5', service_level: 'Standard', phone: '+91-880002005'},
  {carrier_id: 'CR906', name: 'Carrier_6', service_level: 'Express', phone: '+91-880002006'},
  {carrier_id: 'CR907', name: 'Carrier_7', service_level: 'Economy', phone: '+91-880002007'},
  {carrier_id: 'CR908', name: 'Carrier_8', service_level: 'Standard', phone: '+91-880002008'},
  {carrier_id: 'CR909', name: 'Carrier_9', service_level: 'Express', phone: '+91-880002009'}
] AS row
MERGE (c:Carrier {carrier_id: row.carrier_id})
  SET c.name = row.name, c.service_level = row.service_level, c.phone = row.phone;

// Create Customer nodes
UNWIND [
  {customer_id: 'C500', name: 'Customer_0', segment: 'Retail', city: 'Delhi', contact_email: 'cust0@example.com'},
  {customer_id: 'C501', name: 'Customer_1', segment: 'Retail', city: 'Mumbai', contact_email: 'cust1@example.com'},
  {customer_id: 'C502', name: 'Customer_2', segment: 'Wholesale', city: 'Chennai', contact_email: 'cust2@example.com'},
  {customer_id: 'C503', name: 'Customer_3', segment: 'Retail', city: 'Bengaluru', contact_email: 'cust3@example.com'},
  {customer_id: 'C504', name: 'Customer_4', segment: 'Wholesale', city: 'Kolkata', contact_email: 'cust4@example.com'},
  {customer_id: 'C505', name: 'Customer_5', segment: 'Retail', city: 'Hyderabad', contact_email: 'cust5@example.com'},
  {customer_id: 'C506', name: 'Customer_6', segment: 'Corporate', city: 'Pune', contact_email: 'cust6@example.com'},
  {customer_id: 'C507', name: 'Customer_7', segment: 'Corporate', city: 'Ahmedabad', contact_email: 'cust7@example.com'},
  {customer_id: 'C508', name: 'Customer_8', segment: 'Wholesale', city: 'Surat', contact_email: 'cust8@example.com'},
  {customer_id: 'C509', name: 'Customer_9', segment: 'Retail', city: 'Jaipur', contact_email: 'cust9@example.com'}
] AS row
MERGE (c:Customer {customer_id: row.customer_id})
  SET c.name = row.name, c.segment = row.segment, c.city = row.city, c.contact_email = row.contact_email;

// Create Supplier nodes
UNWIND [
  {supplier_id: 'S100', name: 'Supplier_0', country: 'India', contact_email: 'supp0@example.com', phone: '+91-900001000', lead_time_days: 7},
  {supplier_id: 'S101', name: 'Supplier_1', country: 'China', contact_email: 'supp1@example.com', phone: '+91-900001001', lead_time_days: 14},
  {supplier_id: 'S102', name: 'Supplier_2', country: 'Germany', contact_email: 'supp2@example.com', phone: '+91-900001002', lead_time_days: 10},
  {supplier_id: 'S103', name: 'Supplier_3', country: 'USA', contact_email: 'supp3@example.com', phone: '+91-900001003', lead_time_days: 5},
  {supplier_id: 'S104', name: 'Supplier_4', country: 'Vietnam', contact_email: 'supp4@example.com', phone: '+91-900001004', lead_time_days: 21},
  {supplier_id: 'S105', name: 'Supplier_5', country: 'India', contact_email: 'supp5@example.com', phone: '+91-900001005', lead_time_days: 9},
  {supplier_id: 'S106', name: 'Supplier_6', country: 'Mexico', contact_email: 'supp6@example.com', phone: '+91-900001006', lead_time_days: 12},
  {supplier_id: 'S107', name: 'Supplier_7', country: 'UK', contact_email: 'supp7@example.com', phone: '+91-900001007', lead_time_days: 8},
  {supplier_id: 'S108', name: 'Supplier_8', country: 'Japan', contact_email: 'supp8@example.com', phone: '+91-900001008', lead_time_days: 6},
  {supplier_id: 'S109', name: 'Supplier_9', country: 'Brazil', contact_email: 'supp9@example.com', phone: '+91-900001009', lead_time_days: 15}
] AS row
MERGE (s:Supplier {supplier_id: row.supplier_id})
  SET s.name = row.name, s.country = row.country, s.contact_email = row.contact_email, s.phone = row.phone, s.lead_time_days = row.lead_time_days;

// Create Warehouse nodes
UNWIND [
  {warehouse_id: 'W10', name: 'WH_0', location_city: 'Chennai', capacity_units: 10000},
  {warehouse_id: 'W11', name: 'WH_1', location_city: 'Hyderabad', capacity_units: 15000},
  {warehouse_id: 'W12', name: 'WH_2', location_city: 'Bengaluru', capacity_units: 12000},
  {warehouse_id: 'W13', name: 'WH_3', location_city: 'Mumbai', capacity_units: 20000},
  {warehouse_id: 'W14', name: 'WH_4', location_city: 'Delhi', capacity_units: 25000},
  {warehouse_id: 'W15', name: 'WH_5', location_city: 'Pune', capacity_units: 11000},
  {warehouse_id: 'W16', name: 'WH_6', location_city: 'Kolkata', capacity_units: 9000},
  {warehouse_id: 'W17', name: 'WH_7', location_city: 'Ahmedabad', capacity_units: 8000},
  {warehouse_id: 'W18', name: 'WH_8', location_city: 'Jaipur', capacity_units: 7000},
  {warehouse_id: 'W19', name: 'WH_9', location_city: 'Surat', capacity_units: 9500}
] AS row
MERGE (w:Warehouse {warehouse_id: row.warehouse_id})
  SET w.name = row.name, w.location_city = row.location_city, w.capacity_units = row.capacity_units;

// Create Product nodes
UNWIND [
  {product_id: 'P200', sku: 'SKU-3000', name: 'Product_0', category: 'Electronics', unit_weight_kg: 0.5, supplier_id: 'S104'},
  {product_id: 'P201', sku: 'SKU-3001', name: 'Product_1', category: 'Apparel', unit_weight_kg: 0.2, supplier_id: 'S105'},
  {product_id: 'P202', sku: 'SKU-3002', name: 'Product_2', category: 'Electronics', unit_weight_kg: 1.2, supplier_id: 'S107'},
  {product_id: 'P203', sku: 'SKU-3003', name: 'Product_3', category: 'Home', unit_weight_kg: 2.5, supplier_id: 'S108'},
  {product_id: 'P204', sku: 'SKU-3004', name: 'Product_4', category: 'Home', unit_weight_kg: 3.0, supplier_id: 'S105'},
  {product_id: 'P205', sku: 'SKU-3005', name: 'Product_5', category: 'Automotive', unit_weight_kg: 4.5, supplier_id: 'S109'},
  {product_id: 'P206', sku: 'SKU-3006', name: 'Product_6', category: 'Apparel', unit_weight_kg: 0.15, supplier_id: 'S106'},
  {product_id: 'P207', sku: 'SKU-3007', name: 'Product_7', category: 'Electronics', unit_weight_kg: 0.8, supplier_id: 'S101'},
  {product_id: 'P208', sku: 'SKU-3008', name: 'Product_8', category: 'Toys', unit_weight_kg: 0.4, supplier_id: 'S107'},
  {product_id: 'P209', sku: 'SKU-3009', name: 'Product_9', category: 'Automotive', unit_weight_kg: 5.0, supplier_id: 'S102'}
] AS row
MERGE (p:Product {product_id: row.product_id})
  SET p.sku = row.sku, p.name = row.name, p.category = row.category, p.unit_weight_kg = row.unit_weight_kg, p.supplier_id = row.supplier_id;

// Create Order nodes
UNWIND [
  {order_id: 'O600', customer_id: 'C508', order_date: date('2025-01-01'), status: 'Pending', total_amount: 7080.71},
  {order_id: 'O601', customer_id: 'C506', order_date: date('2025-01-02'), status: 'Shipped', total_amount: 12017.72},
  {order_id: 'O602', customer_id: 'C501', order_date: date('2025-01-03'), status: 'Delivered', total_amount: 14856.57},
  {order_id: 'O603', customer_id: 'C502', order_date: date('2025-01-04'), status: 'Cancelled', total_amount: 13852.96},
  {order_id: 'O604', customer_id: 'C501', order_date: date('2025-01-05'), status: 'Delivered', total_amount: 7547.53},
  {order_id: 'O605', customer_id: 'C504', order_date: date('2025-01-06'), status: 'Shipped', total_amount: 5244.23},
  {order_id: 'O606', customer_id: 'C508', order_date: date('2025-01-07'), status: 'Pending', total_amount: 14944.64},
  {order_id: 'O607', customer_id: 'C504', order_date: date('2025-01-08'), status: 'Delivered', total_amount: 3409.04},
  {order_id: 'O608', customer_id: 'C500', order_date: date('2025-01-09'), status: 'Shipped', total_amount: 15444.88},
  {order_id: 'O609', customer_id: 'C501', order_date: date('2025-01-10'), status: 'Pending', total_amount: 18495.57}
] AS row
MERGE (o:Order {order_id: row.order_id})
  SET o.customer_id = row.customer_id, o.order_date = row.order_date, o.status = row.status, o.total_amount = row.total_amount;

// Create OrderItem nodes
UNWIND [
  {order_item_id: 'OI700', order_id: 'O609', product_id: 'P202', quantity: 2, unit_price: 1886.05},
  {order_item_id: 'OI701', order_id: 'O602', product_id: 'P209', quantity: 7, unit_price: 603.45},
  {order_item_id: 'OI702', order_id: 'O606', product_id: 'P206', quantity: 1, unit_price: 2233.47},
  {order_item_id: 'OI703', order_id: 'O602', product_id: 'P206', quantity: 5, unit_price: 4096.12},
  {order_item_id: 'OI704', order_id: 'O601', product_id: 'P201', quantity: 6, unit_price: 72.56},
  {order_item_id: 'OI705', order_id: 'O602', product_id: 'P208', quantity: 1, unit_price: 2237.94},
  {order_item_id: 'OI706', order_id: 'O605', product_id: 'P202', quantity: 3, unit_price: 1154.88},
  {order_item_id: 'OI707', order_id: 'O608', product_id: 'P205', quantity: 5, unit_price: 2740.21},
  {order_item_id: 'OI708', order_id: 'O607', product_id: 'P207', quantity: 4, unit_price: 2169.89},
  {order_item_id: 'OI709', order_id: 'O606', product_id: 'P202', quantity: 2, unit_price: 4729.71}
] AS row
MERGE (oi:OrderItem {order_item_id: row.order_item_id})
  SET oi.order_id = row.order_id, oi.product_id = row.product_id, oi.quantity = row.quantity, oi.unit_price = row.unit_price;

// Create Invoice nodes
UNWIND [
  {invoice_id: 'INV1200', order_id: 'O608', invoice_date: date('2025-01-03'), amount_due: 16591.76, status: 'Unpaid'},
  {invoice_id: 'INV1201', order_id: 'O602', invoice_date: date('2025-01-04'), amount_due: 4861.66, status: 'Paid'},
  {invoice_id: 'INV1202', order_id: 'O603', invoice_date: date('2025-01-05'), amount_due: 12437.05, status: 'Paid'},
  {invoice_id: 'INV1203', order_id: 'O604', invoice_date: date('2025-01-06'), amount_due: 24062.5, status: 'Unpaid'},
  {invoice_id: 'INV1204', order_id: 'O601', invoice_date: date('2025-01-07'), amount_due: 5530.02, status: 'Paid'},
  {invoice_id: 'INV1205', order_id: 'O609', invoice_date: date('2025-01-08'), amount_due: 13279.83, status: 'Unpaid'},
  {invoice_id: 'INV1206', order_id: 'O609', invoice_date: date('2025-01-09'), amount_due: 16454.35, status: 'Paid'},
  {invoice_id: 'INV1207', order_id: 'O602', invoice_date: date('2025-01-10'), amount_due: 12206.08, status: 'Paid'},
  {invoice_id: 'INV1208', order_id: 'O601', invoice_date: date('2025-01-11'), amount_due: 16026.05, status: 'Unpaid'},
  {invoice_id: 'INV1209', order_id: 'O609', invoice_date: date('2025-01-12'), amount_due: 8273.49, status: 'Paid'}
] AS row
MERGE (i:Invoice {invoice_id: row.invoice_id})
  SET i.order_id = row.order_id, i.invoice_date = row.invoice_date, i.amount_due = row.amount_due, i.status = row.status;

// Create Payment nodes
UNWIND [
  {payment_id: 'PMT1300', invoice_id: 'INV1206', payment_date: date('2025-01-04'), amount_paid: 13279.83, method: 'Bank Transfer'},
  {payment_id: 'PMT1301', invoice_id: 'INV1201', payment_date: date('2025-01-05'), amount_paid: 4861.66, method: 'Card'},
  {payment_id: 'PMT1302', invoice_id: 'INV1208', payment_date: date('2025-01-06'), amount_paid: 13279.83, method: 'Card'},
  {payment_id: 'PMT1303', invoice_id: 'INV1206', payment_date: date('2025-01-07'), amount_paid: 16591.76, method: 'Netbanking'},
  {payment_id: 'PMT1304', invoice_id: 'INV1206', payment_date: date('2025-01-08'), amount_paid: 16026.05, method: 'UPI'},
  {payment_id: 'PMT1305', invoice_id: 'INV1203', payment_date: date('2025-01-09'), amount_paid: 13279.83, method: 'Card'},
  {payment_id: 'PMT1306', invoice_id: 'INV1203', payment_date: date('2025-01-10'), amount_paid: 8273.49, method: 'Bank Transfer'},
  {payment_id: 'PMT1307', invoice_id: 'INV1205', payment_date: date('2025-01-11'), amount_paid: 8273.49, method: 'UPI'},
  {payment_id: 'PMT1308', invoice_id: 'INV1202', payment_date: date('2025-01-12'), amount_paid: 12437.05, method: 'Card'},
  {payment_id: 'PMT1309', invoice_id: 'INV1204', payment_date: date('2025-01-13'), amount_paid: 5530.02, method: 'Netbanking'}
] AS row
MERGE (p:Payment {payment_id: row.payment_id})
  SET p.invoice_id = row.invoice_id, p.payment_date = row.payment_date, p.amount_paid = row.amount_paid, p.method = row.method;

// Create Shipment nodes
UNWIND [
  {shipment_id: 'SH800', order_id: 'O609', carrier_id: 'CR900', warehouse_id: 'W17', shipped_date: date('2025-01-02'), estimated_arrival: date('2025-01-05')},
  {shipment_id: 'SH801', order_id: 'O601', carrier_id: 'CR901', warehouse_id: 'W16', shipped_date: date('2025-01-03'), estimated_arrival: date('2025-01-06')},
  {shipment_id: 'SH802', order_id: 'O602', carrier_id: 'CR902', warehouse_id: 'W19', shipped_date: date('2025-01-04'), estimated_arrival: date('2025-01-07')},
  {shipment_id: 'SH803', order_id: 'O601', carrier_id: 'CR903', warehouse_id: 'W18', shipped_date: date('2025-01-05'), estimated_arrival: date('2025-01-08')},
  {shipment_id: 'SH804', order_id: 'O607', carrier_id: 'CR904', warehouse_id: 'W14', shipped_date: date('2025-01-06'), estimated_arrival: date('2025-01-09')},
  {shipment_id: 'SH805', order_id: 'O602', carrier_id: 'CR905', warehouse_id: 'W10', shipped_date: date('2025-01-07'), estimated_arrival: date('2025-01-10')},
  {shipment_id: 'SH806', order_id: 'O600', carrier_id: 'CR906', warehouse_id: 'W17', shipped_date: date('2025-01-08'), estimated_arrival: date('2025-01-11')},
  {shipment_id: 'SH807', order_id: 'O601', carrier_id: 'CR907', warehouse_id: 'W14', shipped_date: date('2025-01-09'), estimated_arrival: date('2025-01-12')},
  {shipment_id: 'SH808', order_id: 'O603', carrier_id: 'CR908', warehouse_id: 'W16', shipped_date: date('2025-01-10'), estimated_arrival: date('2025-01-13')},
  {shipment_id: 'SH809', order_id: 'O607', carrier_id: 'CR909', warehouse_id: 'W19', shipped_date: date('2025-01-11'), estimated_arrival: date('2025-01-14')}
] AS row
MERGE (s:Shipment {shipment_id: row.shipment_id})
  SET s.order_id = row.order_id, s.carrier_id = row.carrier_id, s.warehouse_id = row.warehouse_id, s.shipped_date = row.shipped_date, s.estimated_arrival = row.estimated_arrival;

// Create PurchaseOrder nodes
UNWIND [
  {po_id: 'PO1000', supplier_id: 'S101', order_date: date('2025-01-01'), expected_delivery: date('2025-01-16'), status: 'Open', total_value: 229945.04},
  {po_id: 'PO1001', supplier_id: 'S100', order_date: date('2025-01-02'), expected_delivery: date('2025-01-17'), status: 'Closed', total_value: 60861.29},
  {po_id: 'PO1002', supplier_id: 'S105', order_date: date('2025-01-03'), expected_delivery: date('2025-01-18'), status: 'Open', total_value: 484852.13},
  {po_id: 'PO1003', supplier_id: 'S108', order_date: date('2025-01-04'), expected_delivery: date('2025-01-19'), status: 'Cancelled', total_value: 80089.95},
  {po_id: 'PO1004', supplier_id: 'S109', order_date: date('2025-01-05'), expected_delivery: date('2025-01-20'), status: 'Open', total_value: 260549.54},
  {po_id: 'PO1005', supplier_id: 'S104', order_date: date('2025-01-06'), expected_delivery: date('2025-01-21'), status: 'Closed', total_value: 93674.19},
  {po_id: 'PO1006', supplier_id: 'S109', order_date: date('2025-01-07'), expected_delivery: date('2025-01-22'), status: 'Open', total_value: 478161.39},
  {po_id: 'PO1007', supplier_id: 'S108', order_date: date('2025-01-08'), expected_delivery: date('2025-01-23'), status: 'Open', total_value: 110606.6},
  {po_id: 'PO1008', supplier_id: 'S100', order_date: date('2025-01-09'), expected_delivery: date('2025-01-24'), status: 'Closed', total_value: 128803.64},
  {po_id: 'PO1009', supplier_id: 'S107', order_date: date('2025-01-10'), expected_delivery: date('2025-01-25'), status: 'Open', total_value: 174570.75}
] AS row
MERGE (po:PurchaseOrder {po_id: row.po_id})
  SET po.supplier_id = row.supplier_id, po.order_date = row.order_date, po.expected_delivery = row.expected_delivery, po.status = row.status, po.total_value = row.total_value;

// STEP 3: CREATE RELATIONSHIPS USING UNWIND AND MERGE

// Customer PLACES Order relationships
UNWIND [
  {customer_id: 'C508', order_id: 'O600'}, {customer_id: 'C506', order_id: 'O601'}, {customer_id: 'C501', order_id: 'O602'},
  {customer_id: 'C502', order_id: 'O603'}, {customer_id: 'C501', order_id: 'O604'}, {customer_id: 'C504', order_id: 'O605'},
  {customer_id: 'C508', order_id: 'O606'}, {customer_id: 'C504', order_id: 'O607'}, {customer_id: 'C500', order_id: 'O608'},
  {customer_id: 'C501', order_id: 'O609'}
] AS rel
MATCH (c:Customer {customer_id: rel.customer_id})
MATCH (o:Order {order_id: rel.order_id})
MERGE (c)-[:PLACES]->(o);

// Order CONTAINS OrderItem relationships
UNWIND [
  {order_id: 'O609', order_item_id: 'OI700'}, {order_id: 'O602', order_item_id: 'OI701'}, {order_id: 'O606', order_item_id: 'OI702'},
  {order_id: 'O602', order_item_id: 'OI703'}, {order_id: 'O601', order_item_id: 'OI704'}, {order_id: 'O602', order_item_id: 'OI705'},
  {order_id: 'O605', order_item_id: 'OI706'}, {order_id: 'O608', order_item_id: 'OI707'}, {order_id: 'O607', order_item_id: 'OI708'},
  {order_id: 'O606', order_item_id: 'OI709'}
] AS rel
MATCH (o:Order {order_id: rel.order_id})
MATCH (oi:OrderItem {order_item_id: rel.order_item_id})
MERGE (o)-[:CONTAINS]->(oi);

// OrderItem REFERENCES Product relationships
UNWIND [
  {order_item_id: 'OI700', product_id: 'P202'}, {order_item_id: 'OI701', product_id: 'P209'}, {order_item_id: 'OI702', product_id: 'P206'},
  {order_item_id: 'OI703', product_id: 'P206'}, {order_item_id: 'OI704', product_id: 'P201'}, {order_item_id: 'OI705', product_id: 'P208'},
  {order_item_id: 'OI706', product_id: 'P202'}, {order_item_id: 'OI707', product_id: 'P205'}, {order_item_id: 'OI708', product_id: 'P207'},
  {order_item_id: 'OI709', product_id: 'P202'}
] AS rel
MATCH (oi:OrderItem {order_item_id: rel.order_item_id})
MATCH (p:Product {product_id: rel.product_id})
MERGE (oi)-[:REFERENCES]->(p);

// Product SUPPLIED_BY Supplier relationships
UNWIND [
  {product_id: 'P200', supplier_id: 'S104'}, {product_id: 'P201', supplier_id: 'S105'}, {product_id: 'P202', supplier_id: 'S107'},
  {product_id: 'P203', supplier_id: 'S108'}, {product_id: 'P204', supplier_id: 'S105'}, {product_id: 'P205', supplier_id: 'S109'},
  {product_id: 'P206', supplier_id: 'S106'}, {product_id: 'P207', supplier_id: 'S101'}, {product_id: 'P208', supplier_id: 'S107'},
  {product_id: 'P209', supplier_id: 'S102'}
] AS rel
MATCH (p:Product {product_id: rel.product_id})
MATCH (s:Supplier {supplier_id: rel.supplier_id})
MERGE (p)-[:SUPPLIED_BY]->(s);

// Order GENERATES Invoice relationships
UNWIND [
  {order_id: 'O608', invoice_id: 'INV1200'}, {order_id: 'O602', invoice_id: 'INV1201'}, {order_id: 'O603', invoice_id: 'INV1202'},
  {order_id: 'O604', invoice_id: 'INV1203'}, {order_id: 'O601', invoice_id: 'INV1204'}, {order_id: 'O609', invoice_id: 'INV1205'},
  {order_id: 'O609', invoice_id: 'INV1206'}, {order_id: 'O602', invoice_id: 'INV1207'}, {order_id: 'O601', invoice_id: 'INV1208'},
  {order_id: 'O609', invoice_id: 'INV1209'}
] AS rel
MATCH (o:Order {order_id: rel.order_id})
MATCH (i:Invoice {invoice_id: rel.invoice_id})
MERGE (o)-[:GENERATES]->(i);

// Invoice PAID_BY Payment relationships
UNWIND [
  {invoice_id: 'INV1206', payment_id: 'PMT1300'}, {invoice_id: 'INV1201', payment_id: 'PMT1301'}, {invoice_id: 'INV1208', payment_id: 'PMT1302'},
  {invoice_id: 'INV1206', payment_id: 'PMT1303'}, {invoice_id: 'INV1206', payment_id: 'PMT1304'}, {invoice_id: 'INV1203', payment_id: 'PMT1305'},
  {invoice_id: 'INV1203', payment_id: 'PMT1306'}, {invoice_id: 'INV1205', payment_id: 'PMT1307'}, {invoice_id: 'INV1202', payment_id: 'PMT1308'},
  {invoice_id: 'INV1204', payment_id: 'PMT1309'}
] AS rel
MATCH (i:Invoice {invoice_id: rel.invoice_id})
MATCH (p:Payment {payment_id: rel.payment_id})
MERGE (i)-[:PAID_BY]->(p);

// Order SHIPPED_VIA Shipment relationships
UNWIND [
  {order_id: 'O609', shipment_id: 'SH800'}, {order_id: 'O601', shipment_id: 'SH801'}, {order_id: 'O602', shipment_id: 'SH802'},
  {order_id: 'O601', shipment_id: 'SH803'}, {order_id: 'O607', shipment_id: 'SH804'}, {order_id: 'O602', shipment_id: 'SH805'},
  {order_id: 'O600', shipment_id: 'SH806'}, {order_id: 'O601', shipment_id: 'SH807'}, {order_id: 'O603', shipment_id: 'SH808'},
  {order_id: 'O607', shipment_id: 'SH809'}
] AS rel
MATCH (o:Order {order_id: rel.order_id})
MATCH (s:Shipment {shipment_id: rel.shipment_id})
MERGE (o)-[:SHIPPED_VIA]->(s);

// Shipment USES_CARRIER Carrier relationships
UNWIND [
  {shipment_id: 'SH800', carrier_id: 'CR900'}, {shipment_id: 'SH801', carrier_id: 'CR901'}, {shipment_id: 'SH802', carrier_id: 'CR902'},
  {shipment_id: 'SH803', carrier_id: 'CR903'}, {shipment_id: 'SH804', carrier_id: 'CR904'}, {shipment_id: 'SH805', carrier_id: 'CR905'},
  {shipment_id: 'SH806', carrier_id: 'CR906'}, {shipment_id: 'SH807', carrier_id: 'CR907'}, {shipment_id: 'SH808', carrier_id: 'CR908'},
  {shipment_id: 'SH809', carrier_id: 'CR909'}
] AS rel
MATCH (s:Shipment {shipment_id: rel.shipment_id})
MATCH (c:Carrier {carrier_id: rel.carrier_id})
MERGE (s)-[:USES_CARRIER]->(c);

// Shipment ORIGINATES_FROM Warehouse relationships
UNWIND [
  {shipment_id: 'SH800', warehouse_id: 'W17'}, {shipment_id: 'SH801', warehouse_id: 'W16'}, {shipment_id: 'SH802', warehouse_id: 'W19'},
  {shipment_id: 'SH803', warehouse_id: 'W18'}, {shipment_id: 'SH804', warehouse_id: 'W14'}, {shipment_id: 'SH805', warehouse_id: 'W10'},
  {shipment_id: 'SH806', warehouse_id: 'W17'}, {shipment_id: 'SH807', warehouse_id: 'W14'}, {shipment_id: 'SH808', warehouse_id: 'W16'},
  {shipment_id: 'SH809', warehouse_id: 'W19'}
] AS rel
MATCH (s:Shipment {shipment_id: rel.shipment_id})
MATCH (w:Warehouse {warehouse_id: rel.warehouse_id})
MERGE (s)-[:ORIGINATES_FROM]->(w);

// PurchaseOrder PLACED_WITH Supplier relationships
UNWIND [
  {po_id: 'PO1000', supplier_id: 'S101'}, {po_id: 'PO1001', supplier_id: 'S100'}, {po_id: 'PO1002', supplier_id: 'S105'},
  {po_id: 'PO1003', supplier_id: 'S108'}, {po_id: 'PO1004', supplier_id: 'S109'}, {po_id: 'PO1005', supplier_id: 'S104'},
  {po_id: 'PO1006', supplier_id: 'S109'}, {po_id: 'PO1007', supplier_id: 'S108'}, {po_id: 'PO1008', supplier_id: 'S100'},
  {po_id: 'PO1009', supplier_id: 'S107'}
] AS rel
MATCH (po:PurchaseOrder {po_id: rel.po_id})
MATCH (s:Supplier {supplier_id: rel.supplier_id})
MERGE (po)-[:PLACED_WITH]->(s);

// =============================================================================
// SCRIPT COMPLETION
// Total Nodes Created: 100+ (Carriers, Customers, Suppliers, Warehouses, Products, Orders, OrderItems, Invoices, Payments, Shipments, PurchaseOrders)
// Total Relationships Created: 80+ (PLACES, CONTAINS, REFERENCES, SUPPLIED_BY, GENERATES, PAID_BY, SHIPPED_VIA, USES_CARRIER, ORIGINATES_FROM, PLACED_WITH)
// Script is idempotent and safe for re-execution
// =============================================================================