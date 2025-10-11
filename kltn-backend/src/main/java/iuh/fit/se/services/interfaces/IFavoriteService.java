package iuh.fit.se.services.interfaces;

import iuh.fit.se.dtos.requests.AddFavoriteRequest;
import iuh.fit.se.dtos.responses.FavoriteResponse;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IFavoriteService {

  /**
   * Add a product to user's favorites
   *
   * @param request the add favorite request
   * @param userId the user ID
   * @return favorite response
   */
  FavoriteResponse addToFavorites(AddFavoriteRequest request, Long userId);

  /**
   * Remove a product from user's favorites
   *
   * @param productId the product ID to remove
   * @param userId the user ID
   */
  void removeFromFavorites(Long productId, Long userId);

  /**
   * Get all favorites of a user with pagination
   *
   * @param userId the user ID
   * @param pageable pagination information
   * @return page of favorite responses
   */
  Page<FavoriteResponse> getUserFavorites(Long userId, Pageable pageable);

  /**
   * Get all favorites of a user as list
   *
   * @param userId the user ID
   * @return list of favorite responses
   */
  List<FavoriteResponse> getUserFavoritesList(Long userId);

  /**
   * Check if a product is in user's favorites
   *
   * @param productId the product ID
   * @param userId the user ID
   * @return true if product is favorited, false otherwise
   */
  boolean isProductFavorited(Long productId, Long userId);

  /**
   * Get total count of user's favorites
   *
   * @param userId the user ID
   * @return total count of favorites
   */
  long getUserFavoritesCount(Long userId);
}
