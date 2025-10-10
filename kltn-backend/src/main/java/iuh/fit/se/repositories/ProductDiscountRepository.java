package iuh.fit.se.repositories;

import iuh.fit.se.entities.ProductDiscount;
import iuh.fit.se.entities.ProductDiscountId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ProductDiscountRepository extends JpaRepository<ProductDiscount, ProductDiscountId> {

    // Tìm tất cả discount của một product
    @Query("SELECT pd FROM ProductDiscount pd WHERE pd.product.id = :productId")
    List<ProductDiscount> findByProductId(@Param("productId") Long productId);

    // Tìm tất cả product có discount cụ thể
    @Query("SELECT pd FROM ProductDiscount pd WHERE pd.discount.id = :discountId")
    List<ProductDiscount> findByDiscountId(@Param("discountId") Long discountId);

    // Tìm discount đang hoạt động cho một product
    @Query("SELECT pd FROM ProductDiscount pd WHERE pd.product.id = :productId " +
           "AND pd.discount.startDate <= :now AND pd.discount.endDate >= :now")
    List<ProductDiscount> findActiveDiscountsByProductId(@Param("productId") Long productId,
                                                        @Param("now") LocalDateTime now);

    // Xóa tất cả discount của một product
    @Modifying
    @Query("DELETE FROM ProductDiscount pd WHERE pd.product.id = :productId")
    void deleteByProductId(@Param("productId") Long productId);

    // Xóa tất cả product có discount cụ thể
    @Modifying
    @Query("DELETE FROM ProductDiscount pd WHERE pd.discount.id = :discountId")
    void deleteByDiscountId(@Param("discountId") Long discountId);

    // Kiểm tra xem product đã có discount này chưa
    boolean existsByProductIdAndDiscountId(Long productId, Long discountId);
}
