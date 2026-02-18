DROP VIEW IF EXISTS gold.product_characteristics;
CREATE VIEW gold.product_characteristics AS
WITH repeat_orders AS (
	SELECT 
		seller_id, 
		product_id
	FROM gold.fact_order_items
	GROUP BY seller_id, product_id
	HAVING COUNT(DISTINCT order_id) > 1
)
SELECT 
	o.seller_id, 
	o.product_id, 
	COUNT(DISTINCT o.order_id) AS repeat_order_count,
	COUNT(DISTINCT o.order_item_id) AS total_items, 
	COUNT(DISTINCT o.order_id) * COUNT(DISTINCT o.order_item_id) AS winning_score,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.product_name_lenght)
	AS median_name_length,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.product_description_lenght) 
	AS median_desc_length,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.product_photos_qty)
	AS median_photo_qty,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.product_weight_g) AS median_weight,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY 
		p.product_length_cm 
		* p.product_height_cm
		* p.product_width_cm) AS med_prod_dimension, 
	ROUND (CAST (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY o.price) AS NUMERIC), 2) AS median_price,
	ROUND (CAST (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY o.freight_value) AS NUMERIC), 2) AS median_s_cost
FROM gold.fact_order_items o 
JOIN repeat_orders r
ON o.seller_id = r.seller_id 
AND o.product_id = r.product_id
JOIN gold.dim_product p
ON o.product_id = p.product_id
GROUP BY o.seller_id, o.product_id
ORDER BY o.seller_id, o.product_id

