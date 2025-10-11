package iuh.fit.se.services.interfaces;

import iuh.fit.se.dtos.requests.ProductFilterRequest;
import iuh.fit.se.dtos.responses.ProductDetailResponse;
import iuh.fit.se.dtos.responses.ProductStatisticsResponse;
import org.springframework.data.domain.Page;

public interface IProductFilterService {
    
    /**
     * Lọc sản phẩm theo nhiều tiêu chí kết hợp
     */
    Page<ProductDetailResponse> filterProducts(ProductFilterRequest filterRequest);
    
    /**
     * Lấy sản phẩm theo root category và subcategory
     */
    Page<ProductDetailResponse> getProductsByRootCategory(Long rootCategoryId, int page, int size, String sortBy, String sortDirection);
    
    /**
     * Lấy sản phẩm theo subcategory
     */
    Page<ProductDetailResponse> getProductsBySubCategory(Long subCategoryId, int page, int size, String sortBy, String sortDirection);
    
    /**
     * Lấy sản phẩm theo brand với các filter bổ sung
     */
    Page<ProductDetailResponse> getProductsByBrand(Long brandId, ProductFilterRequest additionalFilters);
    
    /**
     * Lấy sản phẩm theo size với các filter bổ sung
     */
    Page<ProductDetailResponse> getProductsBySize(Long sizeId, ProductFilterRequest additionalFilters);
    
    /**
     * Lấy sản phẩm theo color với các filter bổ sung
     */
    Page<ProductDetailResponse> getProductsByColor(Long colorId, ProductFilterRequest additionalFilters);
    
    /**
     * Lấy sản phẩm có discount
     */
    Page<ProductDetailResponse> getProductsWithDiscount(Double minDiscountPercent, Double maxDiscountPercent, int page, int size, String sortBy, String sortDirection);
    
    /**
     * Lấy sản phẩm yêu thích của user
     */
    Page<ProductDetailResponse> getFavoriteProducts(Long userId, int page, int size, String sortBy, String sortDirection);
    
    /**
     * Lấy sản phẩm theo khoảng giá
     */
    Page<ProductDetailResponse> getProductsByPriceRange(Double minPrice, Double maxPrice, int page, int size, String sortBy, String sortDirection);
    
    /**
     * Đếm số lượng sản phẩm theo các tiêu chí
     */
    Long countProductsByFilter(ProductFilterRequest filterRequest);
    
    /**
     * Lấy thống kê sản phẩm chi tiết
     */
    ProductStatisticsResponse getProductStatistics();
    
    /**
     * Lấy thống kê sản phẩm theo filter
     */
    ProductStatisticsResponse getProductStatisticsByFilter(ProductFilterRequest filterRequest);
    
    /**
     * Lấy sản phẩm mới nhất (trong 30 ngày)
     */
    Page<ProductDetailResponse> getNewProducts(int page, int size, String sortBy, String sortDirection);
    
    /**
     * Lấy sản phẩm bán chạy
     */
    Page<ProductDetailResponse> getBestSellerProducts(int page, int size);
    
    /**
     * Tìm kiếm sản phẩm nâng cao với gợi ý
     */
    Page<ProductDetailResponse> searchProductsAdvanced(String keyword, ProductFilterRequest additionalFilters);
}