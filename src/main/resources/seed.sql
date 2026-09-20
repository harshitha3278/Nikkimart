-- ============================================
-- NIKKIMART SEED DATA
-- ============================================

-- ============================================
-- USERS
-- Admin: admin@nikkimart.com / Admin@123
-- Seller: seller@nikkimart.com / Seller@123
-- Buyer: buyer@nikkimart.com / Buyer@123
-- ============================================

INSERT INTO users (name, email, password_hash, role)
SELECT 'Admin',
       'admin@nikkimart.com',
       '$2a$10$kiD8/iwu9rx7giMwjMaTf.3VhzCU1nwn55DQIOImK/wMHUIV1oa6O',
       'ADMIN'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'admin@nikkimart.com'
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Seller One',
       'seller@nikkimart.com',
       '$2a$10$NwlzQ59aidij195vMQQzl.SK9ZhpZoja.DXXmj3PEHphKHtRlg/Wq',
       'SELLER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'seller@nikkimart.com'
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Buyer One',
       'buyer@nikkimart.com',
       '$2a$10$Fr1.6E.5iFDA6oL7hTbvu.09GscLyDOlPKmkAmC.DwOgPUwYGwr6q',
       'BUYER'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'buyer@nikkimart.com'
);


-- ============================================
-- VEGETABLES
-- ============================================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Spinach','Fresh green spinach leaves',35.00,50,'Vegetables',
'https://images.unsplash.com/photo-1576045057995-568f588f82fb'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Spinach');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Tomato','Fresh red farm tomatoes',40.00,60,'Vegetables',
'https://images.unsplash.com/photo-1546094096-0df4bcaaa337'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Tomato');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Potato','Fresh quality potatoes',45.00,70,'Vegetables',
'https://images.unsplash.com/photo-1518977676601-b53f82aba655'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Potato');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Carrot','Fresh crunchy carrots',50.00,55,'Vegetables',
'https://images.unsplash.com/photo-1445282768818-728615cc910a'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Carrot');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Onion','Fresh farm onions',38.00,80,'Vegetables',
'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Onion');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Brinjal','Fresh purple brinjals',42.00,45,'Vegetables',
'https://images.unsplash.com/photo-1604249600661-6d5d9d6f3d12'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Brinjal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cucumber','Fresh crisp cucumbers',35.00,55,'Vegetables',
'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cucumber');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Green Beans','Fresh tender green beans',60.00,40,'Vegetables',
'https://images.unsplash.com/photo-1567375698348-5d9d5ae99de0'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Green Beans');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Beetroot','Fresh nutritious beetroot',55.00,45,'Vegetables',
'https://images.unsplash.com/photo-1593113646773-028c64a8f1b8'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Beetroot');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Drumstick','Fresh moringa drumsticks',70.00,35,'Vegetables',
'https://images.unsplash.com/photo-1599909533730-f9d9d8f2a1d4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Drumstick');


-- ============================================
-- FRUITS
-- ============================================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Apple','Fresh juicy apples',180.00,40,'Fruits',
'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Apple');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Banana','Fresh naturally sweet bananas',60.00,70,'Fruits',
'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Banana');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Mango','Sweet juicy fresh mangoes',150.00,45,'Fruits',
'https://images.unsplash.com/photo-1553279768-865429fa0078'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Mango');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Orange','Fresh juicy oranges',100.00,50,'Fruits',
'https://images.unsplash.com/photo-1547514701-42782101795e'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Orange');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Pomegranate','Fresh ruby red pomegranates',180.00,35,'Fruits',
'https://images.unsplash.com/photo-1541344999736-83eca272f6fc'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Pomegranate');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Papaya','Fresh ripe papaya',80.00,40,'Fruits',
'https://images.unsplash.com/photo-1526318472351-c75fcf070305'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Papaya');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Pineapple','Fresh tropical pineapple',90.00,30,'Fruits',
'https://images.unsplash.com/photo-1550258987-190a2d41a8ba'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Pineapple');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Watermelon','Fresh juicy watermelon',70.00,35,'Fruits',
'https://images.unsplash.com/photo-1563114773-84221bd62daa'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Watermelon');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Guava','Fresh green guavas',90.00,45,'Fruits',
'https://images.unsplash.com/photo-1536511132770-e5058c7e8c46'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Guava');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Grapes','Fresh sweet green grapes',120.00,40,'Fruits',
'https://images.unsplash.com/photo-1537640538966-79f369143f8f'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Grapes');


