-- Assessing order_items_dataset
-- Check duplicates
SELECT 
order_id, order_item_id,
COUNT(*)
FROM silver.order_items_dataset
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1 OR order_id IS NULL OR order_item_id IS NULL

-- Unwanted spaces 
SELECT 
order_id
FROM silver.order_items_dataset
WHERE order_id != TRIM(order_id) 

-- Unwanted spaces 
SELECT 
product_id
FROM silver.order_items_dataset
WHERE product_id != TRIM(product_id) OR product_id IS NULL

-- Unwanted spaces 
SELECT 
seller_id
FROM silver.order_items_dataset
WHERE seller_id != TRIM(seller_id) OR seller_id IS NULL

--NULL values 
SELECT 
price
FROM silver.order_items_dataset
WHERE price IS NULL OR price < 0

--NULL values, negative price
SELECT 
freight_value
FROM silver.order_items_dataset
WHERE freight_value IS NULL OR freight_value < 0

---------------------------------------------------------------------
-- Assessing products_dataset
-- Check duplicates
SELECT 
product_id,
COUNT(*)
FROM silver.products_dataset
GROUP BY product_id
HAVING COUNT(*) > 1 OR product_id IS NULL 
 
-- Unwanted spaces 
SELECT 
product_id
FROM silver.products_dataset
WHERE product_id != TRIM(product_id) 

-- Unwanted spaces 
SELECT 
product_id
FROM silver.products_dataset
WHERE product_id != TRIM(product_id)

-- Unwanted spaces 
SELECT 
product_category_name
FROM silver.products_dataset
WHERE product_category_name != TRIM(product_category_name)

--NULL values, negative value
SELECT 
COUNT(*),
product_name_lenght
FROM silver.products_dataset
WHERE product_name_lenght IS NULL OR product_name_lenght < 0
GROUP BY product_name_lenght

--NULL values, negative value
SELECT 
COUNT(*), 
product_description_lenght
FROM silver.products_dataset
WHERE product_description_lenght IS NULL 
   OR product_description_lenght < 0
GROUP BY product_description_lenght

--NULL values, negative value
SELECT 
COUNT(*), 
product_photos_qty
FROM silver.products_dataset
WHERE product_photos_qty IS NULL 
   OR product_photos_qty < 0
GROUP BY product_photos_qty

--NULL values, negative value
SELECT 
COUNT(*), 
product_weight_g
FROM silver.products_dataset
WHERE product_weight_g IS NULL 
   OR product_weight_g < 0
GROUP BY product_weight_g

--NULL values, negative value
SELECT 
COUNT(*), 
product_length_cm
FROM silver.products_dataset
WHERE product_length_cm IS NULL 
   OR product_length_cm < 0
GROUP BY product_length_cm

--NULL values, negative value
SELECT 
COUNT(*), 
product_height_cm
FROM silver.products_dataset
WHERE product_height_cm IS NULL 
   OR product_height_cm < 0
GROUP BY product_height_cm

--NULL values, negative value
SELECT 
COUNT(*), 
product_width_cm
FROM silver.products_dataset
WHERE product_width_cm IS NULL 
   OR product_width_cm < 0
GROUP BY product_width_cm
