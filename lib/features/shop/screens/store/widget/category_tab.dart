import 'package:computer_store/features/shop/models/function/fetch_product.dart';
import 'package:flutter/material.dart';
import 'package:computer_store/common/widgets/brands/brand_show_case.dart';
import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
// Import your ProductService
import 'package:computer_store/data/services/shop/products.dart'; // Import your Data model

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
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

          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(USizes.defualtSpece),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand showcases
                    const UBrandShowcase(images: [UImages.productImage1, UImages.productImage2, UImages.productImage3]),
                    const UBrandShowcase(images: [UImages.productImage1, UImages.productImage2, UImages.productImage3]),
                    const SizedBox(height: USizes.spaceBtwItem),

                    // Products section
                    USectionHeading(title: 'You might like', onPressed: () {}),
                    const SizedBox(height: USizes.spaceBtwItem),

                    // Grid layout for products
                    UGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) => UProductCardVertical(product: products[index]),
                    ),
                    const SizedBox(height: USizes.spacebtwSection),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
