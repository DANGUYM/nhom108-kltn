package iuh.fit.se.mapper;

import iuh.fit.se.dtos.responses.ProductResponse;
import iuh.fit.se.entities.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(
    componentModel = "spring",
    unmappedTargetPolicy = ReportingPolicy.IGNORE,
    uses = {
      CategoryMapper.class,
      BrandMapper.class,
      ProductImageMapper.class,
      ProductVariantMapper.class
    })
public interface ProductMapper {
  @Mapping(target = "images", ignore = true)
  @Mapping(target = "variants", ignore = true)
  @Mapping(target = "averageRating", ignore = true)
  @Mapping(target = "totalReviews", ignore = true)
  ProductResponse toProductResponse(Product product);
}
