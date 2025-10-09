-- Insert Categories Script for KLTN E-commerce System
-- This script creates hierarchical categories with parent-child relationships
-- Run this script after the application is set up and database is initialized

-- =============================================================================
-- SELECT DATABASE (Change 'kltn_database' to your actual database name)
-- =============================================================================

USE kltn_database;
-- Alternative database names (uncomment the correct one):
-- USE kltn_backend;
-- USE kltn_ecommerce;
-- USE your_database_name;

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

-- Count total categories
-- SELECT COUNT(*) as total_categories FROM categories;

-- Count root categories
-- SELECT COUNT(*) as root_categories FROM categories WHERE parent_id IS NULL;

-- Count subcategories
-- SELECT COUNT(*) as subcategories FROM categories WHERE parent_id IS NOT NULL;

-- View hierarchical structure
-- SELECT
--     p.name as parent_category,
--     c.name as subcategory,
--     c.description
-- FROM categories p
-- LEFT JOIN categories c ON p.id = c.parent_id
-- WHERE p.parent_id IS NULL
-- ORDER BY p.name, c.name;

-- =============================================================================
-- NOTES:
-- 1. This script assumes AUTO_INCREMENT for the id column
-- 2. The parent_id refers to the parent category's id (based on @JoinColumn annotation)
-- 3. Root categories have parent_id = NULL
-- 4. Removed created_date and updated_date as they might be auto-managed by JPA
-- 5. Column names match the JPA entity structure
-- =============================================================================
