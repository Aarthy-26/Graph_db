// Supply Chain Graph Database Creation Script
// Generated from: carriers.csv, customers.csv, inventory.csv, invoices.csv, logistics_events.csv, order_items.csv, orders.csv, payments.csv, products.csv, purchase_orders.csv, receipts.csv, routes.csv, shipments.csv, suppliers.csv, warehouses.csv, graph_model.json
// Date of generation: 2024
// Description: Creates a comprehensive supply chain graph with all entities and relationships

// Clear existing data (optional - uncomment if needed)
// MATCH (n) DETACH DELETE n;

// ========================================
// CREATE NODES
// ========================================

// Create Carriers
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

// Create Customers
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

// Create Warehouses
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

// Create Suppliers
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

// Create Products
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

// Create Orders
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

// Create Order Items
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

// Create Invoices
CREATE (:Invoices {invoice_id: 'INV1200', order_id: 'O608', invoice_date: '2025-01-03', amount_due: 16591.76, status: 'Unpaid'});
CREATE (:Invoices {invoice_id: 'INV1201', order_id: 'O602', invoice_date: '2025-01-04', amount_due: 4861.66, status: 'Paid'});
CREATE (:Invoices {invoice_id: 'INV1202', order_id: 'O603', invoice_date: '2025-01-05', amount_due: 12437.05, status: 'Paid'});
CREATE (:Invoices {invoice_id: 'INV1203', order_id: 'O604', invoice_date: '2025-01-06', amount_due: 24062.5, status: 'Unpaid'});
CREATE (:Invoices {invoice_id: 'INV1204', order_id: 'O601', invoice_date: '2025-01-07', amount_due: 5530.02, status: 'Paid'});
CREATE (:Invoices {invoice_id: 'INV1205', order_id: 'O609', invoice_date: '2025-01-08', amount_due: 13279.83, status: 'Unpaid'});
CREATE (:Invoices {invoice_id: 'INV1206', order_id: 'O609', invoice_date: '2025-01-09', amount_due: 16454.35, status: 'Paid'});
CREATE (:Invoices {invoice_id: 'INV1207', order_id: 'O602', invoice_date: '2025-01-10', amount_due: 12206.08, status: 'Paid'});
CREATE (:Invoices {invoice_id: 'INV1208', order_id: 'O601', invoice_date: '2025-01-11', amount_due: 16026.05, status: 'Unpaid'});
CREATE (:Invoices {invoice_id: 'INV1209', order_id: 'O609', invoice_date: '2025-01-12', amount_due: 8273.49, status: 'Paid'});

// Create Payments
CREATE (:Payments {payment_id: 'PMT1300', invoice_id: 'INV1206', payment_date: '2025-01-04', amount_paid: 13279.83, method: 'Bank Transfer'});
CREATE (:Payments {payment_id: 'PMT1301', invoice_id: 'INV1201', payment_date: '2025-01-05', amount_paid: 4861.66, method: 'Card'});
CREATE (:Payments {payment_id: 'PMT1302', invoice_id: 'INV1208', payment_date: '2025-01-06', amount_paid: 13279.83, method: 'Card'});
CREATE (:Payments {payment_id: 'PMT1303', invoice_id: 'INV1206', payment_date: '2025-01-07', amount_paid: 16591.76, method: 'Netbanking'});
CREATE (:Payments {payment_id: 'PMT1304', invoice_id: 'INV1206', payment_date: '2025-01-08', amount_paid: 16026.05, method: 'UPI'});
CREATE (:Payments {payment_id: 'PMT1305', invoice_id: 'INV1203', payment_date: '2025-01-09', amount_paid: 13279.83, method: 'Card'});
CREATE (:Payments {payment_id: 'PMT1306', invoice_id: 'INV1203', payment_date: '2025-01-10', amount_paid: 8273.49, method: 'Bank Transfer'});
CREATE (:Payments {payment_id: 'PMT1307', invoice_id: 'INV1205', payment_date: '2025-01-11', amount_paid: 8273.49, method: 'UPI'});
CREATE (:Payments {payment_id: 'PMT1308', invoice_id: 'INV1202', payment_date: '2025-01-12', amount_paid: 12437.05, method: 'Card'});
CREATE (:Payments {payment_id: 'PMT1309', invoice_id: 'INV1204', payment_date: '2025-01-13', amount_paid: 5530.02, method: 'Netbanking'});

