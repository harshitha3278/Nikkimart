-- =========================
-- NIKKIMART SEED DATA
-- =========================

-- USERS
INSERT INTO users (name, email, password_hash, role)
SELECT 'Admin', 'admin@nikkimart.com', 'TEMP_HASH', 'ADMIN'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'admin@nikkimart.com'
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Seller One', 'seller@nikkimart.com', 'TEMP_HASH', 'SELLER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'seller@nikkimart.com'
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Buyer One', 'buyer@nikkimart.com', 'TEMP_HASH', 'BUYER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'buyer@nikkimart.com'
);


-- =========================
-- VEGETABLES
-- =========================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Fresh Carrot','Fresh farm carrots',60.00,50,'Vegetables',
'https://images.unsplash.com/photo-1445282768818-728615cc910a'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Fresh Carrot');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Fresh Tomato','Ripe farm fresh tomatoes',45.00,60,'Vegetables',
'https://images.unsplash.com/photo-1546094096-0df4bcaaa337'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Fresh Tomato');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Potato','Fresh quality potatoes',40.00,70,'Vegetables',
'https://images.unsplash.com/photo-1518977676601-b53f82aba655'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Potato');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Red Onion','Fresh red onions',50.00,55,'Vegetables',
'https://images.unsplash.com/photo-1508747703725-719777637510'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Red Onion');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Green Chilli','Fresh green chillies',35.00,40,'Vegetables',
'https://images.unsplash.com/photo-1588252303782-cb80119abd6d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Green Chilli');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Brinjal','Fresh purple brinjal',45.00,45,'Vegetables',
'https://images.unsplash.com/photo-1615484477201-9f4953340f5a'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Brinjal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cabbage','Fresh green cabbage',35.00,35,'Vegetables',
'https://images.unsplash.com/photo-1594282486552-05b4d80fbb9f'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cabbage');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cauliflower','Fresh cauliflower',55.00,35,'Vegetables',
'https://images.unsplash.com/photo-1568584711271-5c2c7e6f6b6d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cauliflower');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Spinach','Fresh leafy spinach',30.00,40,'Keerai',
'https://images.unsplash.com/photo-1576045057995-568f588f82fb'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Spinach');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Drumstick','Fresh drumsticks',70.00,30,'Vegetables',
'https://images.unsplash.com/photo-1601050690597-df0568f70950'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Drumstick');


-- =========================
-- FRUITS
-- =========================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Fresh Apple','Crisp fresh apples',140.00,40,'Fruits',
'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Fresh Apple');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Banana','Fresh ripe bananas',50.00,70,'Fruits',
'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Banana');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Mango','Sweet seasonal mangoes',120.00,45,'Fruits',
'https://images.unsplash.com/photo-1553279768-865429fa0078'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Mango');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Orange','Juicy fresh oranges',90.00,50,'Fruits',
'https://images.unsplash.com/photo-1547514701-42782101795e'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Orange');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Pineapple','Sweet fresh pineapple',80.00,30,'Fruits',
'https://images.unsplash.com/photo-1550258987-190a2d41a8ba'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Pineapple');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Watermelon','Fresh juicy watermelon',70.00,25,'Fruits',
'https://images.unsplash.com/photo-1563114773-84221bd62daa'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Watermelon');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Papaya','Fresh ripe papaya',65.00,30,'Fruits',
'https://images.unsplash.com/photo-1526318472351-c75fcf070305'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Papaya');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Guava','Fresh green guava',75.00,35,'Fruits',
'https://images.unsplash.com/photo-1536511132770-e5058c7e8c46'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Guava');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Pomegranate','Fresh juicy pomegranate',160.00,30,'Fruits',
'https://images.unsplash.com/photo-1541344999736-83eca272f6fc'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Pomegranate');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Grapes','Fresh seedless grapes',110.00,35,'Fruits',
'https://images.unsplash.com/photo-1537640538966-79f369143f8f'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Grapes');


