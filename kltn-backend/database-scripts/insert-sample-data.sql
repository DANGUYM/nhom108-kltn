-- =====================================================================================
-- SCRIPT INSERT DỮ LIỆU MẪU CHO HỆ THỐNG E-COMMERCE KLTN
-- =====================================================================================
-- Chạy script này sau khi đã insert categories và application đã khởi tạo
-- Thay đổi tên database cho phù hợp với hệ thống của bạn

USE defaultdb;
-- Alternative: USE your_actual_database_name;

-- =====================================================================================
-- 1. INSERT COLORS (Màu sắc)
-- =====================================================================================

INSERT INTO colors (name, description) VALUES
                                           ('Đỏ', 'Màu đỏ tươi sáng'),
                                           ('Xanh dương', 'Màu xanh dương đậm'),
                                           ('Xanh lá', 'Màu xanh lá cây tự nhiên'),
                                           ('Đen', 'Màu đen cổ điển'),
                                           ('Trắng', 'Màu trắng tinh khiết'),
                                           ('Xám', 'Màu xám trung tính'),
                                           ('Hồng', 'Màu hồng nhẹ nhàng'),
                                           ('Vàng', 'Màu vàng tươi sáng'),
                                           ('Nâu', 'Màu nâu đất tự nhiên'),
                                           ('Tím', 'Màu tím thời trang'),
                                           ('Cam', 'Màu cam năng động'),
                                           ('Be', 'Màu be nhẹ nhàng'),
                                           ('Xanh navy', 'Màu xanh navy lịch lãm'),
                                           ('Xanh mint', 'Màu xanh mint tươi mát'),
                                           ('Hồng pastel', 'Màu hồng pastel dịu dàng');

-- =====================================================================================
-- 2. INSERT SIZES (Kích thước)
-- =====================================================================================

INSERT INTO sizes (name, description) VALUES
                                          ('XS', 'Extra Small - Rất nhỏ'),
                                          ('S', 'Small - Nhỏ'),
                                          ('M', 'Medium - Vừa'),
                                          ('L', 'Large - Lớn'),
                                          ('XL', 'Extra Large - Rất lớn'),
                                          ('XXL', 'Double Extra Large - Cực lớn'),
                                          ('XXXL', '3XL - Cực kỳ lớn'),
                                          ('Free Size', 'Một size phù hợp nhiều dáng người'),
                                          ('38', 'Size giày 38'),
                                          ('39', 'Size giày 39'),
                                          ('40', 'Size giày 40'),
                                          ('41', 'Size giày 41'),
                                          ('42', 'Size giày 42'),
                                          ('43', 'Size giày 43'),
                                          ('44', 'Size giày 44');

-- =====================================================================================
-- 3. INSERT BRANDS (Thương hiệu)
-- =====================================================================================

INSERT INTO brands (name, description, logo_url) VALUES
                                                     ('Nike', 'Just Do It - Thương hiệu thể thao hàng đầu thế giới', 'https://kltn-bucket.s3.amazonaws.com/brands/nike-logo.png'),
                                                     ('Adidas', 'Impossible is Nothing - Thương hiệu thể thao Đức', 'https://kltn-bucket.s3.amazonaws.com/brands/adidas-logo.png'),
                                                     ('Puma', 'Forever Faster - Thương hiệu thể thao năng động', 'https://kltn-bucket.s3.amazonaws.com/brands/puma-logo.png'),
                                                     ('Zara', 'Fast fashion - Thời trang nhanh từ Tây Ban Nha', 'https://kltn-bucket.s3.amazonaws.com/brands/zara-logo.png'),
                                                     ('H&M', 'Fashion and quality at the best price', 'https://kltn-bucket.s3.amazonaws.com/brands/hm-logo.png'),
                                                     ('Uniqlo', 'LifeWear - Quần áo cho cuộc sống', 'https://kltn-bucket.s3.amazonaws.com/brands/uniqlo-logo.png'),
                                                     ('Coolmate', 'Thương hiệu thời trang nam Việt Nam', 'https://kltn-bucket.s3.amazonaws.com/brands/coolmate-logo.png'),
                                                     ('Yame', 'Thương hiệu thời trang trẻ Việt Nam', 'https://kltn-bucket.s3.amazonaws.com/brands/yame-logo.png'),
                                                     ('Calvin Klein', 'Thương hiệu thời trang cao cấp Mỹ', 'https://kltn-bucket.s3.amazonaws.com/brands/ck-logo.png'),
                                                     ('Tommy Hilfiger', 'Classic American Cool', 'https://kltn-bucket.s3.amazonaws.com/brands/tommy-logo.png'),
                                                     ('Polo Ralph Lauren', 'Timeless style, authentic luxury', 'https://kltn-bucket.s3.amazonaws.com/brands/polo-logo.png'),
                                                     ('Lacoste', 'Life is a beautiful sport', 'https://kltn-bucket.s3.amazonaws.com/brands/lacoste-logo.png'),
                                                     ('Converse', 'Chuck Taylor All Star - Biểu tượng thời trang', 'https://kltn-bucket.s3.amazonaws.com/brands/converse-logo.png'),
                                                     ('Vans', 'Off The Wall - Thương hiệu skateboard', 'https://kltn-bucket.s3.amazonaws.com/brands/vans-logo.png'),
                                                     ('Local Brand', 'Thương hiệu nội địa chất lượng cao', 'https://kltn-bucket.s3.amazonaws.com/brands/local-logo.png');