// Create Purchase Orders
CREATE (:Purchase_orders {po_id: 'PO1000', supplier_id: 'S101', order_date: '2025-01-01', expected_delivery: '2025-01-16', status: 'Open', total_value: 229945.04});
CREATE (:Purchase_orders {po_id: 'PO1001', supplier_id: 'S100', order_date: '2025-01-02', expected_delivery: '2025-01-17', status: 'Closed', total_value: 60861.29});
CREATE (:Purchase_orders {po_id: 'PO1002', supplier_id: 'S105', order_date: '2025-01-03', expected_delivery: '2025-01-18', status: 'Open', total_value: 484852.13});
CREATE (:Purchase_orders {po_id: 'PO1003', supplier_id: 'S108', order_date: '2025-01-04', expected_delivery: '2025-01-19', status: 'Cancelled', total_value: 80089.95});
CREATE (:Purchase_orders {po_id: 'PO1004', supplier_id: 'S109', order_date: '2025-01-05', expected_delivery: '2025-01-20', status: 'Open', total_value: 260549.54});
CREATE (:Purchase_orders {po_id: 'PO1005', supplier_id: 'S104', order_date: '2025-01-06', expected_delivery: '2025-01-21', status: 'Closed', total_value: 93674.19});
CREATE (:Purchase_orders {po_id: 'PO1006', supplier_id: 'S109', order_date: '2025-01-07', expected_delivery: '2025-01-22', status: 'Open', total_value: 478161.39});
CREATE (:Purchase_orders {po_id: 'PO1007', supplier_id: 'S108', order_date: '2025-01-08', expected_delivery: '2025-01-23', status: 'Open', total_value: 110606.6});
CREATE (:Purchase_orders {po_id: 'PO1008', supplier_id: 'S100', order_date: '2025-01-09', expected_delivery: '2025-01-24', status: 'Closed', total_value: 128803.64});
CREATE (:Purchase_orders {po_id: 'PO1009', supplier_id: 'S107', order_date: '2025-01-10', expected_delivery: '2025-01-25', status: 'Open', total_value: 174570.75});

// Create Receipts
CREATE (:Receipts {receipt_id: 'R1100', po_id: 'PO1008', product_id: 'P206', quantity_received: 97, received_date: '2025-01-06', warehouse_id: 'W11'});
CREATE (:Receipts {receipt_id: 'R1101', po_id: 'PO1002', product_id: 'P206', quantity_received: 36, received_date: '2025-01-07', warehouse_id: 'W18'});
CREATE (:Receipts {receipt_id: 'R1102', po_id: 'PO1008', product_id: 'P205', quantity_received: 9, received_date: '2025-01-08', warehouse_id: 'W11'});
CREATE (:Receipts {receipt_id: 'R1103', po_id: 'PO1003', product_id: 'P207', quantity_received: 24, received_date: '2025-01-09', warehouse_id: 'W17'});
CREATE (:Receipts {receipt_id: 'R1104', po_id: 'PO1000', product_id: 'P201', quantity_received: 21, received_date: '2025-01-10', warehouse_id: 'W12'});
CREATE (:Receipts {receipt_id: 'R1105', po_id: 'PO1009', product_id: 'P209', quantity_received: 90, received_date: '2025-01-11', warehouse_id: 'W16'});
CREATE (:Receipts {receipt_id: 'R1106', po_id: 'PO1007', product_id: 'P202', quantity_received: 26, received_date: '2025-01-12', warehouse_id: 'W15'});
CREATE (:Receipts {receipt_id: 'R1107', po_id: 'PO1005', product_id: 'P203', quantity_received: 37, received_date: '2025-01-13', warehouse_id: 'W13'});
CREATE (:Receipts {receipt_id: 'R1108', po_id: 'PO1009', product_id: 'P208', quantity_received: 99, received_date: '2025-01-14', warehouse_id: 'W15'});
CREATE (:Receipts {receipt_id: 'R1109', po_id: 'PO1005', product_id: 'P201', quantity_received: 71, received_date: '2025-01-15', warehouse_id: 'W14'});

