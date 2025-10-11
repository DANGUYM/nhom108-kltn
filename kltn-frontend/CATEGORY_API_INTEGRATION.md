# Category API Integration - README

## Tổng quan

Đã tích hợp thành công API backend để lấy danh sách categories trong Header component. Thay thế dữ liệu static bằng API calls thật từ backend.

## Các file đã tạo/cập nhật

### 1. Types & Interfaces
- `src/types/responses/categoryResponse.ts` - Định nghĩa các interface cho API response

### 2. Services 
- `src/services/categoryService.ts` - Service calls API với caching và error handling

### 3. Components
- `src/components/Header.tsx` - Cập nhật ProductCategories component sử dụng API
- `src/pages/CategoryTest.tsx` - Component test API (development only)

### 4. Routes
- Thêm route `/category-test` để test API functionality

## API Endpoints được sử dụng

### 1. Get Root Categories
```
GET /categories/root
Response: {
  "code": 200,
  "message": "Root categories retrieved successfully",
  "result": [
    {
      "id": 1,
      "name": "Thời trang nam",
      "description": "Các sản phẩm thời trang dành cho nam giới"
    },
    // ...
  ]
}
```

### 2. Get Subcategories
```
GET /categories/{categoryId}/subcategories  
Response: {
  "code": 200,
  "message": "Subcategories retrieved successfully",
  "result": [
    {
      "id": 9,
      "name": "Áo T-shirt Nam",
      "description": "Áo thun nam các loại",
      "parentCategory": {
        "id": 1,
        "name": "Thời trang nam",
        "description": "Các sản phẩm thời trang dành cho nam giới"
      }
    },
    // ...
  ]
}
```

## Setup & Configuration

### 1. Environment Variables
Tạo file `.env` từ `.env.example`:
```bash
cp .env.example .env
```

Đảm bảo `VITE_API_BASE_URL` đúng:
```bash
VITE_API_BASE_URL=http://localhost:9999/luther/api/v1
```

### 2. Backend Requirements
- Backend server phải chạy trên port 9999
- API endpoints `/categories/root` và `/categories/{id}/subcategories` phải available
- CORS được cấu hình để allow requests từ frontend

### 3. Testing API Integration

#### Option 1: Sử dụng Category Test Page
1. Start development server: `npm run dev`
2. Truy cập: `http://localhost:5173/category-test`
3. Test các API calls và xem response

#### Option 2: Kiểm tra trực tiếp trong Header
1. Mở trang chủ
2. Click vào "Danh mục sản phẩm" trong header
3. Kiểm tra Developer Console để xem API calls

## Features

### ✅ Đã implement
- [x] API service với error handling và retry logic
- [x] Caching categories trong localStorage (30 phút)
- [x] Loading states trong UI
- [x] Error handling và fallback
- [x] TypeScript types cho API responses
- [x] Navigation với category data được truyền qua state

### 🔄 Caching Strategy
- Categories được cache trong localStorage với key `vuvisa_product_categories`
- Cache expiry: 30 phút
- Fallback về cached data nếu API fails
- Manual cache clear function available

### 🎯 Navigation Integration
- Click vào category name → Navigate với categoryId và data
- Click vào subcategory → Navigate với subcategory data
- Router state includes: categoryId, categoryName, rootCategories, subCategories

## Error Handling

### Network Errors
- Hiển thị message "Không thể tải danh mục. Vui lòng thử lại sau."
- Fallback về cached data nếu available
- Loading spinner khi fetch data

### API Errors  
- Parse error response message từ backend
- Log errors vào console cho debugging
- Graceful degradation nếu subcategories fetch fails

## Development Notes

### API Service Architecture
```typescript
// Main functions
getCachedRootCategories() // With caching
getRootCategories()      // Direct API call
getSubCategories(id)     // Get subcategories
getAllCategoriesWithSub() // Batch fetch all
clearCategoriesCache()    // Manual cache clear
```

### Component State Management
```typescript
// ProductCategories component states
const [rootCategories, setRootCategories] = useState<CategoryResponse[]>([]);
const [subCategoriesMap, setSubCategoriesMap] = useState<Record<number, CategoryResponse[]>>({});
const [isLoading, setIsLoading] = useState(false);
const [error, setError] = useState<string | null>(null);
```

## Troubleshooting

### 1. API Not Loading
- Kiểm tra backend server có chạy không
- Verify VITE_API_BASE_URL trong .env
- Check network tab trong DevTools
- Xem console errors

### 2. CORS Issues  
- Đảm bảo backend cấu hình CORS cho frontend domain
- Check preflight OPTIONS requests

### 3. Cache Issues
- Clear localStorage: `localStorage.removeItem('vuvisa_product_categories')`
- Hoặc gọi: `clearCategoriesCache()`

## Future Enhancements

### 🚀 Có thể cải tiến
- [ ] Add search functionality trong categories
- [ ] Implement category filters  
- [ ] Add category images
- [ ] Implement infinite scroll cho large category lists
- [ ] Add category analytics tracking
- [ ] Implement real-time category updates via WebSocket

### 🔧 Technical Improvements
- [ ] Add unit tests cho categoryService
- [ ] Implement React Query cho better caching
- [ ] Add loading skeletons
- [ ] Optimize bundle size
- [ ] Add performance monitoring

## API Documentation References

Xem file `public/kltn-complete-api-tests.json` để có Postman collection đầy đủ với:
- Authentication flow
- Category management endpoints  
- Product management
- Cart và Order functionality
- Và nhiều APIs khác

---

**Note**: Component CategoryTest chỉ dành cho development. Có thể remove khi deploy production.