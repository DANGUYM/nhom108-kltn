# KLTN E-Commerce Backend API System

## Tổng quan hệ thống

Hệ thống backend e-commerce hoàn chỉnh được xây dựng theo kiến trúc Clean Architecture với Spring Boot, bao gồm các API RESTful cho quản lý sản phẩm, giỏ hàng, đánh giá và các chức năng liên quan.

## Cấu trúc API đã hoàn thành

### 1. Color Management APIs (`/api/v1/colors`)
- **POST** `/` - Tạo màu sắc mới (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật màu sắc (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa màu sắc (ADMIN)
- **GET** `/{id}` - Lấy màu sắc theo ID
- **GET** `/` - Lấy danh sách màu sắc với phân trang
- **GET** `/all` - Lấy tất cả màu sắc

### 2. Size Management APIs (`/api/v1/sizes`)
- **POST** `/` - Tạo kích thước mới (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật kích thước (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa kích thước (ADMIN)
- **GET** `/{id}` - Lấy kích thước theo ID
- **GET** `/` - Lấy danh sách kích thước với phân trang
- **GET** `/all` - Lấy tất cả kích thước

### 3. Brand Management APIs (`/api/v1/brands`)
- **POST** `/` - Tạo thương hiệu mới với logo (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật thương hiệu (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa thương hiệu (ADMIN)
- **GET** `/{id}` - Lấy thương hiệu theo ID
- **GET** `/` - Lấy danh sách thương hiệu với phân trang
- **GET** `/all` - Lấy tất cả thương hiệu

### 4. Category Management APIs (`/api/v1/categories`)
- **POST** `/` - Tạo danh mục mới (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật danh mục (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa danh mục (ADMIN)
- **GET** `/{id}` - Lấy danh mục theo ID
- **GET** `/` - Lấy danh sách danh mục với phân trang
- **GET** `/all` - Lấy tất cả danh mục
- **GET** `/root` - Lấy danh mục gốc
- **GET** `/{parentId}/subcategories` - Lấy danh mục con

### 5. Product Management APIs (`/api/v1/products`)
- **POST** `/` - Tạo sản phẩm mới với hình ảnh (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật sản phẩm (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa sản phẩm (ADMIN)
- **GET** `/{id}` - Lấy sản phẩm theo ID
- **GET** `/` - Lấy danh sách sản phẩm với lọc và phân trang
- **GET** `/available` - Lấy sản phẩm còn hàng
- **GET** `/latest` - Lấy sản phẩm mới nhất
- **GET** `/category/{categoryId}` - Lấy sản phẩm theo danh mục
- **GET** `/brand/{brandId}` - Lấy sản phẩm theo thương hiệu
- **GET** `/search` - Tìm kiếm sản phẩm
- **PATCH** `/{id}/status` - Cập nhật trạng thái sản phẩm (ADMIN/STAFF)

### 6. Product Variant Management APIs (`/api/v1/product-variants`)
- **POST** `/` - Tạo biến thể sản phẩm mới (ADMIN/STAFF)
- **PUT** `/{id}` - Cập nhật biến thể sản phẩm (ADMIN/STAFF)
- **DELETE** `/{id}` - Xóa biến thể sản phẩm (ADMIN)
- **GET** `/{id}` - Lấy biến thể sản phẩm theo ID
- **GET** `/` - Lấy danh sách biến thể sản phẩm với phân trang
- **GET** `/product/{productId}` - Lấy biến thể theo sản phẩm
- **GET** `/product/{productId}/available` - Lấy biến thể còn hàng
- **PATCH** `/{id}/stock` - Cập nhật tồn kho (ADMIN/STAFF)

### 7. Cart Management APIs (`/api/v1/cart`)
- **GET** `/user/{userId}` - Lấy giỏ hàng của người dùng (CUSTOMER/ADMIN)
- **POST** `/add` - Thêm sản phẩm vào giỏ hàng (CUSTOMER)
- **PUT** `/items/{cartItemId}` - Cập nhật số lượng sản phẩm (CUSTOMER)
- **DELETE** `/items/{cartItemId}` - Xóa sản phẩm khỏi giỏ hàng (CUSTOMER)
- **DELETE** `/user/{userId}/clear` - Làm trống giỏ hàng (CUSTOMER/ADMIN)
- **GET** `/user/{userId}/items` - Lấy danh sách sản phẩm trong giỏ hàng
- **GET** `/user/{userId}/total` - Tính tổng tiền giỏ hàng
- **GET** `/user/{userId}/count` - Đếm số lượng sản phẩm trong giỏ hàng

### 8. Review Management APIs (`/api/v1/reviews`)
- **POST** `/` - Tạo đánh giá sản phẩm (CUSTOMER)
- **PUT** `/{id}` - Cập nhật đánh giá (CUSTOMER)
- **DELETE** `/{id}` - Xóa đánh giá (CUSTOMER/ADMIN)
- **GET** `/{id}` - Lấy đánh giá theo ID
- **GET** `/product/{productId}` - Lấy đánh giá theo sản phẩm
- **GET** `/user/{userId}` - Lấy đánh giá của người dùng
- **GET** `/product/{productId}/average-rating` - Lấy điểm đánh giá trung bình
- **GET** `/product/{productId}/total-reviews` - Đếm tổng số đánh giá
- **GET** `/product/{productId}/user/{userId}/exists` - Kiểm tra đã đánh giá chưa
- **GET** `/product/{productId}/rating/{rating}` - Lấy đánh giá theo sao

## Các tính năng chính đã implement

### 1. Authentication & Authorization
- JWT-based authentication
- Role-based access control (ADMIN, STAFF, CUSTOMER)
- Method-level security với @PreAuthorize

### 2. File Upload Integration
- AWS S3 integration cho upload hình ảnh
- Automatic image deletion khi xóa entity
- Support multiple file upload

### 3. Database Relations
- Hierarchical categories với parent-child relationship
- Product variants với color và size
- Complete cart management system
- Review system với rating calculation

### 4. API Features
- Comprehensive pagination support
- Advanced filtering và searching
- Proper error handling với custom error codes
- Request/Response validation
- Swagger documentation

### 5. Clean Architecture Implementation
- Proper separation of concerns
- Repository pattern
- Service layer với business logic
- DTO mapping với MapStruct
- Exception handling

## Cấu trúc thư mục

```
src/main/java/iuh/fit/se/
├── controllers/          # REST Controllers
│   ├── ColorController.java
│   ├── SizeController.java
│   ├── BrandController.java
│   ├── CategoryController.java
│   ├── ProductController.java
│   ├── ProductVariantController.java
│   ├── CartController.java
│   └── ReviewController.java
├── services/
│   ├── interfaces/       # Service interfaces
│   └── impls/           # Service implementations
├── repositories/         # JPA Repositories
├── dtos/
│   ├── requests/        # Request DTOs
│   └── responses/       # Response DTOs
├── mapper/              # MapStruct mappers
├── entities/            # JPA Entities
├── enums/               # Enums
├── exceptions/          # Custom exceptions
└── configurations/      # Spring configurations
```

## Error Codes đã định nghĩa

- **1042-1043**: Color errors
- **1044-1045**: Size errors
- **1046-1047**: Brand errors
- **1048-1051**: Category errors
- **1052-1054**: Product errors
- **1055-1057**: Product Variant errors
- **1058-1060**: Cart errors
- **1061-1062**: Review errors

## Database Schema

Hệ thống hỗ trợ các entities chính:
- **User**: Quản lý người dùng
- **Product**: Sản phẩm với đầy đủ thông tin
- **ProductVariant**: Biến thể sản phẩm (size, color, giá, tồn kho)
- **ProductImage**: Hình ảnh sản phẩm
- **Category**: Danh mục có cấu trúc cây
- **Brand**: Thương hiệu
- **Color/Size**: Thuộc tính sản phẩm
- **Cart/CartItem**: Giỏ hàng
- **Review**: Đánh giá sản phẩm

## Security Configuration

- CORS configured cho frontend URLs
- JWT token validation
- Role-based endpoint protection
- File upload security

## Cách sử dụng

1. **Start application**: `./gradlew bootRun`
2. **API Documentation**: `http://localhost:9999/luther/swagger-ui/index.html`
3. **Base URL**: `http://localhost:9999/luther/api/v1`

## Testing với Postman

File test collection có sẵn tại: `postman-tests/kltn-complete-api-tests.json`

## Cấu hình môi trường

Xem file `application.properties` để cấu hình:
- Database connection
- AWS S3 credentials
- JWT settings
- Mail configuration
- Redis cache

---

**Hệ thống API hoàn chỉnh cho e-commerce với 47+ endpoints, hỗ trợ đầy đủ các chức năng quản lý sản phẩm, giỏ hàng, đánh giá và nhiều tính năng khác.**