// Create Shipments
CREATE (:Shipments {shipment_id: 'SH800', order_id: 'O609', carrier_id: 'CR900', warehouse_id: 'W17', shipped_date: '2025-01-02', estimated_arrival: '2025-01-05'});
CREATE (:Shipments {shipment_id: 'SH801', order_id: 'O601', carrier_id: 'CR901', warehouse_id: 'W16', shipped_date: '2025-01-03', estimated_arrival: '2025-01-06'});
CREATE (:Shipments {shipment_id: 'SH802', order_id: 'O602', carrier_id: 'CR902', warehouse_id: 'W19', shipped_date: '2025-01-04', estimated_arrival: '2025-01-07'});
CREATE (:Shipments {shipment_id: 'SH803', order_id: 'O601', carrier_id: 'CR903', warehouse_id: 'W18', shipped_date: '2025-01-05', estimated_arrival: '2025-01-08'});
CREATE (:Shipments {shipment_id: 'SH804', order_id: 'O607', carrier_id: 'CR904', warehouse_id: 'W14', shipped_date: '2025-01-06', estimated_arrival: '2025-01-09'});
CREATE (:Shipments {shipment_id: 'SH805', order_id: 'O602', carrier_id: 'CR905', warehouse_id: 'W10', shipped_date: '2025-01-07', estimated_arrival: '2025-01-10'});
CREATE (:Shipments {shipment_id: 'SH806', order_id: 'O600', carrier_id: 'CR906', warehouse_id: 'W17', shipped_date: '2025-01-08', estimated_arrival: '2025-01-11'});
CREATE (:Shipments {shipment_id: 'SH807', order_id: 'O601', carrier_id: 'CR907', warehouse_id: 'W14', shipped_date: '2025-01-09', estimated_arrival: '2025-01-12'});
CREATE (:Shipments {shipment_id: 'SH808', order_id: 'O603', carrier_id: 'CR908', warehouse_id: 'W16', shipped_date: '2025-01-10', estimated_arrival: '2025-01-13'});
CREATE (:Shipments {shipment_id: 'SH809', order_id: 'O607', carrier_id: 'CR909', warehouse_id: 'W19', shipped_date: '2025-01-11', estimated_arrival: '2025-01-14'});

// Create Logistics Events
CREATE (:Logistics_events {event_id: 'E1500', shipment_id: 'SH806', event_time: '2025-01-02 10:00:00', event_type: 'Picked Up', location: 'Chennai'});
CREATE (:Logistics_events {event_id: 'E1501', shipment_id: 'SH801', event_time: '2025-01-03 10:00:00', event_type: 'In Transit', location: 'Mumbai'});
CREATE (:Logistics_events {event_id: 'E1502', shipment_id: 'SH804', event_time: '2025-01-04 10:00:00', event_type: 'Delayed', location: 'Delhi'});
CREATE (:Logistics_events {event_id: 'E1503', shipment_id: 'SH807', event_time: '2025-01-05 10:00:00', event_type: 'Arrived', location: 'Bengaluru'});
CREATE (:Logistics_events {event_id: 'E1504', shipment_id: 'SH808', event_time: '2025-01-06 10:00:00', event_type: 'Loaded', location: 'Kolkata'});
CREATE (:Logistics_events {event_id: 'E1505', shipment_id: 'SH801', event_time: '2025-01-07 10:00:00', event_type: 'In Transit', location: 'Pune'});
CREATE (:Logistics_events {event_id: 'E1506', shipment_id: 'SH801', event_time: '2025-01-08 10:00:00', event_type: 'Customs', location: 'Hyderabad'});
CREATE (:Logistics_events {event_id: 'E1507', shipment_id: 'SH808', event_time: '2025-01-09 10:00:00', event_type: 'Delivered', location: 'Ahmedabad'});
CREATE (:Logistics_events {event_id: 'E1508', shipment_id: 'SH809', event_time: '2025-01-10 10:00:00', event_type: 'Out for Delivery', location: 'Jaipur'});
CREATE (:Logistics_events {event_id: 'E1509', shipment_id: 'SH809', event_time: '2025-01-11 10:00:00', event_type: 'Exception', location: 'Surat'});

