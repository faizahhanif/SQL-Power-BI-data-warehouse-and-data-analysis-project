
DROP TABLE IF EXISTS silver.order_items_dataset;
CREATE TABLE silver.order_items_dataset(
order_id VARCHAR(100),
order_item_id INT, 
product_id VARCHAR(100),
seller_id VARCHAR(100), 
shipping_limit_date TIMESTAMP, 
price FLOAT, 
freight_value FLOAT,
dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

--
DROP TABLE IF EXISTS silver.products_dataset;
CREATE TABLE silver.products_dataset(
product_id VARCHAR(100),
product_category_name VARCHAR(50), 
product_name_lenght INT,
product_description_lenght INT, 
product_photos_qty INT, 
product_weight_g INT, 
product_length_cm INT, 
product_height_cm INT, 
product_width_cm INT, 
dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

DROP TABLE IF EXISTS silver.sellers_dataset;
CREATE TABLE silver.sellers_dataset(
seller_id VARCHAR(100),
seller_zip_code_prefix VARCHAR(10), 
seller_city VARCHAR(50),
seller_state VARCHAR(50), 
dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)