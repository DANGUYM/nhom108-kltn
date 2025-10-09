package iuh.fit.se.mapper;

import iuh.fit.se.dtos.responses.CartItemResponse;
import iuh.fit.se.entities.CartItem;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE,
        uses = {ProductMapper.class, ProductVariantMapper.class})
public interface CartItemMapper {

    @Mapping(target = "product", source = "product")
    @Mapping(target = "productVariant", source = "productVariant")
    @Mapping(target = "itemTotal", expression = "java(calculateItemTotal(cartItem))")
    CartItemResponse toCartItemResponse(CartItem cartItem);

    @Named("calculateItemTotal")
    default Double calculateItemTotal(CartItem cartItem) {
        if (cartItem == null || cartItem.getQuantity() == null) {
            return 0.0;
        }

        Double price = 0.0;
        if (cartItem.getProductVariant() != null && cartItem.getProductVariant().getPrice() != null) {
            price = cartItem.getProductVariant().getPrice();
        } else if (cartItem.getProduct() != null && cartItem.getProduct().getBasePrice() != null) {
            price = cartItem.getProduct().getBasePrice();
        }

        return price * cartItem.getQuantity();
    }
}
