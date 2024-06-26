import 'package:computer_store/data/services/shop/products.dart';
import 'package:computer_store/features/shop/controllers/wishlist_controller.dart';
import 'package:computer_store/features/shop/models/cart/fetch_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/common/styles/shadows.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/common/widgets/products/product_price/product_price_text.dart';
import 'package:computer_store/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:computer_store/common/widgets/texts/product_title_text.dart';
import 'package:computer_store/features/shop/screens/product_details/product_details.dart';
import 'package:iconsax/iconsax.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';

class UProductCardVertical extends StatelessWidget {
  final Data product;
  final WishlistController wishlistController = Get.put(WishlistController());

  UProductCardVertical({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [UShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(USizes.productImageRadiue),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          children: [
            URoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  URoundedImage(
                    imageUrl: product.images?[0].url ?? '',
                    applyImageRadius: true,
                    height: 200,
                    isNetworkImae: true,
                  ),
                  if (product.price != null &&
                      product.price! >
                          0) // Assuming discount is calculated elsewhere
                    Positioned(
                      top: 12,
                      child: URoundedContainer(
                        redius: USizes.sm,
                        backgroundColor: UColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: USizes.sm, vertical: USizes.xs),
                        child: Text('10%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(
                                    color: UColors
                                        .black)), // Placeholder for discount
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() {
                      bool isInWishlist =
                          wishlistController.isInWishlist(product.id!);
                      return UCricularIcon(
                        icon: isInWishlist ? Iconsax.heart5 : Iconsax.heart,
                        color: isInWishlist ? Colors.red : Colors.grey,
                        onTap: () =>
                            wishlistController.toggleWishlist(product.id!),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: USizes.spaceBtwItem / 2),
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UProductTitleText(
                        title: product.name ?? '', smallSize: true),
                    const SizedBox(height: USizes.spaceBtwItem / 2),
                    UBrandtitlewithverifiedIcon(
                        title: product.brand?.name ?? ''),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(
                      price: product.price.toString(), isLarge: true),
                ),
                GestureDetector(
                  onTap: () {
                    CartService().addTocart(product.id!, 1);  
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: UColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(USizes.cardRaduieMd),
                        bottomRight: Radius.circular(USizes.productImageRadiue),
                      ),
                    ),
                    child: const SizedBox(
                      width: USizes.iconLg * 1.2,
                      height: USizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
