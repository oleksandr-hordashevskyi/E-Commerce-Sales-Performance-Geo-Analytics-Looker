-- =============================================================================
-- Project: E-Commerce Multi-Channel Sales Performance & Geo-Analytics Pipeline
-- Dialect: PostgreSQL
-- Description: Unified ETL pipeline extracting and harmonizing online & offline 
--              transactional data for Google Looker Studio BI semantic layer.
-- =============================================================================

WITH online_sales AS (
    SELECT 
        'Online'::text AS sales_channel,
        o.order_id::text AS order_id,
        o.order_date::date AS order_date,
        o.user_id::text AS user_id,
        oi.product_id::text AS product_id,
        oi.quantity::int AS quantity,
        p.product_price::numeric AS item_price,                      
        (oi.quantity * p.product_price)::numeric AS total_item_revenue, 
        p.product_name::text AS product_name,
        p.product_category::text AS product_category,                
        u.user_name::text AS user_name,
        u.user_city::text AS user_city,                              
        u.user_address::text AS user_country,                         
        u.user_age::int AS user_age,                                 
        pay.payment_method::text AS payment_method,
        pay.payment_status::text AS payment_status,
        NULL::text AS courier,                                       
        NULL::text AS delivery_status    
    FROM project.orders_sql_project AS o
    LEFT JOIN project.order_items_sql_project AS oi 
        ON o.order_id::text = oi.order_id::text
    LEFT JOIN project.products_sql_project AS p 
        ON oi.product_id::text = p.product_id::text
    LEFT JOIN project.users_sql_project AS u 
        ON o.user_id::text = u.user_id::text
    LEFT JOIN project.payments_sql_project AS pay 
        ON o.order_id::text = pay.order_id::text
),
offline_sales AS (
    SELECT 
        'Offline'::text AS sales_channel,
        so.store_order_id::text AS order_id,   
        so.order_date::date AS order_date,
        so.user_id::text AS user_id,
        soi.product_id::text AS product_id,
        soi.quantity::int AS quantity,
        p.product_price::numeric AS item_price,                      
        (soi.quantity * p.product_price)::numeric AS total_item_revenue, 
        p.product_name::text AS product_name,
        p.product_category::text AS product_category,                
        u.user_name::text AS user_name,
        u.user_city::text AS user_city,                              
        u.user_address::text AS user_country,                         
        u.user_age::int AS user_age,                                 
        sp.payment_method::text AS payment_method,
        sp.payment_status::text AS payment_status,
        NULL::text AS courier,
        NULL::text AS delivery_status          
    FROM project.store_orders AS so
    LEFT JOIN project.store_order_items AS soi 
        ON so.store_order_id::text = soi.store_order_id::text 
    LEFT JOIN project.products_sql_project AS p 
        ON soi.product_id::text = p.product_id::text
    LEFT JOIN project.users_sql_project AS u 
        ON so.user_id::text = u.user_id::text
    LEFT JOIN project.store_payments AS sp 
        ON so.store_order_id::text = sp.store_order_id::text
)
SELECT * FROM online_sales
UNION ALL
SELECT * FROM offline_sales;
