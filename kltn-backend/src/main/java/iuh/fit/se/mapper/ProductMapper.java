package iuh.fit.se.mapper;

import iuh.fit.se.dtos.responses.ProductDetailResponse;
import iuh.fit.se.dtos.responses.ProductResponse;
import iuh.fit.se.dtos.responses.CategoryResponse;
import iuh.fit.se.dtos.responses.BrandResponse;
import iuh.fit.se.entities.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ProductMapper {
    
    public ProductResponse toProductResponse(Product product) {
        if (product == null) {
            return null;
        }
        
        return ProductResponse.builder()
            .id(product.getId())
            .name(product.getName())
            .description(product.getDescription())
            .basePrice(product.getBasePrice())
            .status(product.getStatus().name())
            .category(mapCategoryToResponse(product.getCategory()))
            .brand(mapBrandToResponse(product.getBrand()))
            // Additional fields like images, variants, ratings would be mapped here
            .build();
    }
    
    private CategoryResponse mapCategoryToResponse(Category category) {
        if (category == null) {
            return null;
        }
        
        return CategoryResponse.builder()
            .id(category.getId())
            .name(category.getName())
            .description(category.getDescription())
            .parentCategory(category.getCategory() != null ? mapCategoryToResponse(category.getCategory()) : null)
            .build();
    }
    
    private BrandResponse mapBrandToResponse(Brand brand) {
        if (brand == null) {
            return null;
        }
        
        return BrandResponse.builder()
            .id(brand.getId())
            .name(brand.getName())
            .description(brand.getDescription())
            .build();
    }
    
    public ProductDetailResponse toProductDetailResponse(Product product) {
        if (product == null) {
            return null;
        }
        
        return ProductDetailResponse.builder()
            .id(product.getId())
            .name(product.getName())
            .description(product.getDescription())
            .basePrice(product.getBasePrice())
            .status(product.getStatus().name())
            .category(mapCategory(product.getCategory()))
            .rootCategory(mapRootCategory(product.getCategory()))
            .categoryPath(mapCategoryPath(product.getCategory()))
            .brand(mapBrand(product.getBrand()))
            // Additional mappings would be added here based on relationships
            .build();
    }
    
    private ProductDetailResponse.CategoryResponse mapCategory(Category category) {
        if (category == null) {
            return null;
        }
        
        return ProductDetailResponse.CategoryResponse.builder()
            .id(category.getId())
            .name(category.getName())
            .description(category.getDescription())
            .parentId(category.getCategory() != null ? category.getCategory().getId() : null)
            .parentName(category.getCategory() != null ? category.getCategory().getName() : null)
            .build();
    }
    
    private ProductDetailResponse.CategoryResponse mapRootCategory(Category category) {
        if (category == null) {
            return null;
        }
        
        // Find root category by traversing up the hierarchy
        Category root = category;
        while (root.getCategory() != null) {
            root = root.getCategory();
        }
        
        return ProductDetailResponse.CategoryResponse.builder()
            .id(root.getId())
            .name(root.getName())
            .description(root.getDescription())
            .build();
    }
    
    private List<ProductDetailResponse.CategoryResponse> mapCategoryPath(Category category) {
        // This would build the full path from root to current category
        // Implementation would traverse up the hierarchy and build the path
        return List.of(); // Simplified for now
    }
    
    private ProductDetailResponse.BrandResponse mapBrand(Brand brand) {
        if (brand == null) {
            return null;
        }
        
        return ProductDetailResponse.BrandResponse.builder()
            .id(brand.getId())
            .name(brand.getName())
            .description(brand.getDescription())
            // .logoUrl(brand.getLogoUrl()) // Assuming Brand entity has this field
            .build();
    }
}