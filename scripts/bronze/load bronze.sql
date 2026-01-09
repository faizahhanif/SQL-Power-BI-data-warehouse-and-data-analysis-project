
TRUNCATE TABLE bronze.order_items_dataset;
COPY bronze.order_items_dataset
FROM 'C:\ecommerce dataset\order_items_dataset.csv'
CSV 
HEADER
DELIMITER ',';

TRUNCATE TABLE bronze.products_dataset;
COPY bronze.products_dataset
FROM 'C:\ecommerce dataset\products_dataset.csv'
CSV 
HEADER
DELIMITER ',';

TRUNCATE TABLE bronze.sellers_dataset;
COPY bronze.sellers_dataset
FROM 'C:\ecommerce dataset\sellers_dataset.csv'
CSV 
HEADER
DELIMITER ',';

SELECT * FROM bronze.sellers_dataset
