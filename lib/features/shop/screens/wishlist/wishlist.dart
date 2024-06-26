import 'package:computer_store/features/shop/controllers/wishlist_controller.dart';
import 'package:computer_store/features/shop/models/function/fetch_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:computer_store/features/shop/screens/home/home.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import 'package:computer_store/data/services/shop/products.dart'; // Import Data model

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.put(WishlistController());

    return Scaffold(
      appBar: UAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          UCricularIcon(icon: Iconsax.add, onTap: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: FutureBuilder<List<Data>>(
        future: ProductService().fetchProducts(), // Call fetchProducts() to get the future data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available.'));
          } else {
            // Products are successfully loaded
            List<Data> products = snapshot.data!;
            List<Data> wishlistProducts = products.where((product) => wishlistController.isInWishlist(product.id!)).toList();

            if (wishlistProducts.isEmpty) {
              return Center(child: Text('No products in wishlist.'));
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(USizes.defualtSpece),
                child: Column(
                  children: [
                    UGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) => UProductCardVertical(product: products[index]),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