// Create Inventory
CREATE (:Inventory {inventory_id: 'I400', warehouse_id: 'W18', product_id: 'P207', quantity_on_hand: 93, reorder_point: 95, last_updated: '2025-01-01'});
CREATE (:Inventory {inventory_id: 'I401', warehouse_id: 'W11', product_id: 'P201', quantity_on_hand: 179, reorder_point: 27, last_updated: '2025-01-02'});
CREATE (:Inventory {inventory_id: 'I402', warehouse_id: 'W16', product_id: 'P205', quantity_on_hand: 25, reorder_point: 139, last_updated: '2025-01-03'});
CREATE (:Inventory {inventory_id: 'I403', warehouse_id: 'W13', product_id: 'P202', quantity_on_hand: 204, reorder_point: 69, last_updated: '2025-01-04'});
CREATE (:Inventory {inventory_id: 'I404', warehouse_id: 'W19', product_id: 'P203', quantity_on_hand: 1, reorder_point: 51, last_updated: '2025-01-05'});
CREATE (:Inventory {inventory_id: 'I405', warehouse_id: 'W15', product_id: 'P200', quantity_on_hand: 80, reorder_point: 46, last_updated: '2025-01-06'});
CREATE (:Inventory {inventory_id: 'I406', warehouse_id: 'W13', product_id: 'P208', quantity_on_hand: 116, reorder_point: 112, last_updated: '2025-01-07'});
CREATE (:Inventory {inventory_id: 'I407', warehouse_id: 'W15', product_id: 'P202', quantity_on_hand: 322, reorder_point: 113, last_updated: '2025-01-08'});
CREATE (:Inventory {inventory_id: 'I408', warehouse_id: 'W18', product_id: 'P205', quantity_on_hand: 496, reorder_point: 40, last_updated: '2025-01-09'});
CREATE (:Inventory {inventory_id: 'I409', warehouse_id: 'W11', product_id: 'P208', quantity_on_hand: 250, reorder_point: 103, last_updated: '2025-01-10'});

// Create Routes
CREATE (:Routes {route_id: 'RT1400', origin_warehouse: 'W19', destination_city: 'Delhi', distance_km: 547, estimated_time_hours: 51.2});
CREATE (:Routes {route_id: 'RT1401', origin_warehouse: 'W18', destination_city: 'Mumbai', distance_km: 1379, estimated_time_hours: 19.3});
CREATE (:Routes {route_id: 'RT1402', origin_warehouse: 'W16', destination_city: 'Chennai', distance_km: 1495, estimated_time_hours: 67.0});
CREATE (:Routes {route_id: 'RT1403', origin_warehouse: 'W17', destination_city: 'Bengaluru', distance_km: 327, estimated_time_hours: 56.9});
CREATE (:Routes {route_id: 'RT1404', origin_warehouse: 'W12', destination_city: 'Kolkata', distance_km: 1926, estimated_time_hours: 8.3});
CREATE (:Routes {route_id: 'RT1405', origin_warehouse: 'W18', destination_city: 'Pune', distance_km: 2280, estimated_time_hours: 23.9});
CREATE (:Routes {route_id: 'RT1406', origin_warehouse: 'W14', destination_city: 'Jaipur', distance_km: 2032, estimated_time_hours: 55.3});
CREATE (:Routes {route_id: 'RT1407', origin_warehouse: 'W14', destination_city: 'Ahmedabad', distance_km: 2213, estimated_time_hours: 7.9});
CREATE (:Routes {route_id: 'RT1408', origin_warehouse: 'W12', destination_city: 'Surat', distance_km: 318, estimated_time_hours: 46.9});
CREATE (:Routes {route_id: 'RT1409', origin_warehouse: 'W14', destination_city: 'Hyderabad', distance_km: 982, estimated_time_hours: 66.1});

// ========================================
// CREATE RELATIONSHIPS
// ========================================

