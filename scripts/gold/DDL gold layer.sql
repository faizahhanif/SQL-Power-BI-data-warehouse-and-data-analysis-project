
CREATE OR REPLACE VIEW gold.fact_order_items AS
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM silver.order_items_dataset;

CREATE OR REPLACE VIEW gold.dim_product AS
SELECT 
    product_id,
	product_category_name, 
	product_name_lenght,
	product_description_lenght, 
	product_photos_qty, 
	product_weight_g, 
	product_length_cm, 
	product_height_cm, 
	product_width_cm
FROM silver.products_dataset;

CREATE OR REPLACE VIEW gold.dim_seller AS
SELECT 
	seller_id,
	seller_zip_code_prefix, 
	seller_city,
	seller_state
FROM silver.sellers_dataset