-- ============================================
-- GRAINS
-- ============================================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Basmati Rice','Premium long grain basmati rice',140.00,50,'Grains',
'https://images.unsplash.com/photo-1586201375761-83865001e31c'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Basmati Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Brown Rice','Healthy whole grain brown rice',120.00,45,'Grains',
'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Brown Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Ponni Rice','Traditional South Indian ponni rice',75.00,60,'Grains',
'https://images.unsplash.com/photo-1586201375761-83865001e31c'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Ponni Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Sona Masoori Rice','Light and aromatic rice',80.00,55,'Grains',
'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Sona Masoori Rice');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Wheat','Premium whole wheat grains',65.00,60,'Grains',
'https://images.unsplash.com/photo-1509440159596-0249088772ff'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Wheat');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Millet','Nutritious traditional millet',100.00,45,'Grains',
'https://images.unsplash.com/photo-1596797038530-2c107229654b'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Millet');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Ragi','Healthy finger millet grains',90.00,50,'Grains',
'https://images.unsplash.com/photo-1600181568314-4b1f5f9c4c7d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Ragi');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Quinoa','Protein-rich quinoa grains',220.00,30,'Grains',
'https://images.unsplash.com/photo-1586201375761-83865001e31c'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Quinoa');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Barley','Nutritious whole barley grains',110.00,35,'Grains',
'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Barley');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Oats','Healthy whole grain oats',130.00,40,'Grains',
'https://images.unsplash.com/photo-1517093157656-b9eccef91cb1'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Oats');


-- ============================================
-- PULSES
-- ============================================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Toor Dal','Premium yellow split pigeon peas',150.00,50,'Pulses',
'https://images.unsplash.com/photo-1585996743299-6e0d9a9c7c91'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Toor Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Moong Dal','Healthy split green gram',140.00,45,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Moong Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Chana Dal','Fresh split chickpeas',120.00,55,'Pulses',
'https://images.unsplash.com/photo-1585996743299-6e0d9a9c7c91'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Chana Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Urad Dal','Premium black gram dal',145.00,50,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Urad Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Masoor Dal','Fresh red lentils',130.00,45,'Pulses',
'https://images.unsplash.com/photo-1601050690597-df0568f70950'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Masoor Dal');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Green Gram','Whole green gram pulses',135.00,40,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Green Gram');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Black Chickpeas','Healthy whole black chickpeas',125.00,45,'Pulses',
'https://images.unsplash.com/photo-1585996743299-6e0d9a9c7c91'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Black Chickpeas');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Rajma','Premium red kidney beans',160.00,35,'Pulses',
'https://images.unsplash.com/photo-1551462147-ff29053bfc14'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Rajma');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'White Chickpeas','Premium kabuli chickpeas',150.00,40,'Pulses',
'https://images.unsplash.com/photo-1585996743299-6e0d9a9c7c91'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='White Chickpeas');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cowpeas','Nutritious black eyed peas',130.00,40,'Pulses',
'https://images.unsplash.com/photo-1515543904379-3d757afe72e4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cowpeas');


-- ============================================
-- SPICES
-- ============================================

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Turmeric','Pure natural turmeric powder',90.00,50,'Spices',
'https://images.unsplash.com/photo-1615485500704-8e990f9900f7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Turmeric');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Red Chilli','Premium dried red chillies',120.00,45,'Spices',
'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Red Chilli');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Black Pepper','Premium whole black peppercorns',180.00,35,'Spices',
'https://images.unsplash.com/photo-1599909533730-f9d9d8f2a1d4'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Black Pepper');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cumin','Fresh aromatic cumin seeds',160.00,40,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cumin');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Coriander','Aromatic coriander seeds',110.00,45,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Coriander');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cardamom','Premium green cardamom pods',350.00,25,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cardamom');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cloves','Premium aromatic cloves',280.00,30,'Spices',
'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cloves');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Cinnamon','Natural aromatic cinnamon sticks',200.00,35,'Spices',
'https://images.unsplash.com/photo-1608797178974-15b35a64ede9'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Cinnamon');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Mustard Seeds','Fresh yellow mustard seeds',80.00,50,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Mustard Seeds');

INSERT INTO products
(seller_id,name,description,price,stock_qty,category,image_url)
SELECT 2,'Fenugreek','Natural aromatic fenugreek seeds',95.00,40,'Spices',
'https://images.unsplash.com/photo-1596040033229-a9821ebd058d'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Fenugreek');