// Product-Supplier Relationships
MATCH (p:Products {supplier_id: 'S104'}), (s:Suppliers {supplier_id: 'S104'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S105'}), (s:Suppliers {supplier_id: 'S105'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S107'}), (s:Suppliers {supplier_id: 'S107'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S108'}), (s:Suppliers {supplier_id: 'S108'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S106'}), (s:Suppliers {supplier_id: 'S106'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S101'}), (s:Suppliers {supplier_id: 'S101'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S109'}), (s:Suppliers {supplier_id: 'S109'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

MATCH (p:Products {supplier_id: 'S102'}), (s:Suppliers {supplier_id: 'S102'})
CREATE (p)-[:PRODUCT_FROM_SUPPLIER]->(s);

// Order-Customer Relationships
MATCH (o:Orders), (c:Customers)
WHERE o.customer_id = c.customer_id
CREATE (o)-[:ORDER_BY_CUSTOMER]->(c);

// Order Item-Order Relationships
MATCH (oi:Order_items), (o:Orders)
WHERE oi.order_id = o.order_id
CREATE (oi)-[:ITEM_IN_ORDER]->(o);

// Order Item-Product Relationships
MATCH (oi:Order_items), (p:Products)
WHERE oi.product_id = p.product_id
CREATE (oi)-[:ITEM_IS_PRODUCT]->(p);

// Invoice-Order Relationships
MATCH (i:Invoices), (o:Orders)
WHERE i.order_id = o.order_id
CREATE (i)-[:INVOICE_FOR_ORDER]->(o);

// Payment-Invoice Relationships
MATCH (p:Payments), (i:Invoices)
WHERE p.invoice_id = i.invoice_id
CREATE (p)-[:PAYMENT_FOR_INVOICE]->(i);

// Purchase Order-Supplier Relationships
MATCH (po:Purchase_orders), (s:Suppliers)
WHERE po.supplier_id = s.supplier_id
CREATE (po)-[:PO_TO_SUPPLIER]->(s);

// Receipt-Purchase Order Relationships
MATCH (r:Receipts), (po:Purchase_orders)
WHERE r.po_id = po.po_id
CREATE (r)-[:RECEIPT_FOR_PO]->(po);

// Receipt-Product Relationships
MATCH (r:Receipts), (p:Products)
WHERE r.product_id = p.product_id
CREATE (r)-[:RECEIPT_OF_PRODUCT]->(p);

// Receipt-Warehouse Relationships
MATCH (r:Receipts), (w:Warehouses)
WHERE r.warehouse_id = w.warehouse_id
CREATE (r)-[:RECEIPT_TO_WAREHOUSE]->(w);

// Shipment-Order Relationships
MATCH (s:Shipments), (o:Orders)
WHERE s.order_id = o.order_id
CREATE (s)-[:SHIPMENT_FOR_ORDER]->(o);

// Shipment-Carrier Relationships
MATCH (s:Shipments), (c:Carriers)
WHERE s.carrier_id = c.carrier_id
CREATE (s)-[:SHIPMENT_BY_CARRIER]->(c);

// Shipment-Warehouse Relationships
MATCH (s:Shipments), (w:Warehouses)
WHERE s.warehouse_id = w.warehouse_id
CREATE (s)-[:SHIPMENT_FROM_WAREHOUSE]->(w);

// Logistics Event-Shipment Relationships
MATCH (le:Logistics_events), (s:Shipments)
WHERE le.shipment_id = s.shipment_id
CREATE (le)-[:EVENT_FOR_SHIPMENT]->(s);

// Inventory-Warehouse Relationships
MATCH (i:Inventory), (w:Warehouses)
WHERE i.warehouse_id = w.warehouse_id
CREATE (i)-[:STORED_IN_WAREHOUSE]->(w);

// Inventory-Product Relationships
MATCH (i:Inventory), (p:Products)
WHERE i.product_id = p.product_id
CREATE (i)-[:INVENTORY_OF_PRODUCT]->(p);

// Create indexes for better performance
CREATE INDEX FOR (c:Carriers) ON (c.carrier_id);
CREATE INDEX FOR (cust:Customers) ON (cust.customer_id);
CREATE INDEX FOR (w:Warehouses) ON (w.warehouse_id);
CREATE INDEX FOR (s:Suppliers) ON (s.supplier_id);
CREATE INDEX FOR (p:Products) ON (p.product_id);
CREATE INDEX FOR (o:Orders) ON (o.order_id);
CREATE INDEX FOR (i:Invoices) ON (i.invoice_id);
CREATE INDEX FOR (po:Purchase_orders) ON (po.po_id);
CREATE INDEX FOR (sh:Shipments) ON (sh.shipment_id);

// Query examples for verification
// MATCH (c:Customers)-[:ORDER_BY_CUSTOMER]-(o:Orders) RETURN c.name, o.order_id, o.total_amount;
// MATCH (p:Products)-[:PRODUCT_FROM_SUPPLIER]-(s:Suppliers) RETURN p.name, s.name, s.country;
// MATCH (s:Shipments)-[:SHIPMENT_BY_CARRIER]-(c:Carriers) RETURN s.shipment_id, c.name, c.service_level;