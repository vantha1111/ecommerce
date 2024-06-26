import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = <String>[].obs; // Using a list of product IDs

  void toggleWishlist(String productId) {
    if (wishlist.contains(productId)) {
      wishlist.remove(productId);
    } else {
      wishlist.add(productId);
    }
  }

  bool isInWishlist(String productId) {
    return wishlist.contains(productId);
  }
}