-- =====================================================================================
-- 4. INSERT PRODUCTS (Sản phẩm) - Dựa trên categories đã tạo
-- =====================================================================================

-- Sản phẩm Thời trang Nam (category_id = 1-11 for subcategories)
INSERT INTO products (name, description, base_price, status, category_id, brand_id) VALUES
-- Áo T-shirt Nam (category_id = 9)
('Áo T-shirt Nike Dri-FIT', 'Áo thun nam Nike công nghệ Dri-FIT thấm hút mồ hôi tốt', 450000, 'ACTIVE', 9, 1),
('Áo T-shirt Adidas 3-Stripes', 'Áo thun nam Adidas cổ điển với 3 sọc truyền thống', 420000, 'ACTIVE', 9, 2),
('Áo T-shirt Coolmate Premium', 'Áo thun nam Coolmate chất liệu cotton cao cấp', 299000, 'ACTIVE', 9, 7),
('Áo T-shirt Local Brand Minimalist', 'Áo thun nam phong cách tối giản, chất liệu mềm mại', 250000, 'ACTIVE', 9, 15),

-- Áo Polo Nam (category_id = 10)
('Áo Polo Lacoste Classic', 'Áo polo nam Lacoste cổ điển với logo cá sấu', 1200000, 'ACTIVE', 10, 12),
('Áo Polo Ralph Lauren', 'Áo polo nam Ralph Lauren chất liệu pique cotton', 1500000, 'ACTIVE', 10, 11),
('Áo Polo Uniqlo Dry Pique', 'Áo polo nam Uniqlo công nghệ Dry thấm hút tốt', 490000, 'ACTIVE', 10, 6),

-- Quần Jeans Nam (category_id = 14)
('Quần Jeans Slim Fit', 'Quần jeans nam form slim fit thời trang', 599000, 'ACTIVE', 14, 15),
('Quần Jeans Straight Fit', 'Quần jeans nam form straight cổ điển', 549000, 'ACTIVE', 14, 15),
('Quần Jeans Ripped', 'Quần jeans nam rách gối phong cách street style', 699000, 'ACTIVE', 14, 15),

-- Giày Sneaker (category_id = 32)
('Nike Air Force 1', 'Giày sneaker Nike Air Force 1 trắng cổ điển', 2500000, 'ACTIVE', 32, 1),
('Adidas Stan Smith', 'Giày sneaker Adidas Stan Smith xanh lá iconic', 2200000, 'ACTIVE', 32, 2),
('Converse Chuck Taylor All Star', 'Giày sneaker Converse cổ thấp đen trắng', 1500000, 'ACTIVE', 32, 13),
('Vans Old Skool', 'Giày sneaker Vans Old Skool với sidestripe đặc trưng', 1800000, 'ACTIVE', 32, 14),

-- Sản phẩm Thời trang Nữ
('Áo T-shirt Nữ Basic', 'Áo thun nữ basic nhiều màu sắc', 199000, 'ACTIVE', 20, 8),
('Váy Midi Hoa Nhí', 'Váy midi nữ họa tiết hoa nhí dịu dàng', 399000, 'ACTIVE', 24, 4),
('Quần Jeans Skinny Nữ', 'Quần jeans nữ form skinny ôm dáng', 499000, 'ACTIVE', 26, 5),
('Áo Khoác Blazer Nữ', 'Áo khoác blazer nữ công sở thanh lịch', 799000, 'ACTIVE', 23, 4),

