


import 'package:carousel_slider/carousel_slider.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/features/shop/controllers/home_controller.dart';
import 'package:computer_store/utils/constants/color.dart';

import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => URoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: USizes.spaceBtwItem),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                UCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i ? UColors.primary : UColors.grey,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}