select rating from data;
select product_name from data;
select * from data where brand_name = 'bata';
SELECT * FROM data WHERE discounted_price >= '1299';
SELECT * FROM data ORDER BY discount_amount DESC;
SELECT * FROM data ORDER BY discount_amount ASC;
SELECT `brand_name`,`Product_tag`, AVG(`discount_percentage`) AS avg_discount FROM data GROUP BY `brand_name`, `Product_tag`;
SELECT brand.brand_name, brands.brand_tag FROM data INNER JOIN brands ON brand.brand_id =brands.brand_tag;
SELECT brand.brand_name, brands.brand_tag FROM data LEFT JOIN brands ON brand.brand_id =brands.brand_tag;
SELECT brand.brand_name, brands.brand_tag FROM data RIGHT JOIN brands ON brand.brand_id =brands.brand_tag;
SELECT brand_name, total_products FROM (SELECT brands.brand_name, COUNT(product.product_id) AS total_products
    FROM brands LEFT JOIN products ON products.brand_id = brands.brand_id GROUP BY brands.brand_name) AS brand_summary
	WHERE total_products > 10;
SELECT SUM(marked_price - discounted_price) AS discount_amount FROM data;
CREATE VIEW discount_percent AS SELECT product_id, product_name, marked_price, discounted_price, 
(marked_price - discounted_price) AS discount_amount, ROUND(((marked_price - discounted_price) / marked_price) * 100, 2)
AS discount_percent FROM data;
CREATE INDEX idx_data_brand_name ON data(brand_name); SELECT data.product_name, data.brand_name FROM data 
JOIN brand_tag ON data.brand_name = brand_tag.brand_name;