-- Sản phẩm Trẻ em
('Áo T-shirt Trẻ Em', 'Áo thun trẻ em họa tiết hoạt hình đáng yêu', 150000, 'ACTIVE', 31, 15),
('Quần Short Trẻ Em', 'Quần short trẻ em chất liệu cotton thoáng mát', 120000, 'ACTIVE', 31, 15),

-- Túi xách & Balo
('Balo Laptop 15 inch', 'Balo laptop chống nước, ngăn chứa nhiều', 699000, 'ACTIVE', 49, 15),
('Túi Xách Tay Nữ', 'Túi xách tay nữ da PU cao cấp', 399000, 'ACTIVE', 44, 15),
('Balo Du Lịch 30L', 'Balo du lịch 30 lít đa năng', 899000, 'ACTIVE', 50, 15),

-- Phụ kiện
('Nón Snapback', 'Nón snapback thêu logo thời trang', 299000, 'ACTIVE', 58, 15),
('Thắt Lưng Da Nam', 'Thắt lưng nam da thật mặt khóa inox', 449000, 'ACTIVE', 60, 15),
('Kính Mát UV400', 'Kính mát chống tia UV hiệu quả', 199000, 'ACTIVE', 56, 15);

-- =====================================================================================
-- 5. INSERT PRODUCT IMAGES (Hình ảnh sản phẩm)
-- =====================================================================================

-- Hình ảnh cho Nike Air Force 1 (product_id = 11)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-af1-main.jpg', true, 0, 11),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-af1-side.jpg', false, 1, 11),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-af1-back.jpg', false, 2, 11),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-af1-sole.jpg', false, 3, 11);

-- Hình ảnh cho Adidas Stan Smith (product_id = 12)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/adidas-stansmith-main.jpg', true, 0, 12),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/adidas-stansmith-side.jpg', false, 1, 12),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/adidas-stansmith-back.jpg', false, 2, 12);

-- Hình ảnh cho Áo T-shirt Nike (product_id = 1)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-tshirt-main.jpg', true, 0, 1),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/nike-tshirt-back.jpg', false, 1, 1);

-- Hình ảnh cho Váy Midi (product_id = 16)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/midi-dress-main.jpg', true, 0, 16),
                                                                            ('https://kltn-bucket.s3.amazonaws.com/products/midi-dress-detail.jpg', false, 1, 16);

-- =====================================================================================
-- 6. INSERT PRODUCT VARIANTS (Biến thể sản phẩm)
-- =====================================================================================

