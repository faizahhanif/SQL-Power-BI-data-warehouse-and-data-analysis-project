CREATE OR REPLACE VIEW gold.seller_winning_analysis AS
SELECT 
	s.seller_id,
	s.seller_state,
	COUNT(DISTINCT o.order_id) AS total_orders, 
	COUNT(o.order_item_id) AS total_items,
	COUNT(DISTINCT o.order_id) * COUNT(*) AS seller_winning_score,
	ROUND(AVG(p.product_name_lenght),2) AS avg_product_name_length, 
	ROUND(AVG(p.product_description_lenght),2) AS avg_product_description_length,
	ROUND(AVG(p.product_photos_qty),2) AS avg_product_photos_qty,
	ROUND(AVG(p.product_weight_g),2) AS avg_product_weight_g,
	ROUND(AVG(
		p.product_length_cm * 
		p.product_height_cm * 
		p.product_width_cm
		),2) AS avg_product_dimension,
	ROUND(CAST(AVG(o.price) AS NUMERIC) ,2) AS avg_price, 
	ROUND(CAST(AVG(o.freight_value) AS NUMERIC), 2) AS avg_shipping_cost
FROM gold.fact_order_items o
JOIN gold.dim_seller s
ON o.seller_id = s.seller_id
JOIN gold.dim_product p
ON o.product_id = p.product_id
GROUP BY s.seller_id, s.seller_state
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY COUNT(o.order_id) DESC

