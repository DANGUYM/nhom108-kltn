package iuh.fit.se.dtos.responses;

import iuh.fit.se.enums.DiscountType;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DiscountResponse {

    Long id;
    String name;
    DiscountType discountType;
    Double value;
    LocalDateTime startDate;
    LocalDateTime endDate;
    Boolean isActive;
    String formattedValue; // VD: "20%" hoặc "50,000 VND"
}