-- Variants cho Nike Air Force 1 (product_id = 11)
INSERT INTO product_variants (sku, price, stock_quantity, material, image_url, product_id, size_id, color_id) VALUES
                                                                                                                  ('NIKE-AF1-WHT-38', 2500000, 20, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-white-38.jpg', 11, 9, 5),
                                                                                                                  ('NIKE-AF1-WHT-39', 2500000, 25, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-white-39.jpg', 11, 10, 5),
                                                                                                                  ('NIKE-AF1-WHT-40', 2500000, 30, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-white-40.jpg', 11, 11, 5),
                                                                                                                  ('NIKE-AF1-WHT-41', 2500000, 28, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-white-41.jpg', 11, 12, 5),
                                                                                                                  ('NIKE-AF1-WHT-42', 2500000, 22, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-white-42.jpg', 11, 13, 5),
                                                                                                                  ('NIKE-AF1-BLK-40', 2500000, 15, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-black-40.jpg', 11, 11, 4),
                                                                                                                  ('NIKE-AF1-BLK-41', 2500000, 18, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-black-41.jpg', 11, 12, 4),
                                                                                                                  ('NIKE-AF1-BLK-42', 2500000, 20, 'Da synthetic + lưới', 'https://kltn-bucket.s3.amazonaws.com/variants/nike-af1-black-42.jpg', 11, 13, 4);

-- Variants cho Adidas Stan Smith (product_id = 12)
INSERT INTO product_variants (sku, price, stock_quantity, material, image_url, product_id, size_id, color_id) VALUES
                                                                                                                  ('ADIDAS-SS-GRN-39', 2200000, 15, 'Da thật + cao su', 'https://kltn-bucket.s3.amazonaws.com/variants/adidas-ss-green-39.jpg', 12, 10, 3),
                                                                                                                  ('ADIDAS-SS-GRN-40', 2200000, 25, 'Da thật + cao su', 'https://kltn-bucket.s3.amazonaws.com/variants/adidas-ss-green-40.jpg', 12, 11, 3),
                                                                                                                  ('ADIDAS-SS-GRN-41', 2200000, 20, 'Da thật + cao su', 'https://kltn-bucket.s3.amazonaws.com/variants/adidas-ss-green-41.jpg', 12, 12, 3),
                                                                                                                  ('ADIDAS-SS-GRN-42', 2200000, 18, 'Da thật + cao su', 'https://kltn-bucket.s3.amazonaws.com/variants/adidas-ss-green-42.jpg', 12, 13, 3);

-- Variants cho Áo T-shirt Nike (product_id = 1)
INSERT INTO product_variants (sku, price, stock_quantity, material, image_url, product_id, size_id, color_id) VALUES
                                                                                                                  ('NIKE-TSHIRT-BLK-S', 450000, 50, '100% Cotton Dri-FIT', NULL, 1, 2, 4),
                                                                                                                  ('NIKE-TSHIRT-BLK-M', 450000, 60, '100% Cotton Dri-FIT', NULL, 1, 3, 4),
                                                                                                                  ('NIKE-TSHIRT-BLK-L', 450000, 45, '100% Cotton Dri-FIT', NULL, 1, 4, 4),
                                                                                                                  ('NIKE-TSHIRT-BLK-XL', 450000, 30, '100% Cotton Dri-FIT', NULL, 1, 5, 4),
                                                                                                                  ('NIKE-TSHIRT-WHT-S', 450000, 40, '100% Cotton Dri-FIT', NULL, 1, 2, 5),
                                                                                                                  ('NIKE-TSHIRT-WHT-M', 450000, 55, '100% Cotton Dri-FIT', NULL, 1, 3, 5),
                                                                                                                  ('NIKE-TSHIRT-WHT-L', 450000, 35, '100% Cotton Dri-FIT', NULL, 1, 4, 5),
                                                                                                                  ('NIKE-TSHIRT-RED-M', 450000, 25, '100% Cotton Dri-FIT', NULL, 1, 3, 1),
                                                                                                                  ('NIKE-TSHIRT-RED-L', 450000, 20, '100% Cotton Dri-FIT', NULL, 1, 4, 1);

-- Variants cho Quần Jeans (product_id = 8)
INSERT INTO product_variants (sku, price, stock_quantity, material, image_url, product_id, size_id, color_id) VALUES
                                                                                                                  ('JEANS-SLIM-BLUE-29', 599000, 30, '98% Cotton, 2% Elastane', NULL, 8, 2, 2),
                                                                                                                  ('JEANS-SLIM-BLUE-30', 599000, 35, '98% Cotton, 2% Elastane', NULL, 8, 3, 2),
                                                                                                                  ('JEANS-SLIM-BLUE-32', 599000, 40, '98% Cotton, 2% Elastane', NULL, 8, 4, 2),
                                                                                                                  ('JEANS-SLIM-BLUE-34', 599000, 25, '98% Cotton, 2% Elastane', NULL, 8, 5, 2),
                                                                                                                  ('JEANS-SLIM-BLK-30', 599000, 20, '98% Cotton, 2% Elastane', NULL, 8, 3, 4),
                                                                                                                  ('JEANS-SLIM-BLK-32', 599000, 25, '98% Cotton, 2% Elastane', NULL, 8, 4, 4);

-- =====================================================================================
-- 8. INSERT SAMPLE CARTS (Giỏ hàng mẫu)
-- =====================================================================================

-- Tạo cart cho từng user (chỉ cho các user ID đã tồn tại)
INSERT INTO carts (user_id) VALUES
(1), (2);

-- =====================================================================================
-- 9. INSERT SAMPLE CART ITEMS (Sản phẩm trong giỏ hàng)
-- =====================================================================================

-- Cart items cho user 1
INSERT INTO cart_items (quantity, cart_id, product_id)
SELECT 2, c.id, 1 FROM carts c WHERE c.user_id = 1
UNION ALL
SELECT 1, c.id, 11 FROM carts c WHERE c.user_id = 1
UNION ALL
SELECT 1, c.id, 21 FROM carts c WHERE c.user_id = 1;

-- Cart items cho user 2
INSERT INTO cart_items (quantity, cart_id, product_id)
SELECT 1, c.id, 16 FROM carts c WHERE c.user_id = 2
UNION ALL
SELECT 2, c.id, 15 FROM carts c WHERE c.user_id = 2
UNION ALL
SELECT 1, c.id, 24 FROM carts c WHERE c.user_id = 2;

-- =====================================================================================
-- 10. INSERT SAMPLE REVIEWS (Đánh giá sản phẩm)
-- =====================================================================================

INSERT INTO reviews (rating, comment, product_id, user_id) VALUES
-- Reviews cho Nike Air Force 1 (product_id = 11)
(5, 'Giày rất đẹp và chất lượng, đi rất êm chân. Giao hàng nhanh!', 11, 1),
(4, 'Giày đẹp nhưng hơi chật, nên lên size. Nhìn chung ok.', 11, 2),

-- Reviews cho Áo T-shirt Nike (product_id = 1)
(5, 'Áo đẹp, chất liệu mềm mại, thấm hút mồ hôi tốt', 1, 2),
(4, 'Form áo vừa, màu đẹp. Giá hơi cao nhưng chất lượng xứng đáng', 1, 1),

-- Reviews cho Adidas Stan Smith (product_id = 12)
(5, 'Giày kinh điển, đi được nhiều năm vẫn đẹp', 12, 1),
(4, 'Đẹp và bền, nhưng cần thời gian break-in', 12, 2),

-- Reviews cho Váy Midi (product_id = 16)
(5, 'Váy đẹp lắm, chất vải mềm mại, họa tiết xinh xắn', 16, 2),
(4, 'Đẹp nhưng hơi dài với mình. Chất lượng ok', 16, 1),

-- Reviews cho Coolmate T-shirt (product_id = 3)
(4, 'Áo đẹp, giá hợp lý. Chất liệu cotton thoáng mát', 3, 1),
(5, 'Local brand nhưng chất lượng không thua kém gì hàng ngoại', 3, 2),

-- Reviews cho Balo Laptop (product_id = 20)
(5, 'Balo rộng rãi, nhiều ngăn tiện lợi. Chất liệu chống nước tốt', 20, 2),
(4, 'Đẹp và tiện dụng, phù hợp đi làm', 20, 1);

-- =====================================================================================
-- 11. VERIFICATION QUERIES (Kiểm tra dữ liệu)
-- =====================================================================================

-- Kiểm tra số lượng dữ liệu đã insert
-- SELECT 'Colors' as entity, COUNT(*) as count FROM colors
-- UNION ALL
-- SELECT 'Sizes' as entity, COUNT(*) as count FROM sizes
-- UNION ALL
-- SELECT 'Brands' as entity, COUNT(*) as count FROM brands
-- UNION ALL
-- SELECT 'Products' as entity, COUNT(*) as count FROM products
-- UNION ALL
-- SELECT 'Product Images' as entity, COUNT(*) as count FROM product_images
-- UNION ALL
-- SELECT 'Product Variants' as entity, COUNT(*) as count FROM product_variants
-- UNION ALL
-- SELECT 'Users' as entity, COUNT(*) as count FROM users
-- UNION ALL
-- SELECT 'Cart Items' as entity, COUNT(*) as count FROM cart_items
-- UNION ALL
-- SELECT 'Reviews' as entity, COUNT(*) as count FROM reviews;

-- Kiểm tra sản phẩm có đầy đủ thông tin
-- SELECT
--     p.name as product_name,
--     c.name as category_name,
--     b.name as brand_name,
--     COUNT(DISTINCT pi.id) as image_count,
--     COUNT(DISTINCT pv.id) as variant_count,
--     AVG(r.rating) as avg_rating,
--     COUNT(DISTINCT r.id) as review_count
-- FROM products p
-- LEFT JOIN categories c ON p.category_id = c.id
-- LEFT JOIN brands b ON p.brand_id = b.id
-- LEFT JOIN product_images pi ON p.id = pi.product_id
-- LEFT JOIN product_variants pv ON p.id = pv.product_id
-- LEFT JOIN reviews r ON p.id = r.product_id
-- GROUP BY p.id, p.name, c.name, b.name
-- ORDER BY p.id;

-- =====================================================================================
-- NOTES:
-- 1. Tất cả passwords của users cần được hash thông qua API đăng ký
-- 2. Các URL hình ảnh là ví dụ, cần thay thế bằng URL thực tế
-- 3. Dữ liệu này phục vụ mục đích demo và testing
-- 4. Trong production, nên tạo dữ liệu thông qua API để đảm bảo validation
-- 5. Có thể adjust giá cả và số lượng theo nhu cầu thực tế
-- =====================================================================================
