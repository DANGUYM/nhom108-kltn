package iuh.fit.se.dtos.requests;

import iuh.fit.se.enums.DiscountType;
import jakarta.validation.constraints.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateDiscountRequest {

    @Size(min = 3, max = 100, message = "Tên discount phải từ 3 đến 100 ký tự")
    String name;

    DiscountType discountType;

    @DecimalMin(value = "0.0", inclusive = false, message = "Giá trị discount phải lớn hơn 0")
    @DecimalMax(value = "100.0", message = "Giá trị discount phần trăm không được vượt quá 100%")
    Double value;

    LocalDateTime startDate;

    LocalDateTime endDate;
}
