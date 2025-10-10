-- =====================================================================================
-- SCRIPT INSERT DỮ LIỆU MẪU CHO HỆ THỐNG E-COMMERCE KLTN
-- =====================================================================================
-- Chạy script này sau khi đã insert categories và application đã khởi tạo
-- Thay đổi tên database cho phù hợp với hệ thống của bạn

USE defaultdb;
-- Alternative: USE your_actual_database_name;



-- =============================================================================
-- INSERT ROOT CATEGORIES (Parent Categories)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Thời trang nam', 'Các sản phẩm thời trang dành cho nam giới', NULL),
                                                          ('Thời trang nữ', 'Các sản phẩm thời trang dành cho nữ giới', NULL),
                                                          ('Thời trang trẻ em', 'Các sản phẩm thời trang dành cho trẻ em', NULL),
                                                          ('Giày dép', 'Các loại giày dép cho nam, nữ và trẻ em', NULL),
                                                          ('Túi xách & Balo', 'Túi xách, balo và các phụ kiện đựng đồ', NULL),
                                                          ('Phụ kiện thời trang', 'Các phụ kiện thời trang như trang sức, kính mắt, nón...', NULL),
                                                          ('Đồ thể thao', 'Trang phục và phụ kiện thể thao', NULL),
                                                          ('Thương hiệu nổi tiếng', 'Sản phẩm từ các thương hiệu nổi tiếng', NULL);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "THỜI TRANG NAM" (ID will be 1)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Áo T-shirt Nam', 'Áo thun nam các loại', 1),
                                                          ('Áo Polo Nam', 'Áo polo nam thời trang', 1),
                                                          ('Áo sơ mi Nam', 'Áo sơ mi nam công sở và thời trang', 1),
                                                          ('Áo hoodie Nam', 'Áo hoodie nam phong cách trẻ trung', 1),
                                                          ('Áo khoác Nam', 'Áo khoác nam các loại', 1),
                                                          ('Quần jeans Nam', 'Quần jeans nam thời trang', 1),
                                                          ('Quần short Nam', 'Quần short nam mùa hè', 1),
                                                          ('Quần tây Nam', 'Quần tây nam công sở', 1),
                                                          ('Đồ lót Nam', 'Đồ lót nam', 1),
                                                          ('Đồ ngủ Nam', 'Đồ ngủ nam thoải mái', 1),
                                                          ('Áo vest Nam', 'Áo vest nam lịch lãm', 1);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "THỜI TRANG NỮ" (ID will be 2)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Áo T-shirt Nữ', 'Áo thun nữ các loại', 2),
                                                          ('Áo crop top', 'Áo crop top nữ thời trang', 2),
                                                          ('Áo hoodie Nữ', 'Áo hoodie nữ phong cách trẻ trung', 2),
                                                          ('Áo khoác Nữ', 'Áo khoác nữ các loại', 2),
                                                          ('Váy ngắn', 'Váy ngắn nữ thời trang', 2),
                                                          ('Váy dài', 'Váy dài nữ thanh lịch', 2),
                                                          ('Quần jeans Nữ', 'Quần jeans nữ thời trang', 2),
                                                          ('Quần legging', 'Quần legging nữ co dãn', 2),
                                                          ('Quần short Nữ', 'Quần short nữ mùa hè', 2),
                                                          ('Đồ lót Nữ', 'Đồ lót nữ', 2),
                                                          ('Đồ ngủ Nữ', 'Đồ ngủ nữ thoải mái', 2);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "THỜI TRANG TRẺ EM" (ID will be 3)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Bé trai (0-2 tuổi)', 'Trang phục cho bé trai từ 0-2 tuổi', 3),
                                                          ('Bé gái (0-2 tuổi)', 'Trang phục cho bé gái từ 0-2 tuổi', 3),
                                                          ('Trẻ em trai (3-14 tuổi)', 'Trang phục cho trẻ em trai từ 3-14 tuổi', 3),
                                                          ('Trẻ em gái (3-14 tuổi)', 'Trang phục cho trẻ em gái từ 3-14 tuổi', 3),
                                                          ('Thiếu niên (15-18 tuổi)', 'Trang phục cho thiếu niên từ 15-18 tuổi', 3),
                                                          ('Đồ ngủ trẻ em', 'Đồ ngủ cho trẻ em', 3),
                                                          ('Đồ lót trẻ em', 'Đồ lót cho trẻ em', 3),
                                                          ('Trang phục học sinh', 'Đồng phục và trang phục học sinh', 3);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "GIÀY DÉP" (ID will be 4)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Giày sneaker', 'Giày sneaker thể thao thời trang', 4),
                                                          ('Giày chạy bộ', 'Giày chạy bộ chuyên dụng', 4),
                                                          ('Giày tập gym', 'Giày tập gym và fitness', 4),
                                                          ('Giày bóng đá', 'Giày bóng đá chuyên dụng', 4),
                                                          ('Giày tennis', 'Giày tennis chuyên dụng', 4),
                                                          ('Giày cao gót', 'Giày cao gót nữ thời trang', 4),
                                                          ('Giày búp bê', 'Giày búp bê nữ thanh lịch', 4),
                                                          ('Giày boot', 'Giày boot nam nữ', 4),
                                                          ('Dép', 'Dép các loại', 4),
                                                          ('Giày tây', 'Giày tây nam công sở', 4),
                                                          ('Giày lười', 'Giày lười thoải mái', 4);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "TÚI XÁCH & BALO" (ID will be 5)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Túi xách tay', 'Túi xách tay nữ thời trang', 5),
                                                          ('Túi đeo chéo', 'Túi đeo chéo nam nữ', 5),
                                                          ('Túi tote', 'Túi tote đa năng', 5),
                                                          ('Túi clutch', 'Túi clutch nữ sang trọng', 5),
                                                          ('Balo laptop', 'Balo đựng laptop công sở', 5),
                                                          ('Balo du lịch', 'Balo du lịch đa năng', 5),
                                                          ('Balo học sinh', 'Balo cho học sinh sinh viên', 5),
                                                          ('Túi thể thao', 'Túi đựng đồ thể thao', 5),
                                                          ('Ví nam', 'Ví nam các loại', 5),
                                                          ('Ví nữ', 'Ví nữ thời trang', 5),
                                                          ('Vali', 'Vali du lịch các size', 5);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "PHỤ KIỆN THỜI TRANG" (ID will be 6)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Trang sức', 'Trang sức nam nữ', 6),
                                                          ('Kính mát', 'Kính mát thời trang', 6),
                                                          ('Kính cận', 'Kính cận và gọng kính', 6),
                                                          ('Nón', 'Nón các loại', 6),
                                                          ('Khăn', 'Khăn thời trang', 6),
                                                          ('Thắt lưng', 'Thắt lưng nam nữ', 6),
                                                          ('Găng tay', 'Găng tay thời trang', 6),
                                                          ('Tất vớ', 'Tất vớ nam nữ', 6),
                                                          ('Cà vạt', 'Cà vạt nam công sở', 6),
                                                          ('Kẹp tóc', 'Kẹp tóc và phụ kiện tóc', 6),
                                                          ('Khuyên tai', 'Khuyên tai thời trang', 6);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "ĐỒ THỂ THAO" (ID will be 7)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Áo thể thao', 'Áo thể thao nam nữ', 7),
                                                          ('Quần thể thao', 'Quần thể thao nam nữ', 7),
                                                          ('Đồ tập gym', 'Trang phục tập gym', 7),
                                                          ('Đồ yoga', 'Trang phục tập yoga', 7),
                                                          ('Đồ bơi', 'Đồ bơi nam nữ', 7),
                                                          ('Đồ chạy bộ', 'Trang phục chạy bộ', 7),
                                                          ('Đồ bóng đá', 'Trang phục bóng đá', 7),
                                                          ('Đồ tennis', 'Trang phục tennis', 7),
                                                          ('Đồ basketball', 'Trang phục bóng rổ', 7),
                                                          ('Băng đô', 'Băng đô thể thao', 7),
                                                          ('Khăn thể thao', 'Khăn thể thao', 7);

