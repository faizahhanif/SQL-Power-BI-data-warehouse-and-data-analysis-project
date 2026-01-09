-- Build table silver.order_items_dataset
TRUNCATE TABLE silver.order_items_dataset;

INSERT INTO silver.order_items_dataset ( 
	order_id,
	order_item_id, 
	product_id,
	seller_id, 
	shipping_limit_date, 
	price, 
	freight_value
)

SELECT 
order_id,
order_item_id, 
product_id,
seller_id, 
shipping_limit_date, 
price, 
freight_value
FROM bronze.order_items_dataset

----------------------------------------------------------------
-- Build table silver.products_dataset

TRUNCATE TABLE silver.products_dataset;

INSERT INTO silver.products_dataset ( 
	product_id,
	product_category_name, 
	product_name_lenght AS p,
	product_description_lenght, 
	product_photos_qty, 
	product_weight_g, 
	product_length_cm, 
	product_height_cm, 
	product_width_cm
)

SELECT
product_id,
product_category_name, 
CASE WHEN product_name_lenght IS NULL THEN 0
	 ELSE product_name_lenght
END product_name_lenght,
CASE WHEN product_description_lenght IS NULL THEN 0
	 ELSE product_description_lenght
END product_description_lenght, 
CASE WHEN product_photos_qty IS NULL THEN 0
	 ELSE product_photos_qty
END product_photos_qty, 
CASE WHEN product_weight_g IS NULL THEN 0
	 ELSE product_weight_g
END product_weight_g, 
CASE WHEN product_length_cm IS NULL THEN 0
	 ELSE product_length_cm
END product_length_cm, 
CASE WHEN product_height_cm IS NULL THEN 0
	 ELSE product_height_cm
END product_height_cm, 
CASE WHEN product_width_cm IS NULL THEN 0
	 ELSE product_width_cm
END product_width_cm
FROM bronze.products_dataset 

----------------------------------------------------------------
-- Build table silver.products_dataset

TRUNCATE TABLE silver.sellers_dataset;

INSERT INTO silver.sellers_dataset ( 
	seller_id,
	seller_zip_code_prefix, 
	seller_city,
	seller_state
)

SELECT 
seller_id,
seller_zip_code_prefix, 
seller_city,
CASE
    WHEN seller_state = 'AC' THEN 'Acre'
    WHEN seller_state = 'AM' THEN 'Amazonas'
    WHEN seller_state = 'BA' THEN 'Bahia'
    WHEN seller_state = 'CE' THEN 'Ceara'
    WHEN seller_state = 'DF' THEN 'Distrito Federal'
    WHEN seller_state = 'ES' THEN 'Espírito Santo'
    WHEN seller_state = 'GO' THEN 'Goias'
    WHEN seller_state = 'MA' THEN 'Maranhão'
    WHEN seller_state = 'MG' THEN 'Minas Gerais'
    WHEN seller_state = 'MS' THEN 'Mato Grosso do Sul'
    WHEN seller_state = 'MT' THEN 'Mato Grosso'
    WHEN seller_state = 'PA' THEN 'Para'
    WHEN seller_state = 'PB' THEN 'Paraiba'
    WHEN seller_state = 'PE' THEN 'Pernambuco'
    WHEN seller_state = 'PI' THEN 'Piaui'
    WHEN seller_state = 'PR' THEN 'Parana'
    WHEN seller_state = 'RJ' THEN 'Rio de Janeiro'
    WHEN seller_state = 'RN' THEN 'Rio Grande do Norte'
    WHEN seller_state = 'RO' THEN 'Rondonia'
    WHEN seller_state = 'RS' THEN 'Rio Grande do Sul'
    WHEN seller_state = 'SC' THEN 'Santa Catarina'
    WHEN seller_state = 'SE' THEN 'Sergipe'
    WHEN seller_state = 'SP' THEN 'Sao Paulo'
    ELSE seller_state
END AS seller_state
FROM bronze.sellers_dataset

SELECT * FROM silver.sellers_dataset