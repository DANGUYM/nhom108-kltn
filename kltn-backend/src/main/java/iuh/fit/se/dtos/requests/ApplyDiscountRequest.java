package iuh.fit.se.dtos.requests;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ApplyDiscountRequest {

    @NotNull(message = "ID discount không được để trống")
    Long discountId;

    @NotEmpty(message = "Danh sách ID sản phẩm không được để trống")
    List<Long> productIds;
}