-- =============================================================================
-- INSERT SUBCATEGORIES FOR "THƯƠNG HIỆU NỔI TIẾNG" (ID will be 8)
-- =============================================================================

INSERT INTO categories (name, description, parent_id) VALUES
                                                          ('Nike', 'Sản phẩm thương hiệu Nike', 8),
                                                          ('Adidas', 'Sản phẩm thương hiệu Adidas', 8),
                                                          ('Puma', 'Sản phẩm thương hiệu Puma', 8),
                                                          ('Zara', 'Sản phẩm thương hiệu Zara', 8),
                                                          ('Coolmate', 'Sản phẩm thương hiệu Coolmate', 8),
                                                          ('Yame', 'Sản phẩm thương hiệu Yame', 8),
                                                          ('Calvin Klein', 'Sản phẩm thương hiệu Calvin Klein', 8),
                                                          ('Tommy Hilfiger', 'Sản phẩm thương hiệu Tommy Hilfiger', 8),
                                                          ('Polo Ralph Lauren', 'Sản phẩm thương hiệu Polo Ralph Lauren', 8),
                                                          ('Lacoste', 'Sản phẩm thương hiệu Lacoste', 8),
                                                          ('Converse', 'Sản phẩm thương hiệu Converse', 8);

-- =============================================================================
-- VERIFICATION QUERIES (Optional - for testing)
-- =============================================================================


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
('Nike', 'Just Do It - Thương hiệu thể thao hàng đầu thế giới', 'https://cdn.freebiesupply.com/logos/large/2x/nike-4-logo-png-transparent.png'),
('Adidas', 'Impossible is Nothing - Thương hiệu thể thao Đức', 'https://cdn.freebiesupply.com/logos/large/2x/adidas-logo-png-transparent.png'),
('Puma', 'Forever Faster - Thương hiệu thể thao năng động', 'https://cdn.freebiesupply.com/logos/large/2x/puma-logo-png-transparent.png'),
('Zara', 'Fast fashion - Thời trang nhanh từ Tây Ban Nha', 'https://cdn.freebiesupply.com/logos/large/2x/zara-logo-png-transparent.png'),
('H&M', 'Fashion and quality at the best price', 'https://cdn.freebiesupply.com/logos/large/2x/h-m-logo-png-transparent.png'),
('Uniqlo', 'LifeWear - Quần áo cho cuộc sống', 'https://cdn.freebiesupply.com/logos/large/2x/uniqlo-logo-png-transparent.png'),
('Coolmate', 'Thương hiệu thời trang nam Việt Nam', 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=200&h=100&fit=crop'),
('Yame', 'Thương hiệu thời trang trẻ Việt Nam', 'https://images.unsplash.com/photo-1607344645866-009c7d0dce97?w=200&h=100&fit=crop'),
('Calvin Klein', 'Thương hiệu thời trang cao cấp Mỹ', 'https://cdn.freebiesupply.com/logos/large/2x/calvin-klein-logo-png-transparent.png'),
('Tommy Hilfiger', 'Classic American Cool', 'https://cdn.freebiesupply.com/logos/large/2x/tommy-hilfiger-logo-png-transparent.png'),
('Polo Ralph Lauren', 'Timeless style, authentic luxury', 'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?w=200&h=100&fit=crop'),
('Lacoste', 'Life is a beautiful sport', 'https://cdn.freebiesupply.com/logos/large/2x/lacoste-logo-png-transparent.png'),
('Converse', 'Chuck Taylor All Star - Biểu tượng thời trang', 'https://cdn.freebiesupply.com/logos/large/2x/converse-logo-png-transparent.png'),
('Vans', 'Off The Wall - Thương hiệu skateboard', 'https://cdn.freebiesupply.com/logos/large/2x/vans-logo-png-transparent.png'),
('Local Brand', 'Thương hiệu nội địa chất lượng cao', 'https://images.unsplash.com/photo-1607081692251-7a5ab0813e8d?w=200&h=100&fit=crop');

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
-- 5. INSERT DISCOUNTS (Giảm giá)
-- =====================================================================================

INSERT INTO discounts (name, description, discount_type, value, start_date, end_date, is_active) VALUES
('Flash Sale Mùa Hè', 'Giảm giá đặc biệt cho các sản phẩm thời trang mùa hè', 'PERCENT', 25.0, '2025-10-01 00:00:00', '2025-12-31 23:59:59', true),
('Black Friday Sale', 'Giảm giá lớn nhân dip Black Friday', 'PERCENT', 40.0, '2025-11-25 00:00:00', '2025-11-30 23:59:59', true),
('Giảm Giá Sản Phẩm Nike', 'Giảm giá cố định cho các sản phẩm Nike', 'FIXED', 200000.0, '2025-10-01 00:00:00', '2025-11-30 23:59:59', true),
('Sale Thời Trang Nữ', 'Giảm giá đặc biệt cho thời trang nữ', 'PERCENT', 30.0, '2025-10-15 00:00:00', '2025-11-15 23:59:59', true),
('Khuyến Mãi Sinh Viên', 'Giảm giá cho sinh viên', 'PERCENT', 15.0, '2025-09-01 00:00:00', '2025-12-31 23:59:59', true),
('Sale Cuối Năm', 'Giảm giá lớn cuối năm', 'PERCENT', 35.0, '2025-12-01 00:00:00', '2025-12-31 23:59:59', true),
('Giảm Giá Giày Thể Thao', 'Giảm giá cố định cho giày thể thao', 'FIXED', 300000.0, '2025-10-01 00:00:00', '2025-11-30 23:59:59', true),
('New Arrival Discount', 'Giảm giá cho sản phẩm mới', 'PERCENT', 20.0, '2025-10-01 00:00:00', '2025-12-31 23:59:59', true);

-- =====================================================================================
-- 6. INSERT PRODUCT-DISCOUNT MAPPING (Liên kết sản phẩm - giảm giá)
-- =====================================================================================

INSERT INTO product_discounts (product_id, discount_id) VALUES
-- Flash Sale Mùa Hè (discount_id = 1)
(1, 1), -- Áo T-shirt Nike Dri-FIT
(3, 1), -- Áo T-shirt Coolmate Premium
(15, 1), -- Áo T-shirt Nữ Basic

-- Black Friday Sale (discount_id = 2)
(5, 2), -- Áo Polo Lacoste Classic
(6, 2), -- Áo Polo Ralph Lauren
(17, 2), -- Quần Jeans Skinny Nữ

-- Giảm Giá Sản Phẩm Nike (discount_id = 3)
(1, 3), -- Áo T-shirt Nike Dri-FIT
(11, 3), -- Nike Air Force 1

-- Sale Thời Trang Nữ (discount_id = 4)
(15, 4), -- Áo T-shirt Nữ Basic
(16, 4), -- Váy Midi Hoa Nhí
(17, 4), -- Quần Jeans Skinny Nữ
(18, 4), -- Áo Khoác Blazer Nữ

-- Khuyến Mãi Sinh Viên (discount_id = 5)
(21, 5), -- Balo Laptop 15 inch
(23, 5), -- Balo Du Lịch 30L

-- Giảm Giá Giày Thể Thao (discount_id = 7)
(11, 7), -- Nike Air Force 1
(12, 7), -- Adidas Stan Smith
(13, 7), -- Converse Chuck Taylor All Star
(14, 7); -- Vans Old Skool

-- =====================================================================================
-- 7. INSERT PRODUCT IMAGES (Hình ảnh sản phẩm) - URLs thực tế
-- =====================================================================================

-- Hình ảnh cho Áo T-shirt Nike Dri-FIT (product_id = 1)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=800&fit=crop', true, 0, 1),
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?w=800&h=800&fit=crop', false, 1, 1),
('https://images.unsplash.com/photo-1562157873-818bc0726f68?w=800&h=800&fit=crop', false, 2, 1);

-- Hình ảnh cho Áo T-shirt Adidas 3-Stripes (product_id = 2)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=800&h=800&fit=crop', true, 0, 2),
('https://images.unsplash.com/photo-1583743814966-8936f37f4d74?w=800&h=800&fit=crop', false, 1, 2);

-- Hình ảnh cho Áo T-shirt Coolmate Premium (product_id = 3)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?w=800&h=800&fit=crop', true, 0, 3),
('https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800&h=800&fit=crop', false, 1, 3);

-- Hình ảnh cho Áo Polo Lacoste Classic (product_id = 5)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1594223274512-ad4803739b7c?w=800&h=800&fit=crop', true, 0, 5),
('https://images.unsplash.com/photo-1607344645866-009c7d0dce97?w=800&h=800&fit=crop', false, 1, 5);

-- Hình ảnh cho Quần Jeans Slim Fit (product_id = 8)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1542272604-787c3835535d?w=800&h=800&fit=crop', true, 0, 8),
('https://images.unsplash.com/photo-1565084888279-aca607ecce0c?w=800&h=800&fit=crop', false, 1, 8);

-- Hình ảnh cho Nike Air Force 1 (product_id = 11)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800&h=800&fit=crop', true, 0, 11),
('https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=800&h=800&fit=crop', false, 1, 11),
('https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=800&h=800&fit=crop', false, 2, 11),
('https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=800&h=800&fit=crop', false, 3, 11);

-- Hình ảnh cho Adidas Stan Smith (product_id = 12)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1552346154-21d32810aba3?w=800&h=800&fit=crop', true, 0, 12),
('https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&h=800&fit=crop', false, 1, 12),
('https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=800&h=800&fit=crop', false, 2, 12);

-- Hình ảnh cho Converse Chuck Taylor (product_id = 13)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1494955464529-790512c65305?w=800&h=800&fit=crop', true, 0, 13),
('https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=800&h=800&fit=crop', false, 1, 13);

-- Hình ảnh cho Vans Old Skool (product_id = 14)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1544966503-7cc5ac882d5d?w=800&h=800&fit=crop', true, 0, 14),
('https://images.unsplash.com/photo-1520256862855-398228c41684?w=800&h=800&fit=crop', false, 1, 14);

-- Hình ảnh cho Áo T-shirt Nữ Basic (product_id = 15)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=800&fit=crop', true, 0, 15),
('https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=800&h=800&fit=crop', false, 1, 15);

-- Hình ảnh cho Váy Midi Hoa Nhí (product_id = 16)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=800&h=800&fit=crop', true, 0, 16),
('https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=800&h=800&fit=crop', false, 1, 16);

-- Hình ảnh cho Quần Jeans Skinny Nữ (product_id = 17)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=800&h=800&fit=crop', true, 0, 17),
('https://images.unsplash.com/photo-1582418702059-97ebafb35d09?w=800&h=800&fit=crop', false, 1, 17);

-- Hình ảnh cho Áo Khoác Blazer Nữ (product_id = 18)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=800&h=800&fit=crop', true, 0, 18),
('https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=800&fit=crop', false, 1, 18);

-- Hình ảnh cho Áo T-shirt Trẻ Em (product_id = 19)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1503944168440-4c421a582519?w=800&h=800&fit=crop', true, 0, 19),
('https://images.unsplash.com/photo-1519457431-44ccd64a579b?w=800&h=800&fit=crop', false, 1, 19);

-- Hình ảnh cho Balo Laptop 15 inch (product_id = 21)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800&h=800&fit=crop', true, 0, 21),
('https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?w=800&h=800&fit=crop', false, 1, 21);

-- Hình ảnh cho Túi Xách Tay Nữ (product_id = 22)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=800&h=800&fit=crop', true, 0, 22),
('https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800&h=800&fit=crop', false, 1, 22);

-- Hình ảnh cho Nón Snapback (product_id = 24)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=800&h=800&fit=crop', true, 0, 24),
('https://images.unsplash.com/photo-1521369909029-2afed882baee?w=800&h=800&fit=crop', false, 1, 24);

-- Hình ảnh cho Kính Mát UV400 (product_id = 26)
INSERT INTO product_images (image_url, is_main, sort_order, product_id) VALUES
('https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&h=800&fit=crop', true, 0, 26),
('https://images.unsplash.com/photo-1508296695146-257a814070b4?w=800&h=800&fit=crop', false, 1, 26);

-- =====================================================================================
-- 8. INSERT PRODUCT VARIANTS (Biến thể sản phẩm)
-- =====================================================================================

-- Biến thể cho Áo T-shirt Nike Dri-FIT (product_id = 1)
INSERT INTO product_variants (sku, stock_quantity, additional_price, product_id, color_id, size_id) VALUES
('NIKE-TSHIRT-BLACK-S', 50, 0, 1, 4, 2),    -- Đen - S
('NIKE-TSHIRT-BLACK-M', 60, 0, 1, 4, 3),    -- Đen - M
('NIKE-TSHIRT-BLACK-L', 40, 0, 1, 4, 4),    -- Đen - L
('NIKE-TSHIRT-WHITE-S', 45, 0, 1, 5, 2),    -- Trắng - S
('NIKE-TSHIRT-WHITE-M', 55, 0, 1, 5, 3),    -- Trắng - M
('NIKE-TSHIRT-WHITE-L', 35, 0, 1, 5, 4);    -- Trắng - L

-- Biến thể cho Nike Air Force 1 (product_id = 11)
INSERT INTO product_variants (sku, stock_quantity, additional_price, product_id, color_id, size_id) VALUES
('NIKE-AF1-WHITE-39', 20, 0, 11, 5, 10),    -- Trắng - 39
('NIKE-AF1-WHITE-40', 25, 0, 11, 5, 11),    -- Trắng - 40
('NIKE-AF1-WHITE-41', 30, 0, 11, 5, 12),    -- Trắng - 41
('NIKE-AF1-WHITE-42', 25, 0, 11, 5, 13),    -- Trắng - 42
('NIKE-AF1-BLACK-40', 20, 0, 11, 4, 11),    -- Đen - 40
('NIKE-AF1-BLACK-41', 22, 0, 11, 4, 12),    -- Đen - 41
('NIKE-AF1-BLACK-42', 18, 0, 11, 4, 13);    -- Đen - 42

-- Biến thể cho Váy Midi Hoa Nhí (product_id = 16)
INSERT INTO product_variants (sku, stock_quantity, additional_price, product_id, color_id, size_id) VALUES
('MIDI-DRESS-PINK-S', 30, 0, 16, 7, 2),     -- Hồng - S
('MIDI-DRESS-PINK-M', 35, 0, 16, 7, 3),     -- Hồng - M
('MIDI-DRESS-PINK-L', 25, 0, 16, 7, 4),     -- Hồng - L
('MIDI-DRESS-BLUE-S', 28, 0, 16, 2, 2),     -- Xanh dương - S
('MIDI-DRESS-BLUE-M', 32, 0, 16, 2, 3),     -- Xanh dương - M
('MIDI-DRESS-BLUE-L', 22, 0, 16, 2, 4);     -- Xanh dương - L

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
