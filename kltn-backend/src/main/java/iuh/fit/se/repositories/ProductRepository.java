package iuh.fit.se.repositories;

import iuh.fit.se.entities.Product;
import iuh.fit.se.enums.ProductStatus;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

  Page<Product> findByStatus(ProductStatus status, Pageable pageable);

  Page<Product> findByCategoryId(Long categoryId, Pageable pageable);

  Page<Product> findByBrandId(Long brandId, Pageable pageable);

  @Query("SELECT p FROM Product p WHERE p.name LIKE %:keyword% OR p.description LIKE %:keyword%")
  Page<Product> findByKeyword(@Param("keyword") String keyword, Pageable pageable);

  @Query("SELECT p FROM Product p WHERE p.basePrice BETWEEN :minPrice AND :maxPrice")
  Page<Product> findByPriceRange(
      @Param("minPrice") Double minPrice, @Param("maxPrice") Double maxPrice, Pageable pageable);

  @Query(
      "SELECT p FROM Product p JOIN p.category c WHERE c.id = :categoryId AND p.status = :status")
  Page<Product> findByCategoryIdAndStatus(
      @Param("categoryId") Long categoryId,
      @Param("status") ProductStatus status,
      Pageable pageable);

  List<Product> findTop10ByStatusOrderByIdDesc(ProductStatus status);

  @Query(
      "SELECT p FROM Product p JOIN ProductVariant pv ON p.id = pv.product.id WHERE pv.stockQuantity > 0")
  Page<Product> findAvailableProducts(Pageable pageable);
}
