import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/products_card/brand_card.dart';
import 'package:computer_store/features/shop/models/function/fatch_brand.dart';
import 'package:computer_store/features/shop/models/shop/brand_model.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UBrandShowcase extends StatelessWidget {
  const UBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      showBorder: true,
      broderColor: UColors.darGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(USizes.md),
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItem),
      child: Column(
        children: [
          //Brand with product count
          FutureBuilder<List<BrandModel>>(
            future: BrandService().fetchBrand(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No brands found'));
              } else {
                return UGridLayout(
                  itemCount: snapshot.data!.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    return UBrandCard(
                      showBorder: false,
                      brand: snapshot.data![index],
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(height: USizes.spaceBtwItem),

          //Brand Top3 Product image
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: URoundedContainer(
        height: 100,
        backgroundColor:
            UHelper.isDarkMode(context) ? UColors.darGrey : UColors.light,
        margin: const EdgeInsets.only(right: USizes.sm),
        padding: const EdgeInsets.all(USizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