-- =========================
-- GRAINS
-- =========================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Basmati Rice','Premium basmati rice',180.00,50,'Grains',
'https://images.unsplash.com/photo-1586201375761-83865001e31c'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Basmati Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Brown Rice','Healthy brown rice',150.00,45,'Grains',
'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Brown Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Raw Rice','Quality raw rice',75.00,70,'Grains',
'https://images.unsplash.com/photo-1536304929831-1a7c6f0d8d3b'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Raw Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Wheat','Whole wheat grains',65.00,50,'Grains',
'https://images.unsplash.com/photo-1509440159596-0249088772ff'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Wheat');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Millet','Healthy nutritious millet',90.00,45,'Grains',
'https://images.unsplash.com/photo-1592924357228-91a4daadcfea'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Millet');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Ragi','Nutritious finger millet',80.00,40,'Grains',
'https://images.unsplash.com/photo-1605000797499-95a51c5269ae'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Ragi');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Corn','Fresh sweet corn',55.00,35,'Grains',
'https://images.unsplash.com/photo-1551754655-cd27e38d2076'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Corn');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Oats','Healthy rolled oats',120.00,40,'Grains',
'https://images.unsplash.com/photo-1517093728432-20f5b8c2e1f7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Oats');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Quinoa','Premium quinoa grains',220.00,25,'Grains',
'https://images.unsplash.com/photo-1586201375761-83865001e31c'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Quinoa');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Poha','Fresh flattened rice',70.00,40,'Grains',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Poha');


-- =========================
-- PULSES
-- =========================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Toor Dal','Premium split pigeon peas',150.00,50,'Pulses',
'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Toor Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Moong Dal','Fresh yellow moong dal',140.00,45,'Pulses',
'https://images.unsplash.com/photo-1601050690597-df0568f70950'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Moong Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Chana Dal','Quality split chickpeas',110.00,50,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Chana Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Urad Dal','Premium black gram dal',130.00,45,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Urad Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Green Gram','Fresh whole green gram',125.00,40,'Pulses',
'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Green Gram');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Black Chickpeas','Healthy black chickpeas',120.00,40,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Black Chickpeas');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'White Chickpeas','Premium white chickpeas',130.00,40,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='White Chickpeas');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Masoor Dal','Fresh red lentils',135.00,40,'Pulses',
'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Masoor Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Rajma','Premium kidney beans',145.00,35,'Pulses',
'https://images.unsplash.com/photo-1551462147-ff29053bfc14'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Rajma');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cowpea','Fresh nutritious cowpeas',120.00,35,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cowpea');


-- =========================
-- SPICES
-- =========================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Red Chilli Powder','Spicy red chilli powder',90.00,50,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Red Chilli Powder');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Turmeric Powder','Pure turmeric powder',80.00,50,'Spices',
'https://images.unsplash.com/photo-1615485500704-8e990f9900f7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Turmeric Powder');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Black Pepper','Premium whole black pepper',180.00,30,'Spices',
'https://images.unsplash.com/photo-1599909533605-7f9d3f7b6e75'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Black Pepper');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cumin Seeds','Fresh aromatic cumin seeds',150.00,35,'Spices',
'https://images.unsplash.com/photo-1599909533605-7f9d3f7b6e75'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cumin Seeds');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Coriander Powder','Fresh coriander powder',75.00,45,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Coriander Powder');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cinnamon','Premium cinnamon sticks',160.00,25,'Spices',
'https://images.unsplash.com/photo-1601379329542-31c59347e2b4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cinnamon');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cardamom','Aromatic green cardamom',280.00,20,'Spices',
'https://images.unsplash.com/photo-1615485290382-441e4d049cb5'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cardamom');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cloves','Premium whole cloves',190.00,25,'Spices',
'https://images.unsplash.com/photo-1601379329542-31c59347e2b4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cloves');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Ginger','Fresh ginger root',90.00,40,'Spices',
'https://images.unsplash.com/photo-1615485500834-bc10199bc727'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Ginger');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Garlic','Fresh garlic bulbs',100.00,40,'Spices',
'https://images.unsplash.com/photo-1540148426945-6cf22a6b2383'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Garlic');