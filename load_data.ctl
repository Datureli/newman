LOAD DATA
INFILE 'C:/Users/Jan/Desktop/ikea.csv'
INTO TABLE ikea_products
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    item_id,
    name,
    category,
    price,
    old_price,
    sellable_online,
    link,
    other_colors,
    short_description,
    designer,
    depth,
    height,
    width
)
